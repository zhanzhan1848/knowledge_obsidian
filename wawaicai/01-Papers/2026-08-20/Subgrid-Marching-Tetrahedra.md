---
title: "Subgrid Marching Tetrahedra"
authors: ["Hossein Baktash", "Mark Gillespie", "Keenan Crane"]
date: 2026-07
tags: [几何, Marching Tetrahedra, 表面重建, 等值面, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #974"
---

# Subgrid Marching Tetrahedra

## 核心方法

本文由**Keenan Crane**团队提出，改进了标准Marching Tetrahedra算法。

### 核心创新点

1. **子网格精度**: 在粗网格上实现高精度等值面提取
2. **解析插值**: 使用解析方法而非线性插值
3. **特征保持**: 更好地处理尖锐特征
4. **理论保证**: 提供误差界分析

### 技术要点

- **子网格细分**: 网格内部再细分
- **解析SDF评估**: 不依赖网格顶点值
- **四面体分解**: 优化的四面体分解策略

## 开源实现

- libigl: `marching_tets`, `marching_cubes`
- 本文代码: 待发布

## 几何相关性

✅ **高相关**: 等值面提取经典算法
- 四面体网格处理
- SDF等值面提取
- 网格生成

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐ 中等 |
| 理论价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

Keenan Crane团队的工作通常有很高的理论价值和实用性，值得深入研究。

## 相关笔记
[[2026-08-20-Dual-Contouring-Signed-Distance-Data]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
