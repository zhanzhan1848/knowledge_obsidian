---
title: "Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds"
authors: ["Pengfei Wang", "Qinghao Guo", "Haisen Zhao", "Shiqing Xin", "Shuangmin Chen", "Changhe Tu", "Wenping Wang"]
date: 2026-07
tags: [几何, 点云, k-NN, 流形, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #101"
---

# Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds

## 核心方法

本文提出**流形加速的k最近邻查询算法**，专为流形点云设计。

### 核心创新点

1. **流形感知**: 利用点云内在流形结构加速搜索
2. **理论保证**: 提供理论上的近似保证
3. **GPU友好**: 算法设计适合GPU实现
4. **自适应**: 自动适应不同流形结构

### 技术要点

- **流形假设**: 点云位于低维流形上
- **局部线性嵌入**: 利用局部邻域结构
- **KD-树变体**: 针对流形数据的KD-树

## 应用场景

- 点云配准
- 表面重建
- 特征提取
- 几何深度学习预处理

## 开源实现

- libigl: `knn`, `bfs`
- CGAL: `Point_set_processing_3`

## 几何相关性

✅ **高相关**: 点云处理基础算法
- k-NN查询
- 流形学习
- 空间索引

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐ 中等 |
| 应用价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

k-NN是点云处理和几何深度学习的基础算法，流形加速版本具有重要实用价值。

## 相关笔记
[[2026-08-20-GPU-Hausdorff-Distance-Triangle-Meshes]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
