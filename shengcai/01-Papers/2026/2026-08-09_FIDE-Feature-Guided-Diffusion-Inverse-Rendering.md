---
title: Feature-Guided Diffusion for Non-Differentiable Inverse Rendering
authors: Andrei-Timotei Ardelean et al.
date: 2026-07-19
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.17411
pdf: https://arxiv.org/pdf/2607.17411
tags: [rendering, inverse-rendering, path-tracing, diffusion, CMA-ES, optimization]
status: unread
---

# Feature-Guided Diffusion for Non-Differentiable Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Feature-Guided Diffusion for Non-Differentiable Inverse Rendering |
| 作者 | Andrei-Timotei Ardelean et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.17411) |
| PDF | [下载](https://arxiv.org/pdf/2607.17411) |

## 核心贡献
1. **FIDE框架**：完全黑盒的inverse rendering框架，无需梯度或特定初始化
2. **Feature Guiding**：用ViT提取渲染图像的密集视觉特征，而非标量loss
3. **Diffusion-based Proposal Model**：训练扩散模型预测匹配目标图像的参数
4. **CMA-ES闭环优化**：候选解由扩散模型提出，CMA-ES进化策略精调

## 技术方案

### 背景问题
- 传统可微渲染器：需要大量问题特定工程，易陷入局部最优
- 无导数方法：虽减少工程负担，但高度依赖好的初始化

### 核心洞察：Feature Guiding
- 不将每个渲染结果简化为标量loss值
- 使用ViT提取密集视觉特征
- 扩散模型利用这些视觉线索预测参数

### 流程
```
渲染器(黑盒) → ViT特征提取 → 扩散Proposal模型 → CMA-ES精调
                              ↑__________________|
                          (闭环，持续缩小proposal区域)
```

### 验证场景
- Path tracing（路径追踪）
- Vector splines
- Voronoi shaders
- Robotics

## 实验结论
- Feature guiding显著提升收敛速度
- 可靠逃离梯度方法的局部最优
- 在path tracing等复杂反问题表现优异

## 局限性
- ViT特征提取增加计算开销
- 扩散模型训练需要目标分布样本

## 可行性分析
- 实现难度：中（集成ViT、扩散模型、CMA-ES）
- 性能预期：良好（收敛快，可逃逸局部最优）
- 适用场景：不可微渲染器、复杂反问题、多峰优化

## 相关工作
- 传统可微渲染：NeRF、DIBR
- 无导数优化：CMA-ES、BO

## 笔记
重要思路转变：从scalar loss → dense visual features。这使得无导数优化能利用视觉信息，对path tracing等随机渲染器的反问题很有价值。
