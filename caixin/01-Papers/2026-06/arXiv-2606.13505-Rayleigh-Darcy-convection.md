---
title: "Ultimate regime in Rayleigh-Darcy Convection"
authors:
  - Anikesh Pal
date: 2026-06-11
arXiv: "2606.13505"
subjects:
  - Fluid Dynamics (physics.flu-dyn)
url: "https://arxiv.org/abs/2606.13505"
pdf: "https://arxiv.org/pdf/2606.13505"
---

## 摘要

在 **Ra ∈ [10³, 10⁶]** 范围内对 **Rayleigh-Darcy 对流** 进行三维直接数值模拟 (DNS)，研究热传输标度、热边界层动力学和流动结构演化，聚焦于**终极 regime**。

## 关键发现

- **Nusselt数 (Nu)** 在整个研究范围内呈近似线性依赖 Ra
- 在 **Ra ≈ 4×10⁵** 处观察到斜率的明显变化，指示终极 regime 的开始
- 对于 **Ra ≤ 2.5×10⁵**，标度比 Hewitt et al. (2014) 低 6.25%
- 对于 **Ra ≥ 4×10⁵**，结果在 Pirozzoli et al. (2021) 终极 regime 预测的 1.24% 以内
- **热结构分析**：形成近壁原羽流 (protoplumes)，合并为大尺度柱状巨型羽流 (megaplumes)
- 随着 Ra 增加，原羽流尺寸减小但数量增加
- 热边界层厚度标度为 **~Ra⁻¹** 和 **~Nu⁻¹**
- 热耗散随 Ra 增加从边界层向体核转移

## 控制方程

- **Rayleigh-Darcy 方程**（多孔介质中的热对流）
- 达西定律描述渗流

## 数值方法

- **直接数值模拟 (DNS)**
- **方法**：有限差分/有限体积
- **网格**：自适应网格细化
- **Ra 范围**：10³ - 10⁶

## 物理机制

1. **原羽流 → 巨型羽流**：近壁羽流合并
2. **边界层对流增强**：更高 Ra 下更小的原羽流更高效传输热量
3. **热耗散转移**：从边界层向体核

## 标签
#convection #porous-media #DNS #turbulence #heat-transfer #Rayleigh-Darcy

## 相关链接
- DOI: pending via DataCite
- 关联：[[hewitt2014high]], [[pirozzoli2021towards]]