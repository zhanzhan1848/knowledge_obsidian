---
type: paper
created: 2026-08-04
updated: 2026-08-04
tags: [leidenfrost, droplet, navier-stokes, phase-change, marangoni, evaporation, DNS]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.01828
---

# Leidenfrost droplets: The roles of ambient humidity and internal droplet circulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Leidenfrost droplets: The roles of ambient humidity and internal droplet circulation |
| **作者** | M. de Wildt, A. Prosperetti, C. Diddens, D. Lohse |
| **发表** | arXiv:2608.01828 (physics.flu-dyn) — 2026-08-03; submitted to JFM |
| **链接** | [原文](https://arxiv.org/abs/2608.01828) |
| **DOI** | 10.48550/arXiv.2608.01828 |
| **页数** | 29 pages, 15 figures |

---

## 核心贡献

> 通过直接数值模拟(DNS)分析Leidenfrost水滴在四个数量级液滴半径范围内的特性，揭示环境湿度和内部流动对几何形状和干燥动力学的显著影响

1. 首次在同一计算模型下覆盖四个数量级液滴半径的Leidenfrost效应DNS研究
2. 发现环境湿度（与液滴内部流动结合）对几何形状和干燥动力学有显著影响
3. 通过方位稳定性分析证明轴对称假设导致大Leidenfrost液滴的数值模型与实验偏差

---

## 技术方案

### 核心思想

使用直接数值模拟研究Leidenfrost状态下水滴的完整生命周期，避免先前研究的简化假设（纯蒸汽相和等温液滴）。

### 控制方程（液滴内部）

不可压Navier-Stokes：
```math
ρₗ D𝒖ₗ/Dt = ∇·𝝈ₗ + ρₗ𝒈
𝝈ₗ = -pₗ𝐈 + μₗ(∇𝒖ₗ + (∇𝒖ₗ)ᵀ)
∇·𝒖ₗ = 0
```

能量方程：
```math
ρₗcₚₗ DTₗ/Dt = kₗ∇²Tₗ
```

### 控制方程（气相）

混合气体的质量、动量、能量和组分守恒（蒸汽+气体混合物）

### 关键物理机制

| 机制 | 描述 |
|------|------|
| **Leidenfrost效应** | 液滴在超热表面悬浮于自身蒸汽层上 |
| **环境湿度** | 影响蒸发动力学和液滴形状 |
| **内部流动** | 液滴内部循环（~cm/s，毫米级液滴） |
| **Marangoni流动** | 表面温度梯度引起 |
| **毛细长度** | ℓc = √(γ/ρₗg) |

---

## 主要发现

1. **环境湿度**: 一直被低估的因素，对Leidenfrost系统有重要影响
2. **内部流动**: 与环境湿度共同作用影响几何形状和干燥动力学
3. **轴对称假设**: 对大液滴导致显著偏差（3D模拟证实是方位不稳定）
4. **模型局限性**: 纯蒸汽相和等温液滴假设不充分

---

## 局限性

- 轴对称模型对大液滴不准确
- 未完全考虑热Marangoni效应
- 表面活性剂污染等未纳入

---

## 实现建议

- **实现难度**: 高 (需耦合相变和气液两相流动DNS)
- **预期性能**: 可准确预测Leidenfrost液滴生命周期
- **适用场景**: 喷雾冷却、冶金、表面清洁、热管理

---

## 相关概念

- [[Leidenfrost-effect]]
- [[Phase-change]]
- [[Direct-numerical-simulation]]
- [[Navier-Stokes]]
- [[Marangoni-flow]]
- [[Evaporation]]
- [[Vapour-layer]]
