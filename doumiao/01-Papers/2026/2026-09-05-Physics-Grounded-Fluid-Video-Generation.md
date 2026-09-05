---
title: "Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision"
authors:
  - Ruijie Su
  - et al.
date: 2026-07-28
arxiv: 2607.25321
subjects: cs.AI
tags:
  - fluid simulation
  - video generation
  - diffusion model
  - optical flow
  - particle system
  - MPM
  - sloshing
  - pouring
---

## 核心创新点

解决**视频扩散模型违反基本流体物理**的问题（如液体在空中断裂、泼溅不尊重动量/重力）。

### 核心问题

视频扩散模型学习模仿流体**外观**而非流体**动力学**：
- 液柱在空中断裂
- 容器水位不随注入上升
- 泼溅无视动量/重力

### 两项贡献

1. **物理仿真流体数据集**
   - 1,638个MPM模拟的倾倒/晃动视频
   - 2,320个库存 footage 真实倾倒视频
   - 1,515视频真实视频基准测试

2. **双流image-to-video架构**
   - RGB解码器 + 光流解码器分支
   - 端点误差 + 平滑度损失
   - 零初始化卷积融合
   - 仅更新两个解码器，骨干冻结

### 技术指标

- VideoPhy-2 Physical-Commonsense: +8.75分
- Video-Quality: +4.65分
- 端点误差: 0.54像素 (in-distribution)
- 两种规模: 1.3B 和 14B 参数

### 渲染技术分类

- **类型**: 粒子渲染 / 体积渲染 (MPM模拟)
- **方法**: MPM (Material Point Method) + Diffusion + Optical Flow
- **应用**: 流体视频生成、AI生成

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐ (物理合理)
- **创新度**: ⭐⭐⭐⭐⭐ (物理引导的视频生成)
- **应用价值**: 解决AI生成流体的物理一致性问题

## 关键词

`fluid simulation` `video generation` `diffusion model` `optical flow` `MPM` `physics-grounded`
