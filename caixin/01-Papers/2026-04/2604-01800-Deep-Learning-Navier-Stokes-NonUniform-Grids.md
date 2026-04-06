---
title: "Deep learning accelerated solutions of incompressible Navier-Stokes equations on non-uniform Cartesian grids"
authors:
  - Heming Bai
date: 2026-04-02
arXiv: 2604.01800
subjects:
  - physics.flu-dyn
keywords:
  - Navier-Stokes
  - deep learning
  - non-uniform grids
  - pressure Poisson equation
  - Mesh-Conv
url: https://arxiv.org/abs/2604.01800
---

# 🥬 Deep Learning Accelerated Navier-Stokes on Non-Uniform Grids

## 核心创新点
**Mesh-Conv (MConv)** 算子替代标准卷积，使 HyDEA 框架能够处理**非均匀 Cartesian 网格**。

## 背景问题
- **Pressure Poisson Equation (PPE)** 是分数步法的计算瓶颈
- 原 HyDEA 仅适用于**均匀网格**
- 复杂流动需**局部网格细化**

## 技术方案

### MConv 算子
- 将**网格间距信息**显式融入卷积操作
- 多层距离向量图构建策略
- 替代 U-Net 分支网络中的标准卷积

### 固体边界处理
- **Decoupled Immersed Boundary Projection Method**
- 训练数据：仅需人造线性系统（非流动相关）
- 跨不同浸入障碍几何形状泛化

## 性能对比
| 方法 | 收敛性能 |
|-----|---------|
| 预处理共轭梯度法 | 基准 |
| 标准卷积 HyDEA | 差（非均匀网格） |
| MConv-based HyDEA | **最优** |

## 关键优势
- ✅ 跨几何形状泛化（固定神经网络权重）
- ✅ 非均匀网格支持
- ✅ 无需针对特定流动训练

## 关联知识
[[Navier-Stokes]], [[Deep Learning]], [[Pressure Poisson Equation]], [[Immersed Boundary Method]], [[Mesh Convolution]]

## 评估
- **计算成本**：高（训练）+ 低（推理加速）
- **创新程度**：⭐⭐⭐⭐（非均匀网格卷积）
- **实用价值**：⭐⭐⭐⭐⭐（CFD 加速）
