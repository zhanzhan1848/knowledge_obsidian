---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [PINN, turbomachinery, aerodynamic, N-S, CFD]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2605.07131
---

# A fast Physics-Informed Neural Networks based approach to the 2D design of turbine blades

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A fast Physics-Informed Neural Networks based approach to the 2D design of turbine blades |
| **作者** | Yuan Huang, Francesca di Mare |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.07131) |
| **DOI** | 10.48550/arXiv.2605.07131 |

---

## 核心贡献

> 使用 Progressive Euler-PINN 框架进行叶轮机械叶片的大规模工程级筛选

1. **渐进式边界条件松弛**：从无叶片的隧道流逐步松弛到完整出口静压
2. **几何感知动态损失加权**：对曲率大的边界区域增强残差惩罚
3. **单 PINN 工作流**：覆盖 10 个 NACA6 变体和 30 个亚音速工况点
4. **CFD 精度**：压力场和速度场达到与 CFD 可比的精度，同时降低计算成本

---

## 技术方案

### 核心思想

PINNs (Physics-Informed Neural Networks) 是一种 mesh-free 的 CFD 替代方案。该工作针对复杂叶片几何和偏离设计工况下的收敛性和精度问题，提出了一种**渐进式 Euler-PINN**框架。

### 关键技术

| 技术 | 说明 |
|------|------|
| Progressive BC Relaxation | 边界条件从无叶片隧道流逐步松弛至完整出口静压 |
| Geometry-aware Dynamic Loss-weighting | 对高曲率边界区域强化残差惩罚 |
| Euler Equations | 约束不可压缩/可压缩欧拉方程而非完整 N-S |
| PINN Loss Function | $L = w_{r}L_{r} + w_{ic}L_{ic} + w_{bc}L_{bc}$ |

---

## 公式

```math
\begin{aligned}
&\text{Physics-informed residual: } \\
&L_r &= \| \mathcal{N}[\mathbf{u}, p] \|_2^2 \\
&\text{where } \mathcal{N} \text{ is the Euler/N-S operator} \\
&\text{Boundary condition loss: } L_{bc} = \sum_{i} \| \mathbf{u} - \mathbf{u}_i \|_{\Gamma_i}^2 \\
&\text{Dynamic weighting: } w_{bc}(\mathbf{x}) = \exp(\kappa \cdot \text{curvature}(\mathbf{x}))
\end{aligned}
```

---

## 实验结论

- **应用场景**: 透平机械叶片预设计筛选、Carnot 电池等能源转换存储系统
- **测试规模**: 10 个 NACA6 叶片变体 × 30 个亚音速工况点
- **性能**: 相比传统 CFD，大幅降低家族级叶片筛选的计算成本

---

## 局限性

- 限于二维亚音速工况
- 依赖几何参数化（需预先定义叶片族）
- 湍流效应未包含在当前 Euler 框架中

---

## 相关工作

- [[PINN-Turbulence]]
- [[Euler-Equations-FVM]]
- [[Turbomachinery-CFD]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐（需熟悉 PINN 框架和叶轮机械几何）
- **预期性能**: 在预设计筛选阶段可替代部分 CFD 评估
- **适用场景**: 叶轮机械初步设计、叶片族快速评估、能源系统设计