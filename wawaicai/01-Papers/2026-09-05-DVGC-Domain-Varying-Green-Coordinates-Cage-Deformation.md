---
tags: [几何, 网格变形, cage变形, Green坐标, 调和坐标]
---

# Domain-Varying Green Coordinates for Cage-based Deformation

## 论文信息
- **arXiv**: [2608.31003](https://arxiv.org/abs/2608.31003)
- **会议**: Pacific Graphics 2026
- **日期**: 2026-08-31

## 核心方法
提出 Domain-Varying Green Coordinates (DVGC)，统一 Harmonic Coordinates (HC) 和 Green Coordinates (GC) 的 cage-based 变形理论。

## 技术要点
- **新理论视角**: 基于 domain-varying Green’s functions 的 cage 变形，将 domain 视为变形效果的新控制空间
- **统一框架**: 使用跨不同 domain 的 Green’s functions 统一 HC 和 GC
- **连续过渡**: 当 Green’s function domain Θ 从 cage region Ω 扩展到整个 ℝ² 时，产生从 HC 到 GC 的连续效果过渡
- **解析形式**: 当 Θ 是圆盘或矩形时，Green’s function 具有解析或半解析表达式，无需有限元离散化
- **闭合形式**: 当 Θ 是圆盘时，2D 单纯 cage 存在闭合形式表达式

## 几何算法
- Green’s functions
- Harmonic Coordinates (HC)
- Green Coordinates (GC)
- 2D 单纯 cage (simplicial cage)

## 相关笔记
[[2026-09-05-ARAP-Gaussian-Radiance-Fields]]
