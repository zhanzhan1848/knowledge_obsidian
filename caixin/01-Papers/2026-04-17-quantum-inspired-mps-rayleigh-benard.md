---
title: "Quantum-Inspired Simulation of 2D Turbulent Rayleigh-Bénard Convection"
date: 2026-04-17
authors:
  - Nis-Luca van Hülst
  - Mario Guillaume Cecile
  - Hai-Yen Van
  - Tomohiro Hashizume
  - Eugene de Villiers
  - Dieter Jaksch
categories:
  - Turbulence
  - Thermal Convection
  - Quantum Computing
  - High Performance Computing
arxiv_id: "2604.16179"
tags:
  - Rayleigh-Bénard
  - MPS
  - Matrix Product State
  - Turbulent Convection
  - Thermal Diffusion
  - turbulence
  - CFD
---

# 量子启发式 2D 湍流瑞利-贝纳对流模拟

## 核心创新点

本文将**矩阵乘积态 (MPS)** 方法应用于热驱动湍流模拟，在 Ra=10^10 下仅用 1.8% 的努塞尔数误差实现了近 9 倍的自由度压缩。

## 控制方程

- **Rayleigh-Bénard 对流系统**：二维可压缩/不可压缩流体的热对流
- **Boussinesq 近似**下的 N-S 方程 + 热传导方程
- 关键参数：Rayleigh number (Ra), Nusselt number (Nu)

## 数值方法

- **离散化**：Matrix Product State (MPS) 压缩格式
- **创新点**：首次将 MPS 应用于热耦合流动（之前仅用于等温湍流）
- **Bond dimension χ**：表征压缩复杂度的关键参数

## 关键发现

1. **先验分解** (a priori)：在 Ra=10^11 下，bond dimension χ 持续增长（无饱和）
2. **动态模拟**：在固定 χ 下，χ 对 Ra 的依赖比先验复杂度更有利
3. **精度**：Ra=10^10 时，χ 与 Ra=10^9 相当，仅 1.8% 的 Nu 误差

## 计算成本

- 相比全分辨率 DNS，实现约 9 倍自由度压缩
- 适用于高 Ra 下的统计量计算

## 数值稳定性

- MPS 格式直接求解控制方程
- 谱分析验证了空间和时间尺度的恢复

## 核心公式

$$Nu \propto Ra^\gamma$$

## 结论

MPS 可作为高 Ra 热湍流模拟的可扩展工具，为研究ultimate regime提供新途径。

## 关联论文

- [[2604.15277]] - Superstatistical Approach to Turbulent Circulation Fluctuations
- [[2604.15551]] - Data-driven approach for 2D vorticity PDF equations

## URL

https://arxiv.org/abs/2604.16179
