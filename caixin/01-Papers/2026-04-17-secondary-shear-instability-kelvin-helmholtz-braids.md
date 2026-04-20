---
title: "Early onset of secondary shear instability in Kelvin-Helmholtz braids at high Reynolds number"
date: 2026-04-17
authors:
  - Emma R. Bouckley
  - Sam F. Lewin
  - Adrien Lefauve
categories:
  - Instability
  - Stratified Flow
  - Shear Flow
  - DNS
arxiv_id: "2604.16173"
tags:
  - Kelvin-Helmholtz
  - Secondary Shear Instability
  - Braid
  - Stratified Shear Flow
  - turbulence
  - vortex method
---

# 高雷诺数下 Kelvin-Helmholtz 辫状结构二次剪切失稳的早期 onset

## 核心创新点

修正 Corcos & Sherman (1976) 的经典分析方法，在 braid 对齐坐标系下引入应变率与剪切比的新稳定性判据，证明二次剪切不稳定 (SSI) 可在主 billow 饱和前显著更早发生。

## 问题背景

- 分层剪切流中主 Kelvin-Helmholtz billows 之间的 braid 区域
- 应变稳定 braid，但同时压缩倾斜等密度面，增强 baroclinic 剪切

## 控制方程

- 二维分层剪切流
- Boussinesq 近似
- 关键参数：Richardson number (Ri), Reynolds number (Re)

## 数值方法

- **离散化**：二维直接数值模拟 (DNS)
- **Re 范围**：可达 10^7
- **方法**：修正的 Corcos & Sherman 分析 + inviscid 时变模型

## 稳定性判据

新增判据：**应变率与剪切比** (strain rate to shear ratio)

$$Ri_{crit} = f\left(\frac{\dot{\gamma}}{S}\right)$$

## 关键发现

1. 高初始 Ri 下，SSI 判据可在主 billow 饱和前显著更早达到
2. 增加的分层减缓 billow 增长，同时加速 braid 的 baroclinic 剪切产生
3. 高 Re 下 SSI 确实在 braid 中早期发展（2D DNS 验证）

## 物理意义

- 为野外观察到的 braid 主导混合提供机制解释
- 在地球物理相关 Ri 和 Re 下，SSI 可控制三维湍流转捩

## 结论

SSI 可先于并抢先 vortex pairing instability 和 billow core 中的二次对流失稳

## URL

https://arxiv.org/abs/2604.16173
