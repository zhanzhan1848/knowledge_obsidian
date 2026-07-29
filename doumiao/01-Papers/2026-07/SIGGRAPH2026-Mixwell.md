---
type: paper
created: 2026-07-29
updated: 2026-07-29
tags: [fluid-simulation, 2D-fluid, brush, mixing, real-time, GPU-acceleration]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://kesen.realtimerendering.com/sig2026.html
---

# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing |
| **作者** | - |
| **发表** | SIGGRAPH/TOG 2026 |
| **链接** | [SIGGRAPH 2026 Papers](https://kesen.realtimerendering.com/sig2026.html) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 提出 Mixwell，一个用于渐进式基于物理的流体混合的锐利 2D 流体笔刷系统

1. **锐利 2D 流体笔刷**：专为数字绘画设计的高质量流体效果
2. **基于圆柱齿的势流分析**：源自圆柱齿周围的势流评估漂移
3. **GPU 加速解析方法**：每个样本无网格或中间重采样的漂移评估
4. **实时任意分辨率**：支持实时、任意分辨率的流体混合，数值耗散可忽略

---

## 技术方案

### 核心思想

数字绘画中的流体效果通常需要复杂的模拟和渲染技术。Mixwell 通过势流理论提供了一种高效且视觉质量高的方法。

**核心方法**：
- 基于圆柱形齿（cylindrical tines）周围的势流分析
- 每个样本独立评估漂移，无需网格或中间重采样
- GPU 加速实现实时性能

### 关键技术

| 技术 | 说明 |
|------|------|
| Potential flow | 势流理论 |
| Cylindrical tines | 圆柱齿几何 |
| GPU-accelerated | GPU 加速解析计算 |
| Resolution-independent | 任意分辨率支持 |

---

## 实验结论

- **实时性能**：支持实时、任意分辨率的流体混合
- **数值耗散低**：使用解析方法实现可忽略的数值耗散
- **创意控制**：适合数字绘画和艺术创作的流体效果
- **生产就绪**：可集成到数字绘画软件中

---

## 局限性

- 主要针对 2D 流体
- 专注于混合/绘画类应用

---

## 相关工作

- [[Fluid Painting]]
- [[Potential Flow]]
- [[Real-time Fluid Rendering]]
- [[GPU Fluid Simulation]]

---

## 实现建议

- **实现难度**: 中（基于势流理论）
- **预期性能**: 实时，适合交互式应用
- **适用场景**: 
  - 数字绘画软件中的流体笔刷
  - 实时流体混合效果
  - 艺术创作工具
