---
title: 3DGART: 3D Gaussian Accelerated Ray Tracing
authors: Weizhen Zhou, Yuxuan Wang, Yihua Cheng, Hongyun Cheng, Xin Lu
date: 2026-08-17
source: arXiv
url: https://arxiv.org/abs/2608.17298
pdf: https://arxiv.org/pdf/2608.17298
tags: [rendering, ray-tracing, 3D-gaussian-splatting, neural-rendering]
status: unread
---

# 3DGART: 3D Gaussian Accelerated Ray Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3DGART: 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation |
| 作者 | Weizhen Zhou, Yuxuan Wang, Yihua Cheng, Hongyun Cheng, Xin Lu |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17298) |
| PDF | [下载](https://arxiv.org/pdf/2608.17298) |

## 核心贡献
1. 提出基于基元(primitive)的反向传播算法，解决3DGS光线追踪训练中的原子竞争问题
2. 使用保守透视校正的屏幕空间边界构建紧凑中间缓冲区和tile-基元映射
3. 在Mip-NeRF 360上实现约3-3.5倍训练加速，4倍于3DGRT

## 技术方案
**问题**: 3D Gaussian Splatting依赖光栅化，限制了对反射、折射、阴影等二次光线效果的支持。Gaussian ray tracing虽支持这些效果，但训练成本高。

**核心瓶颈**: 像素中心的反向传播中，大量线程同时向同一基元参数累积梯度，导致严重的原子竞争和线程串行化。

**解决方案**: 围绕基元而非像素重组反向传播。使用保守透视校正的屏幕空间边界构建紧凑中间缓冲区和tile-基元映射，使每个线程累积一个基元在其覆盖像素上的贡献，将竞争密集的scatter操作转换为结构化的gather-like过程。

## 实验结论
- Mip-NeRF 360上实现约3-3.5倍原始训练加速
- 比3DGRT快约4倍，同时提升质量
- 使完全光线追踪的Gaussian训练变得实用，训练时间可与光栅化流水线竞争

## 局限性
- 需要额外的中间缓冲区存储
- 针对3DGS特定表示

## 可行性分析
- 实现难度：中
- 性能预期：训练加速3-4倍，对推理无影响
- 适用场景：需要光线追踪反射/折射效果的实时视图合成

## 相关工作
- 3D Gaussian Splatting
- Gaussian Ray Tracing (3DGRT)
- Mip-NeRF 360

## 笔记
**重要**: 这篇论文对3DGS光线追踪训练优化有重要意义。关键技术是基元中心的反向传播，将scatter操作转换为gather-like过程。
