---
title: "Dual Contouring of Signed Distance Data"
authors: ["Xiana Carrera", "Ningna Wang", "Christopher Batty", "Oded Stein", "Silvia Sellán"]
date: 2026-07
tags: [几何, Dual Contouring, SDF, 表面重建, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #654"
---

# Dual Contouring of Signed Distance Data

## 核心方法

本文提出**有符号距离数据的Dual Contouring算法**。

### 核心创新点

1. **Dual方法**: 基于对偶网格的等值面提取
2. **Hermite数据**: 支持基于Hermite插值的数据
3. **特征保持**: 更好地保留尖锐特征
4. **理论分析**: 提供收敛性分析

### 技术背景

Dual Contouring vs Marching Cubes:
| 特性 | Dual Contouring | Marching Cubes |
|------|-----------------|----------------|
| 网格类型 | 四面体/六面体混合 | 仅六面体 |
| 特征保持 | 更好 | 一般 |
| 实现复杂度 | 较高 | 较低 |

## 开源实现

- libigl: `marching_tets`, `contour`
- CGAL: `make_surface_mesh`

## 几何相关性

✅ **高相关**: 表面重建基础算法
- 等值面提取
- SDF插值
- 四面体网格处理

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐ 中等 |
| 实用价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

Dual Contouring是表面重建的重要算法，与libigl的marchin_tets配合可实现完整流程。

## 相关笔记
[[2026-08-20-Subgrid-Marching-Tetrahedra]]
[[2026-08-20-SuperSDF-Sparse-SDF-Super-Resolution]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
