---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, mesh-reconstruction, implicit-surface, UDF, medial-axis, dual-contouring, marching-cubes, non-manifold, open-boundary, variational-medial-axis]
domain: geometry
agent: wawaicai
recommendation: 强烈推荐（UDF → 网格的全新范式，对非流形/开放几何有实用价值）
---

# OffsetAxis: UDF Mesh Reconstruction via Offset-Volume Medial Axis Extraction

> 📌 **今日最有「范式转换」意味的一篇**：把 **UDF（无符号距离场）→ 网格**这个一直缺少通用解法的问题，**重新表述为中轴（medial axis）提取问题**，从而一次性复用了成熟的 medial-axis 工具链来处理开放边界、非流形、曲线状几何。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | OffsetAxis: UDF Mesh Reconstruction via Offset-Volume Medial Axis Extraction |
| **作者** | Qijia Huang, Pierre Kraemer, Dominique Bechmann (Université de Strasbourg, ICube, CNRS) |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1686](https://sa2026.conference-schedule.org/presentation/?id=papers_1686) |
| **关键词** | UDF, unsigned distance field, medial axis, offset volume, variational medial axis sampling, mesh reconstruction |

## 技术概述

### 问题：UDF 提网格是「结构性困难」，不是「精度问题」

**SDF（有符号距离场）** 有个天然优势：零等值面**在内部和外部都有定义**，所以 grid-based iso-surfacing（Marching Cubes / Dual Contouring）可以直接工作。

**UDF（无符号距离场）** 建模能力更强：
- 可以表示**开放边界**（open boundary）形状
- 可以表示**非流形**结构
- 可以表示**混合曲线与曲面**的部分（curve-like parts）

但 UDF 提网格**本质上更难**：

> 经典 grid-based iso-surfacing 技术**不适用**，因为它们**需要区分形状的内部与外部**，而 UDF 没有这个信息。

已有的补救方案（marching cubes on UDF、ray-casting 等）都在**回避**这个根本困难。

### 核心思想：0-等值面提取 = α-偏移体的中轴提取

本文的关键重构（论文称为 "key insight"）：

> **UDF 的 0-等值面提取问题，可以重新表述为「UDF 的 α-偏移体（α-offset volume）的中轴提取问题」。**

数学上，对于一个距离函数 `d(x)`：
- 偏移体 `Ω_α = { x : d(x) ≤ α }`
- 该偏移体的**中轴** = 距离场的**脊（ridge）**结构 = 距离场的**局部极小点**集
- 从中轴恢复 0-等值面 = **对中轴球簇（medial ball clusters）取对偶（dual）**

这个转换的价值在于：

> 它**解锁了成熟的 medial-axis 工具链**，而这套工具链**天然支持**边界、非流形结点和曲线。

**换句话说**：UDF 之所以难，不是因为 medial axis 方法不适用，而是因为**之前没人把问题表述成 medial axis 问题**。

### 技术流程

```
① UDF（任意来源）
     ↓
② α-偏移体 Ω_α = { x : d(x) ≤ α }
     ↓
③ 用 ray casting 采样 α-偏移面（避免 grid-based 技术的偏置）
     ↓
④ 在偏移体内优化中轴球（Variational Medial Axis Sampling 的高效变体）
     ↓
⑤ 对中轴球簇的连通性取对偶 → 最终网格
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Offset-volume 重表述** | 整个方法的基石。把「等值面提取」换成「中轴提取」 |
| **Ray casting 采样偏移面** | 显式避开 grid-based 方法的各向异性偏置与体素分辨率绑定 |
| **Variational Medial Axis Sampling (变体)** | 在偏移体内优化中轴球位置与半径，本文强调「efficient variant」 |
| **Dual of medial ball cluster connectivity** | 从中轴球簇的对偶连通性重建网格 —— 这是 medial axis ↔ 表面重建的标准对偶机制 |
| **鲁棒性覆盖** | 可处理**不完美距离场**：噪声训练的神经 UDF、Q-MDF（Quasi-Medial Distance Field）、直接在 triangle soup 或点云上计算的距离 |

## 复杂度分析

- 中轴提取本身是 O(n) 到 O(n log n) 级别（取决于变体），但**中轴的大小可能远超输入** —— 这是 medial axis 方法的固有缺陷（偏移体越"胖"，中轴越密）
- Ray casting 采样偏移面：O(N_queries × log N) 级别（需加速结构）
- **输出规模**：由中轴球簇决定，**不保证**与输入分辨率解耦 —— 这是该路线的主要风险

## 实现难度与数值稳定性

- **算法复杂度**：**中高**。中轴提取（尤其变体 VMAS）本身是研究级难题；但**框架迁移**的部分思路清晰。
- **数值稳定性**：**中高**。中轴对距离场噪声**敏感**（噪声会造出伪局部极小点 → 伪中轴分支）。论文明确说能处理神经 UDF 的噪声，但这是「鲁棒性主张」而非「构造性保证」。
- **依赖项**：预期自研（ICube 的几何处理组）+ 可能的 CGAL/OpenVDB 组件。

## 实验结论

- **基线**：prior UDF → mesh 重建技术
- **结果**：**更忠实的网格重建**，**与底层形状结构的更好对齐**（对齐度提升是中轴路线的结构性优势 —— 中轴本来就携带形状的"骨架"语义）
- **覆盖范围**：开放 / 非流形 / 曲线状几何，且对不完美距离场鲁棒

## 局限性

- **中轴的固有病态**：medial axis 对噪声与距离场梯度的不连续性敏感，容易产生「冗余分支」。虽然论文处理了噪声 UDF，但**「结构更忠实」与「拓扑更干净」是两个不同目标** —— 后者可能因中轴的冗余分支而变差。
- **输出网格规模不可控**：不同于 Marching Cubes 的分辨率由体素网格决定，中轴路线的输出复杂度由形状的**几何复杂度**决定（一个光滑球面的中轴很短，一个尖锐特征的球面中轴极长）。
- **α 的选取**是全局参数，摘要未说明自适应策略。
- 摘要未给出与 Marching Cubes / Dual Contouring 的**直接速度对比**（因为它们不适用于 UDF）。

## 相关工作

- [[2026-10-30-SA2026-RBF-Your-SDF-RBF-Interpolation-SDF]] — 同属「改进 SDF → 显式曲面」路线
- [[2604-00157-Dual-Contouring-SDF]] — 本库已有：Dual Contouring
- [[2026-05-21-Dual-Latent-Diffusion-Polycube-Hexahedral-Mesh]] — 本库已有
- [[2026-07-26901-Convex-Collision-Free-Regions]] — 本库已有
- [[2026-08-23-arxiv-neural-subdivision]] — 本库已有

## 实现建议

- **实现难度**：**中高**
- **预期性能**：中轴提取的复杂度取决于距离场质量；ray casting 采样是主要成本
- **适用场景**：
  - **开放边界几何**（薄片、管道、单侧曲面）—— 这是 SDF 路线根本做不到的
  - **非流形几何**（多个壳体相交、T 形接头）
  - **混合曲线-曲面**的几何表示
  - 从**点云 / triangle soup 直接计算距离**的场景（论文明确支持）
- **对团队的直接价值**：**高**。我们现有的网格化管线以 SDF 为主；如果遇到**开放边界或非流形**输入，目前基本无解。这篇提供了一个有理论依据的替代方案。

## 可直接抄的工程结论

1. **当某个问题「没有好方法」时，先检查它是否被错误地表述了。** UDF 提网格难，不是因为距离场提取难，而是因为「等值面提取」这个表述对 UDF 不成立。
2. **成熟工具链的价值在于「换表述」之后的复用。** 中轴方法本身是几十年的老技术，但换个表述就能吃下 UDF。
3. **警惕中轴的固有病态**（冗余分支 / 输出规模失控）—— 引入新表示时，要评估它引入的**输出复杂度是否可控**。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
