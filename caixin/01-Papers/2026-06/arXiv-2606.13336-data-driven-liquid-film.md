---
title: "Data-Driven Equation Discovery for Nonlinear Liquid Film Flows"
authors:
  - Radu Cimpeanu
date: 2026-06-11
arXiv: "2606.13336"
subjects:
  - Fluid Dynamics (physics.flu-dyn)
  - MSC: 76A20, 76D08, 93B30, 62J07
url: "https://arxiv.org/abs/2606.13336"
pdf: "https://arxiv.org/pdf/2606.13336"
---

## 摘要

利用**数据驱动方程发现**方法研究**液膜流**的非线性动力学。液膜流问题空间在渐近解析构建方面提供了丰富的背景。通过结合专家知识和数据管理，建立了方程发现的最佳场景。

## 关键挑战

1. **多重共线性 (Multi-collinearity)**：源于多尺度流动配置中单项式基函数的选择
2. **早期瞬态**：动态最丰富的行为在训练数据中携带最大的残差
3. **可辨识性问题**：多项式基函数选择引入的复杂辨识问题

## 方法论

- **稀疏回归 (Sparse Regression)**
- **专家知识整合**
- **数据 curation**
- **PDE 发现的基准测试**

## 创新点

- 首次将数据驱动方程发现应用于液膜流 PDE 系统
- 识别当前发现技术的脆弱性和边界
- 为下一代更稳健、数值稳定算法奠定基础

## 物理系统

- **液膜流 (Liquid Film Flows)**
- 非线性波动
- 薄液层动力学

## 标签
#data-driven #equation-discovery #liquid-film #machine-learning #PDE

## 相关方法
- Sparse Identification of Nonlinear Dynamics (SINDY)
- Genetic Programming
- 字典学习