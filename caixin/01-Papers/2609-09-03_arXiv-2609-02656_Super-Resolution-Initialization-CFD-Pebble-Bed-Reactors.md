---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [CFD, GNN, Super-Resolution, HPC, Pebble-Bed-Reactor]
status: processed
domain: CFD
agent: caixin
source: https://arxiv.org/abs/2609.02656
---

# Super-Resolution Initialization of High-Fidelity CFD Simulations for Pebble-Bed Reactors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Super-Resolution Initialization of High-Fidelity CFD Simulations for Pebble-Bed Reactors |
| **作者** | Guilherme Gottems, Vasil Ivakimov, Luiz Aldeia Machado, Mahmoud Yaseen, Tri Nguyen, Elia Merzari, Riccardo Balin, Dillon Shaver, Filippo Simini, Bethany Lusch, Venkatram Vishwanath, Haomin Yuan, Misun Min, Ramesh Balakrishnan, Jun Fang, Paul Fischer |
| **发表** | arXiv 2026-09-03 |
| **链接** | [原文](https://arxiv.org/abs/2609.02656) |
| **arXiv ID** | 2609.02656 |

---

## 核心贡献

> 使用超分辨率图神经网络(SR-GNN)加速 Pebble-Bed 反应器高阶 CFD 模拟的初始化过程

1. **SR-GNN 初始化框架**: 用低阶 P=2 速度场作为输入，重建高阶 P=7 表示作为初始条件
2. **计算成本降低**: 避免耗时的初始流动发展期，直接从重建的高阶场开始
3. **在 Re=100 的 146-pebble bed 上验证**: 与全分辨率模拟对比精度

---

## 技术方案

### 核心思想

高阶 CFD 模拟（如 NekRS）在达到统计平稳态前的初始流动发展期计算成本极高。本工作使用图神经网络从低阶解学习高阶解的映射，实现快速初始化。

### 关键技术

| 技术 | 说明 |
|------|------|
| SR-GNN | 超分辨率图神经网络，从 P=2 重建 P=7 速度场 |
| NekRS | 高阶谱元 CFD 求解器 |
| Pebble-Bed Reactor | 球床反应器堆芯内多孔介质流动 |

---

## 公式

- 输入: 低阶速度场 $u_{P=2}$
- 输出: 重建高阶场 $u_{P=7}^{reconstruct} = SR-GNN(u_{P=2})$
- 目标: $||u_{P=7}^{restart} - u_{P=7}^{reconstruct}||$ 最小化

---

## 实验结论

- **验证场景**: 146-pebble bed, Re=100
- **方法**: P=2 场 → SR-GNN → P=7 初始条件 → P=7 restart 模拟
- **结果**: 大幅减少初始瞬态计算时间

---

## 相关工作

- [[NekRS]] - 高阶谱元 CFD 求解器
- [[Graph Neural Network]] - 图神经网络
- [[Pebble Bed Reactor]] - 球床反应器

---

## 实现建议

- **实现难度**: 高（需熟悉 GNN + CFD 耦合）
- **适用场景**: 反应器热工水力分析、高阶 CFD 加速
