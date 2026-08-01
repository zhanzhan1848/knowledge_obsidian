---
title: "A Sub-grid-scale Model for Polydisperse Bubbly Flows with Heat and Mass Transfer"
authors: ["Anand Radhakrishnan"]
date: 2026-07-29
arXiv: "2607.27426"
subjects: ["physics.flu-dyn", "physics.comp-ph"]
tags: [CFD, multiphase-flow, bubbly-flows, SGS-model, heat-transfer, mass-transfer]
review-date: 2026-08-01
---

## 核心创新点

1. **多分散泡状流集合平均模型**：Prior 正交距 formulations 使用多项式关系封闭气泡压力，忽略了气泡壁面的热质传递
2. **恒传递方程**：为气泡压力和蒸汽质量制定恒传递方程（constant-transfer equations）
3. **条件双曲正交法**：二阶条件反演，每平衡半径箱产生四个联合半径-径向速度节点
4. **无额外矩**：节点值闭合集合平均流动方程，无需向输运矩集添加混合压力或蒸汽质量矩

## 实现

- **软件**：MFC (Multi-component Flow Code)
- **验证方法**：Monte Carlo 计算验证节点演化和平均气泡变量（谐波强迫种群）
- **气泡屏测试**：量化平衡半径离散化和初始分布变化的闭合误差

## 关键结果

1. **恒传递计算**：在考虑条件下不表现出多项式闭合观察到的高频压力振荡
2. **3D 气泡屏计算**：Euler-Euler 中心压力与 40 个体积平均 Euler-Lagrange 实现均值之间的相对均方根误差为 1.5%
3. **验证**：Monte Carlo 计算验证 quadrature 节点和平均气泡变量演化

## 链接

- arXiv: https://arxiv.org/abs/2607.27426
- 17 pages, 8 figures
