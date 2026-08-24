---
title: "As-Rigid-As-Possible Regularization for Implicit Surfaces"
authors: Tobias Djuren et al.
date: 2026-08-16
tags: [几何, 参数化, 表面变形, ARAP, 隐式曲面]
categories: [Surface Deformation, ARAP, Implicit Surfaces]
arxiv: "2608.15933"
conference: Computer Graphics Forum (CGF) 2026
doi: "10.1111/cgf.70519"
---

# As-Rigid-As-Possible Regularization for Implicit Surfaces

## 核心方法

为**隐式曲面**开发**As-Rigid-As-Possible (ARAP)** 能量计算方法，用于神经形状处理中的正则化。

### 问题背景
- ARAP能量在分片线性网格上效果好
- 隐式表示的ARAP计算缺乏成熟方案
- 神经形状处理需要精确且高效的正则化

### 解决方案

1. 在曲面的点采样上计算ARAP能量
2. 利用隐式表示获取每个采样的微分
3. 每个采样点精确评估（至数值精度）

## 关键创新

- **隐式曲面ARAP**：首个针对隐式表示的ARAP评估方案
- **高效精确**：利用隐式微分，无有限元近似
- **通用性**：适用于神经形状处理的多种应用

## 应用场景

- Neural Shape Processing（神经形状处理）
- Implicit Surface Deformation
- Shape Regularization

## 性能对比

与现有文献替代方案对比：
- 更精确的局部刚性保持
- 计算效率高

## CGF 2026

- 期刊：Computer Graphics Forum
- Volume 25 (2026), Number 5
- DOI: 10.1111/cgf.70519

## 相关技术

- ARAP (As-Rigid-As-Possible)
- Implicit Surface Representations
- SDF (Signed Distance Function)
- Neural Shape Processing
- Mesh/Surface Regularization

## 关联笔记

[[ARAP变形]]
[[隐式曲面]]
[[表面正则化]]
[[CGF2026]]
