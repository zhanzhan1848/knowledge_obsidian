---
title: "Nexus: Native Mesh Generation with Diffusion"
date: 2026-07-19
venue: SIGGRAPH 2026
tags: [几何, 网格生成, Diffusion, Neural-Mesh]
authors:
  - Hanxiao Wang
  - Ying-Tian Liu
  - Yuan-Chen Guo
  - Qi-Yuan Feng
  - Zi-Xin Zou
  - Ding Liang
  - Biao Zhang
  - Yan-Pei Cao
doi: "10.1145/3811344"
url: "https://dl.acm.org/doi/10.1145/3811344"
---

# Nexus: Native Mesh Generation with Diffusion

## 核心方法

提出一种 diffusion 方法，通过**解耦顶点生成和拓扑生成**实现整体网格生成。

### 关键创新点
- **解耦策略**：分别处理顶点位置和网格拓扑
- **Diffusion 框架**：利用 diffusion model 的强大生成能力
- **原生网格输出**：直接生成可用的三角网格

## 关键词
- Mesh Generation
- Diffusion Model
- Native Mesh
- Topology Generation

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：待分析

## 开源实现
- 暂无

## 相关笔记
[[MeshFlow]]
[[Strips-as-Token]]
