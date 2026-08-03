---
title: Kinetic Linear Stability Theory for High-Speed Compressible Flows: A High Performance Computing Framework
arxiv: 2607.27440
authors: Irmak Taylan Karpuzcu
date: 2026-07-29
category: stability-theory
tags: [kinetic-theory, linear-stability, compressible-flow, Boltzmann-BGK, shock-wave, high-Mach, HPC]
journal: physics.flu-dyn
---

# Kinetic Linear Stability Theory for High-Speed Compressible Flows

## 核心创新点

首次将**动力学线性稳定性理论（kLST）**应用于一维正激波，对Boltzmann-BGK方程进行线性化。

### 突破性方法
- 不再依赖N-S或矩封闭的传统激波稳定性分析
- 保留激波内**非麦克斯韦速度分布函数（VDF）**
- 微观场通过速度空间矩恢复

### 理论基础
**Boltzmann-BGK方程线性化**：
$$\frac{\partial f}{\partial t} + \mathbf{c} \cdot \nabla f = -\frac{f - f^{BGK}}{\tau}$$

## 数值方法

### 求解器架构（SLEPc/PETSc）
- **Shift-and-invert Arnoldi** + MUMPS LU（中等规模）
- **Jacobi-Davidson (JD)** + block-Jacobi ILU（大规模）
- **并行计算**：O(10⁵)未知数，数十亿非零元

### 验证
- 氩气激波：$M_\infty = 1.2, 3.0, 4.0$
- 与Gilbarg-Paolucci profiles对比

### 关键发现
- 高马赫数下：Maxwellian VDF vs 非平衡VDF特征谱差异显著
- 连续介质预测可能**遗漏**重要变化，即使宏观轮廓看起来已充分解析

## 关联方程

**Orr-Sommerfeld方程**（经典用于NS方程线性稳定性）的**动力学版本**

## 计算成本

- 最大计算：$M_\infty=4.0$, 281088个未知数
- 已知最高马赫数动力学线性稳定性计算

## 链接

- PDF: https://arxiv.org/pdf/2607.27440
- HTML: https://arxiv.org/html/2607.27440v1

## 评价

✅ **高速可压流动稳定性分析前沿** — 首次将Boltzmann动力学与线性稳定性结合，对高马赫数CFD有重要参考价值
