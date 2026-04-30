---
title: "Reduced-Order Modeling of a Viscoelastic Turbulent Jet with Hybrid Machine Learning Models"
authors: "Christian Amor et al."
arXiv: "2604.26240"
date: 2026-04-29
tags: [turbulence, reduced-order model, POD, neural network, viscoelastic]
---

## 核心贡献

结合本征正交分解 (POD) 和深度网络，提出粘弹性湍流射流的混合降阶模型，加速长时间模拟。

## 方法

1. **POD**: 获取数据的紧致表示
2. **神经网络**: 在低维空间预测 POD 模态系数

## 验证

粘弹性射流的长时间行为预测，计算相关统计量。

## 关键发现

- 小模型可预测多步大幅值动力学
- 大模型对预测小尺度动力学必要
- Skip connections 对更深和可泛化模型最有效

## URL

https://arxiv.org/abs/2604.26240
