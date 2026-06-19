---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, rendering, light-tracing, luminaires, neural]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.04319
---

# PureLight: Learning Complex Luminaires with Light Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PureLight: Learning Complex Luminaires with Light Tracing |
| **作者** | Pedro Figueirêdo et al. |
| **发表** | arXiv:2606.04319 [cs.GR], submitted Wed, 3 Jun 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.04319) |
| **DOI** | https://doi.org/10.48550/arXiv.2606.04319 |
| **代码** | - |

---

## 核心贡献

> 使用光追 tracer 构建发光体路径，用大规模 Normalizing Flow 网络学习出口表面辐射率分布，解决复杂发光体（如多层玻璃包裹的小型光源）在低采样数下的渲染难题

1. **光追构建路径**：从发光体出发追踪到出口表面，构建 emitter→exit surface 路径
2. **Normalizing Flow 学习外观**：用大规模归一化流网络建模出口表面辐射率的概率密度函数 (pdf)
3. **MLP 蒸馏推理**：将复杂 Flow 网络蒸馏为轻量 MLP，直接估计出口表面 radiance
4. **复合渲染管线**：采样网络 + 混合网络，支持将发光体自然融入任意场景

---

## 技术方案

### 核心思想

复杂发光体（如封闭在多层磨砂玻璃内的小灯泡、 crystals 包裹的灯珠）具有复杂光传输行为，传统双向路径追踪难以高效渲染。

方法流程：
1. **Light Tracing**：从发光体追踪到 exit surfaces，建立 path set
2. **分布学习**：用 Normalizing Flow 建模 exit surface 上 outgoing radiance 的 pdf，将 radiance 估计转为分布学习
3. **Radiance 恢复**：outgoing radiance = estimated pdf × flux
4. **MLP 蒸馏**：将 Flow 网络蒸馏为轻量 MLP，支持高效推理
5. **采样 + 混合**：训练采样网络计算直接光照，混合网络将发光体复合到场景

### 关键技术

| 技术 | 说明 |
|------|------|
| Light Tracing | 从发光体追踪路径，专门处理复杂光传输 |
| Normalizing Flow | 大规模归一化流网络建模 radiance 分布 |
| MLP Distillation | 蒸馏为轻量 MLP，支持实时推理 |
| Sampling Network | 有效直接光照采样 |
| Blending Network | 将发光体自然融入场景 |

---

## 实验结论

- 在 Bedroom（镂空 Medieval 灯具）和 Dining Room（层状 Modern 灯具）场景验证
- 相比 BDPT，在低采样数下能更好地处理复杂 luminaires 的锐利图案投影

---

## 局限性

- 需要提前对特定 luminaire 类型进行训练
- 对非典型几何的泛化能力有待验证

---

## 实现建议

- **实现难度**: 中（依赖 Normalizing Flow 训练流程）
- **预期性能**: 复杂 luminaires 低采样渲染质量显著提升
- **适用场景**: 建筑渲染、产品渲染中的复杂灯具
- **优先级**: 中高（实用性强，解决实际痛点）
