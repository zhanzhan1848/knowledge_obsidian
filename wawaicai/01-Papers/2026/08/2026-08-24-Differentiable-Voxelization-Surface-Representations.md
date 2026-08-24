---
title: "Differentiable Voxelization of Surface Representations"
authors: Tobias Djuren et al.
date: 2026-08-16
tags: [几何, 网格处理, 体素化, 可微分优化, 网格变形]
categories: [Voxelization, Mesh Processing, Differentiable Geometry]
arxiv: "2608.15934"
conference: SIGGRAPH Conference Papers 2026
doi: "10.1145/3799902.3811203"
---

# Differentiable Voxelization of Surface Representations

## 核心贡献

首次推导体素表示（voxel grid）关于其包围表面（bounding surface）的**精确梯度**，适用于**卷绕数（Winding Number）**。

## 问题背景

- 表面表示（mesh）适合建模
- 体素表示适合空间查询（相交、包含检测）
- 优化表面以满足体素属性 → 需要体素关于表面的梯度

## 核心方法

### 梯度推导

卷绕数的体素值关于顶点位置的梯度推导：
- 体素值采样于规则网格
- 表面参数化为三角形网格顶点集
- 精确、高效的梯度计算

### 应用示例

1. **变形网格以解决相交问题**（Resolving intersections）
2. **可制造性设计**：三方向带锯切割制造
3. **空间填充优化**：接近铺满3D空间的形状

## 关键洞察

$$\nabla_{\text{vertices}} \text{voxel}(f) = \text{exact gradient via winding number}$$

通过卷绕数的隐式表示获得精确微分，无需有限差分近似。

## SIGGRAPH 2026

- 会议：SIGGRAPH Conference Papers 2026
- Article No.: 22
- 论文 DOI: 10.1145/3799902.3811203

## 相关技术

- Winding Number（卷绕数）
- Voxelization（体素化）
- Differentiable Rendering / Geometry
- Mesh Intersection Resolution
- Manufacturing-aware Design

## 开源实现

- 无公开代码（截至摘要）

## 关联笔记

[[体素化]]
[[可微分几何]]
[[网格变形]]
[[SIGGRAPH2026]]
