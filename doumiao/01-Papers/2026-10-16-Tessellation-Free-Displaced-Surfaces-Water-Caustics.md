---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, arxiv, cs.GR, water-rendering, caustics, displacement-mapping, ray-tracing, tessellation-free]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.21584
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | Bing Xu, Yang Zhou, Brian Budge |
| **发表** | arXiv preprint 2026-10-16 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2610.21584) |
| **DOI** | 10.48550/arXiv.2610.21584 |
| **代码** | 未公布 |
| **提交时间** | 2026-10-15 09:30 UTC（出现在 2026-10-16 14:00 arXiv 公告批次） |

---

## 核心贡献

> 第一个为**无镶嵌位移表面 (tessellation-free displaced surfaces)** 提供**完整几何查询支持**的方法 — 包括表面采样、镜面流形搜索、最近点查询 — 而无需预镶嵌密集三角网格。

1. **一阶纹理空间层次结构 (first-order texture-space hierarchy)**：每个节点存储局部仿射高度平面 + 保守残差界。
2. **保留空间高度变化**：相比标量 min-max 界，仿射平面+残差保留更精细的空间信息。
3. **应用演示：水焦散渲染 (caustics rendering)** —— **对水渲染直接相关**。
4. **应用演示：采样位移发光体 (sampling displaced emitters)**。
5. **应用演示：表面 PDE 求解器**（与水波模拟联动）。

---

## 技术方案

### 核心思想

传统位移映射（displacement mapping）的问题：要先镶嵌（tessellate）为密集三角网才能做几何查询。
- **内存代价高**：4K 纹理 × 高频位移 = GB 级三角网格
- **无法灵活查询**：采样、最短距离、镜面流形等需要其他几何表示

本文方法：
- 每个 BVH 节点存一个**仿射高度平面** `h(u,v) = a*u + b*v + c`
- 加一个**保守残差界** `r` 表示平面不能覆盖的空间变化
- 这样既支持**精确包围盒**（用于求交/距离搜索）又支持**面积估计**（用于采样）

### 关键技术

| 技术 | 说明 |
|------|------|
| **Affine Height Plane (AHP)** | 局部线性高度场，保留斜率信息 |
| **Conservative Residual Bound** | 残差 `r` 确保实际高度 `h ∈ [plane - r, plane + r]` |
| **Texture-Space BVH** | 纹理空间层次遍历，避免 3D 空间结构 |
| **Query-Specific Traversal** | 不同查询用不同剪枝/采样策略 |
| **Slope Bounds for Specular** | 额外斜率界支持镜面光路搜索 |
| **Surface Enclosure** | 用于求交/距离搜索的紧致包围盒 |

### 与水渲染的关系

#### Caustics 渲染流程（论文演示场景）

```
[位移映射水面 → 无镶嵌表面]  
  → [Specular light-path traversal]
  → [焦散光子映射 / 梯度采样]
  → [焦散纹理]
```

**关键优势**：
- **无镶嵌**：高频水面波纹可直接表达，无需 4K 三角网格
- **仿射平面 + 斜率界**：水面法线方向可由平面斜率快速估计，**焦散搜索路径计算量显著降低**
- **面积估计**：支持蒙特卡洛采样用于焦散光子生成

### 水焦散渲染算法（论文贡献）

```math
\text{For each caustics photon ray } \mathbf{r}:
    \text{Traverse BVH (texture-space)}
    \text{For each node } n:
            \text{intersect plane + residual check}
            \text{use slope bounds for specular direction}
            \text{record refraction point}
```

---

## 公式

### 仿射高度平面（核心表示）

每个 BVH 节点存储：

```math
h(u, v) = a \cdot u + b \cdot v + c
```

加上保守残差界 `r`，确保：

```math
h_{\text{true}}(u, v) \in [h(u, v) - r, \; h(u, v) + r]
```

### 斜率界 (Slope Bounds)

```math
\left|\frac{\partial h}{\partial u}\right| \leq s_u, \quad \left|\frac{\partial h}{\partial v}\right| \leq s_v
```

用于镜面流形搜索时剪枝不可能命中节点。

### 面积估计（用于采样）

```math
A_{\text{node}} \approx \int_{u_0}^{u_1}\int_{v_0}^{v_1} \sqrt{1 + \left(\frac{\partial h}{\partial u}\right)^2 + \left(\frac{\partial h}{\partial v}\right)^2} \, du \, dv
```

---

## 实验结论

- **数据集**: 多个高频位移纹理（包括演示用水面纹理）
- **应用验证**: 
  - **焦散渲染 (caustics rendering)** ✅
  - **采样位移发光体 (sampling displaced emitters)**
  - **表面 PDE 求解器**
- **结果**: 
  - **内存节省**：相比预镶嵌密集三角网格，显著降低
  - **性能提升**：相比查询专用方法更快
  - **保留效率光线追踪**

---

## 局限性

- **仅展示场景，未给大规模数据集 benchmark**
- **复杂水面（破碎波、泡沫）的多尺度位移** 未讨论
- **与路径追踪集成**：仅展示 caustics 子模块，全局光照集成未深入

---

## 与流体渲染的关系

### 直接相关性

本文虽以一般位移表面为对象，但**水面波纹焦散渲染**是论文演示的核心用例之一：

1. **水面焦散渲染**：位移映射 → 无镶嵌 → 仿射平面 + 残差 → 焦散采样
   - 对**实时光线追踪水渲染**（Unreal Engine / Unity HDRP）有直接借鉴价值
   - 对**离线水渲染路径追踪**可减少 BVH 构建时间和内存

2. **水面法线估计**：仿射平面斜率直接给出水面法线，**水渲染法线贴图预滤波**思路可借鉴

3. **位移水波动画**：与 [[Tube Maps SPH Boundary]], [[Hamiltonian Wave-Flow Coupling]] 等波模拟方法结合，**实时渲染由仿真生成的位移场**

### 推荐度
✅✅ **强推荐** — 水渲染（尤其是焦散）的核心技术改进；与 [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] 形成"折射 vs 焦散"互补

---

## 相关工作

- [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] — 折射 GS 水面
- [[2026-06-11_AnisoLift_Particle_Liquid_Enhancement]] — 粒子液体增强
- [[2026-08-29_Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]] — 波动-流体耦合
- 焦散渲染经典：Mitchell 1991, Schwartz 1996

---

## 实现建议

- **实现难度**: 高（需要完整的 BVH + 仿射平面数据结构 + 多查询遍历器）
- **预期性能**: 实时光线追踪（具体数字未给，但论文声称"保留高效光线追踪"）
- **适用场景**:
  - 实时光线追踪水焦散（游戏 / VR）
  - 离线水焦散高质量渲染
  - 任何需要高效位移表面查询的渲染管线