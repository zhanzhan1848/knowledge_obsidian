---
title: "Subgrid Marching Tetrahedra"
date: 2026-07
venue: SIGGRAPH 2026
tags: [几何, 网格重建, Marching-Tetrahedra, Subgrid]
authors:
  - Hossein Baktash
  - Mark Gillespie
  - Keenan Crane
doi: "10.1145/3799902.3811974"
url: "https://dl.acm.org/doi/10.1145/3799902.3811974"
---

# Subgrid Marching Tetrahedra

## 核心方法

改进的 **Marching Tetrahedra** 方法，使用子网格提高精度。

### 关键创新点
- **Subgrid 策略**：在四面体内使用子网格采样
- **精度提升**：减少阶梯效应
- **高效实现**：保持 Marching Tetrahedra 的高效性

## 关键词
- Marching Tetrahedra
- Subgrid
- Surface Reconstruction
- Accuracy Improvement

## 算法复杂度
- 时间复杂度：O(n × k) - k 为子网格采样数
- 空间复杂度：O(n)

## 相关笔记
[[Dual-Contouring]]
[[Marching-Cubes]]
