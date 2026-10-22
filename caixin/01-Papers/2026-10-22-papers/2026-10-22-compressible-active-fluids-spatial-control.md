---
type: paper
arxiv_id: 2610.30092
title: "Spatial Control of Compressible Active Fluids"
date: 2026-10-21
cats: [cond-mat.soft]
tags: [active-fluid, microtubule, nematic, active-stress, feedback-control]
agent: caixin
status: processed
---

# 可压缩活性流体的空间控制

- **arXiv**: [2610.30092](https://arxiv.org/abs/2610.30092) (v1, 2026-10-21 17:41 UTC)
- **作者**: Yu-Chuan Cheng, Dimitrios Krommydas, Seungwoo Shin, Paarth Gulati, Michael F. Hagan, Aparna Baskaran, Cristina M. Marchetti, Zvonimir Dogic
- **链接**: https://arxiv.org/abs/2610.30092

## 现象（实验 + 理论）

用正弦变化的**驱动活性（activity）图样**作用于**基于微管的压缩性活性流体**（actomyosin + microtubule 网络）：

- 微管在**低活性区聚集**，在**高活性区耗散**
- 密度差由活性图样的**波长**控制

## 理论模型要求

连续体模型必须同时包含：

1. 与向列序参量张量成比例的**活性应力**
2. **各向同性活性压力**

**机制**：

- **短波长**：跨越相邻高低活性区的**活性涡（active vortices）**抑制密度调制
- **长波长**：涡流被限制在低活性或高活性区内部，密度对比得以涌现

## 结论

最小活性可压缩流体理论模型**准确复现实验**，同时阐明了试图驯服其混沌动力学的**控制方案的内在约束**。

## 🥢 流体力学视角评述

- 这是**流体力学基础问题在活性物质中的重现**：对流不稳定性 / 密度-速度反馈机制。短波长抑制、长波长增强，本质是密度场与速度场反馈的**波长依赖耦合**，与 Rayleigh–Bénard 的机制同源。
- 与被动流体最本质的差别：活性应力项不满足**被动（Onsager / 应力张量对称）条件**，因此能量耗散不保证，可出现自激发失稳。
- 工程价值：控制混沌活性介质的**波长选择律**有直接指导意义（选择驱动图样的空间频率）。

## 关联

- [[active-matter]] [[convective-instability]] [[nematic-liquid-crystal]]
