---
tags: [几何, 网格生成, 生成模型, Flow Matching]
date: 2026-06-22
conference: SIGGRAPH 2026
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

MeshFlow 提出了一种直接生成三角形网格的方法，通过将网格视为"三角形汤"(triangle soups)来避免序列化问题。采用**等变最优传输流匹配模型**(equivariant optimal-transport flow matching)，该方法尊重三角形汤的两个关键对称性：
- 面和顶点的任意排列
- 每个面内顶点的排列

### 技术要点

1. **网络架构**：对 Diffusion Transformer 架构进行简单修改，使其能够建模速度场同时保持所需的等变性
2. **最优传输训练目标**：消除违反对称性的监督信号，提高收敛性
3. **生成方式**：直接生成三角形汤而非有序序列

## 算法复杂度

- 时间复杂度：O(N log N) 推理（~18倍加速相比自回归方法）
- 空间复杂度：与网格面数线性相关

## 实验结果

- 网格质量与最先进的自回归网格生成器相当
- 推理速度提升约 **18倍**

## 开源实现

- Project page: https://qiisun.github.io/MeshFlow/

## 相关笔记

[[TriFlow-Artist-Like-Mesh-Topology]]
[[ExMesh-Topology-Adaptation]]

## 可行性分析

✅ **推荐实现**

- 算法思路清晰，等变流匹配模型适合网格对称性
- 开源项目可参考
- 适合作为网格生成的 baseline
