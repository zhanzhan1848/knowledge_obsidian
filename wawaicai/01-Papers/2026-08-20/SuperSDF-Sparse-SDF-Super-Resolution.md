---
title: "SuperSDF: Sparse SDF Super-Resolution for Surface Extraction"
authors: ["Sagar Panwar", "Nissim Maruani", "Céline Loscos", "Mathieu Desbrun", "Pierre Alliez"]
date: 2026-07
tags: [几何, SDF, 超分辨率, 表面提取, 神经隐式, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #1060"
---

# SuperSDF: Sparse SDF Super-Resolution for Surface Extraction

## 核心方法

本文提出**稀疏SDF超分辨率方法**，用于从低分辨率SDF提取高分辨率表面。

### 核心创新点

1. **稀疏表示**: 在稀疏位置存储高精度SDF值
2. **超分辨率**: 从粗网格SDF恢复细节
3. **自适应采样**: 自适应地选择需要细化的区域
4. **等值面提取**: 优化Marching Cubes输出

### 技术框架

```
粗SDF → 稀疏高精度采样 → 神经网络插值 → 细粒度SDF → 表面提取
```

## 应用场景

- 从低分辨率扫描恢复高精度网格
- 神经隐式表示的细节增强
- 实时SDF渲染加速

## 开源实现

- libigl: `marching_cubes`, `extractSparseSDF`
-神经隐式: DeepSDF, IMAging

## 几何相关性

✅ **高相关**: SDF与表面提取核心算法
- SDF表示
- Marching Cubes / Tetrahedra
- 网格细化

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐ 需验证 |
| 实现难度 | ⭐⭐⭐ 中等 (神经网络) |
| 应用价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

SDF超分辨率是连接低分辨率几何数据和高精度网格的桥梁，应用前景广阔。

## 相关笔记
[[2026-08-20-Interactive-Stroke-based-Neural-SDF-Sculpting]]
[[2026-08-20-Dual-Contouring-Signed-Distance-Data]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
