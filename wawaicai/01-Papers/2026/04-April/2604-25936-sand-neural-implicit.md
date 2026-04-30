---
title: "Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces"
authors: ["Chuanxiang Yang"]
date: 2026-04-15
tags: [几何, 神经隐式, 自适应计算, SDF]
categories: [Geometry, Neural Implicit]
cite: arXiv:2604.25936
subject: "cs.GR"
---

## 核心方法

**SAND (Spatially Adaptive Network Depth)** - 空间自适应网络深度的神经隐式几何表示框架。

### 核心思想

观察：隐式表示在不同区域需要不同的计算精度
- 远离目标表面的查询点：精度要求逐渐降低
- 同一等值面内：不同位置表示难度不同（局部几何复杂度差异）

### 关键创新点

1. **体积分辨率网络深度图**：记录每个空间区域所需的网络深度
2. **尾式多层感知器 (T-MLP)**：每层隐藏层附加输出分支 (tail)
3. **自适应提前终止**：无需遍历完整网络，在几何重要和复杂区域集中计算资源

### 技术细节

- 体积网络深度图 (volumetric depth map)
- 尾式 MLP (T-MLP) - 带输出分支的修正 MLP
- 自适应网络评估

## 算法复杂度

- 时间复杂度：O(k·n), k < 网络总层数
- 空间复杂度：O(n) + 深度图存储

## 开源实现

- 代码: 未公开

## 相关技术

- 神经隐式表示 (NeRF, SDF)
- 自适应计算
- MLP 架构优化
- 距离函数

## 评估

✅ **推荐实现** - 自适应计算思路可迁移到网格采样、LOD 生成等场景，适合提升几何处理效率

## 传递给

@墨鱼丸