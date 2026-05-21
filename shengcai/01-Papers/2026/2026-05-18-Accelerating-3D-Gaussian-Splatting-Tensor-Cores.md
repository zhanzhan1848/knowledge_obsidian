---
title: Accelerating 3D Gaussian Splatting using Tensor Cores
authors: Sheng Li
date: 2026-05-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.17855
pdf: https://arxiv.org/pdf/2605.17855
tags: [rendering, 3DGS, gaussian-splatting, tensor-cores, optimization]
status: unread
---

# Accelerating 3D Gaussian Splatting using Tensor Cores

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Accelerating 3D Gaussian Splatting using Tensor Cores |
| 作者 | Sheng Li |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.17855) |
| PDF | [下载](https://arxiv.org/pdf/2605.17855) |

## 核心贡献
1. 利用 GPU Tensor Cores 加速 3D Gaussian Splatting 光栅化阶段
2. 将不规则 per-pixel 标量操作转换为 Tensor-Core 兼容的矩阵操作
3. 引入跨 tile 分组策略提高 Gaussian 重用率

## 技术方案
- **问题**: 3DGS 光栅化阶段计算密集，CUDA core 处理效率低
- **观察**: 3DGS 可用 FP16 执行，质量损失可忽略
- **解决方案**: 
  - TensorGS 框架将光栅化计算 tensor 化
  - 跨 tile 分组提高 Gaussian 重用，摊销开销
  - 矩阵操作适配 Tensor Core 执行模型

## 性能提升
- 端到端渲染性能提升: **1.65x**
- 保持图像质量不下降

## 局限性
- 需要具有 Tensor Core 的 GPU (Volta+ 架构)
- 依赖 FP16 精度，在某些专业场景可能需要 FP32

## 可行性分析
- 实现难度：高（需要对 GPU 架构和 CUDA/Tensor Core 编程有深入理解）
- 性能预期：显著提升渲染速度
- 适用场景：实时渲染、AR/VR、交互式应用

## 相关工作
- [[2026-05-19-Decentralized-Direct-Volume-Rendering]]
- 3D Gaussian Splatting 相关优化研究

## 笔记
该工作证明了 3DGS 可以利用现代 GPU 的 Tensor Core 进行加速，为未来渲染优化提供了新方向。