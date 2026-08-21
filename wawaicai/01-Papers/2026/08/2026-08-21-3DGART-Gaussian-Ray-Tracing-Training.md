---
title: "3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation"
authors: [Laurent Vit et al.]
date: 2026-08-18
tags: [几何, 高斯溅射, 光线追踪, 训练加速]
arxiv: "2608.17298"
doi: "10.48550/arXiv.2608.17298"
subjects: [cs.GR, cs.CV]
---

# 3DGART: 3D Gaussian Accelerated Ray Tracing

## 核心方法

提出 **3DGART**，实用的光线追踪高斯渲染训练框架，通过**基元重心的反向传播重组**加速训练。

### 核心问题
3D Gaussian Splatting 的光栅化公式依赖屏幕空间近似，限制精确视线相关排序和次级光线效果（反射、折射、阴影）的集成。Gaussian Ray Tracing 训练成本高。

### 关键洞察
主要瓶颈不是光线遍历本身，而是像素中心的反向传播——许多线程同时累积梯度到相同基元参数，导致严重原子争用和线程串行化。

### 核心技术

1. **Primitive-centric 反向传播**
   - 使用保守透视校正屏幕空间边界
   - 构建紧凑中间缓冲区和 tile-primitive 映射
   - 每个线程累积一个基元在其覆盖像素上的贡献
   - 将梯度计算从争用密集 scatter 转换为结构化 gather 类过程

### 性能提升
- Mip-NeRF 360：3-3.5x raw 训练加速 vs per-pixel baseline
- vs 3DGRT：~4x 加速
- 训练时间与光栅化方法相当，同时保留光线追踪优势

## 相关技术
- 3D Gaussian Splatting
- Gaussian Ray Tracing
- Neural Rendering
- Backward Propagation Optimization

## 可行性评估

**推荐度：⚠️ 谨慎评估**

- 与几何处理有一定关联（基元几何）
- 主要属于渲染方向
- 训练加速方法有一定参考价值

## 会议信息
arXiv Submission, 2026-08-18
