---
title: "Scaling in Supersonic Turbulence: Energy Spectra and Fluxes using High-Fidelity Direct Numerical Simulations"
authors: "Harshit et al."
arXiv: "2604.26290"
date: 2026-04-29
tags: [turbulence, DNS, Navier-Stokes, supersonic, compressible]
---

## 核心贡献

超音速湍流的能量级串机制研究。使用 **1024³** 高分辨率 DNS 和 GPU 加速求解器 `DHARA`，研究可压缩湍流在 **Mt = 0.2 ~ 3.0** 范围内的能量转移。

## 控制方程

可压缩 Navier-Stokes 方程，GPU 加速求解器 DHARA，七阶低耗散 TENO 格式。

## 数值方法

- **离散化**: 七阶 TENO (Targeted Essentially Non-Oscillatory) 格式
- **网格**: 1024³ 直接数值模拟
- **求解器**: DHARA (GPU 加速)

## 关键发现

1. **能量谱转变**: 
   - 亚音速: Kolmogorov-like k^(-5/3)
   - 超音速: Burgers-like k^(-2)

2. **能量级串机制**:
   - 旋转动能谱从 k^(-5/3) 转变为 k^(-2)
   - 压缩能量谱偏离 Burgers 标度
   - 跨模态能量转移:  solenoidal → compressive modes

3. **耗散特性**:
   - Mt 增加 → 旋转耗散减少，压缩耗散增加
   - 压力膨胀贡献显著

## 技术亮点

- 高阶低耗散格式适合捕捉激波和湍流
- GPU 加速实现大规模 DNS

## URL

https://arxiv.org/abs/2604.26290
