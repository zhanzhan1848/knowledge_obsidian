---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, isogonal-nets, quad-mesh, discrete-differential-geometry, developable-surfaces, conformal-mapping, shell-structures, paper-craft, computational-design]
domain: geometry
agent: wawaicai
recommendation: 推荐（离散等角网 + 可展开曲面的离散模型，数学品味高）
---

# Quad-mesh based isogonal nets and computational design

> 📌 用**四边形网格**构造**离散等角网（isogonal nets）**，并证明其中第三类是**可展开曲面（developable surfaces）的离散模型** —— 一个有清晰微分几何渊源的**构造性**（非优化）几何设计框架。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | Quad-mesh based isogonal nets and computational design |
| **作者** | SIGGRAPH Asia 2026 Technical Papers（摘要未在列表页给出作者名，见会议日程） |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_2209](https://sa2026.conference-schedule.org/presentation/?id=papers_2209) |
| **关键词** | isogonal net, quad mesh, discrete differential geometry, developable surface, conformal mapping, shell structure, paper craft |

## 技术概述

### 背景：等角网与可展开性

**等角网（isogonal net）** 是微分几何中的经典对象 —— 一族曲线，其**相交角度恒为 90°**（isogonal = 等角的）。

**Chebyshev 网（Chebyshev net）** 的两个基本性质：
1. **正交（orthogonal）** —— 两族曲线处处垂直相交
2. **可展开（developable）** —— 曲面可**不拉伸、不撕裂地展平**到平面

这两个性质使等角网成为**壳体结构设计**与**纸艺/折纸**的天然数学模型：正交意味着「弯曲只沿一个方向」，可展开意味着「能折平」。

### 核心思想：从四边形网格构造等角网

> 我们提出一个**基于四边形网格的框架**，用于构造**离散等角网** —— 使用**棋盘格（checkerboard）图案**，以及**从四边形网格导出的内接平行四边形**。

**关键构造**：在四边形的每条对角线上放一个控制点，连同四个角点，构成一个**内接平行四边形**。在棋盘格式的交替排列下：

> 通过控制这些**平行四边形的角度、相似性（similarity）或全等性（congruence）**，我们在对角网格或控制网格上得到**三类等角网**。

| 类别 | 控制条件 | 特性 |
|------|---------|------|
| **第一类** | 角度（angle） | 保持等角性 |
| **第二类** | 相似（similarity） | 保持形状（各向同性） |
| **第三类** | 全等（congruence） | **可展开曲面的离散模型** |

### 三大特性

1. **显式表示（explicit representations）** —— 这些网有**简单的显式表示**，不需要优化求解
2. **形状探索** —— 支持与**保角映射（conformal mapping）**相关的多样形状探索，且**保持图案形状**
3. **显式约束** —— 用**显式的、至多二次（at-most-quadratic）约束**来数值计算与优化

### 第三类 = 可展开曲面的离散模型

> 第三类**充当可展开曲面的离散模型**，其依据是**光滑等角 Chebyshev 网的分析**，并通过**离散微分几何量**得到验证。

这是本文最有分量的部分：它把**连续的可展开曲面**与**离散的四边形网格 + 平行四边形**严格对应起来，而且**验证是通过离散微分几何量做的**（不是可视化上的相似）。

### 应用

- **壳体结构（shell structures）的图案设计**
- **交互式纸艺切割模型（interactive paper-cutting models）**
- 两者都**用重复的相似元素制作实物**

## 复杂度分析

- **构造**：四边形网格 → 内接平行四边形 → 等角网，**O(面数)**
- **约束求解**：显式、至多二次 ⇒ **O(面数)**，且解**唯一确定**（无迭代收敛问题）
- **形状探索（参数扫描）**：每个参数样本 O(n)，可增量计算

## 实现难度与数值稳定性

- **算法复杂度**：**中**。构造是显式的，但**「控制平行四边形的角度/相似/全等」的具体代数条件**需要推导，实现时容易出符号错误。
- **数值稳定性**：**高（相对而言）**。这是本文的重要优点：**显式 + 至多二次约束**意味着没有大规模非线性求解，没有迭代发散，只有根的选取问题。
- **依赖项**：预期自研（四边形网格数据结构可用 libigl / OpenMesh）；可能需要自己的离散微分几何量计算。

## 实验结论

- **验证方式**：通过**壳体结构的图案设计**与**交互式纸艺切割模型**两类应用展示三类网的有效性
- **理论验证**：第三类通过**离散微分几何量**验证为可展开曲面的离散模型（与连续理论对应）

## 局限性

- **仅 2D 图案 + 折平到 3D**：这是「可展开曲面」的平面表示方法，不是 3D 曲面建模工具。
- **「交互式纸艺切割模型」的具体交互未说明**（是拖拽调整折痕？还是设计图案？）。
- **四边形网格本身的质量要求**：内接平行四边形的构造依赖四边形的**形状质量**，若输入四边形网格极不规则，「相似/全等」条件可能不可满足。
- **与既有多边形网（polygonal net）方法的关系**未在摘要中讨论 —— 这类方法已有相当积累（常见的「竹编/冰裂纹/镶嵌图案」生成），本文的差异化点应在正文。
- 摘要未给出定量对比。

## 相关工作

- [[2026-10-30-SA2026-Tight-Quad-Dominant-Tri-Quad-Cage]] — 四边形主导网格
- [[2026-10-30-SA2026-FlowLoops-Curve-Networks-Triangle-Meshes]] — 曲线网络
- [[2026-10-30-SA2026-Voronoi-Scissors-Approximate-Dissection]] — 纸艺 / 切割方向
- [[2026-10-27-2610-34903-Inverse-Origami-Wrinkle-Structure-Curved-Surface]] — 本库已有：折纸
- [[2026-06-09-quadrilateral-meshing-integrable-odeco-fields]] — 本库已有：四边形网格

## 实现建议

- **实现难度**：**中**
- **预期性能**：实时（显式构造 + 二次约束）
- **适用场景**：
  - **壳体 / 纸艺 / 折纸的参数化设计**（建筑薄壳、家具板件、装饰）
  - **保角映射的形状探索**（受限的相似变换族）
  - **图案生成**（镶嵌、编织感的面板）
- **对团队的直接价值**：**中**。若我们有**折纸 / 可展开结构**方向（我们库里有 Inverse Origami），这篇提供了**离散层面的严格对应**，可用于生成「保证可折平」的折痕图案。

## 可直接抄的工程结论

1. **显式构造 > 优化求解**，尤其当约束是「至多二次」时。构造性方法没有收敛问题、没有初值敏感性、没有局部极小。
2. **离散模型要有连续理论的对应**，并且**用离散微分几何量验证**，而不是靠视觉判断 —— 这是把「看起来对」升级为「可证明对」的关键一步。
3. **正交 + 可展开 = 壳体设计的充分条件**。这两个性质可以直接作为设计约束写进生成器。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
