---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, finite-volume, spherical-grids, Voronoi, MPAS, advection-scheme, atmospheric-CFD]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2604.07103
---

# A new high-order finite-volume advection scheme on spherical Voronoi grids

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A new high-order finite-volume advection scheme on spherical Voronoi grids and a comparative study in a mimetic finite-volume moist shallow-water model |
| **作者** | Luan F. Santos, Jeferson B. Granjeiro, Pedro S. Peixoto |
| **发表** | arXiv 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.07103) / [PDF](https://arxiv.org/pdf/2604.07103) |
| **DOI** | 10.48550/arXiv.2604.07103 |

---

## 核心贡献

> 将平面域 $k$-exact 重构方法扩展到球面 Voronoi 网格，用于 MPAS 等全球大气模式

1. 提出球面上新的高阶有限体积平流格式族（基于 $k$-exact 重构）
2. 在 MPAS 使用的球面质心 Voronoi  tessellation (SCVT) 网格上验证
3. 在局部加密网格（Andes 地形）上测试网格不规则性鲁棒性

---

## 背景与问题

### 球面质心 Voronoi 网格 (SCVT)

- MPAS、FV3 等全球大气模式使用
- 优点：局部加密灵活，无需修改离散化
- 挑战：网格不规则，高阶格式构造困难

### 核心需求

大气模式中，高阶平流格式可：
- 减少数值扩散
- 提高示踪物小尺度结构表征精度

---

## 方法论

### $k$-exact 重构方法

在每个网格单元上，通过最小二乘拟合重构 $k$ 阶多项式：

```math
\int_{V_j} p_k(\mathbf{x}) \, dV = \bar{\phi}_j V_j \quad \text{for all } p_k \in \mathbb{P}^k
```

然后利用重构多项式计算界面通量。

### 球面推广

- 将平面域方法扩展到曲面流形
- 处理曲率效应和网格不规则性
- 在 SCVT 网格上进行测试

---

## 实验结果

| 测试 | 结果 |
|------|------|
| 球面平流精度测试 | 达到设计阶数精度 |
| 网格畸变敏感性 | 对网格扭曲不敏感 |
| 浅水模型（moist SWE） | 与现有 MPAS 格式相当 |
| 局部加密（Andes） | 鲁棒性良好 |

---

## 局限性

- 网格鲁棒性受浅水模型本身离散化敏感性限制（非平流格式问题）
- 高阶格式计算成本高于低阶格式

---

## 相关工作

- [[MPAS]] — Model for Prediction Across Scales
- [[$k$-exact reconstruction]] — $k$ 阶精确重构
- [[Spherical Voronoi grids]] — 球面 Voronoi 网格
- [[Finite volume method]] — 有限体积法
- [[Shallow water equations]] — 浅水方程

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐⭐ 高
- **适用场景**: 全球大气模式、海啸/波浪数值模拟、气候建模
- **关键价值**: 为现有 MPAS 等模式提供高精度平流选项

---

*📅 收集日期: 2026-04-09 | 来源: arXiv math.NA + physics.flu-dyn*
