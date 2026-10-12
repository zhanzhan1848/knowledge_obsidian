---
title: "Simulation Methods for Multiphysics Phenomena in Visual Computing"
date: 2026-10-07
tags: [fluid-simulation, multiphysics, course-notes, deformable-bodies, granular-media, rigid-bodies, coupling]
authors: [Fabian Löschner, Stefan Rhys Jeske, José Antonio Fernández-Fernández, Jan Bender]
paper_id: 2610.09822
subject: cs.GR
status: reviewed
priority: medium
relevance: ⭐⭐⭐⭐
---

## 核心创新点

### 内容定位
计算机图形学多物理场仿真方法的**课程讲义/综述**，覆盖数学基础、关键算法、实际考量。

### 涵盖范围
- 刚体 (Rigid Bodies)
- 可形变体 (Deformable Bodies)
- **流体 (Fluids)**
- 颗粒介质 (Granular Materials)
- 以及它们之间的**耦合 (Coupling)** 策略

### 关键贡献
1. 各类物理现象仿真的数学框架与详细推导
2. 不同材料/耦合策略如何适配统一公式
3. 现成软件框架的对比与选型建议
4. 物理动画的最新趋势（机器学习方法）

## 覆盖的关键算法

| 算法/方法 | 应用 |
|-----------|------|
| **Position-Based Dynamics (PBD)** | 刚体/可形变体/流体耦合 |
| **XPBD** | 扩展 PBD |
| **MPM (Material Point Method)** | 颗粒介质、可形变体、流体耦合 |
| **SPH (Smoothed Particle Hydrodynamics)** | 流体、颗粒 |
| **FLIP/PIC** | 流体（混合 Eulerian-Lagrangian） |
| **DFG / FEM** | 连续介质变形 |
| **Constraint-based Solvers** | 刚体动力学 |

## 重点章节（流体渲染相关）

- **流体仿真**: 不可压缩 Navier-Stokes、粒子法、网格法、混合法
- **流体-刚体耦合**: 双向耦合算法
- **流体-可形变体耦合**: 关键算法（MPM 变体）
- **自由表面流体**: 表面重建、Foam、Bubbles
- **机器学习替代**: 神经流体仿真综述

## 软件框架

| 框架 | 特点 |
|------|------|
| **Houdini** | 工业标准 VFX |
| **Blender** | 开源 + Mantaflow |
| **Bullet / PhysX** | 刚体 |
| **Taichi** | 高性能 GPU 物理仿真 |
| **JAX-based** | 可微分物理 |

## 实现建议

### 实现难度
**N/A (综述)** - 但提供的算法参考极具价值

### 推荐度
**✅ 推荐作为参考资料** - 对于构建多物理场仿真系统是优秀入门教材

### 适用人群
- CG 研究生入门
- 工业 VFX 工程师
- 物理仿真研究入门者

## 相关工作

- [[Position-Based Dynamics]]
- [[Material Point Method]]
- [[SPH Fluid Simulation]]
- [[Neural Fluid Simulation]]
- [[Multiphysics Coupling]]

## 资源链接

- 论文: https://arxiv.org/abs/2610.09822
- arXiv PDF: https://arxiv.org/pdf/2610.09822

## 一句话总结
> 一份覆盖计算机图形学多物理场仿真全栈（刚体/可形变体/流体/颗粒/耦合）的**课程讲义**，数学推导详尽，并对现代物理仿真趋势（神经方法）作出展望。

---
*由豆苗自动收集于 2026-10-12*