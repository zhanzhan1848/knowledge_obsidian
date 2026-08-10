---
title: "Dual Contouring of Signed Distance Data"
date: 2026-07
venue: SIGGRAPH 2026
tags: [几何, 网格重建, Dual-Contouring, SDF, Sharp-Features]
authors:
  - Xiana Carrera
  - Ningna Wang
  - Christopher Batty
  - Oded Stein
  - Silvia Sellán
doi: "10.1145/3799902.3811116"
url: "https://dl.acm.org/doi/10.1145/3799902.3811116"
---

# Dual Contouring of Signed Distance Data

## 核心方法

对 signed distance data 进行 **Dual Contouring**，保留 sharp features。

### 关键创新点
- **QEF (Quadratic Error Functions)**：用于特征保持的网格顶点放置
- **Sharp Features 保留**：准确重建几何特征
- **Signed Distance Data**：处理带符号的距离数据

## 算法复杂度
- 时间复杂度：O(n log n) - QEF 求解
- 空间复杂度：O(n) - 网格存储

## 关键词
- Mesh Reconstruction
- Dual Contouring
- Sharp Features
- Quadratic Error Function

## libigl 实现参考
- `igl::quadric_error_metrics` - QEF 计算
- `igl::decimate` - 网格简化

## 相关笔记
[[Marching-Cubes]]
[[Subgrid-Marching-Tetrahedra]]
