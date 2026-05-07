---
tags: [几何, 中轴, 网格简化, QEM, arXiv]
date: 2026-05-07
source: arXiv cs.GR
---

# Clean and Scalable Medial Axis Simplification via Explicit Surface Correspondence

## 核心方法

**Medial Axis Transform (MAT)** 是一种完整的形状描述符，能够从 MAT 重建原始区域几何。

高质量 MAT 要求：
1. 高保真重建
2. 对齐 MAT 边界与滚动球心轨迹（在 fillet 区域）

## 技术路线

沿用成熟管线：
1. 通过表面采样的 3D Voronoi 图初始化 MAT
2. 通过 **QEM-like 方案** 简化 Voronoi 结构

**关键创新**：通过显式表面对应来实现清洁且可扩展的 MAT 简化。

## 几何相关性

- MAT (Medial Axis Transform) → 形状分析
- QEM (Quadric Error Metrics) → 网格简化
- Voronoi diagram → 空间分割
- fillet 区域 → 几何特征保持

## 关联技术

- [[2026-04-03-Topology-First-BRep-Meshing]] (BRep网格化)
- [[2026-03-12-TopGen-Quadrilateral-Mesh-Generation]] (四边形网格生成)

## 推荐度

⚠️ **关注** — MAT 简化对于形状分析和网格生成下游任务有潜在价值