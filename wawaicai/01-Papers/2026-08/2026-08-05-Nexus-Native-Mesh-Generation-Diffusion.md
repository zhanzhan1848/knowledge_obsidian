---
tags: [几何, Nexus, 网格生成, Diffusion, SIGGRAPH2026]
type: paper
venue: SIGGRAPH 2026
date: 2026-07
---

# Nexus: Native Mesh Generation with Diffusion

## 核心方法

### 问题定义
Polygonal meshes 是现代 3D pipelines 的标准表面表示，生成具有 artist-style topology 的高质量网格对影视、游戏和交互式 3D 应用至关重要。

### 核心创新：Decoupled Vertex and Topology Generation

**Nexus** - 扩散方法实现整体 (holistic) 网格生成

- **解耦顶点生成**：生成精确几何
- **解耦拓扑生成**：生成正确的连接性
- Holistic 方式：一次性生成完整 mesh

### 与 Meshy T2 对比

| 特性 | Nexus | Meshy T2 |
|------|-------|----------|
| 方法 | Diffusion | Flow Matching |
| 策略 | Decoupled vertex + topology | Vertex-set VAE |
| 特点 | Holistic generation | Coarse-to-fine cascade |
| 平台 | SIGGRAPH 2026 | arXiv 2026 |

## 作者

Hanxiao Wang, Ying-Tian Liu, Yuan-Chen Guo, Qi-Yuan Feng, Zi-Xin Zou, Ding Liang, Biao Zhang, Yan-Pei Cao

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#mesh-generation #diffusion #holistic-mesh #siggraph2026 #generative-3d
