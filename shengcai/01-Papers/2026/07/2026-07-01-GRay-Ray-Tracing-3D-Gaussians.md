---
title: Ray Tracing 3D Gaussians Near the Speed of Splats
authors: George Drettakis et al.
date: 2026-07-01
source: arXiv cs.GR (I3D 2026)
url: https://arxiv.org/abs/2606.30869
pdf: https://arxiv.org/pdf/2606.30869
tags: [rendering, ray-tracing, 3D-Gaussian-Splatting, acceleration, 2026]
status: unread
---

# Ray Tracing 3D Gaussians Near the Speed of Splats

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Ray Tracing 3D Gaussians Near the Speed of Splats |
| 作者 | George Drettakis et al. |
| 来源 | arXiv cs.GR, I3D 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.30869) |
| PDF | [下载](https://arxiv.org/pdf/2606.30869) |
| 代码 | [GitHub](https://repo-sam.inria.fr/nerphys/gray) |

## 核心贡献
1. **GRay** - 快速3D Gaussian光线追踪器，接近3DGS光栅化速度
2. 发现密集初始化策略对光线追踪有利但会减慢光栅化
3. 相比3DGRT优化速度快10x，渲染速度快近4x

## 技术方案
- 利用光线追踪与光栅化的算法差异：光线追踪只评估与光线相交的Gaussian
- **对数级扩展** vs 光栅化的线性扩展
- 密集初始化策略：创建大量小型Gaussians，加速光线追踪但减慢光栅化
- GRay渲染质量与3DGRT相当，速度与3DGS相当（质量略低）

## 实验结论
- 渲染速度快近4x
- 优化速度快10x vs 3DGRT
- 密集场景中光线追踪优势更明显
- 与3DGS速度相当但质量略低

## 局限性
- 渲染质量略低于3DGS
- 密集初始化可能影响某些场景质量

## 可行性分析
- 实现难度：中
- 性能预期：接近实时
- 适用场景：需要光线追踪反射/阴影但要求速度的场景

## 相关工作
- [[3DGS]] - 3D Gaussian Splatting
- [[3DGRT]] - 3D Gaussian Ray Tracing

## 笔记
**重要发现**：密集初始化策略对光栅化和光线追踪有相反效果
**代码已开源**
