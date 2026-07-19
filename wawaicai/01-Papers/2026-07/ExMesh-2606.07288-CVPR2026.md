---
title: "ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation"
arXiv: "2606.07288"
date: 2026-06-05
conference: "CVPR 2026"
tags: [网格重建, 拓扑适配, 可微优化, 多视角重建]
---

# ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation

## 核心方法

ExMesh 提出一种**直接优化显式网格**的框架，将可微优化与离散拓扑更新相结合。

### 解决的问题

1. **拓扑适应**: 如何自适应地细化网格拓扑以捕捉细节，同时避免退化面
2. **UV 维护**: 如何在网格结构演变时保持一致的 UV 坐标以实现高保真纹理贴图

### 关键技术点

1. **自适应顶点分裂与合并策略**: 实现粗到细的优化
2. **实时 UV 维护**: 在拓扑变化时保持 UV 一致性
3. **首次集成**: 将离散拓扑操作无缝集成到连续可微优化管道中

### 创新点
- 首个将离散拓扑操作整合到连续可微优化管道中的框架
- 直接从多视角图像优化显式网格，无需中间表示（如 TSDF）或后处理（如 Marching Cubes）
- 在准确性、计算效率和网格简洁性之间取得平衡

## 算法复杂度
- 无需 Marching Cubes 或 TSDF 融合后处理

## 开源实现
- Project: https://arxiv.org/abs/2606.07288

## 可行性分析
- **算法复杂度**: 高
- **数值稳定性**: 良好（拓扑操作的稳定性）
- **依赖项**: PyTorch, 可微网格操作
- **推荐度**: ⭐⭐⭐⭐ 推荐（拓扑+几何联合优化思路值得借鉴）

## 相关笔记
[[MeshFlow: Mesh Generation with Equivariant Flow Matching]]
[[LATO.2: Factorized 3D Mesh Generation]]
