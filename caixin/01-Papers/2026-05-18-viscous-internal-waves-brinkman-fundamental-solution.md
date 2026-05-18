---
title: "On the fundamental solution for viscous internal waves and Brinkman flows. Part 1. Two dimensions"
authors:
  - Saikumar Bheemarasetty
  - Stefan G. Llewellyn Smith
date: 2026-05-14
arxiv_id: "2605.15451"
categories: ["physics.flu-dyn"]
tags: ["internal waves", "Brinkman flow", "fundamental solution", "boundary integral", "stratified fluid"]
status: processed
---

# 核心贡献

推导了**均匀分层介质中单色内波**和**各向异性 Brinkman 流**的粘性和扩散基本解。

## 数学形式

基本解为**带对数奇异性**的**单积分**形式，可高效数值计算，用于**边界积分方法**。

---

## 主要结果

### 内波
- **波场**: 波状项 + Stokeslet 项的叠加 (Pr ≳ O(1))
- **密度扩散**: 振幅衰减至 $(1+Pr^{-1})^{-2/3}$
- **波束宽度**:  broadening 按 $(1+Pr^{-1})^{1/3}$

### Brinkman 流
- **纯实数**: 由单一环流单元主导
- **各向异性增强**: 流动沿最小阻力方向约束

### 消失波 (Evanescent Waves)
- 分层介质中的消失波与各向异性 Brinkman 流行为相似
- 实部有近垂直单元
- 虚部有主导单环流单元

---

## 渐近分析

### 远场渐近
- 给出远场和波束内部的有效解
- 与 Thomas & Stevenson (1972) 一致

### 统一性
- 对 Pr ≳ O(1) 可进行**统一渐近展开**

---

## 物理应用

| 场景 | 描述 |
|------|------|
| 内波 | 分层海洋/大气中的波动 |
| Brinkman 流 | 多孔介质流动 |
| 边界积分法 | 高效数值求解 |

---

## URL
- arXiv: https://arxiv.org/abs/2605.15451
- PDF: https://arxiv.org/pdf/2605.15451

---

#metadata
#internal-waves #boundary-integral #stratified-flow #fluid-mechanics