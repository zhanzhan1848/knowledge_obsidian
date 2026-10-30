---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, shape-dissection, Voronoi, puzzle-design, fabrication, continuous-optimization, global-optimization, rigid-assembly, combinatorial-complexity]
domain: geometry
agent: wawaicai
recommendation: 推荐（形状剖分问题的现代解法，有限形 + 保证刚体无重叠重排）
---

# Voronoi Scissors: Approximate Dissection of 2D Shapes with Continuous Optimization

> 📌 **经典的「形状剖分」问题**（把两个形状切成可以互相替换的公共碎片 —— 著名的「七巧板 / 剖分复用」问题）**长期只有精确解多边形的小规模版本**。本文给出**全自动**方法，且**保证所有碎片支持刚体、非重叠的重排**。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | Voronoi Scissors: Approximate Dissection of 2D Shapes with Continuous Optimization |
| **作者** | ANRAN Qi (University of Tokyo / INRIA / Université Nice Côte d'Azur), Nico Pietroni (UTS Sydney), 等 |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1152](https://sa2026.conference-schedule.org/presentation/?id=papers_1152) |
| **关键词** | shape dissection, Voronoi decomposition, puzzle design, rigid assembly, continuous optimization |

## 技术概述

### 问题：几何约束 + 组合复杂度的双重困难

**平面形状的剖分（dissection）** —— 把形状切成一组**可复用的公共碎片**，通过重排可以近似不同的目标构型 —— 是一个**经典问题**，与**几何处理、Fabrication、设计**都有联系。

尽管研究历史悠久，问题依然困难：

> 困难源于**几何约束与组合复杂度的相互作用**。

既有方法的限制：
- 限于**简单多边形的精确剖分**
- 或只能处理**少量碎片**
- **做近似剖分时引入显著失真**

### 核心思想：混合优化流水线（Hybrid Optimization Pipeline）

> 我们的方法把问题表述为一个**混合优化流水线**。

三个阶段：

```
① 连续优化（基于 Voronoi 驱动的分解）→ 生成初始划分
        ↓
② 全局优化 → 确定碎片的一致重排，强制满足有效刚体无重叠装配所需的结构约束
        ↓
③ 最终精修 → 精化解以最好地逼近输入形状
```

**为什么是 Voronoi？**

Voronoi 分解是 2D 剖分问题的**经典起点**（直觉上，「从若干中心点辐射出的边界」天然形成可重排的碎片）。但纯 Voronoi 的问题是：

- 边界是**直线段**，无法贴合复杂形状的轮廓
- 重排的**一致性**（哪些碎片对应哪些位置）无法自动确定

因此：
- **阶段 ①** 用 Voronoi 提供结构，但用**连续优化**调整边界使其贴合形状
- **阶段 ②** 用**全局优化**处理「哪些碎片移到哪个位置」这个**组合问题**（这是组合复杂度的来源）
- **阶段 ③** 在结构固定的前提下精修几何

**本文的硬保证**：

> 我们的方法**保证所有碎片支持刚体、非重叠的重排**。

这是与「近似」形成对比的**结构性保证** —— 近似只在**几何贴合度**上是近似的，**装配的合法性是保证的**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Voronoi 驱动的连续分解** | 用 Voronoi 提供碎片结构，用连续优化调整边界贴合形状 |
| **全局优化（一致重排）** | 确定碎片的对应关系与放置，同时强制「有效、刚体、无重叠装配」的结构约束 |
| **最终精修** | 结构固定后精修边界以最小化与输入形状的偏差 |
| **刚体 + 无重叠约束** | 作为**约束**而非**惩罚项** ⇒ 保证成立 |

## 复杂度分析

- **连续优化**：每次评估需要检查所有碎片的装配约束 ⇒ O(k²) 最坏（k = 碎片数），可用空间结构加速
- **全局优化**：组合问题的搜索代价随碎片数**指数增长** ⇒ 这是主要瓶颈 ⇒ 这也解释了「既有方法只能处理少量碎片」的根因
- **适用规模**：摘要未给具体碎片数，但展示了「多形状重排、复杂拓扑、复用驱动」场景

## 实现难度与数值稳定性

- **算法复杂度**：**高**。混合连续 + 全局优化，且全局部分要处理组合结构。
- **数值稳定性**：**中高**。装配的「无重叠」判定在**接触/临界**情形下是布尔运算的经典病态点；有重叠与无重叠之间是**开集边界**，优化可能停在边界上。
- **依赖项**：Voronoi（图划分库，CGAL 有 `Apollonius_graph_2`）；约束优化（自研或 OSQP/CBC）；布尔运算（CGAL `Polygon_mesh_processing`）。

## 实验结论

- **场景**：多形状重排、复杂拓扑形状、**复用驱动**（固定源形状被划分以逼近目标）
- **结果**：
  - **全自动**
  - **保证刚体、非重叠重排**
  - 碎片**更紧凑**、**失真更小**（优于既有工作）
- **直观示例**（来自预告片报道）：「手臂与河豚」「乌龟与草莓」等完全不同的形状，用同一组碎片拼出

## 局限性

- **仅 2D**。3D 剖分（立体拼图）显然更难，本文未涉及。
- **全局优化的组合爆炸**：碎片数上限未说明；「多形状重排」的形状数量上限也未说明。
- **Voronoi 结构的局限**：对于碎片数量远多于形状「特征数」的复杂形状，Voronoi 初始化可能并不合适 —— 阶段 ②/③ 能否修复未说明。
- **「紧凑」的度量**未定义（周长？面积？紧凑性比值？）。
- 摘要未给出**与既有工作的定量对比表**。

## 相关工作

- [[2026-10-30-SA2026-Quad-Mesh-Isogonal-Nets]] — 同为「构造性图案」方向（交互式纸艺切割模型）
- [[2026-10-30-SA2026-Fabricating-3D-Shapes-Shrinking-Thread-Embroidery]] — Fabrication 方向
- [[2026-10-30-SA2026-Ortho-arc-Curves-Developable-Bands-Polygonal-Tubes]] — 可展开曲面 / Fabrication
- [[2026-06-18-日报]] — 本库已有

## 实现建议

- **实现难度**：**高**
- **预期性能**：离线（全局优化成本高）
- **适用场景**：
  - **平面拼图 / 拼版设计**（广告、展板、印刷排版）
  - **材料复用**（板材切割优化、家具模块化设计、衣料 upcycling）
  - **教育 / 交互式几何玩具**
  - **仿形设计**（一个源形状切成多份，逼近多个目标）
- **对团队的直接价值**：**中**。如果我们有**制造 / 板材切割 / 模块化设计**相关业务，这篇的方法框架（Voronoi 初始化 → 全局重排 → 精修 + 合法性保证）可以直接复用。

## 可直接抄的工程结论

1. **把「保证」与「近似」分开**：几何贴合度是近似的，**装配合法性是保证的**。这个分层应该在我们的工具输出中显式区分。
2. **用经典结构（Voronoi）做初始化，用优化修正** —— 而不是直接上全局搜索。
3. **组合复杂度集中在单一阶段**（阶段 ②）是好设计：让连续优化阶段专注于几何，让离散阶段专注于组合。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
