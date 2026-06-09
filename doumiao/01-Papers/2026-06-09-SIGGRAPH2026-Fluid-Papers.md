# SIGGRAPH 2026 流体渲染相关论文

> 日期: 2026-06-09
> 来源: SIGGRAPH 2026 Technical Papers Awards
> 搜索关键词: fluid simulation, rendering, free-surface, FLIP

---

##1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**类别:** 表面渲染 + 流体模拟
**奖项:** SIGGRAPH 2026 Best Paper
**作者:** Doug James, Ethan James

### 核心创新
- 提出 sharp 2D fluid brushes概念
- GPU加速的解析方法 (analytical methods)
- progressive, resolution-independent physics-based mixing
- 基于圆柱绕流的势流计算 (potential flow around cylindrical tines)
- 评估 drift per sample，无需网格或中间重采样

### 技术细节
- **渲染方法:** 表面渲染 / 粒子
- **关键技术:** 势流解析计算、GPU加速、无网格方法
- **性能:** real-time, arbitrary-resolution fluid mixing
- **特点:** negligible numerical dissipation

### 适用场景
- 2D 流体混合效果
- 艺术化流体创作工具
- 实时流体模拟

### URL
https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

---

## 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**类别:** 粒子渲染 + 表面渲染
**奖项:** SIGGRAPH 2026 Honorable Mention
**作者:** Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey

### 核心创新
- 时空 FLIP 方法
- 支持非常大的时间步长
- 快速自由表面模拟
- 两相流模拟

### 技术细节
- **渲染方法:** 粒子渲染 (FLIP)
- **关键技术:** FLIP (Fluid Implicit Particle)、时空方法、大时间步长
- **性能:** Fast simulation
- **特点:** 支持两相流、非常大的时间步

### 适用场景
- 实时自由表面流体模拟
- 水体飞溅效果
- 大规模流体模拟

### URL
https://s2026.siggraph.org/program/technical-papers/

---

## 渲染方法总结

| 论文 | 类型 | 技术 | 实时性 |
|------|------|------|--------|
| Mixwell | 表面/粒子 | 势流解析、无网格 | ✅ Real-time |
| Spatiotemporal FLIP | 粒子 | FLIP、大时间步 | ✅ Fast |

---

## 关键词标签
#SIGGRAPH2026 #fluid-simulation #FLIP #particle-system #real-time #free-surface