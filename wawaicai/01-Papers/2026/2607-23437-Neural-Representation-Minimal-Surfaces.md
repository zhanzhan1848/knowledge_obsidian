---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, minimal-surfaces, neural-representation, geometry]
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
| **作者** | Jiayin Sun et al. |
| **发表** | arXiv cs.GR (2026-07-26) |
| **链接** | [原文](https://arxiv.org/abs/2607.23437) |
| **DOI** | 10.48550/arXiv.2607.23437 |
| **代码** | 待查 |

---

## 核心贡献

> 提出基于精确表示（类似经典Weierstrass-Enneper参数化）的最小曲面神经表示，评估误差仅来自数值积分

1. **精确表示**：类似Weierstrass-Enneper参数化
2. **超越PINN**：不同于基于物理信息神经网络的离散化或网格优化方法
3. **Plateau问题优化**：通过优化此表示构建训练目标

---

## 技术方案

### 核心思想

传统方法：
- 离散化方法：优化网格/神经场近似控制方程
- PINN方法：网格或神经场优化近似方程

本文方法：
- 基于 **精确表示**（类似 Weierstrass-Enneper 参数化）
- 可精确表示最小曲面
- 评估误差仅来自数值积分（四舍五入误差可忽略）

### 关键技术

| 技术 | 说明 |
|------|------|
| Weierstrass-Enneper Parameterization | 经典精确最小曲面参数化 |
| Neural Representation | 神经表示层 |
| Plateau Problem | 最小曲面变分问题 |

---

## 数学基础

最小曲面满足平均曲率为零的条件：
$$H = \frac{1}{2}(\kappa_1 + \kappa_2) = 0$$

Weierstrass-Enneper 表示给出了最小曲面的解析参数化。

---

## 实现建议

- **实现难度**: 中等
- **相关理论**: 微分几何, 极小曲面理论
- **参考**: libigl, 微分几何库

---

## 相关笔记

- [[Minimal Surfaces]]
- [[Neural Implicit Geometry]]
- [[Plateau Problem]]
