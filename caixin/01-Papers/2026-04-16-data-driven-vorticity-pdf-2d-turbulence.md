---
title: "A data-driven approach for 2D vorticity PDF equations by a new conditional average estimation"
date: 2026-04-16
authors:
  - Qian Huang
  - Simon Görtz
  - Paul Hollmann
  - Johannes Conrad
  - Christian Rohde
  - Martin Oberlack
categories:
  - Turbulence
  - Probability Density Function
  - Data-Driven Methods
  - Vortex Dynamics
arxiv_id: "2604.15551"
tags:
  - Vorticity
  - PDF
  - Turbulence
  - DNS
  - data-driven
  - vortex method
---

# 基于新条件平均估计的二维涡量 PDF 方程数据驱动方法

## 核心创新点

利用不变量性质推导降维的涡量 PDF 方程，结合 DNS 数据的条件平均采样估计器解决闭合问题。

## 问题背景

- 二维均匀各向同性湍流 (HIT) 的涡量场统计
- PDF 方法中的未闭合算子问题

## 控制方程

### 降维方法

利用不变量性质推导：
- **单点 PDF** 方程
- **两点 PDF** 方程

形式为线性动力学输运方程，但包含条件平均形式的未闭合算子

## 数值方法

### 混合 data-driven 方法

1. **DNS 数据采样**：精心选择的样本
2. **条件平均采样估计器**：解决 PDF 方程
3. **验证**：应用于衰减和受迫 HIT 的 DNS 数据

## 关键创新

- 利用不变性进行维度约简
- 采样估计器方法解决闭合问题

## 结果

- 与直接使用 DNS 数据评估 PDF 的一致性良好
- 适用于衰减和受迫湍流

## 关联理论

- 与 [[2604.15277]] Superstatistical Approach 存在关联

## URL

https://arxiv.org/abs/2604.15551
