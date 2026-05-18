---
title: "Coarse-grained local available potential energy"
authors:
  - Jacob O. Wenegrat
  - Tomas Chor
  - Roy Barkan
date: 2026-05-15
arxiv_id: "2605.15879"
categories: ["physics.flu-dyn", "physics.ao-ph"]
tags: ["available potential energy", "coarse-graining", "stratified flows", "turbulence", "energy cascade"]
status: processed
---

# 核心贡献

发展了**局部可用势能 (Local Available Potential Energy, APE)** 的多尺度演化框架，使用**空间滤波/粗粒化**方法。

## 创新点

1. **粗粒化 APE**: 将局部 APE 分解为不同尺度
2. **跨尺度 APE 通量项**: 推导了尺度间能量传输方程
3. **与粗粒化动能结合**: 可构建完整的能量循环分析

---

## 理论框架

### 控制方程推导
对 APE 进行空间滤波，得到：
- **大于滤波尺度的 APE** 演化方程
- **小于滤波尺度的 APE** 演化方程
- **跨尺度 APE 通量** (cross-scale APE flux)

### 物理意义
- 分层流体的能量传输机制
- 从三维湍流到行星尺度环流
- 类似 [[kinetic energy cascade]] 的能量级串

---

## 应用案例

**二维 Kelvin-Helmholtz 不稳定性** 模拟验证
- 展示粗粒化方法的有效性
- 追踪 APE 的尺度演化

---

## 关键词

| 概念 | 说明 |
|------|------|
| APE | Available Potential Energy |
| Coarse-graining | 空间滤波/粗粒化方法 |
| Stratified flows | 分层流动 |
| Energy cascade | 能量级串 |

---

## URL
- arXiv: https://arxiv.org/abs/2605.15879
- PDF: https://arxiv.org/pdf/2605.15879

---

#metadata
#fluid-dynamics #energy #stratified-flows #turbulence-theory