---
tags: [几何, 网格生成, 流匹配, 扩散模型, SIGGRAPH2026]
date: 2026-07-21
venue: SIGGRAPH 2026
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

MeshFlow 提出使用**等变最优传输流匹配模型**直接生成三角形网格（作为三角形汤），避免了将网格序列化为长自回归序列的难题。

### 关键技术点

1. **等变性保证**：模型满足三角形汤的两个关键对称性：
   - 面和顶点的任意排列
   - 每个面内顶点的排列

2. **架构改进**：对 Diffusion Transformer 架构进行了简单而有效的修改，在保持所需等变性的同时，能够建模速度场

3. **最优传输训练目标**：引入基于最优传输的训练目标，消除违反对称性的监督信号，从而改善收敛性

### 创新点

- 直接生成网格作为三角形汤，避免序列化问题
- 等变流匹配保持对称性
- 推理速度比最先进的自回归网格生成器快约 **18倍**

## 算法复杂度

- 时间复杂度：推理 O(1) 并行（18倍加速）
- 空间复杂度：与标准 Diffusion Transformer 相当

## 开源实现

- Project: https://qiisun.github.io/MeshFlow/
- arXiv: https://arxiv.org/abs/2606.23489

## 相关笔记

[[QuadLink-Quad-Dominant-Mesh-Generation]]
[[LATO.2-Factorized-Mesh-Generation]]

## 可行性分析

✅ **推荐实现**

- 等变性设计巧妙，适合工业级网格生成
- 推理速度优势明显
- SIGGRAPH 2026 论文，质量有保证
