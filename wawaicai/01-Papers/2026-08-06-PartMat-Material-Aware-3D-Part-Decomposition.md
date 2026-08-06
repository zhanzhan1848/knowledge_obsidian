---
tags: [几何, 部件分解, 材质感知, 生成模型]
date: 2026-08-06
---

# PartMat: Material-Aware 3D Part Decomposition with a Single Global Latent

## 核心方法

**PartMat** 是一个高效材质感知 3D 部件分解管道，用单一全局潜在变量表示多部件几何。

### 关键创新点

1. **PartVAE**：学习统一表示，单次前向传递解码所有材质部件
   - 将推理成本与部件数量解耦

2. **扩散模型 + 强化学习精炼**：
   - 扩散模型训练部件生成
   - 强化学习精炼以实现精确材质分配和重叠抑制

3. **Sparse-voxel Flow-matching Model**：带部件注意力的几何后处理

### 应用场景

- 室内设计
- 材质边界分解（织物、木材、金属等）

## 开源实现

- 待公布

## 相关笔记

[[Hi-TOPS: Hierarchical Topology-aware Scoring Prior for 3D Part Decomposition]]

## 链接

- arXiv: https://arxiv.org/abs/2608.01825
- PDF: https://arxiv.org/pdf/2608.01825
