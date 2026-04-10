---
tags: [几何, 网格重建, SDF, arXiv, 2026-04]
---

# Dual Contouring of Signed Distance Data

## 核心方法

提出一种从离散采样的 SDF (Signed Distance Function) 数据重建显式多边形网格的算法，特别擅长恢复锐利特征。在传统 Dual Contouring of Hermite Data 方法基础上，设计并求解二次优化问题，在规则网格的每个单元格内确定网格顶点的最优位置。该优化仅依赖离散采样的 SDF 数据，无需函数求导、梯度信息或大规模数据集训练。

## 算法要点

- **问题**: 从离散 SDF 数据重建精确网格
- **核心创新**: 二次优化确定顶点位置，无需 Hermite 数据
- **优势**: 不需要梯度信息、训练数据或任意函数访问
- **应用**: 3D 建模和设计

## 复杂度分析
- 时间：取决于网格分辨率
- 空间：O(n) 取决于输出网格大小

## 开源实现
- libigl: `isosurface` 相关函数
- 论文代码: 待查找

## 相关笔记
[[2026-04-Topology-First-BRep-Meshing]]

## 元信息
- **arXiv**: [2604.00157](https://arxiv.org/abs/2604.00157)
- **日期**: 2026-03-31
- **作者**: Xiana Carrera et al.
- **领域**: cs.GR
- **会议**: -
