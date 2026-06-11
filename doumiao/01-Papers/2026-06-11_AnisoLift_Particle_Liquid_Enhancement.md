---
title: "Anisotropic Latent Representations for Coarse Particle Liquid Enhancement"
alias: AnisoLift
date: 2026-06-09
tags: [fluid-simulation, particle-rendering, liquid-simulation, machine-learning, graphics]
authors:
  - Zhengqing Gao
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.10473
pdf: https://arxiv.org/pdf/2606.10473
---

## 核心创新点

### 问题背景
基于粒子的液体模拟在图形学和物理建模中广泛应用，但高分辨率 rollout 计算成本高昂。现有方法通过额外粒子生成来恢复细粒度动力学，但计算开销大且表示质量差。

### 核心贡献：AnisoLift
**结构化潜在闭合框架**，为每个粗粒子配备**可学习的各向异性椭球组件**，无需引入额外粒子即可从底层高分辨率流中捕获方向性局部结构。

### 技术方法
1. **各向异性椭球组件**：为粗粒子添加可学习的椭球体表示
2. **残差修正预测**：给定粗模拟，预测粒子状态的残差修正，使其更接近对齐的高分辨率教师状态
3. **联合训练目标**：同时监督粒子动力学和各向异性几何结构

## 渲染技术分析

### 渲染类型
- [x] 粒子渲染
- [ ] 体积渲染
- [ ] 表面渲染

### 渲染方法
- **技术**：基于粒子的液体模拟增强
- **方法**：Latent closure framework + anisotropic ellipsoidal components
- **监督**：联合动力学+几何结构

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐⭐ (增强到完全分辨率流行为) |
| 风格化支持 | 否 |
| 帧率 | N/A (离线模拟增强) |
| GPU需求 | 中等 |
| 内存占用 | 低于全分辨率粒子模拟 |

## 实现建议

- 着色器复杂度：低（不涉及着色器）
- 管线要求：深度学习框架 +粒子模拟
- 推荐度：✅

## 关键词
- Particle-based liquid simulation
- Latent closure
- Anisotropic representation
- Coarse-to-fine fluid enhancement
- Neural simulation

## 相关资源
- Authors: Zhengqing Gao
- Submission: Tue, 9 Jun 2026
- Category: cs.GR