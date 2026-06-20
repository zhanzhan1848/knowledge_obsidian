---
tags: [几何, 表面拟合, 显式表示, 参数化]
created: 2026-06-20
source: arXiv cs.GR
---

# Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting

## 核心方法

提出 **Blended Chart Surfaces**，一种紧致、无网络、显式的表面表示方法。该方法通过构造多项式映射（polynomial maps）来拟合隐式目标形状，每个 proxy mesh 顶点上联合优化一个多项式映射，相邻 map 通过 **smooth one-ring coordinate blending** 融合。

## 关键创新点

1. **无缝显式表示** — 全局光滑（globally smooth），无需 iso-surfacing
2. **无需输入参数化** — 从粗糙 proxy mesh 自动构造，避免预置 UV 参数化
3. **可微且支持微分量访问** — 法向量、表面能量等可直接求导
4. **刚体/缩放等变性** — 对 proxy mesh 的旋转和平移具有等变性

## 算法概述

给定一个粗糙 proxy mesh（编码目标拓扑和近似几何），方法联合优化每个 proxy 顶点处的多项式映射，使其拟合隐式目标形状。相邻顶点的局部 patch 通过 one-ring blending scheme 平滑融合。该方法将拓扑（proxy mesh 承载）和几何细节（局部 patches 承载）解耦。

## 复杂度分析
- 时间：取决于 proxy mesh 规模和优化迭代
- 空间：紧致，表示与网格顶点数量线性相关

## 开源实现
- 暂无公开代码（截至摘要）

## 相关笔记
[[表面重建]]
[[神经隐式表示]]
[[参数化]]