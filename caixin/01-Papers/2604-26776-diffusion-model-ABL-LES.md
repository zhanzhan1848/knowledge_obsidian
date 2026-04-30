---
title: "Conditional Diffusion Denoising Probabilistic Model for Super-Resolution of Atmospheric Boundary Layer LES"
authors: "Omar Sallam et al."
arXiv: "2604.26776"
date: 2026-04-29
tags: [turbulence, LES, diffusion model, super-resolution, wind energy]
---

## 核心贡献

使用条件去噪扩散概率模型 (DDPM) 从粗网格 LES 重建高分辨率湍流场，解决大气边界层 (ABL) 风能应用中的计算成本问题。

## 研究背景

- 风能预测受湍流应力和风剪切不确定性影响
- 高保真 LES 计算成本高，难以实时应用
- 提出生成式 AI 方法降低计算成本

## 方法

- **模型**: Conditional Denoising Diffusion Probabilistic Model
- **数据集**: 并行高阶有限差分求解器生成
  - 变化地转风速
  - 不同表面粗糙度 (IEC 风速等级)
  - 多网格分辨率

## 关键发现

1. **插值场景**: 成功恢复细尺度湍流结构、Reynolds 应力和统计特性
2. **外推场景**: 更高风速时噪声增加，湍流应力过预测
3. **物理一致性**: 训练域内结果准确

## 应用价值

- 大幅降低风能应用中湍流流入表征的计算成本
- 保持可接受的精度

## URL

https://arxiv.org/abs/2604.26776
