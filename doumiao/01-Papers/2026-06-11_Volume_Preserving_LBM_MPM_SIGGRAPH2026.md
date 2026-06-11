---
title: "Volume-Preserving LBM-MPM Coupling for Air-Water-Sand Mixtures"
alias: LBM-MPM Coupling
date: 2026-07 (SIGGRAPH 2026)
tags: [fluid-simulation, multi-phase, lbm, mpm, sand-simulation, siggraph2026]
authors:
  - (待补充)
source: SIGGRAPH 2026
url: https://pages.saclay.inria.fr/mathieu.desbrun/m@pubs.html
conference: SIGGRAPH 2026

---

## 核心创新点

### 问题背景
空气-水-沙混合物模拟在自然现象中常见，但耦合不同物理方法（如 LBM 和 MPM）存在体积守恒等挑战。

### 核心贡献
**体积守恒的 LBM-MPM 耦合方法**用于空气-水-沙混合物模拟。

### 技术突破
1. **LBM-MPM 耦合**：结合格子玻尔兹曼方法 (LBM) 和物质点方法 (MPM)
2. **体积守恒**：保持混合物各相体积
3. **三相模拟**：空气 + 水 + 沙

## 渲染技术分析

### 渲染类型
- [x] 粒子渲染 (MPM)
- [ ] 体积渲染
- [x] 表面渲染

### 渲染方法
- **技术**：LBM-MPM 耦合
- **方法**：体积守恒多相流
- **应用**：空气-水-沙混合物

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐⭐ (物理准确的多相模拟) |
| 风格化支持 | 否 |
| 帧率 | 取决于规模 |
| GPU需求 | 高 |
| 内存占用 | 高 |

## 实现建议

- 着色器复杂度：中等
- 管线要求：多物理耦合
- 推荐度：✅

## 关键词
- LBM (Lattice Boltzmann Method)
- MPM (Material Point Method)
- Multi-phase simulation
- Air-water-sand
- Volume preserving
- Fluid-structure coupling

## 相关资源
- Authors: Mathieu Desbrun et al. (INRIA Saclay)
- Reference: https://pages.saclay.inria.fr/mathieu.desbrun/m@pubs.html