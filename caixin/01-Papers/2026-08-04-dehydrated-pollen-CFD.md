---
type: paper
created: 2026-08-04
updated: 2026-08-04
tags: [CFD, pollen, drag-coefficient, heat-transfer, navier-stokes, openfoam]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.02360
---

# Aerodynamic Drag and Heat Transfer Corrections for Dehydrated Pollen Particles: CFD-Based Modeling of Airborne Allergen Transport in Smart Urban Environments

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Aerodynamic Drag and Heat Transfer Corrections for Dehydrated Pollen Particles: CFD-Based Modeling of Airborne Allergen Transport in Smart Urban Environments |
| **作者** | Omar Hamad, Samer Ali, Mahmoud Khaled, Talib Dbouk |
| **发表** | arXiv:2608.02360 (physics.flu-dyn) — 2026-08-03 |
| **链接** | [原文](https://arxiv.org/abs/2608.02360) |
| **DOI** | 10.48550/arXiv.2608.02360 |
| **代码** | OpenFOAM (rhoSimpleFoam) |

---

## 核心贡献

> 首次使用高保真CFD模拟评估真实脱水泥花粉颗粒的空气动力学曳力和对流换热

1. 首次对真实脱水泥花粉颗粒进行形态学解析的CFD空气动力学建模
2. 发现干花粉曳力系数比球形假设高8%-15%，努塞尔数低5%-15%
3. 证明传统球形相关式不适用于模拟干花粉Lagrangian输运和蒸发

---

## 技术方案

### 核心思想

使用OpenFOAM的rhoSimpleFoam求解器对Betula pendula（银桦）花粉颗粒周围的非球形流动进行高保真CFD模拟，考虑温度引起的密度变化（可达15%）。

### 关键数值方法

| 技术 | 说明 |
|------|------|
| **求解器** | rhoSimpleFoam (稳态、可压缩、非等温) |
| **离散化** | 有限体积法 (FVM)，cell-centered |
| **网格生成** | snappyHexMesh |
| **流动状态** | 层流 (Rep ≤ 15)，Kn << 1 |
| **湍流模型** | 无 (μt = 0) |

### 控制方程

质量守恒：
```math
∇·(ρ𝐔) = 0
```

动量守恒 (Navier-Stokes)：
```math
∇·(ρ𝐔⊗𝐔) = -∇p + ∇·𝝉
```

粘性应力张量 (Newtonian流体)：
```math
𝝉 = μeff[∇𝐔 + (∇𝐔)ᵀ - (2/3)(∇·𝐔)𝐈]
```

能量方程 (sensible enthalpy)：
```math
∇·(ρh𝐔) = ∇·(αeff∇h) + 𝐔·∇p
```

---

## 主要发现

- **曳力系数**: 干花粉比水合球形花粉高8%-15%
- **努塞尔数**: 干花粉比水合球形花粉低5%-15%
- **适用性**: Schiller-Naumann相关式和Ranz-Marshall相关式不适用于真实花粉形态
- **应用场景**: 城市环境过敏风险预测、空气质量管理

---

## 局限性

- 仅考虑低雷诺数层流 (Rep ≤ 15)
- 未考虑花粉表面蒸发对流动的影响
- 网格为人工重建形态，可能与真实形态有差异

---

## 实现建议

- **实现难度**: 中等 (需OpenFOAM + snappyHexMesh)
- **预期性能**: 可准确预测非球形颗粒的曳力和换热
- **适用场景**: 生物气溶胶输运、城市空气质量管理

---

## 相关概念

- [[Stokes-drag]]
- [[Schiller-Naumann-correlation]]
- [[Ranz-Marshall-correlation]]
- [[Lagrangian-particle-tracking]]
- [[CFD-OpenFOAM]]
