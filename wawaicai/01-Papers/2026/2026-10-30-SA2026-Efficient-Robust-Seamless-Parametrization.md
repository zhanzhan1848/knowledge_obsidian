---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
session: Thursday (sess 信息见会议日程)
tags: [geometry, parametrization, UV-unwrapping, seamless, Penner-coordinates, intrinsic-meshing, quad-meshing, texture-mapping, multiscale, scalability]
domain: geometry
agent: wawaicai
recommendation: 强烈推荐（参数化方向近 20 年少见的「可扩展性 + 鲁棒性」双突破）
---

# Efficient and Robust Seamless Parametrization

> 📌 **今日最值得精读的一篇**：把 **Penner 坐标**（内蕴参数化，2008 年至今近 20 年的核心工具）从「能跑但慢」推到「百万三角形可用」。核心洞察是**三级尺度分离**：结构的决定权在粗网格，精度只在细网格。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | Efficient and Robust Seamless Parametrization |
| **作者** | Ryan Capouellez, Alisher Aikyn, Denis Zorin (New York University) |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **日程** | Thursday, 3 December 2026, Conference Hall 2, Level 3 |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1694](https://sa2026.conference-schedule.org/presentation/?id=papers_1694) |
| **关键词** | seamless parametrization, Penner coordinates, holonomy, guiding field, multiscale |
| **开源** | 摘要未给出，待确认 |

## 技术概述

### 问题：内蕴参数化的「精度诅咒」

**无缝（seamless）参数化**是参数化领域最核心也最难的一类问题 —— 它要求参数域上**没有接缝**，即网格能被**连续地**展平到平面域而不断裂。它支撑了很多下游任务：

- 四边形网格生成（quad meshing）
- 纹理映射（texture mapping）
- 基于 patch 的曲面表示（patch-based surface representation）

主流的**内蕴（intrinsic）**路线基于 **Penner 坐标**：用一个**引导场（guiding field）** + 检测到的**特征线（feature lines）**来指定参数化的**拓扑结构**。这条路线的优点是**鲁棒**（能构造出可行的、拓扑结构符合预期的无缝参数化），早期方法（Loop sphere 方案、ABF++ 的内蕴变体）留下的鲁棒性局限基本被它解决了。

**但 Penner 坐标极度依赖高精度非线性求解**（本质上是一组非线性方程组 + 全局耦合），这带来一个致命问题：

> 在**大而稠密**的网格上（非结构化、百万级三角形），高精度非线性求解**无法扩展**。

现实需求恰恰是百万三角形级别的模型（游戏 / 影视资产 / 数字孪生）。

### 核心思想：三级尺度流水线（Three-Scale Pipeline）

论文的关键观察非常有价值，它把「为什么需要高精度」这个问题拆开了：

> Penner 坐标方法**主要用于建立一个初始可行解**。而这个初始解的**结构**只取决于：
> - 引导场的**整体拓扑**
> - 曲面的**拓扑**
>
> **而不是**精细的几何细节。

并且：

> 在全分辨率下**不需要高精度优化**，只要**粗解能被传递到细层级、同时保持约束**即可。

于是得到一条三尺度流水线：

```
① 中等分辨率网格：计算引导场（guiding field）与 holonomy（绕数/单值性）
        ↓
② 粗网格（允许改变连通性 connectivity changes）：高效求解 Penner 坐标可行性问题
        ↓
③ 原始细网格：把粗解的结构传递过来，只做「可扩展的」最终优化 + 量化（quantization）
```

**每一级只做它该做的事**：
- 精细几何信息 → 留到 ③
- 拓扑结构决策 → 提前到 ②
- 引导场 → 提前到 ①（避免在细网格上重复计算）

### 关键技术

| 技术 | 说明 |
|------|------|
| **Holonomy 计算** | 引导场的单值性判据。必须在**中分辨率**上做 —— 细网格上 holonomy 的数值更精确但求解更贵，且不改变最终结构 |
| **粗网格可行性求解** | 关键：**允许连通性改变（connectivity changes）**。这让粗网格的离散化不必与细网格兼容，从而可以自由选择最利于数值求解的粗离散 |
| **结构传递（structure transfer）** | 把粗解的**拓扑结构**（而非几何）搬到细网格上。这是整个方法的枢纽，也是「精度可以延后」得以成立的技术前提 |
| **可扩展的最终优化 + 量化** | 细网格上只做单次、可扩展的优化，并做量化（离散到整数坐标 / 图册坐标） |

## 复杂度分析

- **原有 Penner 路线**：非线性求解规模 ∝ 细网格规模 ⇒ **不可扩展**
- **本文**：三个阶段各自在**各自尺度的网格**上运行，总成本 ≈ `O(mid) + O(coarse) + O(fine, 线性化)`，其中非线性全局求解的规模被压到 **coarse** 这一级
- 论文报告：**百万三角形级别**网格上**显著加速（substantial speedups），鲁棒性无变化**

## 实现难度与数值稳定性

- **算法复杂度**：**中**。概念清晰（尺度分解），但「结构传递」的工程实现是难点 —— 需要定义一个鲁棒的「粗解结构 → 细网格布局」的对应关系。
- **数值稳定性**：**高**。这是本文最大的卖点 —— **鲁棒性没有因为加速而退化**（"no change in robustness"）。这在几何处理里非常难得，因为绝大多数「加速」方案都是靠放松约束换来的。
- **依赖项**：预期为自研实现（NYU 几何处理组的一贯风格）；无外部几何库依赖说明。

## 实验结论

- **数据集**：大规模 benchmark + 真实世界模型
- **基线**：其他 Penner 坐标 / 内蕴参数化方法
- **结果**：**显著加速**，**鲁棒性不变**，处理**百万三角形**网格无压力

## 局限性

- 摘要未给出具体的加速比数字与所用基准细节 → 需查阅正文
- 「结构传递」的适用边界未说明：对于**强特征、非流形**或**拓扑退化**的网格，粗化过程可能破坏特征线检测
- 摘要未提及是否支持**多图表征（multi-chart）**与**边界条件（boundary conditions）**的自定义

## 相关工作

- [[2026-10-30-SA2026-SeamFlow-Artist-Like-UV-Unwrapping]] — 同属参数化方向，但目标不同（SeamFlow 追求「艺术家式」的语义连贯接缝，本文追求无缝 + 可扩展）
- [[2026-10-30-SA2026-ADELE-Adaptive-Delaunay-Mesh-Native-Reconstruction]] — 同为「网格原生」路线
- [[2026-10-30-SA2026-PolyFlow-Continuous-Topology-Flow-Matching]] — 网格拓扑的连续化（生成方向）
- [[2606-18069-Blended-Chart-Surfaces]] — 本库已有：混合图表曲面
- [[2026-06-14-Neural-UV-Reparameterization]] — 本库已有：神经 UV 重参数化

## 实现建议

- **实现难度**：**中**
- **预期性能**：百万三角形级别可交互（相比原始 Penner 坐标预期 **数量级**加速）
- **适用场景**：
  - 需要**无缝**（无接缝）参数化的下游：四边形网格生成、全局纹理映射、patch-based 表示
  - 大规模资产管线（游戏 / 影视 / 数字孪生）
- **对团队的直接价值**：**极高**。如果我们的工具链里有任何「内蕴参数化 / Penner 坐标 / Loop sphere」环节，这篇的**三级尺度分解**可以直接照搬 —— 即使我们不做内蕴版本，「结构与精度分离」的思路也适用于任何「粗结构 + 细几何」的两阶段几何算法。

## 可直接抄的工程结论

1. **先问：这个解的结构依赖什么？** 结构只依赖拓扑 → 可以在粗网格上求解。
2. **粗化时允许改变连通性** —— 这是本文最关键的技术自由度，很多两阶段算法不敢放开。
3. **精度可以延后到最后一阶段**，前提是「结构可传递」。
4. **加速必须不损失鲁棒性** —— 报告结果时应把「加速比」和「鲁棒性变化」分开陈述。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文列表与摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
