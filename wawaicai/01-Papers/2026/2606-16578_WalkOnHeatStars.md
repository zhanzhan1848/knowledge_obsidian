---
tags: [几何, Monte Carlo, PDE求解, 抛物型方程]
created: 2026-06-20
source: arXiv cs.GR
---

# Walk on Heat Stars for Parabolic Heat Equations with Neumann Boundary Conditions

## 核心方法

提出 **Walk on Heat Stars**，一种无网格 Monte Carlo 求解器，将 Walk on Stars 的边界积分框架扩展到抛物型方程。通过**非圆柱形边界积分公式**处理热球采样诱导的时变域。

## 关键创新点

1. **非圆柱形边界积分公式** — 处理时间变化的时空域
2. **Gamma × Uniform 分解** — 热球几何参数化为对数时间坐标和空间方向的组合，双层核分解为独立的 Gamma 和均匀分量
3. **精确方向重要性采样** — 对递归下一步位置、Neumann flux contribution 和体积源项进行精确采样
4. **解耦梯度估计器** — 将空间导数表达为解的加权边界积分，无需递归
5. **异方差回归去噪器** — 适应时空域用于方差缩减

## 算法概述

热球几何由对数时间坐标和空间方向参数化，双层核分解为独立的 Gamma（时间）和均匀（方向）分量。这使得递归下一步位置、Neumann flux contribution 和体积源项的精确方向重要性采样成为可能。

## 验证

在解析解、多类几何和空间频率上验证收敛性，以预期 Monte Carlo 速率收敛，并在热沉和冷却场景上展示实用性。

## 论文信息
- arXiv: [2606.16578](https://arxiv.org/abs/2606.16578)
- 提交时间：2026-06-15

## 相关笔记
[[Monte Carlo方法]]
[[PDE求解]]
[[几何分析]]