---
tags: [几何, 网格重建, 拓扑适应, 可微优化]
date: 2026-06-05
conference: CVPR 2026
---

# ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation

## 核心方法

ExMesh 提出一种新颖的框架，直接优化显式网格，通过将可微优化与离散拓扑更新相结合，从多视角图像重建表面网格。

### 关键挑战

1. **拓扑适应**：如何自适应地细化网格拓扑以捕捉细节，同时不引入退化面
2. **UV 一致性**：如何在网格结构演进时保持一致的 UV 坐标以实现高保真纹理化

### 解决方案

1. **自适应顶点分裂与合并策略**：实现粗到细的优化
2. **实时 UV 维护**：保持几何完整性
3. **首个将离散拓扑操作融入连续可微优化流水线的框架**

## 算法特点

- **无需中间表示**：直接输出可渲染、可编辑的网格
- **端到端优化**：避免 Marching Cubes 或 TSDF fusion 等后处理

## 实验结果

在准确性、计算效率和网格简洁性之间取得平衡

## 开源实现

- arXiv: https://arxiv.org/abs/2606.07288

## 相关笔记

[[MeshFlow-Equivariant-Flow-Matching]]
[[Topology-Adaptation-Methods]]

## 可行性分析

✅ **推荐实现**

- 首个离散+连续统一框架，具有创新性
- 拓扑适应策略可应用于其他网格处理任务
- CVPR 2026 认可度高
