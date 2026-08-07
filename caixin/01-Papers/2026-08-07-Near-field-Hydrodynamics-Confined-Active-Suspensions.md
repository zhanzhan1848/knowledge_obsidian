---
type: paper
created: 2026-08-07
updated: 2026-08-07
tags: [fluid-dynamics, active-matter, hydrodynamics, turbulence, multi-phase]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.05756
---

# Near-field Hydrodynamics Disentangles Angular Correlations in Confined Active Suspensions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Near-field Hydrodynamics Disentangles Angular Correlations in Confined Active Suspensions |
| **作者** | Changle Liao et al. |
| **发表** | arXiv 2026-08-06 |
| **链接** | [原文](https://arxiv.org/abs/2608.05756) |
| **DOI** | 10.48550/arXiv.2608.05756 |
| **代码** | N/A |
| **领域** | physics.flu-dyn, cond-mat.soft |

---

## 核心贡献

> 揭示受限活性物质中两种解耦的流体力学模式：dipolar mode 和 entrainment mode

1. **模式解耦**：发现两种解耦模式表征细胞对：dipolar mode（偶极模式）和 entrainment mode（夹带模式）
2. **竞争机制**：两种模式呈现与密度和距离相关的竞争关系
3. **物理根源**：通过单细胞流场分析、水动力模拟和主动-被动混合物，揭示这两种模式源于 singular hydrodynamics（奇异流体力学）和 lubrication-induced entrainment（润滑感生夹带）

---

## 技术方案

### 核心思想

结合实验和 hydrodynamic simulations 研究准二维 Chlamydomonas reinhardtii 悬浮液中的粒子间相关性。

### 研究对象

- **生物体**：Chlamydomonas reinhardtii（莱茵衣藻）
- **系统**：quasi-two-dimensional active suspensions
- **流动分析**：单细胞流场分析

### 关键机制

| 模式 | 物理机制 |
|------|------|
| Dipolar mode | Singular hydrodynamics（奇异流体力学） |
| Entrainment mode | Lubrication-induced entrainment（润滑感生夹带） |

### 数值方法

- **Smoothed Profile Method (SPM)**：直接求解 Navier-Stokes 方程
- 该方法将活性粒子作为边界条件处理，通过光滑轮廓函数将粒子嵌入流体网格

---

## 实验结论

- 模拟结果与实验观察到的两种模式高度一致
- **结论**：受限活性物质中的时空气象相关性根本上源于这两种 hydrodynamic mechanisms 的相互作用

---

## 局限性

- 仅考虑球形简化模型
- 二维近似可能不完全捕捉真实三维流动特征

---

## 相关工作

- [[Active Matter Hydrodynamics]]
- [[Smoothed Profile Method]]
- [[Confined Suspension Dynamics]]

---

## 实现建议

- **实现难度**：⚠️ 中等（需实现 SPH 或 smoothed profile 方法）
- **预期性能**：适用于活性物质、微生物流体力学研究
- **适用场景**：生物流体力学、活性软物质
