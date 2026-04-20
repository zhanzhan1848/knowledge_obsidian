---
title: "Large-eddy simulation of the FDA benchmark blood pump: validation against experiments"
date: 2026-04-17
authors:
  - Xuanming Huang
  - Chi Ding
  - Yujie Sun
  - Shidi Huang
  - Andrea Cioncolini
  - Damiano Panozani
  - Ju Liu
categories:
  - Biomedical CFD
  - LES
  - Validation
  - Hemodynamics
arxiv_id: "2604.15869"
tags:
  - Navier-Stokes
  - LES
  - Blood Pump
  - FDA benchmark
  - RANS
  - turbulence
  - CFD
---

# FDA 基准血泵的大涡模拟：实验验证及湍流机制

## 核心创新点

系统验证离心血泵 CFD 策略，证明 LES + 瞬态滑移界面耦合优于 RANS 方法，80M 网格单元达到良好解析 LES 状态。

## 问题背景

- 美国 FDA 基准离心血泵模型
- 心室辅助装置的高保真血流动力学模拟需求

## 数值方法

### 策略对比

| 方法 | 描述 |
|------|------|
| **LES + SI** | 大涡模拟 + 瞬态滑移界面耦合 |
| RANS + MRF | 雷诺平均 + 多参考系 |
| RANS + SI | 雷诺平均 + 滑移界面 |

### 网格敏感性

- **80M 单元格**达到良好解析 LES
- 三互补指标量化 LES 质量

## 关键结果

1. **LES + 瞬态转子-定子耦合**在 diffuser 区域一致优于 RANS
2. RANS 在存在强间歇性和壁面约束湍流的区域表现不佳
3. 涡旋结构、TKE 分布、速度能谱详细分析

## 湍流模型

- LES (Smagorinsky-like SGS model)
- 多种 RANS 模型对比

## 血流动力学意义

- 为未来的高保真血流相容性研究提供实用指导
- 证明瞬态模拟对捕捉非稳态湍流特征的重要性

## URL

https://arxiv.org/abs/2604.15869
