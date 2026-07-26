---
title: Real-Time Global Illumination via Sparse Radiance Probes
authors: Rouli Freeman
date: 2026-07-22
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.20384
pdf: https://arxiv.org/pdf/2607.20384
tags: [rendering, global-illumination, real-time-rendering, radiance-cascades]
status: unread
---

# Real-Time Global Illumination via Sparse Radiance Probes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-Time Global Illumination via Sparse Radiance Probes |
| 作者 | Rouli Freeman |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.20384) |
| PDF | [下载](https://arxiv.org/pdf/2607.20384) |

## 核心贡献
1. 将 Radiance Cascades (RC) 适配到准确的实时 3D 漫反射全局光照
2. 提出 **Ray Splitting** 方法：通过追踪从可见表面的光线，根据击中距离计算级联贡献
3. 使用稀疏 hashmap 存储世界空间探针，避免了之前 2D/屏幕空间方法的局限性

## 技术方案

### 问题背景
Radiance probe 方法是实时图形中近似漫反射全局光照的流行方案，但因探针间距大导致细节缺失。Radiance Cascades 通过提高空间分辨率、降低近处物体的角度分辨率来解决这一问题。

### 核心方法：Split Radiance Cascades
- **稀疏 hashmap 存储**：用 hashmap 存储世界空间探针，支持高细节体积辐射信息
- **Ray Splitting**：追踪从可见表面的光线，计算光线对各级联( cascades )的贡献
  - 根据击中距离分配到不同的级联层
  - 允许近处物体提供高细节，远处物体提供低细节

### 技术特点
- 支持单帧和时序累积场景
- 避免噪声或锯齿
- 提供多尺度细节

## 实验结论
- 在多种场景中验证算法效果
- 单帧和时序累积上下文中均能提供高质量间接光照

## 局限性
- 主要针对漫反射全局光照
- 需要进一步评估对高光反射的处理

## 可行性分析
- 实现难度：中
- 性能预期：实时性能，稀疏 hashmap 有利于 GPU 实现
- 适用场景：游戏、VR/AR、实时可视化

## 相关工作
- [[Radiance Cascades]]
- [[Real-time Global Illumination]]
- [[Light Probe]]

## 笔记
**推荐度**：⭐⭐⭐⭐⭐

这是近期最重要的实时全局光照论文之一，将 Radiance Cascades 从 2D/屏幕空间扩展到 3D 世界空间是一个重要突破。Ray Splitting 方法概念清晰，实现方式对 GPU 友好。建议深入分析并考虑传递给 @墨鱼丸 进行算法评估。
