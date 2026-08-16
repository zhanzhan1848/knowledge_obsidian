---
title: "Physics-Based Wildfire Simulation in Large-Scale Semantics-Enriched Gaussian Splatting Forest Scenes"
authors: ["Michael Weinmann"]
date: 2026-08-11
paper_id: arXiv:2608.11100
tags: [fire simulation, gaussian splatting, physics-based, combustion model, particle-based, 3D reconstruction]
category: fluid-rendering
venue: arXiv cs.GR
---

# 论文摘要

## 核心贡献
提出 **WildFireGS**，一个基于物理的野火模拟框架，直接在Large-scale、语义丰富的3D Gaussian Splatting森林场景重建上运行。

## 创新点

### 1. 粒子燃烧模型
- 粒子-based combustion model，直接操作 Gaussian 表示
- 模拟点燃、热量传递、燃烧、火焰传播
- 无需转换为显式网格或体素网格

### 2. 语义增强的 Gaussian 原语
- 为 Gaussian 原语添加语义和材质属性
- 编码植被类型和燃料特性
- 桥接 learning-based 场景重建与环境仿真

### 3. 雨水冷却机制
- 提出 rain-driven cooling mechanism 作为能量汇过程
- 逼真模拟火灾遏制效果

## 技术方法

### 流程
1. 使用 aerial imagery 重建 3D Gaussian Splatting 森林场景
2. 增强 Gaussian 原语：语义标签 + 材质属性
3. 粒子燃烧模型在 Gaussian 表示上原生运行
4. 物理模拟：点火 → 热传递 → 燃烧 → 火焰传播

### 关键公式/概念
- **燃烧模型**: 粒子-based，模拟 ignition, heat transfer, combustion, flame propagation
- **能量汇过程**: rain-driven cooling as energy-sink
- **物理一致性**: propagation scaling with vegetation density, wind velocity, terrain slope

## 实验验证

### 数据集
- Synthetic scenes
- Real aerial forest captures

### 验证方法
- Firebreak experiments
- Biomass loss estimation
- 与植被密度、风速、地形坡度的传播缩放一致性

## 相关工作对比

| 方法 | 优点 | 局限 |
|------|------|------|
| 传统物理火灾模型 | 高真实度 | 仅限于合成环境 |
| Learning-based | 可处理真实场景 | 缺乏物理一致性 |
| **WildFireGS** | 物理-based + 真实场景 | - |

## 未来应用
- 野火数字孪生
- 风险评估
- 景观管理

## 链接
- Paper: https://arxiv.org/abs/2608.11100
- PDF: https://arxiv.org/pdf/2608.11100

## 笔记
- 与流体渲染相关：火焰传播、粒子系统、热传递模拟
- 方法创新点：将 Gaussian Splatting 用于物理仿真，而非仅用于渲染
- 可借鉴：粒子-based燃烧模型用于其他流体效果
