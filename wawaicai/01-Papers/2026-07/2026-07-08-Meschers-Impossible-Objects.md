---
tags: [几何, 网格处理, 不可能对象, 离散外微分]
date: 2026-07-08
source: arXiv
categories: [cs.GR, cs.CG, cs.CV]
---

# Meschers: Geometry Processing of Impossible Objects

## 核心方法

提出 **Meschers** (Meshes + Escher)，一种能够表示不可能几何构造（如 M.C. Escher 木刻作品）的网格表示：

- 理论基础：**离散外微分 (Discrete Exterior Calculus)**
- 支持在不可能对象上进行几何处理操作
- 可进行逆渲染 (inverse-rendering)

## 问题背景

### 现有方法局限
1. **切割 (Cutting)**：改变切割处的局部几何，影响下游图形应用（如平滑）
2. **弯曲/扭曲 (Bending)**：使对象重光照困难
3. 两者都会使几何操作（如距离计算）失效

## 创新点

1. **首个能表示 M.C. Escher 风格不可能对象的计算机表示**
2. 理论扎实：基于离散外微分
3. 支持几何操作：平滑、距离计算
4. 支持逆渲染
5. 与 cut/bend 表示进行了对比验证

## 应用场景

- 艺术创作工具
- 感知心理学研究
- 图形学中的不可能场景建模
- 逆渲染应用

## 开源实现

- 待补充 (arXiv PDF 可用)
- 发表于 ACM Trans. Graph. 44, 4, Article 70 (August 2025)

## 相关笔记

[[2026-07-08-Intrinsic-Meshing-Geodesic-Distances]]

## 元信息

- **arXiv**: [2605.14960](https://arxiv.org/abs/2605.14960)
- **作者**: Ana Dodik 等
- **提交日期**: 2026-05-14
- **Subjects**: Graphics (cs.GR), Computational Geometry (cs.CG), Computer Vision (cs.CV)
- **DOI**: 10.1145/3731422
