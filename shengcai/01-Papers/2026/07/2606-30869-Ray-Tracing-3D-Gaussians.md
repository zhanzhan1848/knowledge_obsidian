---
title: "Ray Tracing 3D Gaussians Near the Speed of Splats"
authors: ["George Drettakis", "et al."]
date: 2026-06-30
venue: "I3D 2026"
status: important
tags: [渲染, 光线追踪, 3DGS, 高斯泼溅, 加速结构]
links:
  arXiv: "https://arxiv.org/abs/2606.30869"
  PDF: "https://arxiv.org/pdf/2606.30869"
  Code: "https://repo-sam.inria.fr/nerphys/gray"
---

## 核心贡献

1. **GRay** - 快速3D Gaussian光线追踪器，接近3DGS光栅化速度
2. 利用光线追踪与光栅化的算法差异：对数级而非线性扩展
3. 密集初始化策略 - 创建许多小型高斯反而加速光线追踪

## 技术方案

### 核心问题
- 3D Gaussian Splatting (3DGS) 以光栅化渲染速度快著称
- 3D Gaussian Ray Tracing (3DGRT) 优化速度慢约一个数量级

### GRay方法
- 光线追踪只评估射线实际相交的高斯，对数扩展
- 光栅化需线性处理所有图元
- **密集初始化**反而加速光线追踪（传统观点认为会变慢）

### 性能对比
- 比3DGRT快约4倍渲染
- 比3DGRT快约10倍优化
- 与3DGS速度相当（质量略低）

## 实验结论

| 指标 | GRay | 3DGRT | 3DGS |
|------|------|-------|------|
| 渲染速度 | ~4x更快 | baseline | competitive |
| 优化速度 | ~10x更快 | baseline | - |

## 相关工作

- 3D Gaussian Splatting (3DGS)
- 3D Gaussian Ray Tracing (3DGRT)
- Radiance Field Reconstruction

## 标签

#光线追踪 #3DGS #高斯泼溅 #渲染加速 #I3D2026
