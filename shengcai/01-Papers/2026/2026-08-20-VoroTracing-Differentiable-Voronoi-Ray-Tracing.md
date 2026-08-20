---
title: Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds
authors: Bernardo Taveira, Carl Lindström, Joakim Johnander, Fredrik Kahl
date: 2026-08-19
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17682
pdf: https://arxiv.org/pdf/2608.17682
tags: [rendering, paper, 2026, ray-tracing, neural-rendering, novel-view-synthesis, voronoi]
status: unread
---

# Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds |
| 作者 | Bernardo Taveira, Carl Lindström, Joakim Johnander, Fredrik Kahl |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17682) |
| PDF | [下载](https://arxiv.org/pdf/2608.17682) |
| 代码 | [VoroTracing](https://research.zenseact.com/publications/vorotracing) |

## 核心贡献
1. **突破光栅化速度限制**：证明可微分光线追踪可以达到甚至超过光栅化新视角合成的吞吐量
2. **八面体表面纹理**：用紧凑的八面体表面和视图相关纹理替换每单元球谐函数，减少外观值加载
3. **表面集中不透明度**：引入表面集中不透明度公式，鼓励透明自由空间和紧凑表面早期终止
4. **GPU优化推理**：空间单元排序、Warp一致光线调度、对齐纹理加载、低贡献单元跳过

## 技术方案

### 核心思想
VoroTracing 基于 Radiant Foam 的 Voronoi 分区表示，但大幅减少了每个光线-单元交互的成本：

1. **Voronoi 分区遍历**：用局部邻接遍历替换重复的 BVH 求交，避免了传统光线追踪的主要障碍
2. **紧凑外观模型**：使用八面体表面纹理代替球谐函数，减少内存访问
3. **早期终止优化**：表面集中不透明度使光线在紧凑表面快速终止

### 渲染管线
- 输入：Voronoi 单元存储密度和外观
- 过程：光线穿过 Voronoi 图，从单元到单元遍历
- 输出：支持鱼眼、卷帘快门、运动模糊、景深等非针孔效果

## 实验结论

| 指标 | 数值 |
|------|------|
| 渲染速度 (RTX 5090) | **623 FPS** |
| 比最快光线追踪方法快 | **3.2×** |
| 比 3D Gaussian Splatting 快 | **2.8×** |
| 质量差距 (vs 最佳光栅化) | < 0.2 dB |

在 Mip-NeRF 360 数据集上，VoroTracing 在保持竞争力的重建质量的同时，实现了显著的速度提升。

## 局限性
- 固定预算表示，优化时不进行剪枝或密集化
- 适应性单元插入可能进一步改进未来系统

## 可行性分析
- **实现难度**：高 - 需要 GPU 渲染器优化、Voronoi 分区、纹理压缩
- **性能预期**：极佳 - RTX 5090 上达 623 FPS
- **适用场景**：实时新视角合成、自动驾驶仿真、VR/AR

## 相关工作
- [[Radiant Foam 2025]]
- [[3D Gaussian Splatting 2023]]
- [[Mip-NeRF 360]]
- [[PowerFoam 2026]]

## 笔记
**关键洞察**：传统观点认为光线提供灵活性，光栅化提供速度，但这个权衡对于显式辐射场设置并非固有。通过围绕遍历成本、内存流量和早期终止设计，可以保留光线的灵活性，同时匹配或超越强大的光栅化基线。

这篇论文是渲染领域的重要突破，证明了光线追踪可以在实时场景中达到光栅化的速度。
