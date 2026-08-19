---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [subdivision-surface, neural-subdivision, Loop-subdivision, mesh-refinement, equivariance]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.14704
---

# Proximity-Preserving Neural Subdivision

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Proximity-Preserving Neural Subdivision |
| **作者** | Hassan Ugail et al. |
| **发表** | arXiv cs.GR (v1: 10 Aug 2026) |
| **链接** | [原文](https://arxiv.org/abs/2608.14704) \| [PDF](https://arxiv.org/pdf/2608.14704) |
| **DOI** | 10.48550/arXiv.2608.14704 |

---

## 核心贡献

> 提出 **PNS (Proximity-Preserving Neural Subdivision)**：一种可训练的细分规则，增强 Loop 细分以适应局部曲率特征，同时保持刚性运动等变性、平面输入精确重现、二次 proximity envelope。

1. **紧支撑曲率门控修正**（curvature-gated correction）：在小范围内的曲率感知顶点修正
2. **架构级保证**：刚性运动等变性、平面输入精确重现、二次 proximity envelope
3. **理论继承**：在线性化配置下退化为 Loop 细分，继承 Reif 谱隙特性

---

## 技术方案

### 核心问题

经典细分方案（Loop、Catmull-Clark）因均匀模板难以适应局部几何特征（锐利棱脊、柔和边缘）；神经网络顶点预测虽可自适应，但通常缺乏细分算子应有的结构化行为。

### 关键创新

| 技术 | 说明 |
|------|------|
| Loop 细分基础 | 以经典 Loop 细分为 baseline 和线性基准 |
| 曲率门控修正 | 在协变局部坐标系中表达的小范围修正 |
| 刚性运动等变性 | 架构级保证，任意网络权重下成立 |
| 平面输入精确性 | 平面输入 → 平面输出 |
| 二次 Proximity Envelope | 修正量有界，迭代稳定性保证 |
| 线性化等价 | planar valence-k stars 下与 Loop 一致 |

### 架构特性（训练前即具备）

1. 刚性运动等变性（equivariance under rigid motion）
2. 平面输入精确重现（exact reproduction of planar input）
3. 二次 proximity envelope 有界
4. 继承 Loop 切空间特征值和 Reif 谱隙

---

## 实验结论

- **特征适应**: 局部棱脊特征拟合改善
- **稳定性**: 迭代细分下保持在 proximity envelope 内
- **对比**: 相比无约束神经 baseline（单步拟合更强但迭代不稳定）表现更优
- **结论**: 在不放弃细分结构约束的前提下引入学习

---

## 局限性

- 修正量在小范围内有界，可能无法处理极端曲率变化
- 对非流形网格的适用性未验证

---

## 实现建议

- **实现难度**: 中高（需理解细分曲面 + 等变性约束 + 曲率估计）
- **开源依赖**: libigl（Loop 细分实现）、PyTorch（神经网络）
- **适用场景**: 网格细分、特征感知网格细化、神经几何建模
- **推荐度**: ⭐⭐⭐⭐⭐ 细分曲面 + 神经网络结合的前沿工作，对几何处理和深度学习都有价值

---

## 相关工作

- [[细分曲面]] / [[Subdivision Surface]]
- [[Loop 细分]]
- [[网格细化]] / [[Mesh Refinement]]
- [[几何等变性]] / [[Equivariance]]
- [[神经几何]] / [[Neural Geometry]]
