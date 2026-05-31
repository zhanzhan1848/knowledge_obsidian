---
tags: [几何, skeleton, mesh, point-cloud, topology]
title: CSCD - Curve Skeletonization in Continuous Domain
authors: CSCD Authors
date: 2026-05-25
source: arXiv
venue: WACV 2026
---

# CSCD: Curve Skeletonization in Continuous Domain for Meshes and Point Clouds

## 核心方法

将 Local Separators (LS) 方法推广到流形上的连续域，提出两个实现：
- **CSCD-M**: 用于 mesh，基于内在三角化
- **CSCD-PC**: 用于 point cloud，使用 tufted Laplacians

### 关键创新
1. **首个 intrinsic 方法** 用于曲线骨架化
2. **CSCD-M**: 利用 mesh 的内在三角化，对噪声有鲁棒性，拓扑保持更好
3. **CSCD-PC**: 使用 tufted Laplacians 增强鲁棒性

### 与之前方法对比
-超越 LS (TOG'21) 在 Thingi10k 数据集上
- 超越 CoverageAxis++ (Eurographics'24)
- 超越 EPCS (CAG'23)

## 下游应用
-物体分类
- 形状分割
- 手柄/隧道/收缩识别

## 链接
- Project: https://cscd-skel.pages.dev

## 几何处理相关性

⭐⭐⭐⭐ **高相关** - 骨架化是几何处理的核心问题

## 实现参考
- libigl: `median_filter`, `laplacian`
- CGAL: `skeletonization`

## 评估
✅ **推荐关注** - 首个 intrinsic 方法，值得研究其与 Laplace spectral coordinates 的关系