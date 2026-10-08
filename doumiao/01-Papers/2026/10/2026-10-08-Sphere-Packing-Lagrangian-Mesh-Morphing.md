---
title: "JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing"
date: 2026-10-06
venue: arXiv cs.GR
arxiv: 2610.08880v1
url: http://arxiv.org/abs/2610.08880v1
subjects: cs.GR
tags:
  - tetrahedral mesh
  - Lagrangian morphing
  - sphere packing
  - differentiable simulation
  - GPU mesher
  - soft robot design
agent: doumiao
status: processed
---

## 核心创新点

**JamTet**：基于**物理球填充**的**拉格朗日网格形变**框架，统一**GPU 并行网格生成**、**保形 morphing** 与**可微仿真**，应用于软体机器人形态设计。

### 关键贡献

1. **GPU 并行网格器** — 八叉树层次球填充 + 受约束 Delaunay 四面体化；元素体积均匀度优于 TetGen、fTetWild
2. **拉格朗日网格 morphing** — 同一组球在变化形状中再平衡，重建边界/连通性；保持内节点身份，**无反转**（固定连通性与 TetSphere 失败处仍稳定）
3. **可微 GPU 仿真器** — JAX 实现的体积 Neo-Hoodane + mass-spring，与 morphing 集成设计管线
4. **设计验证** — 软体机器人实验中，内部节点梯度比仅表面变体提升 **0.73-1.07** 游泳适应度，体素化降低 32-63%

### 与传统方法对比

| 方法 | 大形变 | 节点对应 | 无反转 |
|------|--------|---------|--------|
| 固定连通性网格 | ❌ 退化 | ✅ | ❌ |
| TetSphere | ✅ | ✅ | ⚠️ 易反转 |
| **JamTet** | ✅ | ✅ | ✅ |

## 渲染技术分类

- **类型**: 物理仿真 / 几何处理
- **方法**: 球填充 + 受约束 Delaunay 四面体化 + 可微仿真
- **应用**: 软体机器人形态设计、可微物理优化

## 评估

- **逼真度**: N/A (仿真方法)
- **实时性**: GPU 加速；可微仿真支持优化
- **创新度**: ⭐⭐⭐⭐ (球填充 + 拉格朗日 morphing 整合)

## 实现建议

- **着色器复杂度**: N/A
- **管线要求**: JAX + GPU；CUDA 兼容
- **代码状态**: 匿名审稿中（待公开）
- **推荐度**: ✅ 推荐 — 对**可微物理仿真**与**软体变形**研究有用

## 与流体渲染关联

- **拉格朗日流体模拟**：保内节点身份对**粒子流体**（SPH、MPM）的网格化质量有启发
- **可微仿真**：可推广到**可微流体模拟**，支持**逆流体问题**
- **四面体网格**：是软体、流体耦合仿真的通用体表示

## 关键词

`tetrahedral mesh` `sphere packing` `Lagrangian morphing` `differentiable simulation` `JAX` `soft robot` `cs.GR`