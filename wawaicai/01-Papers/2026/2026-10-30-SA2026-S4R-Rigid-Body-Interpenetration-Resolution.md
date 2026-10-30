---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, collision-resolution, interpenetration, continuation-method, sparse-convex-QP, rigid-body, physical-simulation, procedural-generation, robot-scene-synthesis]
domain: geometry
agent: wawaicai
recommendation: 强烈推荐（延续法 + 解析预测接触事件，是工程上极其实用的方案）
---

# S4R: Scaling for Rigid-Body Interpenetration Resolution

> 📌 **今日最具工程实用价值的一篇**：刚体穿透解算 —— 一个所有物理仿真 / 程序化生成 / 机器人场景合成管线都必须处理的预处理步骤。本文用**延续法（continuation method）** + **解析接触事件预测**给出稳定且快速的解法。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | S4R: Scaling for Rigid-Body Interpenetration Resolution |
| **作者** | Zhiyang Dou (MIT CSAIL), Ang Zhao (厦门大学), Chen Peng (HKU), Minghao Guo (MIT CSAIL), Haixu W... |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1264](https://sa2026.conference-schedule.org/presentation/?id=papers_1264) |
| **关键词** | interpenetration resolution, continuation method, sparse convex QP, signed distance, rigid body, collision detection |
| **基准** | **Kubric**, **HY3D-Bench**, **Thingi10K** |

## 技术概述

### 问题：两个失败模式

刚体穿透解算（rigid-body interpenetration resolution）是**物理仿真、程序化生成、机器人场景合成**中的常见且重要的预处理步骤。

既有方法的两大失败模式：

1. **在稠密非凸接触上会循环（cycle）** —— 迭代式解算在接触数量多、非凸时容易来回振荡
2. **依赖全局线性化（global linearization）**，在**深度穿透**下变得不可靠 —— 线性化假设在小位移/浅接触处成立，深穿透时误差巨大

### 核心思想：均匀缩放的延续法 + 解析接触事件预测

**第一步：从下缩放的无碰撞状态开始**

> S4R 是一个基于**均匀缩放（uniform scaling）**的延续方法。从一个**无碰撞的、下缩放的状态**出发，S4R **逐步把刚体恢复到全尺寸**，并在每一步求解一个**稀疏凸二次规划（sparse convex QP）**，得到维持间隙所需的**最小范数位移**。

这里的缩放是**延续法（continuation / homotopy）**的经典用法：把一个难解的非线性问题，替换成一串**容易解的小步问题**，用小步的结果做下一步的初值。

**第二步：解析预测接触事件（本文最巧妙的部分）**

> 因为**表面点的轨迹在缩放参数上是线性的**，S4R **解析地预测接触事件**，并更新全尺寸网格查询之间的**有符号距离**。

这是全文的技术核心。为什么线性性重要？

在缩放参数 `s ∈ [0,1]` 上，刚体表面点 `p(s) = s · p₀ + t`（含平移 `t`）。若接触判定依赖表面点对的距离，那么：

- **接触事件（两个表面点何时首次接触）是缩放参数的解析函数**（一个二次方程的根）
- 这意味着：**不需要在每一步都重新检测接触**，可以**解析地算出「下一步会在哪里发生接触」**，从而把步长选得**刚好不越过接触点**

**效果**：

> **避免深入穿透的线性化点**，保持每个子问题**接近浅接触**。

**第三步：最终精修**

> 最后的**精修阶段验证全尺寸配置并修正残余的违规**（residual violations）。

## 复杂度分析

- 每个子问题：**稀疏凸 QP**（接触约束数 = 当前活跃接触数，通常远小于总点数）⇒ 求解成本 ~ O(k log k)（内点法 / ADMM）或 O(k^ω)
- **步数**：由缩放的「连续性容限」决定，实践中通常**远小于 10~20 步**（摘要未给数字）
- 关键优化：**解析接触事件预测**避免了「每步做全局碰撞检测」—— 全局检测是 O(n log n) 起步，而接触事件解析求解是 O(k)
- **论文报告**：在大规模场景下**墙钟时间优于基于优化的基线**

## 实现难度与数值稳定性

- **算法复杂度**：**中**。延续法本身是标准技术；难点在 (a) 稀疏 QP 的组装与求解器选择，(b) 接触对的增量维护，(c) 「全尺寸网格查询」的有符号距离更新机制。
- **数值稳定性**：**高**。这是本文的强项：
  - 浅接触处的线性化**有效**（这是物理仿真的标准假设），且本文**刻意**把每个子问题保持在浅接触区
  - **解析预测**避免了「步长过大导致穿透」这个不稳定来源
  - 凸 QP 的子问题**有全局唯一解**（凸性）⇒ 不存在局部极小
  - 唯一的不保证点是**最终精修阶段**（残余违规的修正没有保证性描述）
- **依赖项**：稀疏 QP 求解器（OSQP / MOSEK / 自研）+ 网格距离查询（BVH / 网格自相交工具）。

## 实验结论

- **数据集**：**Kubric**（合成，密集堆叠场景）、**HY3D-Bench**（3D 资产）、**Thingi10K**（模型库）
- **基线**：基于优化的方法（projection / optimization-based）
- **结果**：
  - **消除了评测器报告的穿透**（evaluator-reported penetration）—— 注意这是**第三方评测器**的报告，不是自评，这比自报指标可信
  - **保持较低的质心位移**（low centroid displacement）—— 即修正穿透的同时**没有把物体推飞**，这是关键的质量指标
  - **大规模下墙钟时间优于优化基线**

> 💡 **「质心位移」这个指标值得记住**：解算穿透时，很多方法靠「大力推开」来消除穿透 —— 这会让场景整体失真。S4R 显式优化「最小范数位移」并报告质心位移，说明它在做「**最小干预**」。

## 局限性

- **只处理刚体**（标题里的 S = Scaling / Rigid）。软体或可变形体的穿透解算未覆盖。
- **单点接触假设**：QP 假设接触是**点-点**或点-面的；连续接触区（面-面）需要额外的接触流形假设。
- **最终精修的鲁棒性**：摘要说「验证并修正残余违规」，但未说明残余违规若无法修正时的行为（失败？抛异常？）。
- 摘要未给出**步数**与**每步耗时**的具体数字。
- 「避免深度穿透线性化点」的前提是**缩放轨迹线性**，这对**带旋转的运动学链**（多关节）不直接成立。

## 相关工作

- [[2026-10-30-SA2026-Robust-Bijective-Mapping-Differential-Boundary]] — 同属「结构性保证」路线
- [[2026-10-30-SA2026-Multi-Level-Quadrature-Projective-Dynamics]] — PD 求解
- [[2026-05-09-Adaptive-In-Solve-Algebraic-Coarsening-GPU-IPC]] — 本库已有：GPU IPC
- [[2026-05-09-Canvas-Adaptive-In-Solve-Algebraic-Coarsening-GPU-IPC]] — 本库已有
- [[2026-10-24-2610-30214-Stretch-Energy-Gamma-Convergence-Surface-Homeomorphisms]] — 本库已有

## 实现建议

- **实现难度**：**中**
- **预期性能**：大规模场景下快于优化基线；每步是稀疏 QP
- **适用场景**：
  - **物理仿真预处理**（机器人、车辆、堆叠物体）
  - **程序化生成**（场景摆放后消除穿插）
  - **机器人场景合成**（数字孪生、仿真资产）
  - **游戏引擎**（烘焙阶段的批量解算）
- **对团队的直接价值**：**极高（实用）**。如果我们的管线里有「摆放物体后消除穿插」这个需求，这套方案可以直接落地。**「从下缩放状态起步」这个思路本身极其通用** —— 几乎任何「深穿透导致非线性求解失效」的问题都可以用延续法救。

## 可直接抄的工程结论

1. **深穿透失败 ⇒ 先缩小再放大（延续法）**。这是处理「非线性方程在大步长下失效」的通用套路。
2. **能用解析预测就不要用采样检测**。表面点轨迹在缩放参数上线性 ⇒ 接触事件是闭式可解的，这把 O(n log n) 的检测变成了 O(k) 的解析求解。
3. **把步长选在「刚好不越过接触点」的位置** —— 让每个子问题都落在求解器可信的区间内，比事后修正更可靠。
4. **报告「最小干预」指标**：质心位移。消除穿插不应以推飞物体为代价。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
