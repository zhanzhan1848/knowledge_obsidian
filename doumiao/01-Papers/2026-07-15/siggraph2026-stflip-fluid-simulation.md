---
title: "Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps"
conference: SIGGRAPH 2026
authors: Bernhard Braun, Rene Winchenbach, Nils Thuerey (TU Munich), Jan Bender (RWTH Aachen)
date: 2026-07 (Conference: July 19-23, Los Angeles)
award: Honorable Mention - SIGGRAPH 2026 Technical Papers Awards
tags: [fluid-simulation, FLIP, free-surface, two-phase, large-timestep]
---

## 核心创新点

SIGGRAPH 2026 论文，提出 **ST-FLIP** (Spatiotemporal FLIP)，将粒子视为四维时空中的样本，使时间步长比传统求解器大 **一个数量级**。

### 技术要点

1. **时空粒子表示**：
   - 将 FLIP 粒子扩展到 4D 时空
   - 保持时空一致性

2. **大步长时间步**：
   - 时间步长提升 **10x**
   - 多十亿粒子模拟在单工作站上实现数倍加速

3. **兼容性**：
   - 作为轻量级插件兼容现有 FLIP、PIC、APIC 求解器
   - 降低生产环境大规模流体模拟门槛

### 性能指标

| 指标 | 表现 |
|------|------|
| 时间步长提升 | 10x |
| 速度提升 | 数倍 |
| 规模 | 单工作站十亿粒子 |
| 质量保持 | 详细表面结构和视觉保真度 |

### 适用场景

- 电影/VFX 团队
- 高分辨率预览快速迭代
- 大规模液体模拟生产流程

### 引用

> "For a film or visual-effects team, this can mean faster high-resolution previews, more creative iterations, and final simulations that fit more comfortably within a production schedule."

### 链接

- SIGGRAPH 2026: https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_174&sess=sess108

---

## 相关工作对比

| 方法 | 时间步长 | 可扩展性 | 兼容性 |
|------|----------|----------|--------|
| ST-FLIP (本文) | 10x larger | 单工作站十亿粒子 | FLIP/PIC/APIC |
| 传统 FLIP | baseline | 受 CFL 限制 | - |
| Adaptive Fluid Cohomology | 自适应 | 内存降低86% | - |

---

## 渲染关联

ST-FLIP 提升的是模拟性能，渲染端仍需：
- 表面重建 (Marching Cubes, Screen Space)
- 反射/折射着色
- 焦散 (Caustics)
- 体积光照

可配合 Ray Marching 或粒子渲染管线使用。
