---
title: "Intermittent turbulence in inclined gravity currents"
arxiv: "2608.16683
date: 2026-08-17
tags: [gravity-currents, intermittent-turbulence, DNS, delay-differential-model, turbulent-boundary-layer]
categories: [gravity-currents, turbulence]
---

# Intermittent Turbulence in Inclined Gravity Currents

## 论文信息
- **arXiv**: 2608.16683
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **关键词**: gravity currents, intermittent turbulence, DNS, delay-differential model, turbulent kinetic energy

## 核心创新点

### 问题背景
- 浅坡上的倾斜重力流可表现出明显的湍流间歇性
- 缺乏对这种间歇性产生机制的完整理解

### 数值方法
- **直接数值模拟 (DNS)**
- 时间重力流
- 初始 Reynolds 数范围: $Re_0$
- 坡角: $0.5^\circ$

### 关键发现 ($Re_0 = 2500$, 坡角 $0.5^\circ$)
1. **间歇性行为**:
   - 外层表现出湍流强度的大的 excursion
   - 湍流和弱湍流状态之间的重复转换

2. **物理解释**:
   - 间歇性与剪切产生和湍流动能耗散之间的有限延迟相关
   - 转换期间：延迟允许湍流瞬态放大
   - 从平均流提取动能，削弱平均剪切
   - 促进夹带驱动的层增长
   - 最终导致再层流化

3. **Reynolds 数效应**:
   - 增加 $Re_0$ 减少延迟
   - 逐渐抑制间歇性
   - 流向更持续的湍流状态

### 理论模型
**自主延迟微分方程模型**:
- 基于平均和湍流动能的耦合演化
- 再现在延迟减少时从间歇性到持续湍流的转换
- 预测在更大的通量 Richardson 数下间歇性增加的趋势

## 评估
- ✅ 推荐：倾斜重力流中间歇性湍流机制的深刻洞察
- 对于环境流体力学（如密度流）和工程应用有价值
