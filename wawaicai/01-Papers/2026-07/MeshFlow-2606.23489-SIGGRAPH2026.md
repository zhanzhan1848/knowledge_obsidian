---
title: "MeshFlow: Mesh Generation with Equivariant Flow Matching"
arXiv: "2606.23489"
date: 2026-06-22
conference: "SIGGRAPH 2026"
tags: [网格生成, 深度学习, 流匹配, 生成模型]
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

MeshFlow 提出了一种基于**等变最优传输流匹配 (Equivariant Optimal-Transport Flow Matching)** 的三角形网格生成方法。

### 关键技术点

1. **问题**: 直接生成网格具有置换不变性（面和顶点的任意排列）
2. **解决方案**: 将网格视为三角形汤 (triangle soup)，避免序列化为自回归序列
3. **架构**: 对 Diffusion Transformer 架构进行简单但有效的修改，保持所需等变性
4. **训练目标**: 基于最优传输的损失函数，消除违反对称性的监督信号

### 创新点
- 18× 推理加速（相比 SOTA 自回归网格生成器）
- 保持面置换不变性和面内顶点置换不变性

## 算法复杂度
- 推理速度: ~18× 相比自回归方法

## 开源实现
- Project: https://qiisun.github.io/MeshFlow/

## 可行性分析
- **算法复杂度**: 中等
- **数值稳定性**: 良好（流匹配框架）
- **依赖项**: PyTorch, Diffusion Transformer
- **推荐度**: ⭐⭐⭐⭐ 推荐

## 相关笔记
[[LATO.2: Factorized 3D Mesh Generation]]
[[ExMesh: Explicit Mesh Reconstruction]]
