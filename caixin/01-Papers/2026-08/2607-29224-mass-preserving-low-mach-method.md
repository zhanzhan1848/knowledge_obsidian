---
title: A global mass-preserving numerical method for low-Mach-number real-gas flows in closed systems
arxiv: 2607.29224
authors: Sanath Kotturshettar
date: 2026-07-31
category: numerical-methods
tags: [CFD, low-Mach-number, real-gas, mass-preserving, pressure-correction, FFT solver]
journal: physics.flu-dyn
---

# A global mass-preserving numerical method for low-Mach-number real-gas flows in closed systems

## 核心创新点

提出一种**全局质量守恒的低马赫数真实流体框架**，适用于闭系统的真实状态方程。

### 关键方法
1. **热力学压力一致性**：在均匀热力学压力、状态方程和全局质量守恒之间强制一致性
2. **分离式算法**：先更新热力学状态，再求解动量方程
3. **压力修正法**：速度场通过压力修正推进，允许使用**FFT-based求解器**
4. **二阶空间精度**

### 验证案例
- 方法验证（Method of Manufactured Solutions, MMS）
- 跨临界 CO₂ 通道层流和湍流
- 强热力学非线性下的精度和鲁棒性验证

## 方程框架

**控制方程形式**：
- 可压N-S方程在低马赫数极限下的渐进保持
- 状态方程：$p = p(\rho, T)$ 一般非线性形式
- 压力修正：Poisson型方程（FFT可解）

## 数值方法

- **离散化**：有限体积法，二阶空间精度
- **压力修正**：FFT-based求解器（Poisson方程）
- **时间推进**：分离式策略，热力学更新 → 动量求解
- **网格**：结构化/非结构化

## 关联研究

后续论文：[[2607.28333]] - compressible solved-volatility stochastic fluid thermodynamics（相同作者Tsai的扩展研究）

## 链接

- PDF: https://arxiv.org/pdf/2607.29224
- HTML: https://arxiv.org/html/2607.29224v1
- DOI: https://doi.org/10.48550/arXiv.2607.29224

## 评价

✅ **CFD数值方法重要进展** — 全局质量守恒+FFT求解器的组合对闭系统真实流体模拟有重要价值
