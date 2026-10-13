---
title: "Simulation Methods for Multiphysics Phenomena in Visual Computing"
date: 2026-10-13
tags: [fluid-simulation, multiphysics, course-notes, rigid-body, deformable-body, granular-material]
authors: [Jan Bender et al.]
arxiv: 2610.09822
venue: Eurographics 2026 Tutorials / Course Notes
doi: 10.2312/egt.20261002
status: processed
subjects: cs.GR
---

## 核心内容

**Eurographics 2026 课程笔记**，系统介绍**计算机图形学中的多物理场模拟方法**，覆盖刚体、可变形体、流体、颗粒介质及它们的耦合。

### 章节范围

- **数学基础**: 连续介质力学、偏微分方程
- **刚体模拟**: 接触力学、约束求解、摩擦模型
- **可变形体模拟**: 有限元、质点弹簧、共旋线性
- **流体模拟**: Eulerian / Lagrangian / hybrid（FLIP/PIC/DFK/APIC）
- **颗粒介质**: DEM（离散元法）、MPM（物质点法）
- **多物理场耦合**: 刚-柔、流-柔、刚-流、颗粒-流体
- **新兴趋势**: 机器学习驱动的物理仿真

### 涵盖方法

| 类别 | 方法 |
|------|------|
| **流体** | Eulerian 网格、Eulerian-Lagrangian 混合、SPH、MPM |
| **可变形** | FEM、Mass-Spring、Position-Based Dynamics |
| **刚体** | Impulse-based、Lagrangian 接触 |
| **颗粒** | DEM、MPM、SPH |
| **耦合** | 双向交互、浸没边界 |

### 关键贡献

- 系统性地整合了过去几十年 CG 物理仿真方法
- 数学推导详细，强调材料建模与耦合策略
- 介绍开源多物理框架（如 Bullet、SOFA、Taichi、DiffTaichi 等）
- 涵盖 ML 趋势

## 渲染技术分类

- **类型**: 全栈（仿真 → 渲染准备 → 演示）
- **方法**: 物理仿真（多种范式）

## 适用场景

- **教学**: CG 专业学生入门物理仿真
- **工程师参考**: 实现选择决策
- **研究者**: 跨域方法对比

## 推荐度

✅ 强推荐 — 难得的完整教程笔记

## 关键词

`fluid simulation` `multiphysics` `course notes` `FEM` `MPM` `SPH` `DEM` `coupling`

## 相关工作

- [[2025-03-29_Journey-into-SPH-Simulation]]
- [[2025-03-29_Fluid-Implicit-Particle-Simulation-CPU-GPU]]
- [[2026-02-06-dnncs-coastal-simulation]]

---
*由豆苗自动收集于 2026-10-13*
