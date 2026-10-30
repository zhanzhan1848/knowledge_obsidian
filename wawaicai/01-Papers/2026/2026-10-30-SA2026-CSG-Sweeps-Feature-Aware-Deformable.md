---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, CSG, sweep-surface, feature-aware, non-rigid-motion, implicit-surface, discretization, sharp-features, CAD]
domain: geometry
agent: wawaicai
recommendation: 推荐（特征感知扫掠面，CSG 扩展到非刚体运动）
---

# CSG Sweeps: Feature-aware sweep surfacing of deformable CSGs

> 📌 计算**运动刚体的扫掠面（sweep surface）**是计算机图形学的经典问题；当实体是**分片光滑（piecewise-smooth）**时，扫掠面上会出现**复杂的锐特征（sharp features）网络**，而既有方法**几乎都只支持刚体运动**。本文是**首个**面向**可变形 CSG** 的特征感知扫掠面方法。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | CSG Sweeps: Feature-aware sweep surfacing of deformable CSGs |
| **作者** | Jianjun Xia (Washington University in St. Louis), Qingnan Zhou (Adobe Research), Yiwen Ju (WashU / Stability AI), Xingyi Du... |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_2479](https://sa2026.conference-schedule.org/presentation/?id=papers_2479) |
| **关键词** | sweep surface, CSG, implicit surfaces, sharp features, non-rigid motion, feature-aware |

## 技术概述

### 问题：分片光滑实体的扫掠面特征

**扫掠面** = 一个实体沿运动轨迹扫过所形成的曲面。计算它是图形学的基础问题。

难点在于实体是**分片光滑**时：

> 扫掠面上会产生**复杂的锐特征网络**（a complex network of sharp features）。

而既有方法：
- **很少有方法能建模这些特征**
- **全部局限于刚体运动（平移与旋转）**

### 核心思想：把 lifted sweeping 推广到 CSG

技术贡献：

1. **把 lifted sweeping 公式从「光滑函数」推广到「CSG 函数」**
2. **在任意维度下，对多个相交隐式曲面进行稳健离散化的算法**

**Lifted sweeping** 的思路是把「运动」提升为**高维空间中的静止问题**：把时间维度加进来，运动体的扫掠面 = 在 (空间, 时间) 增广空间中的一个固定形状 —— 于是原本需要处理运动的几何算法，可以在增广空间里当作静态问题处理。

这个思路原本只对**光滑（smooth）函数**成立（因为需要光滑性来做微分运算）。而**真实模型是 CSG**（布尔运算组合的多个光滑基元）—— 分片光滑在**基元交界处**不可微，正是**锐特征的来源**。

本文的推广正是让 lifted sweeping 能在**分片光滑**的情形下工作，从而能捕捉锐特征。

**「任意维度的相交隐式曲面离散化」** 是配套的关键技术：扫掠面上会出现**基元之间互相扫掠产生的自交/相交特征**，这些必须被正确离散化。

## 复杂度分析

- Lifted sweeping：把 3D 问题提升为 4D（空间 + 时间），网格规模从 O(R³) 变为 O(R⁴) ⇒ **这是主要成本**
- **任意维度**的隐式曲面离散化： marching cubes 家族的推广，O(n · f) 级别（n = 单元数，f = 每单元的相交复杂度）
- 锐特征的**显式检测与标记**是额外开销

## 实现难度与数值稳定性

- **算法复杂度**：**高**。需要：CSG 的 lifted sweeping 推广、任意维隐式曲面离散化、锐特征的拓扑处理（特征线上的顶点/边的特殊编码）。
- **数值稳定性**：**高**。CSG 的布尔运算在**基元几乎相切**或**共面**时是经典的数值病态情形；隐式离散化在锐特征处需要**特征对齐的网格**（否则锐特征会被磨圆）。
- **依赖项**：预期自研（隐式曲面库 + CSG 内核）；可能复用 CGAL 的 Nef / 自研 CSG。

## 实验结论

- **结果**：在**刚体与非刚体运动**下均能**捕捉扫掠面上的锐特征**
- **输入要求**：任意 4D 时变 CSG（**几何与拓扑在扫掠过程中都可变化**）

## 局限性

- **4D 提升的代价**：时间维度的加入使离散化成本显著上升（3D→4D 是指数级采样增长）。摘要未提及是否用稀疏/自适应时间采样缓解。
- **CSG 输入是硬约束** —— 需要模型本来就用 CSG 表示。对一般三角网格模型，需要先做 CSG 重建（本身是困难问题）。
- **拓扑变化**（CSG 中的布尔操作导致组件出现/消失）的处理是难点，摘要只说「支持」但未说明细节。
- 摘要未给出速度数据与基准。

## 相关工作

- [[2026-10-30-SA2026-FlowAR-BRep-Interleaved-AR-Flow-Matching]] — B-Rep 生成
- [[2026-10-30-SA2026-CADRec-Recursive-CAD-Sequence-Reconstruction]] — CAD 序列重建
- [[2026-10-19-2610-24569-Energy-Minimized-BSpline-Lofting-Closed-Contours]] — 本库已有：放样（lofting）
- [[2026-10-17-2610-24425-Rectangular-Schoenberg-Whitney-Clamped-BSplines]] — 本库已有

## 实现建议

- **实现难度**：**高**
- **预期性能**：离线（4D 离散化成本高）
- **适用场景**：
  - **运动物体的扫掠体**（机器人手臂扫掠空间、机床刀具扫掠、物体搬运路径包络）
  - **形变 CSG 的包络面**
  - **运动包络 / 可达空间**计算
- **对团队的直接价值**：**中**。若我们有「运动物体包络面」需求（例如机器人可达空间、模具加工包络），本文提供了从 CSG 侧出发的方案；需要 CSG 输入是主要限制。

## 可直接抄的工程结论

1. **「提升到高维变静态」是处理运动问题的通用技巧** —— 但要检查原方法依赖的光滑性在真实模型上是否成立。本文正是修补了这一环。
2. **真实模型通常不是光滑的** —— 分片光滑（CSG）是常态，任何假设光滑性的算法在工程上都要补一个「特征感知」的补丁。
3. **4D 提升的成本是指数的** —— 实践中必然要配合时间维度的自适应采样。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
