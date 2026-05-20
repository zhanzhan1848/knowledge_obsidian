---
title: "Conformal Tubular Parameterization and Toroidal Bending"
date: 2026-04-26
authors: Gary P. T. Choi et al.
arXiv: "2605.16305"
tags: [parameterization, conformal, tubular-surface, toroidal]
conference: arXiv 2026
---

# Conformal Tubular Parameterization and Toroidal Bending

## 核心问题

管状曲面广泛应用于：
- 工程管道
- 医学血管
- 几何处理

传统平面环形/矩形参数域**不保留**管状曲面的纵向+环向拓扑。

## 解决方案

### 框架概览

1. **固定边界管状参数化**:
   - 切割输入网格
   - 圆盘→矩形共形映射
   - 提升到3D管状域

2. **局部拟共形校正**:
   - 环面域上公式化
   - 改善共形性，减少切缝畸变

3. **自由边界变体**:
   - 边界扩展 + cycle-Laplacian 平滑
   - 处理噪声/不规则边界

4. **环面弯曲映射**:
   - 管状→环面，保持拓扑

## 数学基础

### 共形映射

保持角度的映射：
$$\phi: M \rightarrow \mathbb{C}$$
$$|\phi'(z)| dz$$ 为度量张量

### 拟共形校正

寻找最小扭曲映射：
$$\mu = \frac{\partial_{\bar{z}} f}{\partial_z f}$$

## 应用

| 场景 | 效果 |
|------|------|
| 血管表面 | 低畸变参数化 |
| 管道几何 | 环面目标域 |
| 下游处理 | 纹理映射、分析 |

## 可行性评估

- **算法复杂度**: O(n log n) 共形映射
- **数值稳定性**: 高 — 闭式解可用
- **依赖项**: libigl, SSEF
- **推荐度**: ⭐⭐⭐⭐ — 管状曲面参数化重要工作

## 技术亮点

1. **拓扑保持**: 纵向+环向结构保留
2. **切缝减少**: 拟共形校正改善
3. **目标域灵活**: 管状/环面双选项

## 相关技术

- [[Conformal Parameterization]] — 共形映射
- [[Tubular Surface]] — 管状曲面
- [[Toroidal Mapping]] — 环面映射