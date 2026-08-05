---
tags: [几何, 网格简化, 凸分解, 碰撞检测]
type: paper
venue: arXiv cs.GR
date: 2026-02-07
---

# Convex Primitive Decomposition for Collision Detection

## 核心方法

### 问题定义
3D 模型的碰撞体创建耗时，需要建模者手动放置 bounding boxes, capsules, spheres 等近似复杂网格。现有 convex decomposition 方法 (V-HACD, CoACD) 对游戏等严格性能预算不实用。

### 核心创新：Bottom-up Convex Primitive Decomposition

**受 Quadric Error Metric 启发的自底向上方法**

- 将输入网格分解为凸多边形基元 (convex primitives)
- 保证包围输入表面
- 为刚体模拟设计

### 技术细节

**对比测试**：
- 60+ Sketchfab 模型
- V-HACD, CoACD

**评估指标**：
- Hausdorff 距离
- Chamfer 距离 (collider → input)
- 总字节数 (复杂度)
- 碰撞检测 wall-clock 时间

**结果**：
- 更低 one-way mean/median Hausdorff 和 Chamfer 距离
- 不到 1/3 的复杂度 (按总字节数)
- 24 个测试模型 wall-clock 时间一致改善

## 复杂度

- 分解复杂度：O(n log n) based
- 碰撞检测性能：一致改善

## libigl 参考

相关 libigl 函数：
- `igl::convex_hull` - 凸包
- `igl::embree` - 碰撞检测

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#convex-decomposition #collision-detection #mesh-simplification #quadric-error #rigid-body-simulation
