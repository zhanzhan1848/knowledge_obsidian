---
title: 3D Gaussian Accelerated Ray Tracing - Fast Training Through Particle-Based Backward Propagation
authors: University of Canterbury
date: 2026-08-17
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17298
pdf: https://arxiv.org/pdf/2608.17298
tags: [rendering, gaussian-splatting, ray-tracing, neural-rendering, training-optimization, 2026]
status: unread
---

# 3D Gaussian Accelerated Ray Tracing: Fast Training Through Particle-Based Backward Propagation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Gaussian Accelerated Ray Tracing: Fast Training Through Particle-Based Backward Propagation |
| 作者 | University of Canterbury, New Zealand |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17298) |
| PDF | [下载](https://arxiv.org/pdf/2608.17298) |

## 核心贡献
1. **识别瓶颈**：像素中心的后向传播中，原子竞争（atomic contention）是光追高斯训练的主要瓶颈，而非光线遍历本身
2. **提出粒子中心反向传播**：用保守透视校正的屏幕空间边界构建紧凑中间缓冲区，基于 tile-primitive 映射将散射操作转为结构化收集，大幅减少梯度累积冲突
3. **性能提升**：Mip-NeRF 360 上比 per-pixel baseline 快 **3-3.5×**，比 3DGRT 快 **4×**，同时提升质量
4. 使完全光追高斯训练进入光栅化管线的运行时间范围

## 技术方案

### 核心问题
现有可微光线追踪 pipeline 采用像素中心形式：每个线程处理一条光线，累积梯度到对应高斯参数。同一 primitive 可见于多个像素时，大量线程并发更新同一内存位置，导致严重的原子操作争用和线程串行化。

### 3DGART 解决方案
**核心思想**：以后向传播以 primitive 为中心而非像素为中心。

- 使用保守透视校正的屏幕空间边界构建紧凑中间缓冲区
- 建立 tile-primitive 映射，每个线程负责累积一个 primitive 在其覆盖像素上的贡献
- 将梯度计算从高冲突的散射操作转变为结构化gather-like过程

### 高斯场景表示
每个 primitive i 由均值位置 **μ** ∈ ℝ³ 和协方差矩阵 **Σ** ∈ ℝ³ˣ³ 定义。3D 点 **x** 处的高斯密度响应为高斯函数形式。

## 实验结论
- Mip-NeRF 360 bicycle 场景：3DGART 收敛速度比 3DGRT 快约 **4×**，同时获得更高重建质量
- 训练速度提升 **3-3.5×**（per-pixel baseline）
- 完全光追高斯训练达到与光栅化 pipeline 相当的运行时间，同时保留光线追踪的优势（反射、折射、阴影、次级光线）

## 局限性
- 需要额外的中间缓冲区，增加了内存开销
- tile-primitive 映射需要额外的构建步骤
- 主要针对训练阶段优化，推理阶段优化有限

## 可行性分析
- 实现难度：中（需要理解梯度累积的原子争用问题）
- 性能预期：训练速度大幅提升，推理速度与 3DGRT 相当
- 适用场景：需要光线追踪效果（反射、折射、软阴影）的 3DGS 训练流程、NeRF/3DGS 混合场景

## 相关工作
- 3D Gaussian Splatting (3DGS)
- 3D Gaussian Ray Tracing (3DGRT)
- Neural Radiance Fields (NeRF)
- EVER (exact volumetric integration)
- Point-Based Neural Rendering (PBNR)

## 笔记
这是高斯泼溅与光线追踪结合方向的重要进展。核心洞察是将后向传播从像素中心重构为primitive中心，解决了原子争用这个关键瓶颈。对需要反射、折射等光线追踪效果但又想利用3DGS高效训练的应用非常有价值。
