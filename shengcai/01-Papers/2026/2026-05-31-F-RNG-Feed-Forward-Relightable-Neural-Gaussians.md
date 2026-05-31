---
title: F-RNG: Feed-Forward Relightable Neural Gaussians
authors: (NVIDIA Research)
date: 2026-05-25
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.25975
pdf: https://arxiv.org/pdf/2605.25975
tags: [rendering, neural-rendering, gaussian-splatting, relighting, 3DGS, paper, 2026]
status: unread
---

# F-RNG: Feed-Forward Relightable Neural Gaussians

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | F-RNG: Feed-Forward Relightable Neural Gaussians |
| 作者 | NVIDIA Research |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.25975) |
| PDF | [下载](https://arxiv.org/pdf/2605.25975) |

## 核心贡献
1. 提出 **F-RNG**：前馈框架，直接从稀疏视图输入生成可重光照的 3DGS 资产
2. 基于大重建模型（LRM）构建，结合内在分解模型（IDM）先验
3. 实现 **~25x 更快的重光照速度**，质量提升 ~+2.0 dB
4. 无需重新训练或微调底层 LRM，可自动受益于更好的 LRM 和 IDM

## 技术方案

### 三阶段方法
1. **Latent-Interpolated Fine-Grained Geometry Synthesis**
   - 增强 LRM 的几何表示能力

2. **Prior-Guided Relightable Appearance Distillation**
   - 结合 IDM 先验提取可重光照神经表示

3. **Universal Neural Renderer**
   - 灵活、高保真的重光照能力

### 关键创新
- 不需要 per-scene optimization
- 从稀疏视图泛化到新场景
- 避免在不同光照条件下重复推理大模型

## 实验结论
- 重光照速度提升 ~25x
- 渲染质量提升 ~+2.0 dB (对比 SOTA LRM-based 方法)
- 训练成本可接受（小网络，有限数据和计算资源）

## 局限性
- 需要先验模型（LRM、IDM）支持
- 稀疏视图输入质量影响结果

## 可行性分析
- 实现难度：高（依赖大模型先验）
- 性能预期：25x 加速，适合实时重光照应用
- 适用场景：实时渲染、动态光照场景、稀疏视图重建

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Rendering]]
- [[Relighting]]