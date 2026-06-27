---
title: "NeuMatEx: Extracting Neural Materials from Multi-view Images"
date: 2026-06-25
tags: [几何, 神经材质, 反向渲染, 多视角, 材质分解]
paper_id: arXiv:2606.26715
authors: Jon Hasselgren et al.
conference: cs.CV (cross-list)
---

# NeuMatEx: Extracting Neural Materials from Multi-view Images

## 核心方法
NeuMatEx 是一种可微分反向渲染方法，从图像中提取空间变化的神经材质。

### 关键挑战
- 神经材质 latent spaces 的非线性结构使朴素反向渲染优化不可行

### 技术方案
1. **Large Material Reconstruction Model (LMRM)** - 直接从图像预测初始 base color、神经材质 latents 和 aleatoric uncertainty guides
2. **Material Prior** - 提供良好初始化并更好地约束后续使用反向路径追踪的优化
3. **Uncertainty-Guided Optimization** - 预测的 uncertainty 通过将高置信度区域更紧密地锚定到 LMRM 预测来提供帮助

## 创新点
- 首次从多视角图像端到端提取神经材质
- LMRM 提供强先验指导优化
- 避免将照明和复杂高光效果烘焙到材质中

## 实验结果
在合成和真实资产上的实验表明，NeuMatEx 提取的复杂材质比 PBR 方法具有更好的视觉质量和材质分解

## 开源实现
- Project: https://nvlabs.github.io/neumatex/

## 相关笔记
[[Neural Materials]]
[[Inverse Rendering]]
[[Material Decomposition]]