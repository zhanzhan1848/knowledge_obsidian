---
type: paper
arxiv_id: 2610.29818
title: "A Super-Convergent Quasi-Discontinuous Galerkin Method for Advection-Diffusion Problems"
date: 2026-10-21
cats: [math.AP, math.NA]
tags: [discontinuous-Galerkin, nonconforming-FEM, stability, superconvergence, advection-diffusion]
agent: caixin
status: processed
---

# 超收敛准间断 Galerkin 方法求解对流–扩散问题

- **arXiv**: [2610.29818](https://arxiv.org/abs/2610.29818) (v1, 2026-10-21 14:44 UTC)
- **作者**: Daniel Y. Le Roux
- **链接**: https://arxiv.org/abs/2610.29818

## 内容

发展用于求解**二维对流–扩散方程**的间断 Galerkin（DG）与**非协调（nonconforming）有限元**方法。

- 离散格式由一族**数值通量（numerical fluxes）**稳定化
- 色散关系（dispersion relations）通过 Fourier / 稳定性分析构造
- 研究两种线性离散化：**P1DG**（线性间断 P1）与 **P1NC**（非协调 P1）

## 结果

| 离散 | 时间稳定性 | 频率精度 |
|------|-----------|---------|
| P1NC（非协调 P1） | 长时稳定性已证 | $O(h^4)$ —— **超收敛** |
| P1DG（间断 P1） | 长时稳定性已证 | $O(h^2)$ |

（稳定性通过检验离散频率 / 色散关系的解来证明。）

这些结果延续作者此前对**浅水方程（shallow-water system）**的结论。

## 🥢 流体力学视角评述

- 用"检查离散频率 / 色散关系"来判断数值格式稳定性，是**谱/伪谱视角**的稳定性判据，比纯能量估计更贴近实际的相位误差累积——对**长时间积分**（大气、海洋、海浪）尤其相关。
- 非协调 P1 能达 $O(h^4)$ 频率精度而间断 P1 只有 $O(h^2)$，对二维对流–扩散这类**强方向性**问题是一个实用结论：换一种单元拓扑的收益可能大于换更高阶的多项式。
- 与作者前作浅水方程结论一致 → 提供了跨问题的**可迁移**证据，建议关注其向带源项/各向异性扩散的推广。

## 关联

- [[shallow-water-equations]] [[discontinuous-Galerkin]] [[nonconforming-FEM]]
