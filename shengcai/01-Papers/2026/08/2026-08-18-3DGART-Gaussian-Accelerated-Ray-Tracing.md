---
title: "3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation"
authors: Laurent Vit, Oliver Batchelor, Richard Green
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17298
pdf: https://arxiv.org/pdf/2608.17298.pdf
tags: [rendering, ray-tracing, Gaussian-splatting, 3DGS, training, 2026]
status: unread
---

# 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation |
| 作者 | Laurent Vit, Oliver Batchelor, Richard Green |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17298) |
| PDF | [下载](https://arxiv.org/pdf/2608.17298.pdf) |

## 核心贡献
1. **识别训练瓶颈** - 发现主要瓶颈不是光线遍历，而是以像素为中心的反向传播
2. **Particle-based backward propagation** - 围绕基元而非像素重新组织反向传播
3. **Conservative perspective-correct screen-space bounds** - 构建紧凑中间缓冲区和 tile-primitive 映射
4. **Practical training framework** - 3DGART 使完全光线追踪的高斯训练变得实用

## 问题背景
- 3D Gaussian Splatting 使高斯基元成为实时新视角合成的有效表示
- 但其基于光栅化的公式依赖屏幕空间近似，限制了：
  - 准确的视线相关排序
  - 次级光线效果（反射、折射、阴影）的集成
- Gaussian ray tracing 通过评估显式光线-基元相交解决了这些限制
- 但训练成本仍然很高

### 瓶颈分析
- 主要瓶颈不是光线遍历
- 而是**像素中心的反向传播**
- 许多线程同时累积梯度到相同基元参数，导致严重的原子争用和线程串行化

## 技术方案：3DGART

### 核心思想
围绕基元而非像素重新组织反向传播

### 实现方法
1. **Conservative perspective-correct screen-space bounds** - 构建紧凑中间缓冲区
2. **Tile-primitive mapping** - 每个线程累积一个基元在其覆盖像素上的贡献
3. 将梯度计算从 contention-heavy scatter 操作转换为结构化 gather-like 过程

### 性能结果
- Mip-NeRF 360 上实现 **~3-3.5x** 原始训练加速（相比 per-pixel baseline）
- 相比 3DGRT 提升约 **4x**
- 同时提升质量
- 使完全光线追踪的高斯训练变得实用，训练时间与基于光栅化的流程相当

## 可行性分析
- 实现难度：高
- 性能预期：3-4x 训练加速
- 适用场景：高质量 Gaussian 渲染、光线追踪效果

## 相关工作
- [[3D Gaussian Splatting]]
- [[Gaussian Ray Tracing]]
- [[神经渲染训练优化]]

## 笔记
这篇论文解决了 Gaussian Ray Tracing 训练速度慢的核心问题。通过将反向传播从像素中心改为基元中心，大大减少了梯度累积时的线程争用。这是一个重要的工程优化。
