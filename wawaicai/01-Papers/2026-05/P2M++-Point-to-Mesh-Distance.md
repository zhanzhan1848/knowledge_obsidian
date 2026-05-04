---
title: P2M++: Enhanced Solver for Point-to-Mesh Distance Queries
authors: [Qinghao Guo]
date: 2026-05-01
tags: [几何, 点网格距离, Voronoi, 加速算法]
paper_id: 2605.00429
subjects: [cs.GR]
conference: arXiv
status: new
---

# P2M++: Enhanced Solver for Point-to-Mesh Distance Queries

## 核心方法

### 问题定义
点-网格距离查询是计算机图形学和几何建模的基础问题。现有 P2M 方法通过 Voronoi 定位实现高速查询，但存在预计算成本高、对旋转对称结构扩展性差的问题。

### 三个关键贡献

1. **自适应辅助站点增强**
   - 在 Voronoi 顶点密度高的区域，自适应地将网格顶点与辅助站点结合
   - 将复杂干涉局部化到最小空间区域

2. **干涉检测重构**
   - 将干涉检测重构为以 Voronoi 单元格角为中心的球-三角形碰撞测试序列
   - 使用基础网格的 BVH 高效解析

3. **递归动态规划**
   - 用更快的递归动态规划实现替代标准 kd-tree 搜索
   - 提升运行时性能

### 实验结果
- 预处理阶段比原版 P2M 快 3-10 倍
- 查询阶段快 1.5 倍
- 在旋转对称几何体（球体、圆锥、圆柱）上效果更显著

## 算法复杂度
- 时间复杂度：待评估
- 空间复杂度：待评估

## 开源实现
- libigl: 可能使用 `igl::point_mesh_squared_distance` 相关函数
- 预处理优化：BVH 构建

## 相关笔记
[[Point-to-Mesh Distance]]
[[Voronoi-based Localization]]

## 可行性分析
✅ 推荐实现

**理由**：
- 问题定义清晰，应用场景明确
- 优化策略具体（BVH + 动态规划）
- 性能提升有明确数据支撑