---
title: "Generative and isoparametric geometric modeling of large-scale and multiscale microstructures"
authors: ""
date: 2026-05-20
tags: [几何, 微结构, Catmull-Clark, 等参建模, 多尺度, 增材制造]
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.18894
---

## 核心方法

随着增材制造向更高分辨率和更大构建体积发展，微结构可在更大物理域上设计更细的几何特征。这对几何建模提出根本挑战：必须紧凑表示海量几何细节，同时维护跨尺度关联。现有方法无法很好扩展——显式表示内存成本过高，隐式表示仅在微结构具有解析的、周期性的或简洁程序化描述时才紧凑。

提出新方法：将微结构建模视为**按需生成过程**，无需实例化所有几何细节。

核心：**ExVCC**（Extended Volumetric Catmull-Clark Spline）——支持局部样条细粒化超越张量积拓扑。基于 ExVCC 引入新的形状编码方案和细粒化规则，紧凑编码大规模几何和跨尺度关联。

## 关键创新

- ExVCC 扩展体积 Catmull-Clark 样条
- 局部样条细粒化超越张量积拓扑
- 按需生成微结构几何
- 多尺度关联维护

## 开源实现
- 待查

## 相关笔记
[[几何-细分曲面]]
[[几何-多尺度建模]]