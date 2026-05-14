---
type: paper
created: 2026-05-14
updated: 2026-05-14
tags: [paper, rendering, time-of-flight, ReSTIR, transient rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.11536
---

# Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling |
| **作者** | (待获取) |
| **发表** | arXiv cs.GR, 2026-05-12 |
| **链接** | [原文](https://arxiv.org/abs/2605.11536) |

---

## 核心贡献

> 一句话总结：提出路径长度感知的shift mapping技术，将ReSTIR扩展到时域光传输渲染

1. 路径长度感知的shift mapping：基于Newton方法调整复用光路以满足时间门控约束
2. 空时域Reservoir复用框架：适用于时域光传输的Monte Carlo渲染
3. 支持交互帧率的时间门控和瞬态渲染

---

## 技术方案

### 核心思想

现有ToF渲染方法计算成本高，难以扩展到复杂动态场景。本文借鉴ReSTIR（实时辐射度复用）技术，将其扩展到时域光传输渲染。关键挑战是复用路径经常违反光路长度约束。

### 关键技术

| 技术 | 说明 |
|------|------|
| 路径长度感知Shift Mapping | 几何变换，调整复用光路满足时间门控约束，受稳态焦散渲染的镜面流形探索启发 |
| 空时域Reservoir复用 | 在时间和空间上复用光路样本 |
| Newton方法 | 用于计算满足光路长度约束的shift |

---

## 实验结论

- 在复杂场景（含 glossy/specular 材质和动态运动）中效率显著提升
- 支持交互帧率的时间门控和瞬态渲染
- 应用于形状重建和导航

---

## 局限性

- 依赖特定的光路长度约束
- 性能提升与场景复杂度相关

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 交互帧率 (数十fps)
- **适用场景**: ToF成像、瞬态渲染、导航

---