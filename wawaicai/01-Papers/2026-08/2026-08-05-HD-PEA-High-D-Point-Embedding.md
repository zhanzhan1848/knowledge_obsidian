---
tags: [几何, 点云重建, 各向异性网格, 深度学习, 高维嵌入]
type: paper
venue: arXiv cs.GR
date: 2026-07-30
---

# HD-PEA: Learning Manifolds in High-D Point Embedding for Anisotropic Surface Approximation from Unstructured Point Clouds

## 核心方法

### 问题定义
Dense 3D sensors produce point clouds that are geometrically redundant for real-time processing. 本论文解决如何从**非结构化点云**高效重建**各向异性表面**。

### 核心算法：HD-PEA Framework

**Step 1: High-Dimensional Euclidean Point Embedding**
- 将输入点云映射到高维流形嵌入空间
- 学习点的高维表示，同时保持几何一致性

**Step 2: Patch-based Meta-Embedding Scheme (推理阶段)**
- 处理大规模点云无需重训练和微调
- 支持 patch-wise 处理

**Step 3: Tangent Subspace Estimation for High-D Manifold**
- 估计高维嵌入流形的切线子空间
- 各向异性流形重建

**Step 4: Riemannian Curvature Tensor Estimation**
- 估计黎曼曲率张量

### 关键创新
1. **Scalable deep learning framework** for high-d Euclidean point embedding
2. **各向异性表面逼近**：fewer elements, higher fidelity, improved numerical stability
3. 比 isotropic 和 adaptive meshes 更好的效果

## 复杂度分析

- 训练：端到端深度学习
- 推理：Patch-based，支持大规模
- 数值稳定性：相比 isotropic methods 更好

## 数据集

- Thingi10K
- AIM@SHAPE
- Stanford 3D Scanning Repository
- ScanNet

## 开源实现

- 未提供具体链接
- arXiv: https://arxiv.org/abs/2607.28855

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#point-cloud #anisotropic-meshing #deep-learning #surface-reconstruction #manifold-learning
