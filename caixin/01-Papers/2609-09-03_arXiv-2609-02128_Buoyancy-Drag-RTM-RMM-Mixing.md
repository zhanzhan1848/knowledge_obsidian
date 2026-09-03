---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Turbulence, Rayleigh-Taylor, Richtmyer-Meshkov, Mixing, Buoyancy-Drag, ICF]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.02128
---

# Bridging the local and the global: a physically constrained buoyancy--drag model for unified prediction of Rayleigh--Taylor and Richtmyer--Meshkov mixing widths across density ratios

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Bridging the local and the global: a physically constrained buoyancy--drag model for unified prediction of Rayleigh--Taylor and Richtmyer--Meshkov mixing widths across density ratios |
| **作者** | (见原文) |
| **发表** | arXiv 2026-09-03 |
| **链接** | [原文](https://arxiv.org/abs/2609.02128) |
| **arXiv ID** | 2609.02128 |

---

## 核心贡献

> 统一的浮力-曳力模型，跨密度比预测 RT 和 RM 混合层宽度

1. **局部-全局耦合**: 将局部前缘动力学与全局质量守恒结合
2. **独立系数**: 气泡和尖刺前端保持独立的惯性、浮力和曳力系数
3. **无拟合预测**: 给定气泡侧状态，无需针对 RM 重新校准即可交叉预测 RM 尖刺指数

---

## 技术方案

### 核心思想

Rayleigh-Taylor (RT) 和 Richtmyer-Meshkov (RM) 湍流混合层宽度预测是惯性约束聚变和超新星动力学的核心问题。气泡-尖刺不对称、密度比依赖和非稳态驱动对低阶浮力-曳力模型构成持久挑战。

### 关键技术

| 技术 | 说明 |
|------|------|
| Buoyancy-Drag Model | 浮力-曳力模型 |
| RT/RM Mixing | Rayleigh-Taylor / Richtmyer-Meshkov 混合 |
| Similarity Solution | 相似性解 |
| Profile-Shape Parameter c | 剖面形状参数 |

---

## 公式

- 气泡前端方程: 受惯性、浮力、曳力共同作用
- 尖刺前端方程: 同上，独立系数
- 约束条件: 低 Atwood 数对称性 + 高密度比自由落体极限

---

## 实验结论

- **跨密度比**: 统一描述，无需逐案调参
- **应用**: 惯性约束聚变、超新星动力学

---

## 相关工作

- [[Rayleigh-Taylor Instability]] - RT 不稳定性
- [[Richtmyer-Meshkov Instability]] - RM 不稳定性
- [[Turbulent Mixing]] - 湍流混合
- [[ICF]] - 惯性约束聚变

---

## 实现建议

- **实现难度**: 中（模型推导为主）
- **适用场景**: 天体物理、聚变物理
