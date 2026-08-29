---
title: "ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition"
authors: Chuanjin Fan et al.
date: 2026-08-25
tags: [渲染, PBR, ray tracing, 多视角重建, 材质分解, 2026]
status: 重要
source: arXiv cs.GR
link: https://arxiv.org/abs/2608.24109
---

# ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition |
| 作者 | Chuanjin Fan et al. |
| 发表 | arXiv (2026-08-25) |
| 链接 | [arXiv](https://arxiv.org/abs/2608.24109) |

## 核心贡献

1. **两阶段管线**：从多视角图像重建可重光照、可编辑的 UV-PBR 网格资产
2. **拓扑自适应网格重构**：通过自适应顶点分裂与合并优化网格几何和拓扑，同时保持 UV 一致性
3. **UV空间 PBR 材质优化**：固定 mesh-UV 载体后，在 UV 空间优化 PBR 贴图和环境光照
4. **次级射线追踪**：使用共享的 UV-PBR 材质通过次级射线追踪建模单次弹射漫反射间接光照

## 技术方案

### 第一阶段：网格拓扑优化
- 自适应顶点分裂与合并
- 保持 UV 一致性
- 优化显式网格几何

### 第二阶段：PBR 材质分解
- 固定 mesh-UV 载体
- 优化 UV 空间 PBR 贴图
- 环境光照估计
- 次级射线追踪计算间接光照

## 实验结论

- 几何精度具有竞争力
- 重光照性能优秀
- 可直接用于标准 DCC 工作流

## 局限性

- 仅建模单次弹射间接光照
- 联合优化可能导致材质-光照分解不明确

## 创新性：⭐⭐⭐⭐
## 实用性：⭐⭐⭐⭐⭐
## 实现难度：中

## 标签
#渲染 #PBR #ray-tracing #多视角重建 #2026
