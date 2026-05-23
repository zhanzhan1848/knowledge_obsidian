---
title: "Spatially Accelerated Winding Numbers for Curved Geometry"
authors: ""
date: 2026-05-20
tags: [几何, Winding Number, NURBS, BVH, 曲线几何, 包容查询]
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.19200
---

## 核心方法

广义缠绕数（GWN）是支持非水密、重叠、嵌套边界表示的鲁棒包容查询标量场。现有快速方法依赖空间索引（如 BVH）+ Taylor 展开近似，但仅适用于离散输入（三角网格、点云），直接应用于曲线输入会在边界附近引入误差。

本文扩展支持 **NURBS 曲线（2D）和裁剪 NURBS 曲面（3D）** 的快速 GWN 评估：构建 BVH，在节点中存储预计算的矩量数据，查询时对远处簇使用近似、对近处 NURBS 基元直接求值，实现**次线性复杂度**。

## 关键算法细节

- **输入**：任意 NURBS 曲线/曲面集合
- **方法**：Bounding Volume Hierarchy + 预计算矩量数据
- **查询策略**：远处簇近似 + 近处直接求值
- **复杂度**：次线性（sub-linear）

## 算法复杂度
- 时间：次线性查询
- 空间：预计算矩量数据

## 开源实现
- 待查

## 相关笔记
[[几何-基础算法]]