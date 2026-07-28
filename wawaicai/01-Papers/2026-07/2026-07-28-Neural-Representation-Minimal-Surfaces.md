---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [geometry, minimal-surfaces, neural-implicit, surface-representation]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.23437
---

# Neural Representation of Minimal Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Representation of Minimal Surfaces |
| **作者** | Jiayin Sun |
| **发表** | arXiv cs.GR, 2026-07-26 |
| **链接** | [原文](https://arxiv.org/abs/2607.23437) |
| **DOI** | 10.48550/arXiv.2607.23437 |
| **代码** | - |

---

## 核心贡献

> 基于 Weierstrass-Enneper 参数化的精确神经表示最小曲面

1. 提出首个精确表示方法（类似经典 Weierstrass-Enneper 参数化），评估误差可忽略
2. 使用 Plateau 问题的训练目标优化表示
3. 相比离散化或 PINN 方法，避免了网格/神经场近似

---

## 技术方案

### 核心思想

传统 PINN 方法通过优化网格或神经场来近似支配方程，但存在离散化误差。本文方法基于精确的 Weierstrass-Enneper 参数化表示，通过学习该参数化中的系数来得到最小曲面。

### 关键公式

Weierstrass-Enneper 参数化允许精确构建极小曲面（平均曲率为零的曲面）。本文将其转化为神经表示的训练目标。

### 创新点

- 评估精度只受制于数值积分误差（非逼近误差）
- 训练目标直接针对 Plateau 问题

---

## 实验结论

- 11 pages, 11 figures
- 验证了极小曲面的精确神经表示

---

## 局限性

- 依赖 Weierstrass-Enneper 参数化的数学框架
- 仅适用于可参数化的极小曲面类

---

## 相关工作

- [[Neural Implicit Fields]]
- [[Minimal Surfaces]]
- [[Weierstrass-Enneper Parameterization]]

---

## 实现建议

- **实现难度**: 中
- **依赖**: PyTorch / JAX
- **适用场景**: 曲面重建、几何建模、计算机图形学教学
