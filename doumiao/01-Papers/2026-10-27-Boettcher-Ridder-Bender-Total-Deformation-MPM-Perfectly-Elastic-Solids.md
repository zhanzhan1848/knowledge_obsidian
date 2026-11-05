---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, mpm, particle-system, perfectly-elastic, numerical-fracture, contact-handling, zero-energy-mode]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.36945
---

# Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations |
| **作者** | Timna Böttcher, Rick Ridder, Jan Bender — **TU Braunschweig (图形学与可视化研究所)** |
| **发表** | arXiv preprint (cs.GR) 2026-10-27 |
| **链接** | [原文](https://arxiv.org/abs/2610.36945) |
| **分类** | 粒子系统 / MPM / 弹性固体 |

---

## 核心贡献

> **一个新的 MPM 求解器，可从强变形中恢复、天然支持接触处理，且不产生数值断裂** —— 关键在于**直接在当前网格 (current grid) 上计算弹性力**，但**从粒子位置与固定的参考网格直接计算形变**，而非依赖速度梯度更新。

1. **问题：MPM 求解器的数值断裂 (numerical fracture)**
   - 即使弹性模型中**不含塑性**，物体也会"碎裂"；
   - **已有做法**：在**参考构型 (reference configuration)** 的固定网格上计算力；
     - ❌ **与标准碰撞处理方法不兼容**（因为碰撞通常在当前构型/当前网格上进行）。
2. **本文方案**
   - 提出**无需数值断裂**的可变形固体模拟方法，**仍然在当前网格上计算弹性力**；
   - ✅ 因此**可以直接使用 MPM 框架中常见的基于网格的碰撞处理**；
   - **形变直接从粒子位置与固定参考网格计算**，**不基于速度梯度做任何更新**；
   - 这 facilitates 了：
     - **粒子级碰撞处理**的引入；
     - **零能量模式抑制 (zero-energy mode suppression)**，用于抵消非线性变形带来的伪影。
3. **结果**：能够高效模拟**经历大变形并涉及接触的复杂弹性物体场景**。

---

## 技术方案

### 三种方案的对比

| 方案 | 弹性力计算位置 | 数值断裂 | 碰撞处理兼容性 |
|------|--------------|---------|---------------|
| 标准 MPM | 当前网格 | ❌ 有 | ✅ |
| 已有纯弹性解法 | **参考构型固定网格** | ✅ 无 | ❌ **不兼容标准碰撞** |
| **本文 (Total Deformation)** | **当前网格** | ✅ **无** | ✅ **兼容** |

```
┌─────────────────────────────────────────────┐
│ 形变场计算:                                  │
│   x(t)  ← 粒子位置 p_i(t)                    │
│   F(t)  ← p_i(t) 与固定参考网格 X_ref 的映射  │
│   ★ 不用速度梯度累积更新 F                    │
│   → 避免积分误差导致的断裂                     │
└─────────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────────┐
│ 弹性力: 在当前网格上计算 (与碰撞同一网格)      │
│   → 可用标准网格碰撞处理                       │
└─────────────────────────────────────────────┘
        ↓
┌─────────────────────────────────────────────┐
│ 零能量模式抑制 + 粒子级碰撞                    │
│   → 抵消非线性变形伪影                         │
└─────────────────────────────────────────────┘
```

### 与 DIQ-MPM 的关系
两者都出自**同一研究脉络**（Bo Ren 组与 TU Braunschweig 均有 MPM 数值断裂相关工作）：

| 维度 | **Total Deformation MPM** | **DIQ-MPM** |
|------|--------------------------|-------------|
| 关注 | 纯弹性固体的**数值断裂** | **流固耦合**（TLMPM + 流体） |
| 形变计算 | 从粒子位置直接算，**不用速度梯度** | 隐式 TLMPM + DIQ 界面求积 |
| 接触 | 粒子级 + 零能量模式抑制 | 粒子接触力模型 |
| 流体 | ❌ 无 | ✅ 欧拉不可压流体 |

> **两篇互补**：DIQ-MPM 处理"固体 + 流体"，Total Deformation 处理"纯弹性固体 + 大变形 + 接触"。

---

## 摘要原文

> We present a new MPM-based solver for perfectly elastic solids, which can recover from strong deformations and naturally allows contact handling. Typical MPM solvers suffer from numerical fracture, where objects break apart even when no plasticity is included in the elasticity model. Previous approaches for perfectly elastic solids solve this by computing forces on a fixed grid in the reference configuration. However, this makes them incompatible with standard collision handling methods. We instead propose a method for deformable solid simulation without numerical fracture, that still computes elastic forces on the current grid. Our method can easily include grid-based collision handling, as commonly used in MPM frameworks. Additionally, we compute the deformation directly from the particle positions and a fixed reference grid, without any updates based on velocity gradients. This facilitates the inclusion of particle-level collision handling and zero-energy mode suppression, which counteracts artifacts from non-linear deformations. As a result, we can efficiently simulate complex scenarios of elastic objects undergoing large deformations, including contact.

---

## 关联笔记
- [[2026-11-05-Zhang-Cen-Zhu-Chen-Ren-DIQ-MPM-Fluid-Solid-Coupling]] — 姊妹工作（流固耦合）
- [[2026-10-29-Feng-Luan-Mastering-Multi-State-Dynamics-Continuum-Damage-Viscoplastic-MPM]] — 相场损伤 MPM
- 技术笔记：[[粒子渲染]]
