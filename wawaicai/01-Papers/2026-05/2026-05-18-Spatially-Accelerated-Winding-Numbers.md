---
title: "Spatially Accelerated Winding Numbers for Curved Geometry"
date: 2026-05-18
authors: Jacob Spainhour et al.
arXiv: "2605.19200"
tags: [winding-number, NURBS, BVH, acceleration, containment-query]
conference: arXiv 2026
---

# Spatially Accelerated Winding Numbers for Curved Geometry

## 核心问题

广义卷绕数 (GWN) 支持鲁棒的包容查询：
- 非水密、重叠、嵌套边界表示
- 但 NURBS 曲线/曲面直接计算代价高

**已有加速**: 空间索引 + Taylor 展开近似 — 仅限离散输入（三角网格、点云）

**本工作**: 扩展到 NURBS，保留曲线/曲面特征

## 解决方案

### BVH + 预计算矩数据

1. **预处理**: 自适应细分 NURBS 基元
2. **BVH 存储**: 每个节点存储预计算的矩数据
3. **查询时**: 
   - 远处簇：使用近似（矩数据）
   - 近处基元：直接求值

### 复杂度

亚线性复杂度，保留边界附近几何特征。

## 实验

| 数据集 | 方法 | 加速比 |
|--------|------|--------|
| 2D NURBS | 本方法 | 10x |
| 3D Trimmed NURBS | 本方法 | 5x |
| 复杂模型 | Taylor展开 | 失效 |

## 可行性评估

- **算法复杂度**: O(log n) 亚线性查询
- **数值稳定性**: 高 — 矩数据预计算
- **依赖项**: libigl, OpenNURBS
- **推荐度**: ⭐⭐⭐⭐ — NURBS 包容查询突破

## 技术亮点

1. **曲线几何支持**: 扩展到 NURBS
2. **自适应细分**: 更好空间划分
3. **亚线性**: 大规模模型可查询

## 相关技术

- [[Winding Numbers]] — 包容查询
- [[NURBS]] — 曲线曲面表示
- [[BVH]] — 层次包围体