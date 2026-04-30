---
title: "A Hybrid Gas-Kinetic Scheme and Discrete Velocity Method for Continuum and Rarefied Flows"
authors: "Hangkong Wu et al."
arXiv: "2604.26463"
date: 2026-04-29
tags: [Navier-Stokes, gas-kinetic scheme, DVM, rarefied flow, hybrid method]
---

## 核心贡献

提出混合 GKS-DVM 方法，结合气体动理学格式 (GKS) 和离散速度法 (DVM) 的优势，在连续流和稀薄流之间自适应切换。

## 方法

- **连续极限**: 恢复 Navier-Stokes 解 (渐进保持 AP 性质)
- **稀薄极限**: 自然捕捉自由分子流
- **数值碰撞时间**: 平衡两种方法的精度

## 自适应策略

基于当地 Knudsen 数和 Mach 数调整计算策略，降低计算成本。

## 验证案例

1. **平板边界层**: 连续条件
2. ** lid-driven cavity flow**: 宽范围 Knudsen 数
3. **激波结构问题**: 跨流域

## 性能

- 连续流和稀薄流均保持高精度
- 计算效率优于单一方法

## URL

https://arxiv.org/abs/2604.26463
