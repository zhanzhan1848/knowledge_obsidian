---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [2D-Turbulence, Inverse-Energy-Cascade, Vortex, DNS, Energy-Spectrum]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.01553
---

# The dynamical role of vortices in the two-dimensional inverse cascade of turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The dynamical role of vortices in the two-dimensional inverse cascade of turbulence |
| **作者** | Victor Valadão |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.01553) |
| **arXiv ID** | 2609.01553 |

---

## 核心贡献

> 高分辨率 DNS 揭示涡旋在二维湍流逆级联中的动力学作用

1. **涡旋-背景分解**: 将涡量和速度场分解为涡旋分量和背景分量
2. **涡旋占比小但影响大**: 涡旋分量只携带少量能量，但显著影响能谱并产生 Kolmogorov 标度的偏差
3. **广义 von Karman-Howarth 平衡**: 推导了分解场的广义平衡方程，涉及涡旋和背景速度增量的三阶相关

---

## 技术方案

### 核心思想

二维湍流中能量从forcing尺度向大尺度逆级联。涡旋在近forcing尺度产生，它们如何影响逆级联过程此前不清晰。

### 关键技术

| 技术 | 说明 |
|------|------|
| Inverse Energy Cascade | 逆能量级联 |
| Vortex Decomposition | 涡旋-背景分解 |
| von Karman-Howarth Equation | 湍流统计方程 |
| High-Resolution DNS | 高分辨率直接数值模拟 |

---

## 公式

广义 von Karman-Howarth 平衡方程包含涡旋-背景速度增量三阶相关项，代表与涡旋-背景相关联的惯性范围常数能流通量。

---

## 相关工作

- [[2D Turbulence]] - 二维湍流
- [[Inverse Cascade]] - 逆级联
- [[Vortex Dynamics]] - 涡旋动力学

---

## 实现建议

- **实现难度**: 高（需高分辨率 2D DNS）
- **适用场景**: 大气/海洋环流、湍流理论
