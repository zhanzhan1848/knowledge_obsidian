---
title: Superpower Contouring of Unsigned Distance Data
tags: [几何, 重建, 隐式曲面, 无符号距离场]
cite: arXiv:2604.19568
date: 2026-04-21
authors: [Ningna Wang]
venue: cs.GR
---

# Superpower Contouring of Unsigned Distance Data

## 核心方法

提出 **superpower contour** 概念，用于从无符号距离数据重建任意曲面（开放、非定向、非流形）。

### 关键创新
- 利用 power diagram 特性
- 证明 superpower contour 在采样密度极限下收敛到真实曲面
- 使用 polygonal mesh 近似未知几何

### 算法流程
1. 从无符号距离样本生成 superpower contour
2. 利用 superpower contour 作为初始曲面代理
3. 迭代优化生成精确多边形网格

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：待分析

## 与现有方法对比

| 方法 | 要求 | 限制 |
|------|------|------|
| 现有方法 | 需要符号、精确梯度、连续距离函数 | 无法处理离散无符号数据 |
| 本文方法 | 仅需无符号距离数据点 | 可处理开放/非流形曲面 |

## 创新点

1. **数学理论基础**：证明 superpower contour 收敛性
2. **无需训练**：不依赖数据驱动训练
3. **通用性**：支持开放、非定向、非流形曲面

## 开源实现
- 待查找

## 相关笔记
[[几何-重建]]
[[隐式曲面]]