---
type: paper
created: 2026-07-29
updated: 2026-07-29
tags: [fluid-simulation, FLIP, SPH, large-time-step, free-surface]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://s2026.siggraph.org
---

# Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps |
| **作者** | Bernhard Braun, Rene Winchenbach, Nils Thuerey (Technical University Munich), Jan Bender (RWTH Aachen University) |
| **发表** | SIGGRAPH 2026 (Honorable Mention - Technical Papers Awards) |
| **链接** | [SIGGRAPH 2026 Schedule](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_174&sess=sess108) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 提出时空 FLIP (ST-FLIP)，通过将粒子视为四维时空中的样本，实现比传统求解器大一个数量级的时间步长

1. **时空扩展 FLIP**：将粒子视为 4D 时空中的样本
2. **超大时间步长**：时间步长比传统求解器大**最高一个数量级**
3. **多倍加速**：在单工作站上运行数十亿粒子模拟时实现**数倍加速**
4. **保持表面细节**：保持详细的表面结构和视觉保真度
5. **轻量级插件**：设计为现有 FLIP、PIC 和 APIC 求解器的轻量级插件

---

## 技术方案

### 核心思想

流体-隐式粒子(FLIP)模拟方法是视觉特效中广泛使用的流体模拟技术。然而，传统 FLIP 受到时间步长大小的限制，需要在效率和精度之间权衡。

**ST-FLIP 解决方案**：通过时空扩展，将时间维度作为第四维处理，突破时间步长限制。

### 关键技术

| 技术 | 说明 |
|------|------|
| Spatiotemporal FLIP | 将粒子样本扩展到 4D 时空 |
| Large time steps | 支持超大时间步长 |
| Free-surface simulation | 自由表面模拟 |
| Two-phase simulation | 两相模拟 |

---

## 实验结论

- **时间步长提升**：时间步长比传统方法大**高达 10 倍**
- **加速比**：单工作站上多亿粒子模拟实现**数倍加速**
- **视觉质量**：保持详细的表面结构和视觉保真度
- **生产就绪**：作为轻量级插件，降低了大规模流体模拟的门槛

---

## 局限性

- 主要针对液体模拟
- 需要现有的 FLIP/PIC/APIC 求解器基础

---

## 相关工作

- [[FLIP Fluid Simulation]]
- [[PIC Method]]
- [[APIC Method]]
- [[Free-surface Flow]]

---

## 实现建议

- **实现难度**: 中（作为现有求解器的扩展）
- **预期性能**: 时间步长提升 10x，整体模拟速度数倍提升
- **适用场景**: 
  - 电影/视觉特效中的大规模液体模拟
  - 游戏中的实时流体预览
  - 需要快速迭代的生产环境
