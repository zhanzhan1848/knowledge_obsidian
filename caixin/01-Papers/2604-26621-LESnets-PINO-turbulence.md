---
title: "LESnets: Large-Eddy Simulation Nets based on Physics-Informed Neural Operator for Wall-Bounded Turbulence"
authors: ""
arXiv: "2604.26621"
date: 2026-04-29
tags: [turbulence, LES, neural operator, PINO, wall-bounded]
---

## 核心贡献

提出 **LESnets** 框架，将大涡模拟方程融入因子化傅里叶神经算子 (F-FNO)，实现高雷诺数壁湍流的无标签训练预测。

## 方法

- **基础架构**: Factorized Fourier Neural Operator (F-FNO)
- **训练方式**: 无需标签数据，基于物理约束
- **壁模型**: 集成壁定律 (law of the wall) 到物理约束损失

## 验证案例

湍流渠道流，摩擦雷诺数 Reτ = 180, 590, 1000

## 性能对比

与 data-driven 模型 (IUFNO, F-FNO) 和传统 LES 方法对比：
- 预测精度相当
- 计算效率更高
- 可实现长时间预测

## 技术亮点

- 将 LES 方程显式融入神经算子
- 无需标签的物理信息训练
- 粗网格即可模拟高雷诺数壁湍流

## URL

https://arxiv.org/abs/2604.26621
