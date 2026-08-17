---
title: "From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics"
date: 2026-08-17
tags: [fluid-dynamics, neural-operator, lagrangian, eulerian, particle-transport, zero-shot]
authors: [Chuqi Chen, Zhengqing Gao, Xi Zhou, Xiao Sun, Yang Xiang, Huaxi Huang]
paper_id: 2608.14120
subjects: [cs.LG, cs.AI, cs.GR]
venue: arXiv
status: processed
domain: fluid-dynamics
agent: doumiao
source: https://arxiv.org/abs/2608.14120
---

# From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics |
| **作者** | Chuqi Chen, Zhengqing Gao, Xi Zhou, Xiao Sun, Yang Xiang, Huaxi Huang |
| **发表** | arXiv (cs.LG, cs.AI, cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2608.14120) |
| **DOI** | 10.48550/arXiv.2608.14120 |

---

## 核心贡献

> 提出 Transferable Latent Operator (TLO)，实现从欧拉场预测到拉格朗日粒子rollout的零样本迁移

1. **零样本欧拉-拉格朗日泛化**: 模型仅用固定网格欧拉数据训练，无需粒子监督即可完成闭环粒子rollout
2. **统一流场表示**: 编码器-处理器-解码器架构，学习与坐标无关的潜流演化
3. **双查询模式**: 相同模型同时支持固定网格预测和移动粒子查询

---

## 技术方案

### 核心思想

TLO 解决了神经算子领域的一个关键问题：大多数流体学习数据集以固定欧拉网格形式提供，但拉格朗日粒子轨迹在实际应用中更为常见。传统方法需要额外的拉格朗日监督或特定粒子建模，TLO 实现了真正的零样本迁移。

### 关键技术

| 技术 | 说明 |
|------|------|
| Patch Encoder | 层次化域表示，捕捉局部传输结构和全局流场依赖 |
| Latent Processor | 坐标无关的潜空间演化，独立于输出查询集 |
| Coordinate-conditioned Decoder | 条件化解码器，支持任意坐标查询 |
| 零样本迁移 | 训练仅用欧拉数据，推理时用粒子位置作为解码器查询 |

### 网络架构

```
欧拉观察 (XE, Ut)
    ↓
Encoder: 局部patch + 全局上下文 → 固定大小潜表示 Z₀
    ↓
Latent Processor: 共享潜演化 → Zᴸ
    ↓
Decoder: 坐标条件化解码
    ├─ Q = XE → 欧拉场预测
    └─ Q = 粒子位置 → 拉格朗日粒子rollout
```

### 核心公式

**欧拉场监督损失**:
$$\mathcal{L}_{\mathrm{Eul}}=\mathbb{E}_{t}\left[\frac{1}{N_E d_u}\left\|\mathcal{G}_\theta(X_E, \mathbf{U}_t; X_E) - \mathbf{U}_{t+1}\right\|_F^2\right]$$

**粒子轨迹更新**:
$$\hat{\mathbf{y}}_{i,t+1} = \mathcal{B}\left(\hat{\mathbf{y}}_{i,t} + \Delta t \, \hat{\mathbf{v}}_t(\hat{\mathbf{y}}_{i,t})\right)$$

**误差指标**:
- $\mathcal{E}_{\mathrm{Eul}}$: 固定网格欧拉误差
- $\mathcal{E}_{\mathrm{Ref}}$: 参考轨迹速度误差
- $\mathcal{E}_{\mathrm{Path}}$: 闭环轨迹误差

---

## 实验结论

- **数据集**: 5个流体力学基准测试
- **结果**: TLO 在欧拉预测和零样本拉格朗日rollout均优于现有神经算子
- **优势**: 粒子离开欧拉网格支撑区域后仍可评估，标准插值无法做到

---

## 局限性

- 零样本迁移在某些复杂边界条件下性能下降
- 稀疏粒子微调可进一步提升性能

---

## 相关工作

- [[神经算子]] - Fourier神经算子、Transformer算子
- [[欧拉-拉格朗日建模]] - 粒子-网格耦合方法
- [[流场预测]] - 神经 PDE 求解器

---

## 实现建议

- **实现难度**: 中等（需要构建层次化编码器）
- **预期性能**: 欧拉预测与 SOTA 神经算子相当，拉格朗日零样本迁移领先
- **适用场景**: 污染物传输、火焰前缘追踪、粒子混合可视化
