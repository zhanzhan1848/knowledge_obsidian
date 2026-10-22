---
type: paper
arxiv_id: 2610.29859
title: "Time-asymptotic stability of generic Riemann solutions for viscous-dispersive heat-conducting compressible fluids"
date: 2026-10-21
cats: [math.AP]
tags: [Navier-Stokes-Fourier-Korteweg, viscous-dispersive-shock, capillary, Riemann-problem, a-contraction]
agent: caixin
status: processed
---

# NSFK 系统一般 Riemann 解的时间渐近稳定性

- **arXiv**: [2610.29859](https://arxiv.org/abs/2610.29859) (v1, 2026-10-21 15:17 UTC), 58 页
- **作者**: Sungho Han, Jeongho Kim
- **链接**: https://arxiv.org/abs/2610.29859

## 模型

**NSFK（Navier–Stokes–Fourier–Korteweg）** 系统：描述**粘性、导热、可压**且具**内禀毛细效应**的流体动力学。

## 结果

对绝热指数 $\gamma\in(1,2]$，证明 NSFK 解在 $t\to\infty$ 时**一致（uniformly in space）收敛**至一个**复合波**，包含三部分：

1. **稀疏波（rarefaction wave）**
2. **粘性接触波（viscous contact wave）**
3. **粘性-色散激波（viscous-dispersive shock）**，带**时变偏移（time-dependent shift）**

### 条件

初始扰动足够小，且接触波与激波强度足够小。**关键：对稀疏波强度不施加任何小性条件。**

### 技术

- 因毛细效应，激波为粘性-色散型，其**剖面方程为三阶**
- 采用 Kang 与 Vasseur 引入 shifts 的 **$a$-contraction 方法**处理激波

### 首创性

这是**首个**关于 NSFK 系统粘性-色散激波时间渐近稳定性的结果，也是首个关于 NSFK 一般 Riemann 解的同类结果。

## 🥢 流体力学视角评述

- 物理背景：NSFK 是描述**液-气界面毛细波**（如沸腾、蒸发、界面波）的标准模型，激波-稀疏波-接触波的复合结构对应**相变前沿**的传播。
- 对 CFD 实践的价值：给出了**数值格式应该稳定到什么样的渐近解**这一终极基准。若离散求解器在长时间大网格下仍与之相容（$L^1_{\text{loc}}$ 意义），则长时间积分可信。
- "对稀疏波不施加小性条件" 是结果强度的关键提升——稀疏波在 3D3C 系统中可能很大（接触波/激波必须小的情形在实际中常见于特定参数区）。
- ⚠️ 58 页、依赖特殊 $a$-contraction 技巧，纯数值复现不现实，价值在于**理论基准**。

## 关联

- [[Navier-Stokes-Korteweg]] [[capillary-wave]] [[Riemann-problem]]
