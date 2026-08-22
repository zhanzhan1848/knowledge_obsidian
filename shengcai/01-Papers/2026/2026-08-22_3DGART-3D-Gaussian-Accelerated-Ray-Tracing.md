---
title: 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation
authors: Anonymous
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17298
pdf: https://arxiv.org/pdf/2608.17298
tags: [rendering, paper, 2026, ray-tracing, gaussian-splatting, neural-rendering]
status: unread
---

# 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation |
| 作者 | Anonymous |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17298) |
| PDF | [下载](https://arxiv.org/pdf/2608.17298) |

## 核心贡献
1. 提出 **3DGART** 框架，通过**基元为中心的反向传播**替代传统的像素级反向传播
2. 使用保守透视校正的屏幕空间边界构建紧凑中间缓冲区和 tile-primitive 映射
3. 将梯度计算从**原子竞争scatter操作**转换为**结构化gather-like过程**
4. 在 Mip-NeRF 360 上实现 ~3-3.5x 原始训练速度提升，~4x 相比 3DGRT

## 技术方案

### 问题
3D Gaussian Splatting 基于光栅化，在集成**反射、折射、阴影**等二次光线效果时受限。Gaussian Ray Tracing 通过显式光线-基元求交解决此问题，但训练成本高。核心瓶颈不是光线遍历本身，而是**像素为中心的反向传播**——大量线程同时累积梯度到相同基元参数，导致严重原子竞争和线程串行化。

### 核心方法
- **基元为中心的反向传播**：每个线程累积单个基元在其覆盖像素上的贡献
- **保守透视校正屏幕空间边界**：构建紧凑中间缓冲区
- **Tile-Primitive 映射**：允许结构化gather而非竞争性scatter

### 关键创新
```math
\text{Gradient}_{\text{primitive}} = \sum_{p \in \text{covered pixels}} \frac{\partial L(p)}{\partial \text{primitive}}
```
将 scatter 操作转为 gather-like 过程，消除原子竞争。

## 实验结论
- Mip-NeRF 360：~3-3.5x 训练速度提升，~4x 相比 3DGRT
- 质量优于 baseline
- 使完全光线追踪 Gaussian 训练变得实用，运行时与光栅化 pipeline 相当

## 局限性
- 论文未明确提及

## 可行性分析
- 实现难度：**中**
- 性能预期：训练速度显著提升，保持光线追踪质量优势
- 适用场景：需要反射/折射/阴影效果的实时新视角合成

## 相关工作
- [[GRTX-Efficient-Ray-Tracing-3D-Gaussian-Rendering]]
- [[3D Gaussian Splatting 相关工作]]

## 笔记
与 GRTX (2605_00177) 相比，3DGART 专注于训练加速而非推理。两者都解决 Gaussian + Ray Tracing 的整合问题但切入点不同。
