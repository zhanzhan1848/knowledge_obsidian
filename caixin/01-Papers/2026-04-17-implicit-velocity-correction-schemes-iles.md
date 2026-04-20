---
title: "Implicit Velocity Correction Schemes for Scale-Resolving Simulations of Incompressible Flow"
date: 2026-04-17
authors:
  - Henrik Wüstenberg
  - Alexandra Liosi
  - Spencer J. Sherwin
  - Joaquim Peiró
  - David Moxey
categories:
  - Numerical Methods
  - LES
  - High-Order Methods
arxiv_id: "2604.16057"
tags:
  - Navier-Stokes
  - Implicit Scheme
  - LES
  - Velocity Correction
  - CFL
  - spectral/hp element
  - CFD
---

# 不可压缩流尺度解析模拟的隐式速度修正格式

## 核心创新点

系统比较两种隐式速度修正格式（线性隐式 + 半拉格朗日子步进）与标准半隐式格式，在高阶谱/hp 元素框架下验证稳定性提升两个数量级。

## 问题背景

- 高 Re 不可压缩流的尺度解析模拟受 CFL 限制
- 显式时间推进导致小时间步长、长求解时间

## 数值方法

### 三种格式对比

1. **半隐式 (Semi-implicit)**: 标准方法
2. **线性隐式 (Linear-implicit)**: 隐式处理速度
3. **半拉格朗日子步进 (Sub-stepping/Semi-Lagrangian)**: 子步进

### 框架

- **离散化**：高阶谱/hp 元素方法
- **应用**：Imperial Front Wing benchmark（复杂高 Re 几何）

## 关键结果

| 指标 | 隐式格式提升 |
|------|-------------|
| 稳定性限制 | 放宽 **2 个数量级** |
| 时间步长 | 可扩大 **20 倍** |
| 计算效率 | 提升最高 **11 倍** |

## 精度分析

- 时间步长扩大 20 倍对层流-湍流转捩和关键流动统计影响轻微
- 隐式方案每时间步成本增加，但总体时间-解减少

## 湍流模型

- **ILES** (隐式大涡模拟)

## 结论

为大规模尺度解析模拟的时间积分策略选择提供实用指导

## URL

https://arxiv.org/abs/2604.16057
