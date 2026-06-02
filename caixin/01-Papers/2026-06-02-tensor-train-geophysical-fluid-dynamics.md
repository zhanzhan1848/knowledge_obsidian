---
type: paper
created: 2026-06-02
updated: 2026-06-02
tags: [tensor-train, geophysical-fluid-dynamics, GFD, PDE-solver, shallow-water-equations]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.00055
---

# Viability of Tensor Train Methods for Geophysical Fluid Dynamics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Viability of Tensor Train Methods for Geophysical Fluid Dynamics |
| **作者** | Jeremy Lilly, Derek DeSantis, Mark R. Petersen |
| **发表** | arXiv 2026-06-02 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2606.00055) |
| **DOI** | 10.48550/arXiv.2606.00055 |
| **代码** | - |

---

## 核心贡献

> 评估 Tensor Train (TT) 方法在地球流体力学 (GFD) 中的性能表现

1. 首次在 GFD 中系统评估 TT 方法的压缩率、误差和加速比
2. 使用浅水方程和 E3SM 海浪组件离散化方案作为测试基准
3. 发现 TT 对简单流动有效，但对复杂 GFD 状态表示能力有限

---

## 技术方案

### 核心思想

Tensor Train (TT) 方法是一种 PDE 求解加速技术，通过低秩张量分解压缩模型状态。

### 关键方程

浅水方程 (Shallow Water Equations):
- 连续性方程 + 动量方程
- 应用于 E3SM (Energy Exascale Earth System Model) 海洋组件

### 测试用例

4 个复杂度递增的测试用例：
1. 简单层流
2. Rossby 波
3. 中等复杂流
4. 真实 GFD 复杂状态

---

## 公式

TT 方法核心：将高维张量表示为低秩 TT 格式

```
‖X - X_TT‖ / ‖X‖ < ε
```

---

## 实验结论

| 指标 | 结果 |
|------|------|
| **简单流动** | TT 可有效压缩和加速 |
| **复杂 GFD 状态** | TT 难以高效表示 |
| **压缩率** | 因状态复杂度差异大 |
| **加速比** | 简单流 > 复杂流 |

---

## 局限性

- 复杂真实 GFD 场景下 TT 秩快速膨胀
- 非线性流动状态表示效率低
- 需要针对特定问题调参

---

## 相关工作

- [[Tensor Train PDE solvers]]
- [[E3SM Earth System Model]]
- [[Shallow Water Equations CFD]]

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 简单流动可获 2-5x 加速
- **适用场景**: 海浪预报、Rossby 波模拟、低复杂度 GFD