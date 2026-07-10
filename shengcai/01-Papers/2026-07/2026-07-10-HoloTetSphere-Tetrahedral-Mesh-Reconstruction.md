---
title: HoloTetSphere: Unified TetSphere Mesh Reconstruction for Physical Simulations
authors: Yaqiao Dai
date: 2026-07-09
source: arXiv cs.GR (ECCV 2026)
url: https://arxiv.org/abs/2607.08398
pdf: https://arxiv.org/pdf/2607.08398
tags: [rendering, paper, 2026, gaussian-splatting, tetrahedral-mesh, physical-simulation]
status: unread
---

# HoloTetSphere: Unified TetSphere Mesh Reconstruction for Physical Simulations

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | HoloTetSphere: Unified TetSphere Mesh Reconstruction for Physical Simulations |
| 作者 | Yaqiao Dai |
| 来源 | arXiv cs.GR (ECCV 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.08398) |
| PDF | [下载](https://arxiv.org/pdf/2607.08398) |

## 核心贡献
1. 提出拓扑自适应框架，通过端到端拓扑和几何优化实现完整四面体网格重建
2. 将高斯球耦合到四面体元素，利用边缘连接估计连续不透明度场实现可微分元素剪枝
3. 联合最小化网格平滑能量和多视角高斯渲染误差，驱动几何细化同时保持拓扑适应性

## 技术方案
**问题**：现有物理引导 3D 重建的标准流程依赖两阶段范式（表面提取→四面体化），错误传播严重。TetSphere Splatting 等拉格朗日方法虽尝试绕过，但同伦约束阻止拓扑自适应优化，产生离散的多个四面体而非单一连通网格。

**方法**：
- 耦合 Gaussian Spheres 与四面体元素 + 边缘连接 → 估计连续不透明度场 → 可微分剪枝
- 交替最小化：网格平滑能量 + 多视角 Gaussian 渲染误差 → 几何细化 + 拓扑保持
- 端到端拓扑和几何联合优化

**结果**：构建统一、拓扑连贯的四面体网格，超越 SOTA 几何精度，产生连贯单连通四面体网格。

## 实验结论
- 几何精度优于 SOTA 技术
- 生成连贯单连通四面体网格
- 有效绕过传统误差传播的四面体化步骤
- 适用于下游物理仿真

## 局限性
- 主要针对物理仿真场景优化
- 需要多视角图像输入

## 可行性分析
- 实现难度：中
- 性能预期：高质量四面体网格，适合物理仿真
- 适用场景：物理仿真、3D 重建、Gaussian Splatting 相关渲染

## 相关工作
- TetSphere Splatting
- DMTet
- NeRF
- Neural Angelo

## 笔记
- 与渲染相关点：使用 Gaussian Rendering 框架，涉及可微分渲染
- 关键词：Gaussian Sphere, Tetrahedral Mesh, Differentiable Pruning, Multi-view Rendering
