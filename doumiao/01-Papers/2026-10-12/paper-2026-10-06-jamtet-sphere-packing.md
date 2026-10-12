---
title: "Physics-based Sphere Packing for Lagrangian Mesh Morphing (JamTet)"
date: 2026-10-06
tags: [fluid-simulation, mesh-morphing, differentiable-simulation, sphere-packing, tetrahedral-meshing, soft-robot]
authors: [Jiong Lin, Hod Lipson]
paper_id: 2610.08880
subject: cs.GR
status: reviewed
priority: medium
relevance: ⭐⭐⭐
---

## 核心创新点

### 问题定义
将四面体网格作为可微分仿真与计算设计的物体表示。固定连接网格在大幅形变下退化，从零重网格丢弃节点对应关系。

### 核心方法
**JamTet** - 基于物理的球堆积框架用于体网格生成与形变。

### 三项贡献
1. **GPU 并行网格生成器** - 八叉树层次打包 + 受约束 Delaunay 四面体化
   - 元素体积比 TetGen / fTetWild 更均匀
2. **Lagrangian 网格形变** - 在形状变化时通过重平衡相同球体重建边界与连接
   - **保留内部节点身份**
   - 在固定连接与 TetSphere 网格会反转处仍**保持无反转**
3. **JAX 可微 GPU 仿真器** - 弹簧边 + 体 Neo-Hookean 项
   - 与网格形变集成在设计管线中

## 渲染技术

### 类型
- **可微分物理仿真**
- **体网格表示**

### 应用方向
- 软体机器人形态设计
- 计算设计 / 形状优化
- 流体-结构耦合仿真基础

## 关键技术

| 技术 | 说明 |
|------|------|
| **Sphere Packing** | 物理基础球堆积 |
| **Octree Hierarchical Packing** | GPU 并行八叉树打包 |
| **Constrained Delaunay Tetrahedralization** | 受约束 Delaunay 四面体化 |
| **Lagrangian Mesh Morphing** | 拉格朗日网格形变（保持节点身份） |
| **Differentiable Simulator (JAX)** | 可微分仿真 |
| **Mass-spring + Neo-Hookean** | 材料模型 |
| **Interior-node Gradients** | 内部节点梯度（设计优化） |

## 实验结果

### 软体机器人形态设计
- **内部节点梯度提升游泳适应性**: +0.73 - +1.07 over matched surface-only variant
- **体素化版本的适应性**: 比同一设计低 32-63%

### 网格质量
- 元素体积更均匀（vs TetGen、fTetWild）
- 大形变下保持无反转

## 实现建议

### 实现难度
**高** - 球堆积算法 + GPU 并行 + 可微仿真 + 设计管线集成

### 预期性能
- **GPU 加速**: 是
- **训练**: 可微 JAX 仿真支持端到端优化
- **代码**: 待发表（under review）

### 适用场景
- ✅ 软体机器人形态优化
- ✅ 大形变可微仿真
- ✅ 流体-结构耦合（基础）
- ⚠️ 主要面向几何/物理仿真而非直接渲染

### 推荐度
**⚠️ 部分推荐** - 对**流体-结构耦合**和**可微物理仿真**有意义，但偏向物理仿真而非渲染

## 相关工作

- [[Differentiable Simulation]]
- [[Sphere Packing Algorithms]]
- [[Mesh Morphing]]
- [[Soft Robotics]]
- [[Fluid-Structure Interaction]]

## 资源链接

- 论文: https://arxiv.org/abs/2610.08880
- 代码: under review（待发表）

## 一句话总结
> JamTet 通过物理球堆积 + 受约束 Delaunay 四面体化 + 可微 JAX 仿真器，提供大形变下保持节点身份且无反转的体网格形变框架，软体机器人设计梯度相比表面-only 变体提升 0.73-1.07。

---
*由豆苗自动收集于 2026-10-12*