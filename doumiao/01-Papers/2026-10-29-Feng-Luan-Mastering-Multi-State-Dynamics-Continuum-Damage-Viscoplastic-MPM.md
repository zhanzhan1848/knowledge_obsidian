---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, mpm, particle-system, phase-field-damage, ginzburg-landau, viscoplastic, rl, manipulation]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39975
---

# Mastering Multi-State Dynamics: Continuum Damage and Viscoplastic MPM for RL-Based Dexterous Manipulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mastering Multi-State Dynamics: Continuum Damage and Viscoplastic MPM for RL-Based Dexterous Manipulation |
| **作者** | Yusen Feng, Shangbo Luan |
| **发表** | arXiv preprint (cs.RO / cs.GR) 2026-10-29 |
| **链接** | [原文](https://arxiv.org/abs/2610.39975) |
| **分类** | 粒子系统 / MPM / 相场损伤 / 强化学习 |

---

## 核心贡献

> **MG-CD-MPM**：在统一仿真器中用**工具中心化的局部化 CD-MPM (Continuum Damage MPM)** 处理**多状态材料**（软固体、脆性材料、颗粒介质、黏塑性/半流体介质），并通过**双向刚体工具耦合**把材料的**抗力直接暴露给 RL 策略**，使其能在**在线强化学习**所需的速度下运行。

1. **问题**：多状态材料的机器人操作需要一个能同时处理
   - **大变形**、
   - **拓扑变化 (topology change)**、
   - **工具与材料之间的双向接触**，
   且**速度足够快以驱动在线强化学习**的仿真器。
2. **核心机制：MG-CD-MPM (tool-centered localized extension of CD-MPM)**
   - **隐式 Ginzburg–Landau 相场损伤系统**在**局部 patch** 上求解；
   - 使用**预处理共轭梯度 (preconditioned CG)**，以**几何多重网格 V-cycle** 作为预条件器；
   - **背景 MPM 离散保持均匀**：**只有损伤求解被局部化**（这是性能的关键）。
3. **双向刚体工具耦合**
   - 将 **MPM 接触冲量**转换为作用在工具上的**力与力矩**；
   - **把材料抗力直接暴露给策略 (policy)** —— 这是让 RL 学习"材料反馈"的关键设计。
4. **统一本构层**：**统一的逐粒子本构层 (per-particle constitutive layer)** 覆盖
   - 软固体 (soft solids)、
   - 脆性材料 (brittle materials)、
   - 颗粒介质 (granular media)、
   - 黏塑性或半流体介质 (viscoplastic / semi-fluid media)。
5. **演示**：六个场景中的**切割 (cutting)、舀取 (scooping)、铲挖 (shoveling)**；结合**脚本化工具运动**与在**两个切割任务**上训练的 **PPO 策略**。

---

## 技术方案

### 架构

```
┌────────────────────────────────────────────────────┐
│ 工具中心化局部 patch (tool-centered local patch)      │
│   ┌──────────────────────────────────────────────┐  │
│   │ 隐式 Ginzburg-Landau 相场损伤求解              │  │
│   │   预处理 CG + 几何多重网格 V-cycle 预条件器     │  │
│   │   ★ 仅此部分局部化 → 性能可控                  │  │
│   └──────────────────────────────────────────────┘  │
│                       ↓                              │
│  均匀背景 MPM 网格 (uniform background)              │
│  统一逐粒子本构层:                                    │
│    软固体 | 脆性 | 颗粒 | 黏塑性/半流体                │
│                       ↓                              │
│  接触冲量 → 转换 → 工具上的力/力矩 (双向)             │
└───────────────────────┬────────────────────────────┘
                        ↓
              PPO 策略直接读取材料抗力
```

### "半流体介质"的渲染意义
本文的"黏塑性或半流体介质"分支覆盖了**介于固体与流体之间**的材料状态（**浆料、软糊、颗粒浆体、熔胶**）—— 这正是**烟雾/火焰过渡态**（如浓烟、油火、灰烬流）的数值类比。在图形学中，这类**多相/多状态介质**的表现力往往比纯流体或纯固体更丰富。

---

## 摘要原文

> Robotic manipulation of multi-state materials needs a simulator that handles large deformation, topology change, and two-way contact between tools and materials while staying fast enough to drive online reinforcement learning. We present MG-CD-MPM, a tool-centered localized extension of CD-MPM. The implicit Ginzburg-Landau phase-field damage system is solved on a local patch by preconditioned conjugate gradients using a geometric-multigrid V-cycle as the preconditioner. The background MPM discretization remains uniform: only the damage solve is localized. Two-way rigid-tool coupling converts MPM contact impulses into forces and torques on the tool, exposing material resistance directly to the policy. The resulting Gym-like simulator covers soft solids, brittle materials, granular media, and viscoplastic or semi-fluid media within a unified per-particle constitutive layer. We demonstrate cutting, scooping, and shoveling in six scenes, combining scripted tool motions with PPO policies trained on two cutting tasks.

---

## 关联笔记
- [[2026-10-27-Boettcher-Ridder-Bender-Total-Deformation-MPM-Perfectly-Elastic-Solids]] — MPM 数值断裂
- [[2026-11-05-Zhang-Cen-Zhu-Chen-Ren-DIQ-MPM-Fluid-Solid-Coupling]] — MPM 流固耦合
- 技术笔记：[[粒子渲染]]
