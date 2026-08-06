---
tags: [几何, 点云, 表面重建, 深度学习]
date: 2026-08-06
---

# HD-PEA: Learning Manifolds in High-D Point Embedding for Anisotropic Surface Approximation

## 核心方法

提出 **HD-PEA** (High-Dimensional Point Embedding Anisotropic surface approximation) 框架，直接处理非结构化点云，实现各向异性表面近似重建。

### 关键创新点

1. **高维欧几里得点嵌入**：将输入点云映射到高维流形嵌入空间
2. **Patch-based Meta-embedding 方案**：无需重训练即可处理大规模点云
3. **切向子空间估计**：用于高维嵌入流形近似和各向异性重建
4. **黎曼曲率张量估计**：从点云估计曲率

### 算法流程

1. 编码器将点云映射到高维流形嵌入空间
2. Patch-based meta-embedding 支持大规模推理
3. 切向子空间估计 → 各向异性流形重建

## 复杂度分析

- **训练**：端到端深度学习框架
- **推理**：Patch-based 方案，线性扩展

## 数据集

- Thingi10K
- AIM@SHAPE
- Stanford 3D Scanning Repository
- ScanNet

## 开源实现

- 论文代码：待公布

## 相关笔记

[[Fast Native Mesh Generation with Flow Matching]]

## 链接

- arXiv: https://arxiv.org/abs/2607.28855
- PDF: https://arxiv.org/pdf/2607.28855
