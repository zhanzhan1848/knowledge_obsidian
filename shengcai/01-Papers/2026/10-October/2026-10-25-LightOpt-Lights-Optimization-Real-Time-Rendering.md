---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, 渲染, 实时渲染, 光源优化, 延迟着色, Tiled-Z, 可微优化, irradiance, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://mirage-c.github.io/LightOpt/
---

# LightOpt: Lights Optimization for Real-time Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LightOpt: Lights Optimization for Real-time Rendering |
| **作者** | Tuo Chen, Luyan Cao, Kui Wu, Shimin Hu |
| **发表** | ACM SIGGRAPH 2026 Conference Papers ('26), 2026 |
| **链接** | [原文](https://doi.org/10.1145/3799902.3811072) |
| **DOI** | 10.1145/3799902.3811072 |
| **代码** | 未公开（项目页仅提供演示与视频） |
| **项目页** | https://mirage-c.github.io/LightOpt/ |

---

## 核心贡献

> 可微的**光照优化管线**：自动减少实时游戏场景中的**活跃光源数量**，同时保持最终渲染外观 —— 用「辐照度场作为视图无关目标」+「重叠/吸引双损失」+「动态光源增删合并控制器」实现。

1. **辐照度场目标（Irradiance-field target）**：从场景表面采样，用**原始辐照度场**作为**视图无关**的优化目标 —— 避免了直接优化最终像素带来的视角耦合问题。
2. **两个损失函数**：
   - **重叠损失（overlap loss）**：抑制冗余光源覆盖（同一片区域被多灯照）
   - **吸引损失（attraction loss）**：把附近的光源拉向**照明不足**的区域
3. **动态光源控制器**：在优化过程中交替执行**光源删除 / 合并 / 插入**，自适应调整光集合，而非一次性固定光数。
4. **Time-of-Day 支持**：可跨关键帧优化动态光照参数。
5. **管线无关**：作为**预处理步骤**，可接入现有 tiled / clustered / tiled-Z 渲染管线。

---

## 技术方案

### 核心思想

```
场景表面 Poisson disk 离散采样
        ↓
计算原始辐照度场 E_target (视图无关)
        ↓
可微光源参数优化 (位置/颜色/强度/半径)
        ↓
交替:  删除 / 合并 / 插入 光源
        ↓
损失 = overlap loss (抑制冗余) + attraction loss (补足欠照明)
        ↓
输出精简光集合 → 接入 tiled / clustered / tiled-Z 管线
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **辐照度场目标** | 用**视图无关**的辐照度场而非最终像素作目标 → 优化与相机解耦，一次优化多视角可用 |
| **Overlap loss** | 惩罚多灯对同一区域的重复覆盖，降低 **ALO（Average Light Overdraw）** |
| **Attraction loss** | 把光源吸引到光照不足处，避免"删完变暗" |
| **动态光源控制器** | 优化中动态执行删除 / 合并 / 插入，光集合自适应 |
| **Poisson disk 采样** | 场景表面离散化用于高效评估辐照度场 |
| **扩展光源作用范围** | 允许光源跨越影响边界移动时仍有可微行为 |
| **ToD 扩展** | 跨关键帧优化动态光照参数 |

---

## 公式

```math
\mathcal{L} = \underbrace{\lambda_{\text{ov}}\mathcal{L}_{\text{overlap}}}_{\text{抑制冗余覆盖}}
             + \underbrace{\lambda_{\text{at}}\mathcal{L}_{\text{attraction}}}_{\text{补足欠照明}}
```

```math
\text{Overdraw 惩罚（多灯重复覆盖）}:\quad
\mathcal{L}_{\text{overlap}} \propto \sum_{p \in \mathcal{S}}
\Big(\sum_{i \in \mathcal{N}(p)} w_i(p)\Big)^{\!\alpha} - \sum_{i}\sum_{p \in \mathcal{N}(i)} w_i(p),
\qquad \alpha > 1
```

```math
\text{Attraction（欠照明区域吸引）}:\quad
\mathcal{L}_{\text{attraction}} \propto \sum_{p:\,E(p)<E_{\text{tgt}}(p)}
\big(E_{\text{tgt}}(p) - E(p)\big)
\]

---

## 代码片段

```cpp
// 概念示意：优化循环中的动态光源控制器
for (int iter = 0; iter < num_iters; ++iter) {
    // 1) 在 Poisson disk 采样点上计算当前辐照度场
    std::vector<float> E = evaluate_irradiance(scene, lights, samples);

    // 2) 可微优化光源参数（位置 / 颜色 / 强度 / 半径）
    lights = optimizer.step(lights, [&](const LightSet& L) {
        float overlap = overlap_loss(L, samples);   // 惩罚冗余覆盖
        float attract = attraction_loss(L, samples, E_target); // 吸引到欠照明
        return overlap + attract;
    });

    // 3) 动态调整光集合：删除 / 合并 / 插入
    if (iter % controller_interval == 0) {
        lights = controller.remove_redundant(lights, samples); // ALO 高且贡献小者
        lights = controller.merge_similar(lights);             // 近似等价者合并
        lights = controller.insert_for_deficit(lights, samples); // 欠照明处补灯
    }
}
```

---

## 实验结论

- **数据集**: 5 个**生产级游戏场景**（Tavern / Cave / Square / Valley / Street），含室内、室外与 Time-of-Day 设置
- **基线**: 艺术家手工削减光源；工业界**视角相关（view-dependent）光源裁剪**基线
- **结果**:

| 场景 | 输入光源 | 优化后 | 平均 ALO ↓ | 平均着色时间 ↓ | 平均 RMSE ↓ | 加速比 |
|------|---------|--------|------------|---------------|------------|--------|
| Valley | 121 | 57 | 5.78 → 2.54 | 0.95 → 0.57 ms | 0.046 | 1.67× |
| Tavern | 210 | 126 | 3.35 → 1.72 | 0.71 → 0.52 ms | 0.041 | 1.37× |
| Square (ToD) | 314 | 249 | 3.28 → 1.57 | 0.83 → 0.56 ms | 0.043 | 1.48× |
| Cave | 80 | 64 | 3.43 → 2.05 | 0.71 → 0.49 ms | 0.037 | 1.45× |
| Street | 135 | 95 | 3.83 → 1.68 | 0.67 → 0.45 ms | 0.033 | 1.49× |

- **总体**: 光照成本降低 **18–52%**，活跃光源减少 **20–53%**，最大着色加速 **2.07×**，每场景优化耗时约 **10 分钟**
- **Cave 场景**: 延迟着色时间 **0.71 ms → 0.49 ms**（RTX 3090）
- **视觉保真**: 在速度与视觉保真两项上均**优于工业界视角相关裁剪基线**

---

## 局限性

- **代码未公开**，仅项目页与视频，复现成本高
- 依赖**游戏场景的表面采样**与 Tiled/Clustered 渲染管线假设
- ToD 场景优化光源数削减比例最低（314→249，−21%），说明动态光照下约束更强
- 优化为**离线预处理**，运行时新增光源需重新优化

---

## 相关工作

- [[2026-10-25-RCPG-Radiance-Cascade-Path-Guiding]] — 互补：路径引导而非光源数削减
- [[2026-10-24-Ray-by-Ray-Fine-Grained-GPU-Ray-Tracing-Resource-Management]] — 互补：RT 单元资源分配
- [[2026-10-25-Adaptive-Streaming-Perceptual-FrameRate-Resolution]] — 互补：感知驱动的分辨率/帧率自适应
- [[2026-10-15-SUPRA-TEX-PBR-Texture-Generation]] — 相关：材质侧优化

---

## 实现建议

- **实现难度**: **中**（可微光源参数优化 + 辐照度场评估 + 增删合并控制器，概念清晰）
- **预期性能**: 光照成本 −18~52%，着色加速最高 2.07×，离线优化 ~10 min/场景
- **适用场景**: 移动端 / 主机游戏与实时应用的**前向渲染（延迟着色）**光源精简；Tiled-Z / Clustered 光源剔除管线
- **⭐ 优先级**: **高** — 本库首次覆盖「实时渲染光照数量优化」方向；**辐照度场作视图无关目标**这一设计可迁移到其他"保持外观同时削减计算"的场景（材质精简、LOD 策略、阴影贴图分配）

---

## 备注

- 无 arXiv 预印本；通过项目页 + OpenAlex API 抓取
- SIGGRAPH 2026 会议论文，**此前批次遗漏**，本次补齐
