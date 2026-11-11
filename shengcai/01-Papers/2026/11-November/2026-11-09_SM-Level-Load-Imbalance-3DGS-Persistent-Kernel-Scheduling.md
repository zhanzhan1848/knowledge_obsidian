---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, gpu-optimization, rasterization, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12319
arxiv_id: 2611.12319
---

# Mitigating SM-Level Load Imbalance in 3D Gaussian Splatting on GPUs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mitigating SM-Level Load Imbalance in 3D Gaussian Splatting on GPUs |
| **作者** | Junha Ryu, Hoi-Jun Yoo (KAIST) |
| **发表** | arXiv cs.DC / cs.GR / cs.CV / cs.LG, 2026-11-09（预印本, ICML 模板） |
| **链接** | [原文](https://arxiv.org/abs/2611.12319) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 识别出 GPU 3DGS 渲染的根本瓶颈——**屏幕 tile 间的 SM 级负载不均衡**——并用纯软件调度手段消除执行尾部（execution tail）。

1. **量化分析**：刻画多种 3DGS 变体与场景（物体级到城市场景）下的 tile 级负载分布与 SM 活跃度，证明少数计算密集 tile 主导执行时间。
2. **LPT 调度 + Persistent Kernel**：按投影高斯数量降序分发 tile，优先跑重 tile，缩短"晚发 CTA"造成的执行尾部。
3. **深度分块 + 饱和信号**：利用 alpha blending 的可组合性，把超重 tile 沿深度切成连续块，跨多个 CTA 并行执行；用**饱和信号**恢复提前终止，避免冗余计算，同时保留原始 alpha blending 公式。
4. **选择性分块 + 流式协同**：只对最重的 tile 分块，与 LPT 调度的 tile 协同执行；轻量逐帧策略依据渲染管线已有的 tile 统计量决定何时分块、分多少。

---

## 技术方案

### 核心思想

GPU 光栅化器按 tile 分配工作。3DGS 场景中，某些 tile 覆盖大量高斯（近景大 splat 密集区域），负载远超其他 tile。这导致：
- 少数 SM 长时间忙，其余 SM 早早空闲
- 关键路径 = 最重 tile 的执行时间（执行尾部）

本文不改算法、不改场景表示、不改 alpha blending 公式，纯靠调度解决。

### 关键技术

| 技术 | 说明 |
|------|------|
| **LPT（Longest Processing Time first）** | 经典 LPT 调度启发式：重 tile 优先，理论上可保证 Cmax ≤ (4/3 - 1/(3m))·OPT |
| **Persistent Kernel** | 常驻 CTA，动态从工作队列取 tile，避免每 tile 重新 launch CTA 的开销 |
| **深度连续分块** | alpha blending 的 over 操作符可组合：$C = \sum_i c_i \prod_{j<i}(1-\alpha_j)$，故沿深度切块可并行 |
| **饱和信号 (Saturation Signaling)** | 某块累积不透明度饱和（达 1）后广播信号，让其余块提前退出 |
| **负载代理量** | 用投影高斯数作为 tile 负载的代理指标（论文有专门消融验证） |
| **成本模型** | 轻量逐帧策略，用一组固定常数 + tile 统计量估算收益，选择分块阈值 $h$ 与分块数 $k$ |

### 公式

```math
// alpha blending 的可组合性（分块并行化成立的前提）
C = \sum_{i} c_i \prod_{j<i} (1 - \alpha_j)

// 沿深度切分为 k 个连续块，块间并行 + 饱和信号提前终止
// 块 b 的合成结果在饱和（累积 alpha >= 1）后无需继续累积
```

---

## 代码片段

```cuda
// Persistent kernel + LPT 调度（伪代码）
__global__ void persistentBlendKernel(Scene scene, TileQueue queue) {
    while (true) {
        int tile = queue.popNext();          // 按投影高斯数降序 (LPT)
        if (tile == INVALID) break;

        // 选择性分块：最重的 tile 沿深度切成 k 个连续块
        int k = policy.chooseChunkCount(scene.tileStats[tile]);
        if (k > 1) {
            // 各块并行执行，深度区间 [z_lo, z_hi)
            launchChunk(scene, tile, chunkId, k);
        } else {
            blendTile(scene, tile);
        }
    }
}

// 饱和信号：某块累积不透明度达到 1 时广播，其余块提前退出
__device__ void signalSaturation(int tile, int chunkId);
```

---

## 实验结论

- **数据集**: 城市场景（大规模 urban）、Waymo、PandaSet 序列、物体级 benchmark、世界模型生成场景
- **基线**: Vanilla 3DGS alpha blending、优化的光栅化器实现、Mean-Threshold Tile Splitting 变体
- **结果**:
  - **城市场景 alpha blending 平均加速最高 2.93×**
  - **最不均衡的单帧最高 5.6×**
  - 负载均衡场景（Waymo、PandaSet 两条序列）提升有限：**1.03–1.10×**（执行尾部本身很短）
  - **无需重训练**、**无需专用硬件**、**保留原始 alpha blending 公式**
  - 可与优化光栅化器组合；可跨 GPU 架构与多种 3DGS 变体应用
- **消融**: 高斯数作为负载代理是有效的；流式协同执行优于融合内核；优于基于均值阈值的 tile 切分

---

## 局限性

- **只针对推理期渲染的 alpha blending 阶段**，收益与每帧的 tile 不均衡程度成正比
- **负载均衡时收益有限**（1.03–1.10×），此时逐帧策略很少触发分块，效果接近 LPT-only，且不会拖慢 Vanilla
- 成本模型使用**一组固定的常数**（跨所有评测负载），按 GPU 标定或在线学习可进一步逼近逐帧 oracle，作者留作未来工作
- 预印本，未见同行评审

---

## 相关工作

- [[2026-07-20-Rendering-3D-Gaussians-on-Graph-Processor]]
- [[2026-08-22_3DGART-3D-Gaussian-Accelerated-Ray-Tracing]]
- [[2026-09-08_TileGS-Gaussian-Rasterization]]
- 概念：[[3D高斯泼溅]], [[GPU调度]], [[光栅化]], [[Tile-Based渲染]]

---

## 实现建议

- **实现难度**: 中（需改写 3DGS 光栅化器为 persistent kernel 形式 + 实现饱和信号同步）
- **预期性能**: 城市场景 alpha blending 阶段 2.93× 加速；平衡场景基本无副作用
- **适用场景**: **自动驾驶仿真、城市级 3DGS 场景、生成式世界模型**——这些正是负载最不均衡的场景
- **与团队的关系**: 这是纯软件、零重训练的正交优化，落地风险低。建议 @墨鱼丸 评估在现有 3DGS 渲染器上叠加 persistent kernel 调度的工程量
- **优先级**: 高（低成本高回报，尤其面向自动驾驶/城市场景）
- **注意**: 与 [[2026-11-01_AbacusGS]] 同属"3DGS 排序与调度"方向，两者可叠加（AbacusGS 解决排序， 本文解决调度）
