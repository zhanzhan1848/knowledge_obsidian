---
title: "SuperSDF: Sparse SDF Super-Resolution for Surface Extraction"
date: 2026-07
venue: SIGGRAPH 2026
tags: [几何, SDF, 超分辨率, 表面重建]
authors:
  - Sagar Panwar
  - Nissim Maruani
  - Céline Loscos
  - Mathieu Desbrun
  - Pierre Alliez
doi: "10.1145/3799902.3811060"
url: "https://dl.acm.org/doi/10.1145/3799902.3811060"
---

# SuperSDF: Sparse SDF Super-Resolution for Surface Extraction

## 核心方法

提出 **SDF 超分辨率** 方法，从稀疏 SDF 提取高分辨率表面。

### 关键创新点
- **Sparse SDF**：处理稀疏有符号距离场
- **Super-Resolution**：SDF 超分辨率重建
- **高效表面提取**：从粗粒度 SDF 提取精细网格

## 关键词
- SDF
- Super-Resolution
- Surface Extraction
- Mesh Reconstruction

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：O(n) - 稀疏表示

## libigl 实现参考
- `igl::isosurface` - 等值面提取
- `igl::marching_cubes` - Marching Cubes

## 相关笔记
[[Dual-Contouring]]
[[Neural-Implicit]]
