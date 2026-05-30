---
title: Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing
authors:
  - Doug James
  - Ethan James
venue: SIGGRAPH 2026 / Best Paper Award
date: 2026-07
type: fluid-simulation
tags:
  - fluid simulation
  - 2D fluid brushes
  - GPU acceleration
  - physics-based mixing
  - potential flow
  - resolution-independent
---

## 核心贡献

Mixwell 引入了**锋利的2D流体画笔**和**GPU加速的解析方法**，用于渐进式、分辨率无关的物理基流体混合。

## 技术要点

### 方法
- 基于圆柱形齿（cylindrical tines）周围势流（potential flow）的解析推导
- 每个采样点独立评估漂移，无需网格或中间重采样
- 实现实时、任意分辨率的流体混合与渲染
- 数值耗散极低

### 创新点
1. **Sharp 2D Fluid Brushes** — 锋利的2D流体画笔
2. **GPU-accelerated Analytical Methods** — GPU加速的解析方法
3. **Progressive, Resolution-independent** — 渐进式、分辨率无关
4. **Negligible numerical dissipation** — 可忽略的数值耗散

## 渲染方法
- 类型：2D 表面/粒子
- 技术：势流 + 流体画笔

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：是

## 性能预期
- 帧率：实时
- GPU 需求：GPU加速
- 内存占用：低

## 实现建议
- 着色器复杂度：中
- 管线要求：GPU计算
- 推荐度：✅

## 链接
- SIGGRAPH 2026: https://s2026.siggraph.org/program/technical-papers/
- Paper Session: https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

## 相关概念
[[fluid simulation]] [[potential flow]] [[GPU fluid]]
