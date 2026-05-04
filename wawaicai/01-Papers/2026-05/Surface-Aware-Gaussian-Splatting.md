---
title: "Surface-Aware Gaussian Splatting for Geometrically Accurate Mesh Reconstruction"
authors: [Divyam Sheth, et al.]
date: 2026-05-01
tags: [几何, 3DGS, 2DGS, 网格重建, 表面重建]
paper_id: 2605.00569
subjects: [cs.CV, cs.GR]
conference: arXiv (cross-list)
status: new
---

# Surface-Aware Gaussian Splatting for Geometrically Accurate Mesh Reconstruction

## 核心方法

### 问题定义
3D Gaussian Splatting (3DGS) 可实现照片级真实感渲染，但体积性质限制了其捕捉表面几何的能力。2DGS 可实现视图一致且几何准确的表面重建，但对高斯原语初始化敏感。

### 关键创新

1. **Depth-guided Initialization**
   - 结合单目深度和法线先验
   - 改善几何精度和鲁棒性

2. **Clustering-based Pruning**
   - 使用聚类技术修剪退化高斯
   - 提高重建质量

### 实验结果
- 在 DTU 数据集上达到 SOTA 网格重建效果
- 保持高质量的新视角合成

## 相关笔记
[[3D Gaussian Splatting]]
[[Mesh Reconstruction]]
[[Surface Reconstruction]]

## 可行性分析
✅ 推荐关注

**理由**：
- 结合深度先验改善 2DGS 初始化
- 解决实际问题（3DGS 体积表示的表面几何限制）
- 有公开代码/项目页面