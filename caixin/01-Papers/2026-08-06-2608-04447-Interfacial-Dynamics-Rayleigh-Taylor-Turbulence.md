---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [Rayleigh-Taylor, immiscible, surface-tension, energy-cascade, multi-phase, DNS]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04447
---

# Interfacial Dynamics and Energy Cascade in Immiscible Rayleigh-Taylor Turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Interfacial dynamics and energy cascade in immiscible Rayleigh-Taylor turbulence |
| **作者** | Dongxiao Zhao |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04447) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04447 |
| **代码** | - |

---

## 核心贡献

> 通过数值模拟揭示表面张力控制不可混溶 RT 湍流的特征尺度、界面面积和能-赝量预算

1. **自相似演化**：流动随表面张力呈现自相似演化，$E_{max} \propto \sigma^{1/2}$，持续时间 $\propto \sigma^{-1/4}$
2. **能级串级机制**：表面张力在大尺度移除动能，在小尺度注入动能，转换发生在 Hinze 尺度附近
3. **局部运动学关系**：验证 $\mathbf{f}^\sigma \cdot \mathbf{u} = -\sigma\mathcal{S}|\nabla c| + \text{Transport}$
4. **LES 亚网格闭合**：为不可混溶湍流 LES 提供严格物理框架

---

## 技术方案

### 控制方程

不可压 NS + VOF（体积分数方法）：

$$\nabla \cdot \mathbf{u} = 0$$
$$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\frac{1}{\rho}\nabla p + \nu\nabla^2\mathbf{u} + \mathbf{f}^\sigma$$

表面张力：$\mathbf{f}^\sigma = \sigma\kappa\nabla c$

### 数值方法

- 变表面张力系数 $\sigma$ 的参数化研究
- 尺度间预算分析（Scale-by-scale budget）

### 关键尺度关系

| 量 | 标度关系 |
|----|---------|
| 最大动能 | $E_{max} \propto \sigma^{1/2}$ |
| 流动持续时间 | $t_* \propto \sigma^{-1/4}$ |
| 转换尺度 | Hinze scale |

---

## 核心公式

表面张力功率与界面拉伸的局部运动学关系：

$$\mathbf{f}^\sigma \cdot \mathbf{u} = -\sigma\mathcal{S}|\nabla c| + \text{Transport}$$

其中 $\mathcal{S}$ 为界面拉伸率，$c$ 为重流体体积分数

---

## 实验结论

- **泡-滴结构**：垂直拉长丝状，直径约为毛细尺度的 3 倍
- **速度标度**：垂直速度与等效直径平方根成正比，符合阻力-浮力平衡
- **LES 应用**：直接关联表面张力功率与界面拉伸

---

## 局限性

- 二维或简化三维模拟
- 假设不可混溶，未考虑相变

---

## 实现建议

- **实现难度**: ★★★★☆
- **预期性能**: 为多相湍流 LES 提供物理基础
- **适用场景**: 惯性约束聚变、爆炸物理、海洋锋面
