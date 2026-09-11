---
title: "AnisoLift: Anisotropic Latent Representations for Coarse Particle Liquid Enhancement"
authors: Zhengqing Gao et al.
date: 2026-06-09
tags: [fluid-simulation, particle-system, liquid-rendering, neural-enhancement, cs.GR]
---

# AnisoLift: 各向异性隐式表示用于粗粒度粒子液体增强

## 论文信息
- **arXiv**: [2606.10473](https://arxiv.org/abs/2606.10473)
- **类别**: cs.GR
- **发表时间**: 2026-06-09
- **PDF**: https://arxiv.org/pdf/2606.10473

## 核心问题

基于粒子的液体模拟在计算机图形和物理建模中广泛使用，但**高分辨率 rollouts 计算成本仍然很高**。许多方法旨在从粗粒度粒子模拟中恢复细尺度动力学和密集传输模式。然而这些方法通常依赖额外的粒子生成，导致：
- 计算开销大
- 表示质量差

## 核心创新

### AnisoLift 框架
提出**结构化隐式闭包框架 (Structured Latent Closure Framework)**：

1. **各向异性椭球分量**: 为每个粗粒粒子添加**可学习的各向异性椭球分量**
2. **无额外粒子**: 模型从底层高分辨率流场中捕捉方向性局部结构，无需引入额外粒子
3. **残差校正**: 给定粗粒模拟，预测粒子状态的残差校正，使更新状态更接近对齐的高分辨率教师

### 训练目标
**联合监督**：
- 粒子动力学
- 各向异性几何结构

→ 鼓励**物理一致性**和**结构一致性**

## 实验结果
- 增强粗粒液体模拟
- 保真度接近完全分辨率流行为

## 关键洞察
- 方向性结构信息可以通过椭球分量隐式表示
- 不需要额外的粒子生成开销
- 知识蒸馏框架从高分辨率教师到粗粒学生

## 相关工作链接
- [[Particle-based Liquid Simulation]]
- [[Neural Fluid Enhancement]]
- [[Coarse-graining in Fluid Simulation]]

## 标签
#fluid-simulation #particle-system #liquid-rendering #neural-enhancement
