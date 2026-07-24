---
type: paper
created: 2026-07-24
updated: 2026-07-24
tags: [rarefied-gas, iterative-solver, discrete-velocity-method, axisymmetric, electrostatic]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2607.21277
---

# A general synthetic iterative solver for axisymmetric rarefied gas and electrostatic charged-particle flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A general synthetic iterative solver for axisymmetric rarefied gas and electrostatic charged-particle flows |
| **作者** | Yifan Wen, Lei Wu |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.21277) |
| **DOI** | 10.48550/arXiv.2607.21277 |
| **代码** | - |

---

## 核心贡献

> 提出AxiGSIS算法，通过双向耦合动力求解器和宏观合成系统，加速稀薄气体和带电粒子流的稳态收敛

1. 轴对称一般合成迭代方案 (AxiGSIS)
2. 有限体积离散速度法 + 轴对称2D Meridian平面
3. 低Knudsen数流动的高效计算

---

## 技术方案

### 核心思想

GSIS框架下，动力求解器计算非平衡应力和热流，作为修正源项引入宏观合成系统。宏观系统的修正流场反馈给动力求解器，实现快速信息传播。

### 关键技术

| 技术 | 说明 |
|------|------|
| 有限体积离散速度法 | 2D轴对称Meridian平面 + 3D分子速度空间 |
| 一般合成迭代 (GSIS) | 动力-宏观双向耦合 |
| 静电场 | 带电粒子输运 |

---

## 基准验证

| 流动类型 | 描述 |
|----------|------|
| Taylor Couette流 | 稀薄气体Couette流动 |
| 中性喷管膨胀流 | 自由分子流 |
| 带电粒子绕静电球流动 | 静电场作用下的粒子输运 |
| 静电加速喷管流 | 带电粒子加速 |

---

## 实验结论

- AxiGSIS准确复现参考动力论解
- 准确捕捉轴对称流动物理和带电粒子对静电场的响应
- 相比传统动力迭代，显著降低计算开销
- 在低至中等Knudsen数流动中优势明显

---

## 实现建议

- **实现难度**: 较高（需动力论基础）
- **适用场景**: 高真空系统、MEMS、空间推进

---

## 相关概念

- [[稀薄气体动力学]]
- [[离散速度法]]
- [[合成迭代求解器]]
- [[带电粒子输运]]
- [[Knudsen数]]
