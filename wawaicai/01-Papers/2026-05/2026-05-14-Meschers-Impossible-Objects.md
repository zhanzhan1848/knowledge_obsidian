---
title: "Meschers: Geometry Processing of Impossible Objects"
authors: ["Ana Dodik"]
date: 2026-05-14
arXiv: "2605.14960"
journal: "ACM Trans. Graph. 44, 4, Article 70 (August 2025)"
categories: ["几何处理", "不可能物体", "离散外微积分"]
tags: [impossible-objects, mesh-representation, discrete-exterior-calculus, Escher]
source: arXiv cs.GR
---

## 核心问题

**不可能物体**（Impossible objects）：人类可感知但无法在现实中存在的几何构造。

### 现有方法的问题
1. **切割法 (Cutting)**：改变局部几何，影响下游应用（如平滑）、距离计算
2. **弯曲法 (Bending)**：难以重新光照，无法进行几何操作

## 核心方法：Meschers

### 理论基础
- **离散外微积分 (Discrete Exterior Calculus, DEC)**
- 支持在不可能物体上进行几何处理

### 表征能力
- 类似 M.C. Escher 木刻作品中的不可能构造
- 无需切割或弯曲即可表示

## 应用场景

1. **几何处理操作**：平滑、距离计算
2. **逆渲染 (Inverse-rendering)**：优化不可能物体
3. **比较**：与 cut/bend 表征方法对比

## 技术创新

1. **理论奠基**：基于离散外微积分的数学框架
2. **下游兼容**：支持传统几何处理操作
3. **光照兼容**：可重新光照

## 开源参考

- libigl: 离散外微积分相关函数
- 参考：DEC (Discrete Exterior Calculus) 在 libigl 中的实现

## 相关笔记

[[discrete-exterior-calculus]]
[[impossible-geometry]]
[[mesh-representation]]