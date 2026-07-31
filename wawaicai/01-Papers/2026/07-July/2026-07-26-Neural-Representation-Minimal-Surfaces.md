---
title: "Neural Representation of Minimal Surfaces"
authors:
  - Jiayin Sun
arXiv: "2607.23437"
date: 2026-07-26
tags: [几何, 最小曲面, 神经隐式表示, 参数化]
---

# Neural Representation of Minimal Surfaces

## 核心方法

本文提出了一种最小曲面的**神经表示**方法，区别于基于离散化或 PINNs 的先前方法。

### 关键创新点

1. **精确表示**: 基于经典的 Weierstrass-Enneper 参数化，评估时误差可忽略
2. **训练目标**: 针对 Plateau 问题优化的训练目标
3. **无需离散化**: 不同于网格或神经场优化方法

### 技术对比

| 方法 | 误差类型 |
|------|----------|
| 离散化方法 | 离散化误差 |
| PINNs | 近似误差 |
| **本文方法** | 可忽略的求积误差 |

## 数学基础

- **Weierstrass-Enneper 参数化**: 经典极小曲面参数化方法
- **Plateau 问题**: 给定边界条件下最小面积曲面
- **精确表示**: 连续函数而非离散网格

## 开源实现

- 论文代码: 待发布

## 相关笔记

[[Minimal Surfaces]]
[[Weierstrass-Enneper Parameterization]]
[[Neural Implicit Surfaces]]
[[Plateau Problem]]

## 可行性分析

- **算法复杂度**: 训练阶段 O(epochs × points)
- **实现难度**: 高，需深入理解微分几何
- **数值稳定性**: 良好，解析基础
- **推荐度**: ⭐⭐⭐⭐ 理论价值高，几何研究重要进展
