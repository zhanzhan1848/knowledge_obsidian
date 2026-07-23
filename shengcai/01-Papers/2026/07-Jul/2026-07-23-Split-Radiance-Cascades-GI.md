---
title: Real-Time Global Illumination via Sparse Radiance Probes (Split Radiance Cascades)
authors: Rouli Freeman
date: 2026-07-22
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.20384
pdf: https://arxiv.org/pdf/2607.20384
tags: [rendering, paper, 2026, global-illumination, radiance-cascade, ray-tracing, real-time-rendering]
status: unread
---

# Real-Time Global Illumination via Sparse Radiance Probes (Split Radiance Cascades)

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-Time Global Illumination via Sparse Radiance Probes (Split Radiance Cascades) |
| 作者 | Rouli Freeman |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.20384) |
| PDF | [下载](https://arxiv.org/pdf/2607.20384) |

## 核心贡献
1. 提出 Split Radiance Cascades，将 Radiance Cascades 适应于准确的实时3D漫反射全局光照
2. 引入 **ray splitting** 方法，通过从可见表面追踪光线并根据击中距离计算对级联的贡献来计算辐射区间
3. 使用稀疏 hashmap 存储世界空间探针，实现高效存储和查询

## 技术方案

### 背景：Radiance Cascade 问题
Radiance Cascade (RC) 是一种流行的实时全局光照近似方法，通过增加空间分辨率和降低近距离物体的光照和遮挡角分辨率来提供细节。但现有 RC 实现要么运行在2D，要么运行在屏幕空间，因为存储高细节体积辐射信息的成本过高。

### 解决方案：Split Radiance Cascades
1. **稀疏 Hashmap 存储**：使用稀疏 hashmap 存储世界空间探针，而非密集网格
2. **Ray Splitting**：从可见表面追踪光线，根据击中距离计算对级联的贡献
3. **3D 漫反射全局光照**：实现准确的世界空间3D GI

### 核心公式
```math
辐射级联计算：
对于每个级联 c，光线贡献根据击中距离 d 计算：
C_c = f(d, c) * radiance

其中 f 是基于距离的衰减/贡献函数
```

### 评估结果
- 单帧质量高
- 时间累积上下文下表现更好
- 多种场景验证

## 实验结论
- 高质量间接光照
- 单帧和时间累积两种模式
- 无噪声或锯齿

## 局限性
- 主要针对漫反射全局光照
- 实现复杂度较高
- 需要针对动态场景优化

## 可行性分析
- **实现难度**：高 - 需要理解 RC 原理和稀疏数据结构
- **性能预期**：高 - 稀疏存储可大幅降低内存
- **适用场景**：
  - 实时全局光照
  - 游戏渲染
  - VR/AR 交互应用

## 相关工作
- [[Radiance Cascade]]
- [[Sparse Voxel Octree GI]]
- [[Light Probe Methods]]

## 笔记
这篇论文是全局光照领域的重要进展，将 Radiance Cascade 扩展到3D世界空间存储，解决了存储成本问题。

**创新点**：
1. 稀疏 hashmap 替代密集网格
2. Ray splitting 简化级联计算
3. 保持 RC 的无噪声特性

**推荐给墨鱼丸**：
- 这是实时光照的重要方向
- 可考虑与现有渲染管线集成
- 重点关注稀疏数据结构的设计
