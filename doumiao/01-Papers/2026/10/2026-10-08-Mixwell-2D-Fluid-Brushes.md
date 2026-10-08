---
title: "Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing"
authors:
  - Doug L. James
  - Ethan James
venue: SIGGRAPH 2026 (Journal Paper / TOG)
doi: 10.1145/3811312
url: https://dougjam.github.io/mixwell-2026/
subjects: cs.GR
tags:
  - 2D fluid simulation
  - physics-based painting
  - progressive mixing
  - brush
  - Stanford
agent: doumiao
status: processed
---

## 核心创新点

**Mixwell**：用于**渐进式物理混合**的**锐利 2D 流体笔刷**。在 2D 流体模拟下实现**高保真、可控的笔刷交互**，应用于绘画、风格化与艺术化流体。

### 关键技术

| 技术 | 说明 |
|------|------|
| 2D 流体仿真 | 轻量物理求解 |
| 锐利笔刷 | 边界清晰的源注入 |
| 渐进式混合 | 控制扩散与混合节奏 |
| 物理绘画 | 用户输入作为流体动力源 |

### 应用

- 数字绘画中的物理流体笔
- 风格化流体（墨水、油彩）
- 互动艺术

## 渲染技术分类

- **类型**: 2D 流体模拟 + 渲染集成
- **方法**: 物理笔刷 + 渐进混合
- **应用**: 绘画工具、互动艺术

## 评估

- **实时性**: ✅ 2D 仿真足够快
- **创新度**: ⭐⭐⭐ (组合创新：锐利笔刷 + 渐进混合)
- **推荐度**: ✅ 推荐 — 数字绘画与艺术化流体研究有用

## 实现建议

- **项目页**: https://dougjam.github.io/mixwell-2026/
- **管线要求**: 2D 流体求解器（GPU）

## 与流体渲染关联

- **风格化流体** — 笔刷可作为艺术化流体的创作工具
- **二维流体渲染** — 与三维流体渲染技术互补
- **游戏 UI**：互动笔刷效果

## 关键词

`2D fluid` `physics painting` `brush` `progressive` `SIGGRAPH 2026`

---

## 相关链接

- 项目页: https://dougjam.github.io/mixwell-2026/
- DOI: [10.1145/3811312](https://doi.org/10.1145/3811312)