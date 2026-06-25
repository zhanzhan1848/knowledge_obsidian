---
title: "Mesh Generation with Equivariant Flow Matching"
arXiv: "2606.23489"
authors: ["Qi Sun", "et al."]
conference: "SIGGRAPH 2026"
date: 2026-06-22
tags: [网格生成, 生成模型, 等变神经网络, 几何处理]
---

# Mesh Generation with Equivariant Flow Matching

## 核心方法

### 问题定义
直接生成网格（Triangle Meshes）具有挑战性，因为网格表示包含重要的对称性：
- 面和顶点的排列不变性 (Permutation invariance of faces and vertices)
- 每个面内顶点的排列不变性

### 核心思想
MeshFlow 提出了一种等变最优传输流匹配模型（Equivariant Optimal-Transport Flow Matching），直接生成三角形 soups，避免了将网格序列化为长自回归序列的问题。

### 技术创新

1. **等变架构修改**：对 Diffusion Transformer 架构进行简单而有效的修改，保持所需等变性的同时实现可扩展建模
2. **最优传输训练目标**：消除违反对称性的监督信号，提高收敛性
3. **流匹配框架**：学习速度场，支持快速推理

## 算法复杂度
- **推理速度**：比 SOTA 自回归网格生成器快约 **18 倍**
- 生成质量：与 SOTA 自回归方法相当

## 开源参考
- Project Page: https://qiisun.github.io/MeshFlow/

## 技术亮点

### 等变性保证
- 任意面排列
- 每个面内顶点排列

### 流匹配优势
- 无需 diffusion noise schedule
- 最优传输理论支撑
- 保证对称性

## 相关笔记
[[几何生成模型]]
[[网格简化与重网格化]]
