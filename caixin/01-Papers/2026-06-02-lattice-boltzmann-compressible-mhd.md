---
type: paper
created: 2026-06-02
updated: 2026-06-02
tags: [lattice-boltzmann, LBM, MHD, compressible-flow, magnetohydrodynamics, OpenLB, high-performance-computing]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.00641
---

# Lattice Boltzmann Methods for Compressible (Magneto)hydrodynamics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Lattice Boltzmann Methods for Compressible (Magneto)hydrodynamics |
| **作者** | Fedor Bukreev, Adrian Kummerländer, Mathias J. Krause |
| **发表** | arXiv 2026-06-02 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2606.00641) |
| **DOI** | 10.48550/arXiv.2606.00641 |
| **代码** | OpenLB (https://www.openlb.net/) |

---

## 核心贡献

> 提出一类新型 Lattice Boltzmann Methods (LBM) 格式，可求解可压缩磁流体动力学方程

1. 首次将 LBM 扩展到可压缩和 resistive incompressible MHD 系统
2. 利用 Strang 分裂 + 分离传输策略实现完全解耦局部操作
3. 在 OpenLB 中实现，达到 98.9% hardware roofline 性能
4. 成功模拟 16 Psyche 小行星在超音速太阳风中的运动

---

## 技术方案

### 核心思想

将动理学方程 (kinetic formulation) 的算法结构与 Strang 分裂结合，分别传输所有状态变量及其特征。

### 关键技术

| 技术 | 说明 |
|------|------|
| Lattice Boltzmann Method | 替代传统有限体积/有限差分 |
| Strang Splitting | 分离传输方程各项 |
| MHD (Magneto-Hydrodynamics) | 磁流体动力学耦合 |
| OpenLB | 开源 LBM 平台 |
| Dynamic Solid Geometry | 动态固体几何处理 |

### 涵盖系统

- 理想可压缩 MHD
- Resistive incompressible MHD
- 可压缩 Euler 方程
- 不可压缩 Navier-Stokes 方程

---

## 性能分析

| 指标 | 结果 |
|------|------|
| **Roofline 效率** | 98.9% |
| **可扩展性** | 高 |
| **数值稳定性** |良好 |

---

## 应用场景

16 Psyche 小行星模拟：
- 表面解析磁化小行星
- 超音速早期太阳风流动
- 流体-结构耦合
- 磁场演化

---

## 局限性

- 需要验证更多 benchmark cases
- 对极端磁雷诺数场景的适用性待研究

---

## 相关工作

- [[OpenLB Lattice Boltzmann]]
- [[Magnetohydrodynamics CFD]]
- [[Compressible Flow LBM]]
- [[16 Psyche Asteroid Simulation]]

---

## 实现建议

- **实现难度**: 中等 (基于 OpenLB 框架)
- **预期性能**: 高效率 (接近硬件峰值)
- **适用场景**: 航空航天 MHD、多物理场耦合、天体物理流