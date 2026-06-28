---
tags: [几何, NURBS, 参数化, 约束优化, 工业CAD, 水静力学]
date: 2026-06-28
arXiv: 2606.07198
conference: arXiv (math.NA)
---

# Constraint-driven Optimization and Parametrization of Industrial NURBS Geometries via Neural Deformation Field

## 核心方法

### 问题背景
工业 CAD 几何（多面片 NURBS 曲面）的参数化和形状优化需求

### 技术方案

**可微分 NURBS 框架**：
- 通过物理知情几何参数化变形复杂 CAD 模型
- 神经位移场（MLP）作用于 NURBS 控制点
- 保持面片连接性的同时提供紧凑参数化

**关键创新**：
- 无需预定义变形策略，直接由物理约束驱动
- 全局几何量（排水体积、润湿表面积、浮力质心）表述为可微分积分算子
- Gauss-Legendre  quadrature + 解析 B-spline 导数计算表面积分

**不依赖中间网格生成**，直接在 CAD 表示上操作

## 算法复杂度

- 可微分：全程梯度传播
- 物理约束：水静力学设计相关

## 创新点

- 首个端到端可微分工业 NURBS 优化框架
- 约束驱动（而非参数驱动）的形状优化
- MLP 表示的位移场保持连接性

## 可行性分析

| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中（需 B-spline/NURBS 微分） |
| 数值稳定性 | 高（物理约束提供正则化） |
| 依赖项 | NURBS 库 (OpenCASCADE/OpenTurns) |
| 推荐度 | ⭐⭐⭐⭐ 工业应用价值高，CAD 参数化方向 |

## 相关笔记
[[CADFit]]
[[parametrization]]
