---
tags: [关节体重建, 网格, 动态重建, 高斯散点, CVPR2026]
---

# ArtMesh: Part-Aware Articulated Mesh Fields with Motion-Consistent Dynamics

## 论文信息

| 属性 | 值 |
|------|-----|
| **arXiv** | [2605.16582](https://arxiv.org/abs/2605.16582) |
| **作者** | Xinrui Cui et al. |
| **发布日期** | 2026-05-15 |
| **Subjects** | cs.CV |

## 核心方法

ArtMesh: 从多视角图像重建关节体为连接的三角形网格，附带每部件刚性运动。

### 问题背景

现有 3D Gaussian Splatting (3DGS) 关节体重建方法继承了点云的无结构几何表示：
- 缺乏表面拓扑，无法推理部件边界
- 无法沿物体连接性强制运动一致性

### 技术方案

1. **基于网格的可微分渲染骨干**
   - 网格原生方法，部件感知动态直接作用于结构化拓扑

2. **部件感知限制 Delaunay 重网格化**
   - 生成连接的子网格，三角形不跨越语义部件边界

3. **双向运动一致性**
   - Vertex-wise Motion Consistency: 传输网格顶点
   - Pixel-wise Motion Consistency: 渲染RGB-D观测

## 数据集

**Articulate-100**: 100个关节体，涵盖16个 PartNet-Mobility 类别

## 性能

- 关节参数估计优于此前的3DGS方法
- 多部件物体几何重建效果提升最大

## 创新点

- 网格原生关节体重建
- part-aware restricted Delaunay remeshing

## 相关技术

[[3D高斯散点]]
[[关节体分析]]
[[Delaunay网格化]]
[[网格分割]]

## 备注

可用于机器人操作、动画等场景
