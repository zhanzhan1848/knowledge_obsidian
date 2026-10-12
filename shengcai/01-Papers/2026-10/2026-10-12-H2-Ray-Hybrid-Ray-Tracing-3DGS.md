---
type: paper
created: 2026-10-12
updated: 2026-10-12
tags: [paper, ray-tracing, BVH, real-time-rendering, 3DGS, rasterization, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.13498
---

# H2-Ray: A Hybrid and Hierarchical Ray Tracing Method for Efficient 3D Gaussian Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Hybrid and Hierarchical Ray Tracing Method for Efficient 3D Gaussian Rendering |
| **作者** | Tiancheng Zhao, Sixu Li, Yuzhou Chen, Hengyu Ding, Zhiming Pan (+1) |
| **发表** | arXiv cs.GR 2026-10-09 |
| **链接** | [原文](https://arxiv.org/abs/2610.13498) |
| **DOI** | - |
| **代码** | 未公开 |

---

## 核心贡献

> 将光线追踪引入 3DGS 渲染管线，解决高斯光栅化无法表达次级光照、深度畸变镜头、景深效果等问题，并通过 BVH 与统一求交引擎实现 3.77×–9.26× 加速。

1. **Load-Balanced Spatial BVH (LB-SBVH)** — 用密度感知表示将全局不均衡负载切分为均衡的局部遍历单元
2. **Ray-Cluster Path Reuse (RCPR)** — 让代理光线与相邻光线共享遍历状态，复用冗余遍历
3. **Unified Intersection Engine (UIE)** — 模式复用数据通路，40% 浮点单元在 Gaussian 与 triangle 求交间共享

---

## 技术方案

### 核心思想

3DGS 当前系统全部依赖光栅化以保证实时性，但光栅化无法支持：(a) 次级光照 (b) 高畸变相机模型 (c) 景深 DoF。光线追踪是自然选择，但 3DGS 的光线追踪面临三个本质困难：

1. **负载不均衡**：百万级 Gaussian 在空间中分布极不均匀（前景密、背景稀），传统 BVH traversal 出现大量 warp idle
2. **冗余遍历**：相邻像素的光线路径高度相似，从相同 BVH 子树遍历，浪费 SIMT 资源
3. **异构求交**：Gaussian 与 triangle 的求交数学完全不同，难以共用硬件单元

### 关键技术

| 技术 | 说明 |
|------|------|
| **LB-SBVH** | 空间均匀网格分区 + 密度感知 primitive 表示，把不均衡全局问题转换为均衡局部问题 |
| **RCPR** | proxy ray + cluster：让一群相邻光线共享 traversal state，类似 wavefront 合并 |
| **UIE** | 模式复用的数据通路（mode-multiplexed datapath）：Gaussian/triangle 共享 40% FP units |
| **RT Core 改造** | 修改 NVIDIA RTX A5000 RT Core 模型（cycle-accurate simulation） |

### 性能基准

- **GPU**: NVIDIA RTX A5000
- **对比基线**: RaySplats
- **场景数**: 8
- **结果**:
  - 几何均值加速 **3.77×**
  - 最大加速 **9.26×**
  - 通过 cycle-accurate RT Core 模型 + 实测 CUDA 时长双重验证

---

## 公式

```math
\text{Workload}_{\text{tile}} = \sum_{g \in \text{tile}} \mathbb{1}[\text{ray hits } g]
```

LB-SBVH 的目标是把每个 tile 的工作量平衡到接近均值。

```math
\text{RCPR}_{\text{reuse}} = \frac{\text{unique traversal state}}{\text{cluster size}}
```

---

## 代码片段

未公开源码。从论文描述推断 LB-SBVH 的核心结构：

```cpp
// LB-SBVH partition (示意)
struct TileBVH {
    std::vector<Gaussian> density_gaussians;
    BoundingBox tile_bbox;
    float density_estimate;
};

void build_lb_sbvh(const Scene& scene) {
    uniform_grid = partition_uniform(scene, k);
    for (tile in uniform_grid) {
        tile_bvh[tile] = build_bvh_with_density(tile);
    }
}
```

---

## 实验结论

- **数据集**: 8 个标准场景（具体未列出，从文中推断含常见 3DGS 基准）
- **基线**: RaySplats
- **结果**: 3.77× geomean / 9.26× max speedup, 渲染质量持平
- **资源开销**: 需要修改 RT Core（专用加速路径），但可通过纯 CUDA fallback 实现

---

## 局限性

- 仅在 NVIDIA RTX A5000 上验证，其他 GPU 架构（AMD、Intel、mobile）兼容性未知
- Gaussian 与 triangle 混合场景的视觉质量对比数据缺失
- 未开源代码 → 复现门槛较高
- LB-SBVH 网格划分粒度 k 是 hyperparameter，未给出自适应策略

---

## 可行性评估（内部视角）

| 维度 | 评分 | 说明 |
|------|------|------|
| 创新性 | ⭐⭐⭐⭐⭐ | 首次系统性解决 3DGS ray tracing 三难问题 |
| 实用性 | ⭐⭐⭐⭐ | 立即可用于次级光照/景深效果 |
| 实现难度 | 高 | 需 GPU 架构层优化，依赖 RT Core 改造 |
| 推荐度 | ⭐⭐⭐⭐ | 推荐关注并尝试黑盒集成 |

### 推荐结论
⚠️ **谨慎评估后推荐** — 核心思想清晰，但完整复现需要 GPU 架构深度。建议作为**架构参考**而非直接移植。

### 行动建议
传递给 @墨鱼丸 (moyuwan)：
1. 调研 UIE 的 mode-multiplexed 数据通路实现细节
2. 评估 LB-SBVH 在我们渲染管线中的适配路径
3. RCPR 思路可用于现有 light tracing 的 traversal 优化

原始链接: https://arxiv.org/abs/2610.13498
