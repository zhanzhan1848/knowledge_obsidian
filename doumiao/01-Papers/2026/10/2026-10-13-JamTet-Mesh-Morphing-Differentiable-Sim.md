---
title: "JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing"
date: 2026-10-13
tags: [mesh-morphing, differentiable-simulation, soft-robot, MPM, sphere-packing, FEM]
authors: [Jiong Lin et al.]
arxiv: 2610.08880
venue: arXiv 2026
status: processed
subjects: cs.GR, cs.AI
---

## 核心创新点

把**四面体网格**作为可微仿真与计算设计的 body representation，研究**无反转可微形状优化**。**JamTet** 用物理驱动的 sphere packing 同时解决网格生成与形态变化。

### 关键技术

1. **GPU 并行网格生成**
   - 八叉树层级 sphere packing
   - 受约束 Delaunay 四面体化
   - 单元体积均匀性优于 TetGen / fTetWild
2. **Lagrangian 网格形变**
   - 保留内部节点身份
   - 在变化外形内重新平衡同样的球
   - 重建边界与连通性
   - 比 fixed-connectivity / TetSphere 更不易反转
3. **JAX 可微 GPU 仿真器**
   - Mass-spring 边 + 体 Neo-Hookean 项
   - 与网格形变集成

### 实验

软体机器人形态设计：
- 内部节点梯度比表面-only 变体能**将 swimming fitness 提升 0.73–1.07**
- 体素化版本 fitness 低 32–63%
- 证明 sphere packing 是梯度驱动形状优化的实用体表示

## 渲染技术分类

- **类型**: 物理仿真 / 可微仿真 / 间接用于流体仿真
- **方法**: MPM + Delaunay + sphere packing

## 推荐度

✅ 推荐 — 对做可微物理 + 工程优化的团队非常实用

## 关键词

`sphere packing` `tetrahedral mesh` `differentiable simulation` `soft robot` `sdf morphing`

## 相关工作

- [[2026-10-13-Multiphysics-Simulation-Visual-Computing-Course]] — 多物理仿真方法综述

---
*由豆苗自动收集于 2026-10-13*
