---
title: "Probabilistic Upscaling of Hydrodynamics in Geological Fractures Under Uncertainty"
date: 2026-04-17
authors:
  - Sarah Perez
  - Florian Doster
  - Hannah Menke
  - Ahmed ElSheikh
  - Andreas Busch
categories:
  - Subsurface Flow
  - Uncertainty Quantification
  - Deep Learning
  - Fractured Media
arxiv_id: "2604.15785"
tags:
  - LBM
  - Stokes flow
  - Uncertainty Quantification
  - Fracture Flow
  - Deep Learning
  - CFD
---

# 不确定性下地质裂缝水动力学的概率 upscaling

## 核心创新点

结合 Bayesian 校正、深度学习 surrogate 和 Darcy 尺度 upscaling 的概率工作流，实现裂缝渗透率的不确定性感知估计。

## 问题背景

- 裂缝地质介质的流动和输运受孔径异质性和表征不确定性控制
- 现有 upscaling 方法依赖确定性渗透率表示

## 数值方法

### 工作流三组件

1. **Bayesian 校正**：孔径-渗透率模型错配的不确定性量化
2. **Residual U-Net**：学习局部异质性对渗透率不确定性的影响
3. **Darcy 尺度 upscaling**：不确定性传播到有效渗透率

### 应用案例

- Little Grand Wash Fault damage zone (Utah) 天然剪切裂缝
- 基于同一数据集的简化几何

## 关键结果

1. 常见经验孔径-渗透率关系对天然裂缝存在系统性偏差
2. 概率工作流产生与物理行为一致的不确定性感知渗透率估计
3. 捕获通道化、连通性和复杂 3D 空隙几何对渗透率的影响

## 计算效率

- 结合 physics-informed 和 data-driven 方法
- 无需重复高保真模拟

## 结论

为裂缝介质流动的不确定性分析提供可扩展工具

## URL

https://arxiv.org/abs/2604.15785
