---
title: "Tangent Blow-Ups for Processing Non-Manifold Geometry"
date: 2026-05-18
authors: Alice Petrov et al.
arXiv: "2605.18215"
tags: [non-manifold, differential-geometry, tangent-space, singular-geometry]
conference: arXiv 2026
---

# Tangent Blow-Ups for Processing Non-Manifold Geometry

## 核心思想

几何数据常包含**奇异性**: 边缘、角点、自相交、分叉连接点等。传统几何处理假设流形（每点有唯一切平面），在奇异性处方法失效。

**解决方案**: 引入"切线爆破"(Tangent Blow-Up)，将奇异性点提升到 $M \times Gr(k, n)$ 空间（空间 × 切平面Grassmannian）。

## 数学框架

### 切线爆破定义

对于点 $p \in \mathbb{R}^n$，其切线爆破：
$$\tilde{M} = \{(p, T) \mid p \in M, T \in Gr(T_p M)\}$$

迭代后，原本位置重叠但切方向不同的点变得可分。

### 度量定义

产品度量：
$$g_{(p,T)}((v_1, S_1), (v_2, S_2)) = \langle v_1, v_2 \rangle + \langle S_1, S_2 \rangle$$

### 离散微分算子

在提升空间中直接定义：
- **梯度**: $\nabla f$
- **散度**: $\nabla \cdot X$  
- **拉普拉斯**: $\Delta f$

## 应用场景

| 应用 | 效果 |
|------|------|
| 测地线计算 | 正确处理分叉路径 |
| 分割 | 边缘处一致处理 |
| 参数化 | 奇异性处合理过渡 |
| 曲率估计 | 角点处稳定 |

## 可行性评估

- **理论深度**: 高 — 代数几何方法
- **实现难度**: 中 — 需要Grassmannian表示和度量
- **依赖项**: libigl, Eigen
- **推荐度**: ⭐⭐⭐⭐ — 非流形几何处理的基础框架

## 创新点

1. **表示革命**: 从流形假设解放
2. **统一框架**: 微分算子推广到奇异空间
3. **实用性**: 具体应用验证有效性

## 相关技术

- [[Differential Geometry]] — 切空间、Grassmannian
- [[Geodesic Computation]] — 测地线
- [[Parameterization]] — UV展开