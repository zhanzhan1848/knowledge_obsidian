---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, mesh-reconstruction, mesh-native, delaunay-tetrahedral, hash-grid, SDF, volumetric-rendering, adaptive-refinement, differentiable-rendering, point-pruning]
domain: geometry
agent: wawaicai
recommendation: 强烈推荐（「网格原生」路线 + 自适应细分，思路完整可复现）
---

# ADELE - Adaptive Delaunay Grids for High-Fidelity Mesh-Native Reconstruction

> 📌 **今日最完整的「网格原生重建」方案**：不做 NeRF/3DGS 中间表示，直接在**可优化的 Delaunay 四面体网格**上重建，并用**点剪枝/插入**做自适应细分 —— 直接针对当前「后处理提网格」范式的两大痛点。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | ADELE - Adaptive Delaunay Grids for High-Fidelity Mesh-Native Reconstruction |
| **作者** | Johannes Weidenfeller (ETH Zürich), Shaofei Wang (BIGAI), Philipp Fürnstahl (University of Zurich), 等 |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1411](https://sa2026.conference-schedule.org/presentation/?id=papers_1411) |
| **关键词** | mesh-native reconstruction, Delaunay tetrahedral grid, hash grid, SDF, volumetric rendering, adaptive refinement |

## 技术概述

### 问题：当前 SOTA 重建的两难

> **网格**（Mesh）仍然是**几何推理**与**接入图形管线**最实用的表示，但现有重建方法**难以产出高质量网格**。

绝大多数 SOTA 方法的范式是：

```
学习中间表示 (NeRF / 3DGS)  →  后处理提取网格
```

这导致两个后果：
1. **表面过平滑**（oversmoothed surfaces）
2. **网格质量差**：**三角形数量过多**（excessive triangle counts）却精度不高

已有的 **mesh-native 优化方法**缓解了部分问题，但仍有两个硬伤：
- **固定分辨率的离散化**（fixed-resolution discretizations）—— 无法在细节处加密、在平坦处节省
- **优化行为不稳定**（unstable optimization behavior）

### 核心思想：把「网格」本身变成可优化的表示 + 自适应离散化

ADELE 的表示层设计：

> **可优化的 Delaunay 三角剖分四面体网格** + **多分辨率哈希网格（multi-resolution hash grid）**

分工清晰：

| 组件 | 职责 |
|------|------|
| **Delaunay 四面体网格** | 几何载体（**可优化**：顶点位置可被梯度更新） |
| **多分辨率哈希网格** | 提供**潜在特征**，用于预测 **SDF / 外观值**（appearance） |

前者承载**拓扑与几何**，后者承载**高分辨率外观细节** —— 这是「用便宜的稀疏结构 + 昂贵的密集特征」的经典组合。

**自适应细分机制**：四面体网格通过**点剪枝（point pruning）**与**点插入（point insertion）**来细化。这是本文相对既有 mesh-native 方法的关键改进 —— 直接解决了「固定分辨率」的痛点。

### 渲染 / 优化策略

这是一个**两阶段混合**方案：

```
① 体积渲染（volumetric rendering）引导 → 得到粗几何（bootstrap coarse geometry）
     ↓
② 网格渲染（mesh-based rendering）      → 恢复精细细节（recover fine-grained details）
```

**关键技术：可微的、基于光栅化的深度偏移渲染（depth-offset rendering）**

> 提出一个**可微的、光栅化（rasterization-based）的深度偏移渲染**形式，**减少几何伪影**、提升重建质量。

这是理解本文的关键：为什么要引入「深度偏移」？

因为在网格原生表示下，**表面的位置与光栅化深度不再天然一致**。传统的「把顶点投影到像素、按深度排序」的做法，会在**斜面、细长三角形**上产生严重的深度偏差伪影。**深度偏移渲染**把「几何表面」与「光栅化覆盖」解耦，从而消除这类伪影。

## 复杂度分析

- 网格规模：自适应（由剪枝/插入决定），**不再由固定分辨率决定** ⇒ 复杂度与**几何复杂度**绑定，而非与体素网格绑定
- 四面体网格优化的每步成本：O(F) 梯度 + 局部 Delaunay 更新（通常 O(k log k) 的增量重连）
- 哈希网格查询：O(log N) 或近似 O(1)（取决于实现）
- **相对体素方法的存储优势**：稀疏四面体网格 vs 稠密体素网格，在相同精度下存储量差异巨大

## 实现难度与数值稳定性

- **算法复杂度**：**高**。需要实现：可微 Delaunay 四面体网格、增量剪枝/插入、光栅化深度偏移渲染、哈希网格特征插值、体积渲染引导。
- **数值稳定性**：**中高**。Delaunay 增量更新在**退化配置（cospherical / 重复点）**下容易翻转；剪枝/插入的判定若用阈值会抖动。论文标题强调 "Adaptive" 隐含了对稳定性的大量工程处理。
- **依赖项**：预期 PyTorch 自研（可微渲染部分可能基于 nvdiffrast / 自研光栅器），Delaunay 部分可能是自研可微实现（**CGAL 的 Delaunay 不可微**，是明显的实现难点）。

## 实验结论

- **数据集**：多种 **object-centric** benchmark
- **基线**：既有 mesh 优化方法 + SOTA NeRF / 3DGS 方法
- **结果**：
  - **显著优于**既有 mesh 优化方法
  - 与 SOTA **NeRF/3DGS 方法可比（competitive）** —— 这是一个很高的标准，因为通常 mesh-native 方法显著落后于 3DGS

## 局限性

- **自适应机制的代价**：论文强调这是 "adaptive mesh-based optimization framework" + "practical mesh rendering technique"，隐含**自适应策略本身是一个独立贡献**，其细节（何时剪、何时插、阈值如何定）摘要未展开。
- **四面体网格的固有复杂度**：Delaunay 四面体网格在**薄结构**（薄板、叶片）上单元质量会退化。
- **未提及**是否支持**非流形输入**或**多壳体场景**。
- 摘要未给出**具体的三角形数量对比**（而这正是它声称解决的问题之一 —— "excessive triangle counts"）。

## 相关工作

- [[2026-10-30-SA2026-PolyFlow-Continuous-Topology-Flow-Matching]] — 网格生成方向
- [[2026-10-30-SA2026-OffsetAxis-UDF-Medial-Axis-Reconstruction]] — 隐式 → 网格
- [[2026-10-30-SA2026-MeRM-Neural-Geometry-Tokens]] — 前馈式网格重建
- [[2026-10-30-SA2026-ADELE-Adaptive-Delaunay-Mesh-Native-Reconstruction]] — 本篇
- [[2026-07-ADS-Adaptive-Delaunay-Scaffolding]] — 本库已有：Delaunay 相关
- [[2604-00157-Dual-Contouring-SDF]] — 本库已有
- [[2026-08-26-ExMesh-Multi-View-Relightable-UV-PBR-Mesh]] — 本库已有

## 实现建议

- **实现难度**：**高**（可微 Delaunay 四面体网格是主要工作量）
- **预期性能**：与 3DGS/NeRF 可比，且网格数量显著更少（自适应带来的收益）
- **适用场景**：
  - 需要**直接产出高质量网格**（不做后处理提网格）的重建管线
  - 对**三角形数量敏感**（Web/移动端/实时渲染）的场景
  - 物体级（object-centric）重建
- **对团队的直接价值**：**高**。如果我们目前用「NeRF/3DGS → 后处理提网格」的管线，这篇的**自适应四面体网格 + 深度偏移渲染**是一套可以直接对标的替代方案。特别是「**深度偏移渲染**」这个技术点，可能是可以单独移植到我们现有管线里的改进。

## 可直接抄的工程结论

1. **「中间表示」不是免费的** —— NeRF/3DGS 作为中间表示，代价是「后处理提网格」的质量损失。mesh-native 路线值得在**质量优先**的场景重新评估。
2. **可微几何操作是最大的工程门槛** —— CGAL 的 Delaunay 不可微，所以 ADELE 大概率自研了可微版本。这部分工作量往往被论文的「方法论叙事」掩盖。
3. **光栅化深度 ≠ 几何深度** —— 一旦引入网格原生表示，就必须处理这个不一致。「深度偏移渲染」是一个低成本的对策，值得记入我们的技术清单。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
