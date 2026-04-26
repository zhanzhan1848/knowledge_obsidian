---
title: "Monte Carlo PDE Solvers for Nonlinear Radiative Boundary Conditions"
authors: "Anchang Bao"
date: 2026-04-22
status: 待读
tags: [渲染, 全局光照, Monte Carlo, 热辐射]
conference: arXiv
arxiv_id: "2604.21717"
---

# Monte Carlo PDE Solvers for Nonlinear Radiative Boundary Conditions

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Anchang Bao |
| 发表 | arXiv cs.GR (2026-04-22) |
| 链接 | [arXiv](https://arxiv.org/abs/2604.21717) |

## 核心贡献
1. **Picard 风格固定点迭代框架**：使 Monte Carlo PDE solvers 能处理非线性辐射边界条件
2. **异方差回归去噪技术**：专门为边界解估计设计，降低 Monte Carlo 估计的高方差
3. **热辐射模拟验证**：在复杂几何体上验证

## 技术方案

### 方法
- 使用 Picard-style fixed-point iteration 处理非线性边界条件
- 稳定性通过适当选择的松弛系数保证
- 即使初始边界估计不精确，也能渐进收敛到正确解

### 方差 reduction
- 现有方法只关注 interior points
- 本文提出针对 on-boundary solution estimates 的去噪技术
- 填充了先前方法的空白

## 性能
- 相比标准线性化策略，达到更高精度
- 在合成基准和实际热辐射模拟上验证

## 评估
- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐ (与渲染直接相关度中等，涉及热辐射模拟)
- **难度**: 高
- **推荐度**: ⭐⭐⭐ (适合热辐射相关渲染)

## 相关工作
- Monte Carlo PDE solvers
- Heat transfer in geometry processing
- Radiative boundary conditions
- Variance reduction techniques

## 链接
- PDF: https://arxiv.org/pdf/2604.21717