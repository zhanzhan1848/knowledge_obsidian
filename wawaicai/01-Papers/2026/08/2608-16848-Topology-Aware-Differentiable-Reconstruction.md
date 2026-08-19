---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [surface-reconstruction, differentiable-optimization, persistent-homology, topology, mesh-reconstruction]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.16848
---

# Topology-Aware Differentiable Triangle-Soup Reconstruction via Persistent Homology

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Topology-Aware Differentiable Triangle-Soup Reconstruction via Persistent Homology |
| **作者** | Viritphon Chongpermwattanapol |
| **发表** | arXiv cs.GR (v1: 17 Aug 2026) |
| **链接** | [原文](https://arxiv.org/abs/2608.16848) \| [PDF](https://arxiv.org/pdf/2608.16848) |
| **DOI** | 10.48550/arXiv.2608.16848 |

---

## 核心贡献

> 将**拓扑（Topology）**引入可微分表面重建的目标函数，通过持续同调（Persistent Homology）比较目标 diagram 与当前表面，修复空洞和环（loops）等拓扑错误。

1. **可微分 persistence 项**：比较演化表面的 diagram 与固定目标 diagram
2. **闭式circumradii 梯度**：通过配对 frozen backward re-expressing matched birth/death simplices
3. **修复所有拓扑缺陷**：包括 enclosed voids（4.0-7.9x 误差降低）和 loops（2.3x，零 phantom handles）

---

## 技术方案

### 核心问题

现有可微分 triangle-soup 重建的 photometric 和 geometric loss 无法测量拓扑——collapsed loops 或 punctured voids 可能得分与正确重建完全相同。标准隐式修复方法（重新分配采样预算）无法解决此问题。

### 关键创新

| 技术 | 说明 |
|------|------|
| Differentiable persistence term | 端到端可微分的拓扑损失项 |
| Persistent Homology | 利用持续同调测量表面拓扑特征 |
| Closed-form circumradii | 配对的 birth/death simplex 梯度闭式解 |
| Recruitment term | 修复特征缺失时的梯度问题 |

### 公式核心

$$L_{topology} = f(\text{PersistenceDiagram}(S), \text{TargetDiagram})$$

梯度通过配对的 simplices 的闭式 circumradii 流动。

### 拓扑错误类型修复

- **Enclosed Voids**: 4.0-7.9x 误差降低
- **Loops**: 2.3x 降低，零 phantom handles
- **H0 (component counts)**: 无显著改善（null result）

---

## 实验结论

- **数据集**: 8 个外部 genus-known 网格（两个预注册组）
- **验证**: channel-controlled verdict（通过相同梯度通道击败非拓扑基线）
- **结果**: 洞修复 4.87x，环修复 1.52x，无 per-shape tuning
- **噪声鲁棒性**: 在噪声下优雅降级

---

## 局限性

- 所有证据为合成数据，真实扫描为未来工作
- 目标 diagram 需要预先已知
- H0（连通分量）无显著改善

---

## 实现建议

- **实现难度**: 高（需理解持续同调 + 可微分编程）
- **开源依赖**: DIPHA/Gudhi（PH 计算）、PyTorch/JAX（自动微分）
- **适用场景**: 3D 扫描重建、数字孪生、隐式表面优化
- **推荐度**: ⭐⭐⭐⭐⭐ 拓扑感知重建的前沿工作，对网格处理有重要参考价值

---

## 相关工作

- [[表面重建]] / [[Surface Reconstruction]]
- [[持续同调]] / [[Persistent Homology]]
- [[可微分渲染]] / [[Differentiable Rendering]]
- [[拓扑修复]] / [[Topology Repair]]
