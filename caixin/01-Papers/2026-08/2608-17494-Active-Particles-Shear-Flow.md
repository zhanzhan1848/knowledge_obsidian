---
title: "Steady transport of active particles under continuous release in confined shear flow"
arxiv: "2608.17494"
date: 2026-08-19
tags: [active-matter, shear-flow, Smoluchowski-equation, transport, swimming-particles, bio-convection]
categories: [active-matter, particle-transport]
---

# Steady Transport of Active Particles in Confined Shear Flow

## 论文信息
- **arXiv**: [2608.17494](https://arxiv.org/abs/2608.17494)
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **关键词**: active particles, shear flow, Smoluchowski equation, transport theory, swimming

## 核心创新点

### 问题背景
- 连续释放是传输中的基本源条件
- 现有理论处理：下游浓度发展（被动示踪剂）或充分发展的活性粒子横截面分布
- 本文：解决从入口到远场的稳态传输问题

### 理论框架
1. **基础方程**: Smoluchowski 方程（描述活性粒子的概率密度演化）
2. **边界值问题**: 
   - 点源入口通量
   - 边界条件
3. **求解方法**: 
   - 流线坐标与横截面变量分离
   - 非自伴随广义特征值问题
   - Galerkin 谱框架求解
   - 加权双正交展开确定下游允许模式系数

### 关键发现 (Poiseuille 流动，对流主导条件)
1. **位置-方向相干性**: 
   - 早期发展区域存在明显的 position-orientation coherence
   - 游泳和剪切重定向驱动种群经历连续的角阶段

2. **浓度分布演化**:
   - 早期：交替的偏心和中心积累区域
   - 下游：分散逐渐减弱相干性

3. **颗粒伸长效应**:
   - 增强取向对齐
   - 产生早期三峰垂直分布
   - 下游横向积累更强、更持久
   - 抑制次级中心积累

4. **纵向边缘浓度**:
   - 非单调变化（反映平均纵向速度变化）
   - 远场极限由渐近漂移速度的倒数给出

## 数值验证
- 与个体基模拟的出色一致性验证理论

## 评估
- ✅ 推荐：活性粒子在剪切流中传输的完整理论框架
- 对于理解生物流体动力学和活性物质有重要价值
