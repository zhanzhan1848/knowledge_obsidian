---
title: Foundations of a solved-volatility stochastic turbulence closure: Itô--Hencky kinematics, source-consistent momentum and finite-correlation realisation
arxiv: 2607.25536
authors: Hsieh-Chen Tsai
date: 2026-07-28
category: turbulence-modeling
tags: [turbulence, stochastic-closure, Itô-calculus, Hencky-strain, Reynolds-stress, DNS-validation]
journal: physics.flu-dyn
---

# Foundations of a solved-volatility stochastic turbulence closure

## 核心创新点

建立**求解位移波动场（displacement-volatility field）**的全新湍流封闭框架，与传统随机封闭方法（给定协方差张量、噪声基、涡粘场）完全不同。

### 理论基础

**一个Itô配置映射的起点**：
- 局部矩阵对数展开
- 物质增量和空间Hencky增量
- 路径约束的二次变差漂移

### 关键方程

**材料回拉动量方程**在常密度、一布朗通道、路径等容、无独立martingale条件下：
$$\to \text{完整随机Reynolds输运平衡的on-shell形式}$$

### 系统结构
- **速度-波动-压力系统**：指数-1微分-代数结构
- **虚拟功率**：确定应力脉冲的机械类型
- **有限相关前体**：Green-Kubo实现

## 四个极限结果

1. **非零布朗输运极限**：无法保留有限的常规未解动能
2. **总能量单独**：不决定熵产生
3. **壁面切向条件**：限制协方差秩而非随机模式数
4. **齐次解耦Helmholtz-Stokes方程**：只有平凡周期解

## 关联：后续论文

- [[2607.28333]] — 可压版本（含源项一致的能量、有限相关库、熵容许性）

## 链接

- PDF: https://arxiv.org/pdf/2607.25536
- HTML: https://arxiv.org/html/2607.25536v1
- DOI: https://doi.org/10.48550/arXiv.2607.25536

## 评价

✅ **湍流随机封闭理论重要框架** — 路径积分/Itô框架的系统性构建，CFD验证留待后续研究
