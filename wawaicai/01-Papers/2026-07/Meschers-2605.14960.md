---
title: "Meschers: Geometry Processing of Impossible Objects"
arXiv: "2605.14960"
date: 2026-05-14
conference: "ACM Trans. Graph. (August 2025)"
tags: [不可能对象, 离散外微分, 网格表征, 逆渲染]
---

# Meschers: Geometry Processing of Impossible Objects

## 核心方法

Meschers 提出一种能够表示不可能建筑结构（如 M.C. Escher 木刻作品）的网格表征，基于**离散外微分 (Discrete Exterior Calculus, DEC)** 理论。

### 背景问题

- **切割法**: 修改切割处的局部几何，影响平滑等下游图形应用，破坏距离计算等几何操作
- **弯曲法**: 难以重新光照 (relight) 对象
- **需求**: 表示不可能对象的同时支持标准几何处理操作

### 关键技术点

1. **DEC 理论基础**: 网格表示建立在离散外微分上
2. **支持用例**:
   - 网格平滑
   - 重新光照 (relighting)
   - 距离计算等几何操作
   - 逆渲染 (inverse-rendering)
3. **与现有方法对比**: cut and bend 表示

### 创新点
- 首个支持完整几何处理操作链的不可能对象表征
- 可逆渲染不可能对象

## 算法复杂度
- DEC 框架：数值稳定
- 适用于标准几何处理管线

## 开源实现
- Project: https://arxiv.org/abs/2605.14960

## 可行性分析
- **算法复杂度**: 中等
- **数值稳定性**: 良好（DEC 理论支撑）
- **依赖项**: 离散外微分库（如 PyDEC）
- **推荐度**: ⭐⭐⭐⭐ 推荐（新型网格表征，有独特应用场景）

## 相关笔记
[[Intrinsic Meshing: Geodesic Distances]]
