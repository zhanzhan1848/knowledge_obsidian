---
tags: [渲染, 逆渲染, 路径追踪, Diffusion, CMA, 2026-07]
date: [[2026-07-24]]
status: 待读
---

# Feature-Guided Diffusion for Non-Differentiable Inverse Rendering

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Feature-Guided Diffusion for Non-Differentiable Inverse Rendering |
| 作者 | Andrei-Timotei Ardelean |
| 链接 | [arXiv:2607.17411](https://arxiv.org/abs/2607.17411) |
| PDF | [PDF](https://arxiv.org/pdf/2607.17411) |
| 发表 | arXiv cs.GR, 2026-07-19 |

## 核心贡献

1. **FIDE 框架**: 完全黑盒的反向渲染框架，无需梯度或特定初始化
2. **Feature Guiding**: 使用 Vision Transformer (ViT) 从渲染结果提取密集视觉特征，而非标量损失值
3. **Diffusion-based 候选提议**: 基于提取的特征训练扩散模型预测匹配目标图像的参数

## 技术方案

### 问题背景
传统反向渲染通过可微分渲染器和梯度下降求解，需要大量问题特定工程，且因歧义容易陷入局部最优。

### 核心方法
- **黑盒渲染器**: 将渲染器视为不透明函数，只需产生图像
- **Feature Guiding**: 
  - 不将候选渲染简化为标量损失值
  - 使用 ViT 提取密集视觉特征
  - 训练扩散模型预测匹配目标图像的参数
- **CMA 演化策略**: 扩散模型提议的候选解在闭环中持续细化，逐步缩小提议区域

### 验证场景
- 路径追踪 (Path Tracing)
- 向量样条 (Vector Splines)
- Voronoi 着色器
- 机器人学

## 实验结论

- Feature guiding 显著提升收敛速度
- 能可靠逃离梯度方法停滞的局部最优
- 在多种反向问题上验证有效

## 创新点分析

| 方面 | 传统方法 | FIDE |
|------|----------|------|
| 损失函数 | 标量损失 | ViT 密集特征 |
| 初始化 | 需要良好初始化 | 无需特定初始化 |
| 梯度 | 需要可微分渲染器 | 黑盒，无需梯度 |
| 局部最优 | 易陷入 | 能可靠逃离 |

## 标签
#inverse-rendering #path-tracing #diffusion-model #CMA #black-box-optimization
