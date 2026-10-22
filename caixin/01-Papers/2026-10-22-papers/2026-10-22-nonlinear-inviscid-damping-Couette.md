---
type: paper
arxiv_id: 2610.29975
title: "Nonlinear Inviscid Damping of Couette Flow with Vorticity Perturbations Supported up to the Boundary"
date: 2026-10-21
cats: [math.AP]
tags: [Couette-flow, inviscid-damping, boundary-layer, dyadic-decomposition, stability]
agent: caixin
status: processed
---

# 近 Couette 流中边界涡量扰动的非线性无粘衰减

- **arXiv**: [2610.29975](https://arxiv.org/abs/2610.29975) (v1, 2026-10-21 16:24 UTC), 72 页
- **作者**: Siming He, Sameer Iyer, Weiren Zhao
- **链接**: https://arxiv.org/abs/2610.29975

## 结果

在**有限沟道**中建立近 Couette 流的非线性无粘衰减，扰动为**在边界处无穷阶消失**的涡量。

- **方法**：将涡量分解为**支撑集向边界扩张的二进制层（dyadic layers）**，用**归纳 Newton 格式**追踪跨层的非线性相互作用
- 另需建立精细的椭圆估计，定量各层所生成的速度

## 🥢 流体力学视角评述

- "涡量无穷阶消失但衰减仍需处理边界层" 是无粘稳定性理论的核心困难：Lions / Iooss–Perron 的半群框架给线性衰减，**非线性衰减**才是真问题（应用 Euler-vortex 不可压模型）。
- Dyadic 层 + 归纳 Newton 的技术路线与线性稳定性分析（normal mode）完全不同，适合**非线性**相饱和阶段。
- 物理意义：**管道流 / Taylor–Couette 的自维持湍流转捩**是经典未解问题；本工作为在 Couette 基础态上加**非线性扰动后仍衰减**提供了严格证据，即基础态的鲁棒性。
- ⚠️ 72 页、椭圆估计为主要技术难点，复现门槛高。

## 关联

- [[2026-10-22-2D-inhomogeneous-Euler-well-posedness]]
- [[stability-Couette]] [[inviscid-damping]]
