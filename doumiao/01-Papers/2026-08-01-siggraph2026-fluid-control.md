# Fluid Control with Localized Spacetime Windows

> **日期**: 2026-07 (SIGGRAPH 2026 课程)  
> **来源**: Physics-Based Animation Blog  
> **关键词**: fluid control, spacetime, optimization, fluid simulation  
> **链接**: https://www.physicsbasedanimation.com/2026/07/09/fluid-control-with-localized-spacetime-windows/  
> **标签**: #fluid-control #spacetime-optimization #SIGGRAPH2026

## 概述

本文为 SIGGRAPH 2026 物理动画课程的一部分，介绍了一种基于**局部时空窗口（Localized Spacetime Windows）**的流体控制方法。

## 核心思想

时空窗口允许在局部时空区域内进行优化，而非整个时空域。从而：
- 降低优化维度
- 支持局部控制（如控制特定区域的流体行为）
- 可与 ST-FLIP 等大时间步方法结合

## 与流体渲染关联

流体控制是**表面渲染**和**粒子渲染**的重要上游技术：
- 控制泡沫/飞溅的位置和时机
- 引导流体形成特定形状
- 与 ST-FLIP 的大时间步互补

## 参考文献

SIGGRAPH 2026 Course on Physics-Based Animation
