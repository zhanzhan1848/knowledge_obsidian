---
title: Feature-Guided Diffusion for Non-Differentiable Inverse Rendering
authors: Andrei-Timotei Ardelean
date: 2026-07-19
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.17411
pdf: https://arxiv.org/pdf/2607.17411
tags: [rendering, inverse-rendering, diffusion, CMA-ES, path-tracing]
status: unread
---

# Feature-Guided Diffusion for Non-Differentiable Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Feature-Guided Diffusion for Non-Differentiable Inverse Rendering |
| 作者 | Andrei-Timotei Ardelean |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.17411) |
| PDF | [下载](https://arxiv.org/pdf/2607.17411) |

## 核心贡献
1. **FIDE (Feature-Informed Diffusion Evolution)**: 完全黑盒框架，无需梯度或特定初始化
2. **Feature Guiding**: 使用ViT从渲染结果提取密集视觉特征，而非简化为标量损失值
3. **Diffusion-based Candidate Proposal**: 基于扩散的候选提议模型预测匹配目标图像的参数
4. **CMA Evolution**: CMA进化策略闭环细化，持续缩小提议区域

## 技术方案
**关键洞察**: 不将每个候选渲染简化为标量损失值，而是用ViT提取密集视觉特征

**优化流程**:
1. ViT提取渲染图像的密集视觉特征
2. 扩散模型基于视觉特征预测候选参数
3. CMA-ES进化策略闭环细化
4. 持续缩小提议区域

**验证场景**: path tracing, vector splines, Voronoi shaders, robotics

## 实验结论
- Feature guiding显著提升收敛性
- 可靠逃离梯度方法陷入的局部最小值
- 在多种逆问题验证

## 局限性
- 依赖ViT和扩散模型
- 计算成本较高

## 可行性分析
- 实现难度：中
- 性能预期：需要多轮迭代
- 适用场景：不可微渲染器优化

## 相关工作
- [[Path Tracing]]
- [[Inverse Rendering]]
- [[CMA-ES]]

## 笔记
提出了处理不可微渲染器的新思路，feature guiding比标量损失更有效。
