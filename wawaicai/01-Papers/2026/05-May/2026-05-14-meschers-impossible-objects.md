---
title: "Meschers: Geometry Processing of Impossible Objects"
date: 2026-05-14
tags: [几何, 网格处理, 离散微分几何, 表示方法]
cite: arXiv:2605.14960 [cs.GR]
authors: Ana Dodik et al.
venue: ACM Trans. Graph. 44, 4, Article 70 (August 2025)
---

# Meschers: Geometry Processing of Impossible Objects

## 核心方法

提出 **Meschers** (Meshes + Escher)，一种能够表示不可能几何构型的网格表示，灵感来自 M.C. Escher 的木刻作品。

### 问题背景
- 经典方法通过切割(cutting)或弯曲(bending)将不可能物体嵌入3D空间
- Cutting 改变切割处的局部几何，影响平滑等下游应用
- Bending 使得难以对物体进行重新着色

### 核心创新
基于**离散外微积分(Discrete Exterior Calculus, DEC)**的理论基础：
- 支持几何处理操作（平滑、距离计算等）
- 能够对不可能物体进行逆渲染(inverse-render)
- 与传统 cut/bend 表示对比

### 技术特点
- 支持标准几何处理用例
- 可计算离散几何处理
- 保持不可能结构的视觉感知

## 算法复杂度
- 论文未给出具体复杂度分析
- 基于 DEC 框架，计算效率依赖于网格分辨率

## 开源参考
- 论文链接: https://arxiv.org/abs/2605.14960
- ACM DOI: https://doi.org/10.1145/3731422

## 可行性分析

### ✅ 推荐实现

| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中等（需实现 DEC 框架）|
| 数值稳定性 | DEC 理论成熟，稳定 |
| 依赖项 | libigl (DEC 操作), CGAL (可选) |

### 实现建议
- libigl 提供了 DEC 相关函数，可参考
- 适合艺术/视觉效果应用
- 对工程应用价值一般

## 相关笔记
[[网格表示]]
[[离散微分几何]]
