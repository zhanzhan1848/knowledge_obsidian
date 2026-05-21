---
title: "Generative and isoparametric geometric modeling of large-scale and multiscale microstructures"
citation: "arXiv:2605.18894"
date: 2026-05-18
tags: [微观结构, 等参建模, Catmull-Clark样条, 多尺度几何, 增材制造]
---

# ExVCC: 大规模多尺度微观结构的生成式等参几何建模

## 问题背景

增材制造向更高打印分辨率和更大构建体积发展， microstructure 可设计更细的几何特征覆盖更大的物理域。这对几何建模提出根本挑战：必须紧凑表示大规模几何细节，同时保持跨尺度关联。

现有方法无法很好地扩展：
- 显式表示承受 prohibitive 内存成本
- 隐式表示仅在 microstructure 承认解析、周期或简洁程序描述时才紧凑

## 核心贡献

### 1. ExVCC (Extended Volumetric Catmull-Clark Spline)

扩展的体积 Catmull-Clark 样条表示，超越张量积拓扑支持局部样条细化。

### 2. 新形状编码方案和细化规则

- 紧凑编码大规模几何细节
- 通过按需分层细化支持局部求值

### 3. 等参表示

跨尺度的几何细节定义在共享参数域上，使用相同的 ExVCC 样条基函数。

## 技术效果

- 将 ExVCC 的样条细化层次转化为几何编码、按需生成和跨尺度关联的统一框架
- 几何修改可自动跨尺度传播

## 应用场景

大规模和多尺度 microstructure 建模，适用于增材制造

## 标签

#几何建模 #等参曲线 #微观结构 #Catmull-Clark #多尺度