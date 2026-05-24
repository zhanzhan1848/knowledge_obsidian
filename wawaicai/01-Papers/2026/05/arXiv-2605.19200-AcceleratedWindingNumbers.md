---
title: "Spatially Accelerated Winding Numbers for Curved Geometry"
authors: ["Jacob Spainhour et al."]
date: 2026-05-18
venue: arXiv cs.GR
tags: [几何, 缠绕数, NURBS, 几何查询]
---

# Spatially Accelerated Winding Numbers for Curved Geometry

## 核心方法

扩展了广义缠绕数 (Generalized Winding Number, GWN) 的快速评估，支持任意 NURBS 曲线和裁剪 NURBS 曲面。

### 技术要点

1. **问题**: GWN 在复杂曲面上直接评估成本高昂
2. **解决方案**: 
   - 使用 Bounding Volume Hierarchy (BVH) 存储预计算的矩量数据
   - 查询时远距离簇使用近似值，附近 NURBS 基元直接评估
   - 达到亚线性复杂度同时保留边界附近几何特征

### 核心创新

- **自适应细分策略**: 对 NURBS 基元进行预处理细分，创建更好的空间划分
- 支持 2D NURBS 曲线和 3D 裁剪 NURBS 曲面块
- 保持与直接评估相同的 containment 判定精度

## 算法复杂度

- 时间: 亚线性查询复杂度
- 空间: O(n) BVH 存储，预计算矩量数据

## 实现难度

- 算法复杂度: **高**
- 数值稳定性: 高斯积分需要精确处理
- 依赖: BVH 数据结构，数值积分

## 推荐结论

✅ **推荐实现** - 对 CAD 几何查询和碰撞检测有重要价值

## 开源参考

- libigl: `igl::winding_number` 相关函数
- CGAL: `CGAL::Polygon_mesh_processing` 中的 winding number 实现

## 相关技术

- [[Generalized Winding Number]], [[Point Cloud Classification]], [[Collision Detection]]