---
title: "Feature-Driven Water Motion Recovery for Parametric Modeling and Simulation Coupling"
alias: Water Feature Recovery
date: 2026-07 (SIGGRAPH 2026)
tags: [water-simulation, feature-driven, parametric, fluid-rendering, siggraph2026]
authors:
  - Sam Cole
  - Nicholas Illingworth
  - Alexey Stomakhin
  - Sean Flynn
source: SIGGRAPH 2026 (Wētā FX)
url: https://beforesandafters.com/2026/05/14/more-of-the-siggraph-2026-schedule-has-been-published/
conference: SIGGRAPH 2026

---

## 核心创新点

### 问题背景
从参考视频或捕捉数据中恢复时间一致的水运动用于参数化建模和模拟耦合是一个难题。

### 核心贡献
**特征驱动方法**从输入数据中恢复时间一致的水运动，支持稳定的参数化建模和模拟耦合。

### 技术突破
1. **特征驱动**：从数据中提取水运动特征
2. **时间一致性**：稳定的时序水运动
3. **模拟耦合**：与后续物理模拟无缝耦合

## 渲染技术分析

### 渲染类型
- [ ] 粒子渲染
- [ ] 体积渲染
- [x] 表面渲染 (water surface)
- [ ] 实时渲染

### 渲染方法
- **技术**：特征驱动水运动恢复
- **方法**：Parametric modeling + simulation coupling
- **应用**：水模拟、视觉特效

## 性能预期

| 指标 | 说明 |
|------|------|
| 逼真度 | ⭐⭐⭐⭐⭐ (Wētā FX 工业级质量) |
| 风格化支持 | 是 |
| 帧率 | 离线（工业制作） |
| GPU需求 | 高 |
| 内存占用 | 高 |

## 实现建议

- 着色器复杂度：中等
- 管线要求：特征提取 + 物理模拟
- 推荐度：✅✅

## 关键词
- Water simulation
- Feature-driven
- Parametric modeling
- Motion capture
- VFX
- Wētā FX

## 相关资源
- Authors: Sam Cole, Nicholas Illingworth, Alexey Stomakhin, Sean Flynn (Wētā FX)
- Source: beforesandafters.com