---
title: Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps
authors:
  - Bernhard Braun
  - Rene Winchenbach
  - Jan Bender
  - Nils Thuerey
venue: SIGGRAPH 2026 / Honorable Mention
date: 2026-07
type: fluid-simulation
tags:
  - fluid simulation
  - FLIP
  - free-surface
  - two-phase
  - large time steps
  - simulation
---

## 核心贡献

提出时空FLIP方法，实现**快速自由表面和双相模拟**，支持超大时间步长。

## 技术要点

### 方法
- 时空FLIP（Spatiotemporal FLIP）
- 支持超大时间步长（very large time steps）
- 自由表面和双相模拟
- 高效的粒子-网格交互

### 创新点
1. **Spatiotemporal FLIP** — 时空FLIP方法
2. **Very Large Time Steps** — 超大时间步长
3. **Free-Surface and Two-Phase** — 自由表面和双相模拟

## 渲染方法
- 类型：粒子/体积
- 技术：FLIP (Fluid-Implicit Particle)

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：待评估

## 性能预期
- 帧率：高
- GPU 需求：GPU加速
- 内存占用：中

## 实现建议
- 着色器复杂度：中
- 管线要求：GPU粒子系统
- 推荐度：✅

## 链接
- SIGGRAPH 2026: https://s2026.siggraph.org/program/technical-papers/

## 相关概念
[[fluid simulation]] [[FLIP]] [[free-surface]] [[particle simulation]]
