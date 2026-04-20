---
title: "Component-Based Reduced-Order Modeling Framework for Rocket Combustion Dynamics"
date: 2026-04-16
authors:
  - Brody Gatza
  - Cheng Huang
categories:
  - Reduced Order Modeling
  - Combustion
  - Rocket Engine
  - HPC
arxiv_id: "2604.15467"
tags:
  - ROM
  - CBROM
  - Rocket Combustion
  - DMD
  - MP-LSVT
  - CFD
---

# 多喷嘴配置火箭燃烧动力学的组件化降阶建模框架

## 核心创新点

开发组件化降阶建模 (CBROM) 框架，通过几何分解将单域分解为多个代表性组件，显著降低 ROM 训练成本。

## 问题背景

- 即使使用最先进计算能力，大型火箭发动机的高保真 (LES) 模拟仍遥不可及
- 需要高效参数化建模方法

## 数值方法

### 组件化分解

分解为：
- 喷嘴 (Injectors)
- 燃烧室 (Combustor)
- 喷管 (Nozzle)

### 降阶技术

- **MP-LSVT** (Model-form preserving Least-Squares with Variable Transformation) 投影
- **DMD** (Dynamic Mode Decomposition) 分析

### 边界条件

训练时通过精心设计的边界条件施加系统级响应

## 验证案例

- **七喷嘴模型火箭燃烧器配置**
- 展现自激燃烧动力学

## 关键结果

1. **参数化预测**：准确预测动态行为变化
2. **DMD 谱**：捕捉特征频率变化
3. **时间和 RMS 场**：目标状态变量精确预测

## 计算效率

- 仅需较小计算域的高保真模拟
- 大幅降低 ROM 训练成本

## URL

https://arxiv.org/abs/2604.15467
