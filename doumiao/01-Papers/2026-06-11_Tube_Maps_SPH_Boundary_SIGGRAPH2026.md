---
title: "Tube Maps: Fast SPH Boundary Handling with Tubular Coordinates"
alias: Tube Maps
date: 2026-07 (SIGGRAPH 2026)
tags: [fluid-simulation, sph, boundary-handling, particle-rendering, siggraph2026]
authors:
  - (待补充)
source: SIGGRAPH 2026
url: https://gatc.cs.columbia.edu/projects/tubemaps.html
conference: SIGGRAPH 2026

---

## 核心创新点

### 问题背景
SPH (Smoothed Particle Hydrodynamics) 模拟中，边界处理效率和精度是关键挑战。传统方法计算成本高或精度有限。

### 核心贡献
**Tube Maps**：使用**管状坐标**进行快速 SPH 边界处理。

### 技术突破
1. **管状坐标**：将边界表示为管状结构
2. **快速处理**：显著加速边界计算
3. **SPH 兼容**：与标准 SPH 方法兼容

## 渲染技术分析

### 渲染类型
- [x] 粒子渲染 (SPH)
- [ ] 体积渲染
- [ ] 表面渲染

### 渲染方法
- **技术**：SPH + 管状坐标
- **方法**：Tubular coordinate boundary handling
- **应用**：SPH 流体模拟

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐ (准确的边界处理) |
| 风格化支持 | 否 |
| 帧率 | 显著提升（边界计算加速） |
| GPU需求 | 中等 |
| 内存占用 | 取决于模拟规模 |

## 实现建议

- 着色器复杂度：低-中
- 管线要求：SPH 粒子系统
- 推荐度：✅

## 关键词
- SPH (Smoothed Particle Hydrodynamics)
- Boundary handling
- Tubular coordinates
- Fluid simulation
- Particle methods

## 相关资源
- Authors: Columbia GATL
- Reference: https://gatc.cs.columbia.edu/projects/tubemaps.html