---
title: "Dual Contouring of Signed Distance Data"
arXiv: "2604.00157"
conference: "SIGGRAPH 2026"
date: 2026-04-01
tags: [几何, 网格重建, SDF, 尖锐特征, Dual Contouring]
categories: [论文, 表面重建, SIGGRAPH2026]
---

# Dual Contouring of Signed Distance Data

## 核心方法

从离散采样的 **Signed Distance Function (SDF)** 数据重建显式多边形网格，特别擅长恢复**尖锐特征**：
- 基于传统 Dual Contouring of Hermite Data 方法
- 设计并求解**二次优化问题**来确定网格顶点在每个网格单元中的最优位置
- 优化仅依赖离散采样的 SDF 数据，不需要梯度信息或大规模训练数据

## 创新点

1. **无需 Hermite 数据**：不依赖精确表面法线
2. **迭代细化**：利用 SDF 信息迭代细化网格顶点位置
3. **局部优化可并行**：每个网格单元独立优化
4. **保持尖锐特征**：即使特征未与背景网格对齐也能恢复

## 技术细节

- 关键能量：二次误差函数 (QEF)
- 与原始 Dual Contouring 相同的假设：样本位于规则网格节点上
- 可利用远离零等值面的 SDF 数据的全局几何信息

## 算法复杂度

- 时间：$O(n)$ 并行（每个单元格独立）
- 空间：$O(n)$ 网格存储

## 开源参考

- libigl: `quadric_error_metric` 相关函数
- CGAL: `Polygon_mesh_processing` 模块
- 原始 Dual Contouring: Ju et al. (2002)

## 相关笔记

[[表面重建]] [[SDF]] [[网格简化]] [[尖锐特征]]

## 可行性评估

✅ **强烈推荐实现**

优点：
- 离 SDF 数据重建的最新 SOTA
- 保持尖锐特征，适合 CAD/制造
- 无需梯度或法线数据
- 可并行实现

适用场景：3D 建模、工业设计、增材制造、逆向工程

## 传递建议

传递给 @墨鱼丸 - 适合集成到几何处理管线
