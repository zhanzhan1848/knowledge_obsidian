---
title: "Parametric Reduced-Order modeling and Closed-Loop Control of Tandem-Cylinder Wakes"
authors:
  - Tea Vojkovic
date: 2026-04-02
arXiv: 2604.02440
subjects:
  - physics.flu-dyn
keywords:
  - Navier-Stokes
  - reduced-order model
  - vortex shedding
  - closed-loop control
  - model predictive control
url: https://arxiv.org/abs/2604.02440
---

# 🥬 Parametric Reduced-Order Control of Tandem-Cylinder Wakes

## 核心创新点
基于**弱非线性分析**的参数化降阶模型 + **模型预测控制 (MPC)** 实现 tandem cylinder 涡街完全抑制。

## 控制目标
- **完全抑制** gap region 和下游 wake 的涡街
- **Re = 50, 60, 70**：完全抑制
- **Re = 80**：显著降低非稳态

## 方法论

### 1. 降阶建模
- **全局弱非线性分析**（基于不可压缩 Navier-Stokes 方程）
- 时间依赖强迫的广义模型
- 实时流场演化预测

### 2. MPC 控制器设计
- 速度测量反馈
- 体积力驱动 (volumetric forcing)
- 圆柱间距：8 倍直径

## 传感需求
| Re | 测量点数量 |
|----|-----------|
| 50 | 1 |
| 60-70 | 2 |

## 物理发现
- **Co-shedding regime**：gap 内形成完全发展的 wake
- 弱非线性分析捕获 bifurcations
- 有限传感即可实现有效控制

## 关联知识
[[Navier-Stokes]], [[Vortex Shedding]], [[Model Predictive Control]], [[Reduced Order Model]], [[Fluid Structure Interaction]]

## 评估
- **计算成本**：中等（离线 ROM 训练 + 在线 MPC）
- **创新程度**：⭐⭐⭐⭐（闭环涡街抑制）
- **工程价值**：⭐⭐⭐⭐（振动控制、载荷减轻）
