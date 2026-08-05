---
tags: [几何, 网格生成, Flow Matching, 图像到网格]
type: paper
venue: arXiv cs.GR
date: 2026-07-28
---

# Meshy T2: Fast Native Mesh Generation with Flow Matching

## 核心方法

### 问题定义
主流方法将 mesh 序列化为 token 序列并自回归解码，速度慢且误差累积，不适合交互式资产创建。

### 核心创新

**1. Vertex-set Mesh VAE**
- 每顶点一个连续 latent token
- 单次并行解码：vertices + edge connectivity + face winding order
- 保留高精度几何和 artist-authored topology
- 无需顶点量化或焊接

**2. Coarse-to-Fine Cascade of Two Flow-Matching Models**
- **Voxel Flow**：image-conditioned，从图像生成粗略占用 scaffold
- **Mesh Flow**：populate scaffold，每个顶点 latent token，条件包括 image + scaffold + vertex budget

### 三大能力

1. **Interactive generation speed**：并行流式综合
2. **Effective face-count control**：通过 vertex budget 控制面数
3. **Native multi-part assets**：部件直接从生成的连通性中出现

### 性能

- 中位数 **6 秒**完成 image-to-mesh
- 比自回归基线快 **一个数量级**
- 几何保真度 SOTA

## 开源实现

- Code & weights: https://github.com/meshy-dev/meshy-t2 (即将)

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#mesh-generation #flow-matching #image-to-mesh #generative-3d #vertex-va
