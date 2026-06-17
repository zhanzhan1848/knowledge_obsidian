---
title: Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting
date: 2026-06-17
authors:
  - Romy Williamson
categories:
  - 表面表示
  - 网格处理
tags:
  - 表面拟合
  - Chart/Atlas参数化
  - 显式表示
  - 可微优化
  - 神经隐式
arxiv: "2606.18069"
subjects:
  - cs.GR
  - cs.CG
  - cs.CV
---

# Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting

## 核心方法

本文提出 **Blended Chart Surfaces**，一种紧凑、无网络、显式表示的曲面表示方法，具有天然全局光滑性。

### 核心思想

1. **输入**：粗代理网格 (coarse proxy mesh)，编码目标曲面拓扑和近似几何
2. **优化**：在每个代理顶点联合优化多项式映射，使用现成优化器拟合隐式目标形状
3. **融合**：使用"一环坐标"平滑混合方案融合相邻映射
4. **结果**：解耦拓扑/粗几何与几何细节

### 关键创新

- **无网络化 (Network-free)**：不依赖神经网络
- **显式表示 (Explicit)**：直接访问曲面点
- **全局光滑 (Globally smooth)**：通过混合方案保证跨patch边界光滑
- **完全可微**：支持基于梯度的优化
- **刚体/缩放等变性**：对代理网格的旋转和平移具有不变性

## 算法描述

### 问题定义

现有神经表示的局限性：
- 隐式场需要等值面提取才能用于下游处理
- 显式神经映射受限于规范域参数化或存在接缝

### 技术方案

给定粗代理网格 $M = (V, E, F)$：
- 在每个顶点 $v_i$ 定义局部多项式映射 $p_i: \mathbb{R}^2 \to \mathbb{R}^3$
- 相邻patch通过"一环坐标"混合函数 $\beta_i(u,v)$ 融合
- 优化目标：拟合隐式目标形状（隐式场、点云、解析曲面）

### 混合公式

$$S(u,v) = \frac{\sum_i \beta_i(u,v) \cdot p_i(u,v)}{\sum_i \beta_i(u,v)}$$

其中 $\beta_i$ 是紧支撑权函数，确保局部支持和光滑过渡。

## 复杂度分析

- **表示复杂度**：O(n) 其中 n 为代理网格顶点数
- **计算复杂度**：每顶点多项式优化，局部计算
- **存储复杂度**：远小于等分辨率神经隐式表示

## 数值稳定性

- 多项式基函数条件数良好
- 混合函数设计避免数值病态
- 梯度可直接通过解析形式计算

## 开源实现

- 论文未提及开源代码
- 潜在实现：libigl 的 mesh parameterization 相关函数可作为参考

## 相关技术对比

| 方法 | 显式/隐式 | 网络依赖 | 全局光滑 | 可微性 |
|------|----------|----------|----------|--------|
| 神经隐式 (SDF/NeRF) | 隐式 | 是 | 是 | 是 |
| 网格位移 MLP | 显式 | 是 | 否 | 是 |
| **Blended Chart Surfaces** | **显式** | **否** | **是** | **是** |

## 可行性评估

✅ **推荐实现**

- 算法清晰，多项式优化成熟
- 适合作为几何处理中的通用曲面表示
- 可与 libigl/CGAL 集成

⚠️ **注意事项**

- 对粗网格质量有一定要求
- 高亏格曲面需要合理的chart划分

## 传递给

@墨鱼丸 - 几何算法可行性分析

---

*生成时间: 2026-06-17 14:05 UTC*
