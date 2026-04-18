---
tags: [几何, 3D资产生成, 骨骼, 蒙皮, 神经表示]
date: 2026-04-13
source: arXiv cs.GR
paper_id: 2604.08746
---

# AniGen: Unified S^3 Fields for Animatable 3D Asset Generation

## 核心方法

AniGen 是一个统一框架，直接从单张图像生成 animate-ready 3D assets (配备骨骼和蒙皮权重)。

**关键技术点**：
1. **S³ Fields (Shape, Skeleton, Skin)**：在共享空间域上定义形状、骨骼和蒙皮
2. **置信度衰减骨骼场**：处理 Voronoi 边界的几何歧义
3. **双皮肤特征场**：解耦蒙皮权重与特定关节数量

## 创新点
1. **统一生成**：形状、骨骼、蒙皮一次性生成
2. **拓扑一致性**：避免后处理 auto-rigging 的脆性
3. **任意复杂度**：固定架构网络预测任意复杂度 rig

## 可行性分析
- **算法复杂度**：高 (端到端生成)
- **数值稳定性**：待验证
- **依赖项**：深度学习框架
- **推荐度**：⭐⭐⭐⭐⭐ 3D 资产生成重要进展

## 相关笔记
[[2026-03-26-WorldMesh-Mesh-Conditioned-Image-Diffusion-3D-Scenes]]
