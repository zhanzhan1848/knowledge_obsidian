---
type: paper
created: 2026-05-19
updated: 2026-05-24
tags: [GNN, physics-informed, RANS, Euler-Lagrange, dental-aerosol, OpenFOAM, surrogate-model]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.19589v1
---

# Physics-Informed Graph Neural Network Surrogates for Turbulent Nanoparticle Dispersion in Dental Clinical Environments

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physics-Informed Graph Neural Network Surrogates for Turbulent Nanoparticle Dispersion in Dental Clinical Environments |
| **作者** | Takshak Shende |
| **发表** | arXiv (cs.LG, physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.19589v1) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 提出 ELGIN (Eulerian-Lagrangian Graph Interaction Network)，一种基于 OpenFOAM 多面体网格的物理信息图神经网络代理模型，用于实时预测牙科气溶胶传播。

1. **ELGIN 架构**: 结合图Transformer + 可学习压力投影 + 湍流闭包头 + 辛积分器
2. **RANS + Euler-Lagrange**: 使用 foam-extend 4.1 OpenFOAM reactingParcelFoam 的 CFD 基准真值
3. **四阶段课程学习**: 稳定 260 步自回归 rollout，无梯度爆炸
4. **37× 加速**: GPU 上约 64 秒完成 26 秒 rollout vs. 参考管线

---

## 技术方案

### 方法

| 组件 | 说明 |
|------|------|
| Multi-head Graph Transformer | 图变换器多头注意力 |
| Jacobi-preconditioned learnable pressure projection | 雅可比预条件可学习压力投影 |
| Turbulence-closure head | 湍流闭包头 |
| Sigmoid-gated Lagrangian Interaction Network | 门控拉格朗日交互网络 |
| Differentiable inverse-distance mesh-parcel coupling | 可微逆距离网格-质点耦合 |
| Symplectic Stormer-Verlet integrator | 辛 Stormer-Verlet 积分器 |

### 验证结果

- 平均质点位移误差: 从 19.56% 降至 16.20%
- 质点云回转半径误差: 从 9.85% 降至 6.58%
- 37× 加速 (4GB GPU)

### 应用场景

牙科气溶胶程序 (亚50微米颗粒) 可在封闭诊所中长时间悬浮，导致病原体传播风险

---

## 相关工作

- [[physics-informed-NN]]
- [[graph-NN-CFD]]
- [[Euler-Lagrange-spray]]

---

## 实现建议

- **实现难度**: 高 (深度学习 + OpenFOAM + 物理约束)
- **预期性能**: 需 GPU 支持
- **适用场景**: 牙科诊所感染风险筛查、医院通风评估

---

## 备注

- 40 页，12 图
- 代码/模型开源待确认