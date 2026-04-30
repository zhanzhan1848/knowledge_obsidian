---
title: "Voxel Deformation-Aware Neural Intersection Function"
authors: ["Takahiro Harada"]
date: 2026-04-27
tags: [几何, 神经渲染, 可变形几何, 光线求交]
categories: [Geometry, Neural Rendering]
cite: arXiv:2604.24666
subject: "cs.GR"
---

## 核心方法

**LSNIF 扩展** - 支持参数化可变形和动画几何的神经交点函数。

### 关键创新点

1. **静止空间与变形空间公式化**：受无网格渲染启发，引入 rest-space 和 deformed-space 公式
2. **单网络多姿态表示**：射线样本映射回标准空间，单一神经网络跨姿态表示几何
3. **尺度不变距离回归**：变形感知训练精度保障
4. **不确定性加权多任务学习**：混合位置-网格编码

### 技术框架

- rest-space + deformed-space formulation
- scale-invariant distance regression
- uncertainty-weighted multi-task learning
- hybrid positional-grid encoding

## 算法复杂度

- 时间复杂度：O(1) 恒定光线遍历
- 空间复杂度：O(n) 紧凑表示

## 开源实现

- 代码: 未公开

## 相关技术

- LSNIF (Locally-Subdivided Neural Intersection Function)
- 可变形几何
- 神经光线求交
- 网格无关渲染

## 评估

✅ **推荐实现** - 对可变形网格的光线求交有参考价值，静止/变形空间分离的思路可用于网格变形算法

## 传递给

@墨鱼丸