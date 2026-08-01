---
title: "Modified Dynamic Mixed Subgrid-scale Models for Geophysical Flows: Forced Two-Dimensional and β-plane Turbulence"
authors: []
date: 2026-07-29
arXiv: "2607.27567"
subjects: ["physics.flu-dyn", "physics.ao-ph", "physics.geo-ph"]
tags: [turbulence, LES, subgrid-scale, geophysical-flows, DMM]
review-date: 2026-08-01
---

## 核心创新点

1. **问题识别**：经典 DMM 最小二乘估计可被结构分量主导，限制功能分量耗散正则化作用
2. **改进框架**：基于 Gram 的修正框架，构建新型参数化 DMM 家族（全耦合、顺序、完全解耦）
3. **可调结构-功能平衡**：通过 Gram 矩阵分析实现结构-功能平衡调节
4. **Leith 模型 + 四阶非线性梯度模型**：用于 β-plane 湍流框架评估

## 湍流模型 (LES)

- **动态混合模型 (DMM)**：结合功能涡粘和结构闭合
- **Germano 身份误差 (GIE)**：最小二乘优化基础
- **新模型类型**：
  - Fully-coupled DMM
  - Sequential DMM（功能分量先确定，结构分量修正）
  - Fully-decoupled DMM

## 数值方法

- **先验测试**：结构主导模型与理想 SGS 力强烈一致，准确再现局部 SGS 能量交换（包括反散射）
- **后验测试**：结构主导模型在高波数出现噪声伪影，净耗散不足
- **顺序 DMM**：保持大部分先验结构精度，同时改善后验涡量场、谱和诊断

## 关键发现

- SGS 能量和涡量转移分析：顺序 DMM 允许在大于强迫尺度的尺度上反散射，同时增强小尺度耗散
- 改善了瞬时结构保真度和长期精度之间的平衡

## 链接

- arXiv: https://arxiv.org/abs/2607.27567
- 26 pages, 11 figures, 5 tables
