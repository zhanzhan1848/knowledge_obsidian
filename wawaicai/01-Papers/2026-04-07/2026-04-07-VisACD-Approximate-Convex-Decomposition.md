---
title: "VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition"
authors: ["Egor Fokin"]
date: 2026-04-05
tags: [mesh-processing, mesh-decomposition, convex-decomposition, GPU, physics-simulation]
arXiv: "2604.04244"
subjects: "cs.GR, cs.CG"
---

# VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

## 核心方法

提出 VisACD，一种基于**可见性 (Visibility)** 的旋转等变、GPU 加速的近似凸分解 (Approximate Convex Decomposition, ACD) 算法，用于将复杂网格分解为少量凸包部件。

**核心创新点：**
1. **可见性驱动分解** - 利用顶点对之间的可见性信息指导分解方向
2. **旋转等变性** - 对输入网格的方向不敏感
3. **GPU 加速** - 支持大规模网格的实时处理
4. **Intersection-free** - 保证分解结果无交叉

**问题背景：**
- 物理模拟中的碰撞检测需要在精度和效率之间权衡
- 基础图元（包围盒）高效但不精确
- 原始网格精确但计算昂贵
- 传统 ACD 方法需要大量凸部件且对方向敏感

## 算法流程

1. 对输入网格计算顶点间的可见性
2. 使用可见性信息确定切割方向
3. GPU 并行处理切割操作
4. 迭代分解直到满足凸性要求

## 复杂度分析

- 时间复杂度：O(n log n) 对于预处理，GPU 并行分解
- 空间复杂度：O(n) 存储可见性关系

## 开源实现

- 论文代码：待查 (arXiv:2604.04244)

## 可行性评估

- **算法复杂度**：中
- **数值稳定性**：高（旋转等变设计）
- **GPU 依赖**：CUDA/OpenGL

## 相关笔记

[[2026-04-07-DAILY-SUMMARY]]

## 技术关联

- 相关方法：Convex Decomposition, V-HACD
- 应用场景：物理模拟、碰撞检测、游戏引擎、机器人仿真
- libigl 参考：`remove_unreferenced`, `triangle` 等网格处理函数
