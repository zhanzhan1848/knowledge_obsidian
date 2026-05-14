---
title: "SMAC: Simultaneous Monitoring of Shape and Color via 4D Point Clouds"
date: 2026-05-09
tags: [点云处理, 4D点云, Laplace-Beltrami, 形状监测, 异常检测]
source: arXiv cs.CV
paperId: 2605.08753
authors: Mariafrancesca Patalano et al.
---

# SMAC: Simultaneous Monitoring of Shape and Color via 4D Point Clouds

## 核心方法

提出 **SMAC (Simultaneous Monitoring of shApe and Color)** 框架，用于通过4D点云同时监测形状和表面颜色变化，无需配准或网格重建。

### 核心创新点

1. **registration-free**：无需配准、网格重建或降采样
2. **Laplace-Beltrami 谱表示**：利用 LB 算子谱特性提取数百个分层有序几何特征
3. **combined monitoring scheme**：同时检测形状变形和颜色异常
4. **spatially-aware post-signal diagnostics**：定位异常源和颜色异常区域

### 技术亮点

- **4D点云**：融合点云几何和颜色属性，编码形状和材质信息
- **异质材料复杂形状**：能处理空间异质材料属性的复杂形状
- **非刚性变形下避免误报**：在非刚性变形情况下保持稳定

## 算法流程

```
4D点云（带颜色）→ Laplace-Beltrami 谱表示 → 提取分层几何特征
     ↓
Combined Monitoring Scheme → 形状变形检测 + 颜色异常检测
     ↓
Spatially-aware Diagnostics → 定位异常源和区域
```

### 关键数学工具

- **Laplace-Beltrami 算子**：用于提取几何特征的谱表示
- **层次化几何特征**：数百个分层有序的特征
- **无网格重建**：直接处理点云数据

## 实验验证

- Monte Carlo 模拟研究
- 功能梯度材料 (Functionally Graded Materials) 案例研究
- 有效检测细微缺陷，提供诊断能力

## 应用场景

- 先进制造质量控制
- 复杂零件形状和材料监测
- 功能梯度材料分析

## 相关技术

- libigl: `cotangent_weights`, `mass_matrix` 等 LB 相关函数
- CGAL: 点云处理相关功能
- PointNet: 点云特征编码

## 相关笔记

[[point-cloud-processing]]
[[Laplace-Beltrami]]
[[shape-monitoring]]
[[anomaly-detection]]