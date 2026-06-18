---
title: "Efficient Neighbourhood Search in 3D Point Clouds Through Space-Filling Curves and Linear Octrees"
arXiv: "2603.06771"
date: 2026-03-10
tags: [几何, 点云, 空间填充曲线, 八叉树, 邻域搜索]
categories: [论文, 点云处理, 数据结构]
---

# Space-Filling Curves for Point Cloud Neighbourhood Search

## 核心方法

利用 **空间填充曲线 (SFC)** 和**线性八叉树**实现 3D 点云高效邻域搜索：
- 二维空间填充曲线递归细分空间
- 三维扩展形成密集网格
- 将八叉树单元与每单元格代码关联

## 创新点

1. **线性八叉树**：避免传统八叉树指针开销
2. **空间填充曲线**：提供连续内存访问模式
3. **高效邻域查询**：适合大规模点云

## 技术细节

- 宏单元格均匀网格作为分布式空间细分
- 维度可在运行时配置

## 算法复杂度

- 搜索：$O(\log n)$ 近似
- 空间：$O(n)$

## 开源参考

- libigl: `point_mesh_squared_distance`
- CGAL: `Octree` 类

## 相关笔记

[[点云]] [[空间数据结构]] [[邻域搜索]]

## 可行性评估

✅ **推荐实现**

优点：
- 简单高效的数据结构
- 适合 GPU 并行
- 内存访问友好

适用场景：点云配准、表面重建、SLAM
