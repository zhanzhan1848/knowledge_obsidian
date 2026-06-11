---
title: "Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing"
alias: Mixwell
date: 2026-07 (SIGGRAPH 2026)
tags: [fluid-simulation, fluid-rendering, real-time, brush-tool, physics-based, siggraph2026]
authors:
  - Doug James
  - Ethan James
source: SIGGRAPH 2026 Best Paper
url: https://s2026.siggraph.org/program/technical-papers/
conference: SIGGRAPH 2026

---

## 核心创新点

### 问题背景
流体混合（fluid mixing）在艺术创作和交互式应用中常见，但传统方法受限于网格分辨率或中间重采样。

### 核心贡献
**Mixwell**：用于**渐进式、基于物理的流体混合**的**锐利2D 流体画笔**，结合 GPU 加速的解析方法。

### 技术突破
1. **解析方法**：基于圆柱齿周围的势流（potential flow）推导
2. **无网格/无重采样**：每个采样直接评估 drift
3. **任意分辨率**：分辨率独立，实时性能
4. **极小数值耗散**： negligible numerical dissipation

## 渲染技术分析

### 渲染类型
- [ ] 粒子渲染
- [ ] 体积渲染
- [x] 表面渲染（2D fluid surface）
- [x] 实时渲染

### 渲染方法
- **技术**：势流解析解 + GPU 加速
- **方法**：Sharp 2D fluid brushes, progressive physics-based mixing
- **创新**：无网格中间表示

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐⭐ (解析方法保证精度) |
| 风格化支持 | 是（画笔工具） |
| 帧率 | 实时 |
| GPU需求 | 中等（GPU 加速） |
| 内存占用 | 低（无需网格存储） |

## 实现建议

- 着色器复杂度：中等
- 管线要求：GPU 计算流体
- 推荐度：✅✅（Best Paper）

## 关键词
- Fluid mixing
- Real-time fluid
- Progressive physics
- Sharp fluid brushes
- Potential flow
- GPU-accelerated
- Resolution-independent

## 相关资源
- Best Paper Award - SIGGRAPH 2026
- Authors: Doug James, Ethan James
- Session: [Attend the session](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108)