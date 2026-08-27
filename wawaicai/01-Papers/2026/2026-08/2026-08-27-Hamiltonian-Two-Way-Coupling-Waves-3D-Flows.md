---
title: "Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows"
authors: ["Sinan Wang"]
date: 2026-08-25
arXiv: "2608.25203"
conference: "SIGGRAPH Asia 2026"
tags: [流体模拟, 波模拟, Hamiltonian, 2D-3D耦合]
---

# Hamiltonian 双向耦合非线性波与 3D 流动

## 核心方法

解决大规模自由液面模拟中 2D 波模型与 3D 流体求解器的耦合问题。

### 问题背景

- 传统 2D 波模型（线性或非色散）与强非线性 3D 求解器耦合时产生反射和伪影
- SWE (Shallow Water Equation)、BEM、Airy 等方法在 2D-3D 界面处有可见接缝

### 解决方案

**基于 Zakharov 公式的非线性色散 2D 波模型**
- Hamiltonian 结构：表面高度与表面势能构成典范对 (η, ψ)
- 典范一致双向耦合方案：信息平滑穿越 2D-3D 界面

### 性能提升

- 平均波高误差降低 1.7-5 倍（对比 SWE, BEM, Airy 基线）
- 运行速度比 BEM 快 10³ 倍以上
- 与 3D Navier-Stokes 求解器耦合，消除接缝伪影
- 比纯 GPU NB-FLIP 模拟快 4 倍以上

## 论文信息
- **DOI**: https://doi.org/10.1145/3842540
- **发表**: ACM Transactions on Graphics (SIGGRAPH Asia 2026)

## 可行性评估

✅ **SIGGRAPH Asia 2026 录用论文**

- 学术价值高
- 实用性强：可用于游戏、影视流体特效
- 方法创新：Hamiltonian 结构保证耦合一致性

## 关键词
[[流体模拟]], [[波模拟]], [[SIGGRAPH Asia 2026]]
