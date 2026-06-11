---
title: "Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps"
alias: Spatiotemporal FLIP
date: 2026-07 (SIGGRAPH 2026 Honorable Mention)
tags: [fluid-simulation, flip-simulation, free-surface, two-phase, large-timestep, siggraph2026]
authors:
  - Bernhard Braun
  - Rene Winchenbach
  - Jan Bender
  - Nils Thuerey
source: SIGGRAPH 2026 Honorable Mention
url: https://s2026.siggraph.org/program/technical-papers/
conference: SIGGRAPH 2026

---

## 核心创新点

### 问题背景
FLIP (Fluid-Implicit Particle) 方法在自由表面和两相模拟中表现优异，但受限于小时间步长以保证稳定性。

### 核心贡献
**时空 FLIP**：允许**非常大的时间步长**进行快速自由表面和两相模拟。

### 技术突破
1. **时空方法**：时空域联合优化
2. **大步长稳定性**：显著大于传统 CFL限制
3. **两相支持**：空气-水两相流
4. **自由表面**：高质量自由表面追踪

## 渲染技术分析

### 渲染类型
- [x] 粒子渲染
- [ ] 体积渲染
- [ ] 表面渲染

### 渲染方法
- **技术**：FLIP + 时空优化
- **方法**：Spatiotemporal FLIP for large time steps
- **应用**：自由表面、两相流

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐⭐ (高精度两相模拟) |
| 风格化支持 | 否 |
| 帧率 | 大幅提升（允许大步长） |
| GPU需求 | 中等-高 |
| 内存占用 | 取决于模拟规模 |

## 实现建议

- 着色器复杂度：中等
- 管线要求：粒子模拟管线
- 推荐度：✅✅（Honorable Mention）

## 关键词
- FLIP
- Free-surface simulation
- Two-phase simulation
- Large time steps
- Spatiotemporal optimization
- Fluid simulation

## 相关资源
- Honorable Mention - SIGGRAPH 2026
- Authors: Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey