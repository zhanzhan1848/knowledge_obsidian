---
title: "Subgrid Marching Tetrahedra"
arXiv: "2606.00454"
authors: ""
date: 2026-06-01
venue: arXiv cs.GR
tags: [几何, 网格重建, Marching Tetrahedra, 网格提取]
subjects: "cs.GR"
---

# Subgrid Marching Tetrahedra

## 核心方法

从连续符号距离函数（SDF）的四面体网格交点恢复无交错的流形三角形网格。

**关键创新：**
- 突破经典 Marching Cubes/Tets 的限制，允许单个网格单元内任意数量的表面片
- 无需明确的内外侧定义（允许有边界的表面）
- 无需一致方向输入几何
- 保留经典 Marching 的局部并行性质

**核心技术：**
- 引入法坐标（normal coordinates）的推广——来自几何拓扑
- 通过每条网格边上的任意整数相交计数编码表面连通性
- 绕过 Nyquist-Shannon 采样限制，固定网格可解析任意小特征

## 算法复杂度
- 时间：局部并行，每 tet 独立 O(1)
- 空间：O(n) 其中 n 为 tet 数量

## 实现难度
- 算法复杂度：中
- 数值稳定性：高（无需法向量计算）
- 依赖项：仅需四面体网格和 SDF 求交

## 可行性
✅ **推荐实现**

可作为 libigl `icip` 类算法的补充或替代。

## 开源参考
- libigl: `marching_tets` 函数
- CGAL: 暂无直接对应
- 论文代码: 待查

## 相关笔记
[[几何/网格重建]]
