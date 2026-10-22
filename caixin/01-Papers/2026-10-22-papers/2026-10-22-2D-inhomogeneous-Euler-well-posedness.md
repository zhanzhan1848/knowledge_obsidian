---
type: paper
arxiv_id: 2610.30096
title: "A well-posedness theory for the 2D inhomogeneous incompressible Euler equations and a class of global-in-time solutions"
date: 2026-10-21
cats: [math.AP]
tags: [Euler-equations, well-posedness, critical-regularity, quasiconformal, stratified-flow]
agent: caixin
status: processed
---

# 二维非齐次不可压 Euler 方程的适定性理论与一类长时间解

- **arXiv**: [2610.30096](https://arxiv.org/abs/2610.30096) (v1, 2026-10-21 17:45 UTC), 47 页
- **作者**: Ibrahim Suleiman
- **链接**: https://arxiv.org/abs/2610.30096

## 问题

考虑二维**非齐次**不可压 Euler 方程的 Cauchy 问题。这是 **P. L. Lions 提出的公开问题**（齐次、非必对称情形）。

## 结果

1. **局部适定性**：在临界正则性下的 $m$-重对称函数类中，且允许速度场在无穷远处线性增长。
   - 关键工具：用**拟共形映射（quasiconformal mappings）+ 特定尺度不变 Hölder 空间中的 Schauder 估计**发展变系数椭圆理论。
2. **降维**：局部适定性 → 导出 0-齐次涡量与密度解所满足的 $\mathbb{S}^1$ 上的一维系统。
3. **长时间适定性**：对该一维系统，在**远离平衡态**的一类初值上获得全局适定性。
   - 作者称：不 aware of any previous **非扰动的**时变解类使二维非齐次 Euler 获得全局适定性。
4. **二分性**：对某些带符号的全局解，证明无限时间内**密度均匀化（density homogenization）** 与 **平均弛豫（averaged relaxation）** 之间的二分。

## 🥢 流体力学视角评述

- 非齐次（变密度）二维 Euler 的经典结果是 Elsner & Novikov 等：所有光滑解**趋于常密度分层平衡态**。本文的新意在于：
  - 在**临界正则性**（Hölder 层面）而非光滑层面建立适定性；
  - 允许**无穷远线性增长**（物理上对应大尺度背景流 / 地球自转），这对大气海洋流体是必要的放宽；
  - 给出**显式的长时间解类**（非扰动），而非仅证明"趋于平衡"。
- 拟共形映射处理变系数椭圆算子（$\nabla\cdot(\rho^{-1}\nabla\cdot)$ 型）是被低估的技术，在重力分层流、多层大气模型中都可复用。
- 二分性（有符号 vs 平均）提示可能存在**分界面重力内波**等非平衡结构，值得跟进。

## 关联

- [[2026-10-22-nonlinear-inviscid-damping-Couette]]
- [[Euler-equations]] [[stratified-flow]]
