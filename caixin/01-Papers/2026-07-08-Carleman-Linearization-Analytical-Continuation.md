---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [fluid-dynamics, quantum-computing, Carleman-linearization, LBM, Navier-Stokes]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2607.05873
---

# Fixing Divergence in Carleman Linearization via Analytical Continuation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fixing Divergence in Carleman Linearization via Analytical Continuation |
| **作者** | Mingshuo Zhu |
| **发表** | arXiv 2607.05873v1, 2026-07-07 |
| **链接** | [原文](https://arxiv.org/abs/2607.05873) |
| **DOI** | - |

---

## 核心贡献

> 通过解析延拓修正 Carleman 线性化中的指数发散问题，扩展到 LBM 等 Navier-Stokes 求解方法

1. 识别 Carleman 线性化在有限时间后发散的原因：Laurent 级数在收敛邻域外展开
2. 插入**正则化函数**修正发散解（解析延拓提示）
3. 在 Logistic 方程、KPP-Fisher 方程、相场模型验证
4. **LCU (Linear Combination of Unitaries) 量子算法**实现，提供详细复杂度和误差分析

---

## 技术方案

### 核心思想

Carleman 线性化将非线性微分方程转化为线性系统，但解在有限时间后指数发散。这是因为解在收敛邻域外进行 Laurent 级数展开。通过在发散解中插入正则化函数（解析延拓）来修正。

### 关键技术

| 技术 | 说明 |
|------|------|
| Carleman Linearization | 非线性ODE转线性系统 |
| Analytical Continuation | 解析延拓修正发散 |
| Lattice Boltzmann Method (LBM) | 文中提及的 NS 求解方法之一 |
| LCU Quantum Algorithm | 量子算法实现 |

### 相关方程验证

- Logistic 方程
- KPP-Fisher 方程
- 周期边界条件下的相场模型

---

## 物理背景

文中指出：即使在广泛使用的 **格子玻尔兹曼方法 (LBM)** 中，Carleman 解也会在有限时间后发散，LBM 是求解 Navier-Stokes 方程的标志性方法。

---

## 代码片段

论文提供 LCU 量子算法的详细复杂度分析（35页，18图）

---

## 局限性

- 解析延拓需要事先了解解的解析结构
- 对高维问题计算成本增加
- 量子硬件实现尚需时日

---

## 相关工作

- [[Carleman linearization]]
- [[Lattice Boltzmann Method]]
- [[Quantum computing for CFD]]
- [[Navier-Stokes numerical methods]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ 较高 (需解析延拓理论)
- **适用场景**: 量子计算 CFD、非线性动力学、长时间积分
