---
tags: [几何, 网格生成, 深度学习, 生成模型]
type: 论文
created: 2026-06-16
source: arXiv cs.CV
venue: CVPR 2026 Highlight
---

# MeshFlow: Efficient Artistic Mesh Generation via MeshVAE and Flow-based Diffusion Transformer

## 核心方法

**问题**: 现有网格生成器采用自回归(AR)下一token预测，存在两个问题：
1. 推理成本随网格大小二次增长，难以扩展到高多边形网格
2. 需要离散化顶点坐标，引入量化误差

**解决方案**: 
- **MeshVAE**: 提出变分自编码器，用对比损失监督，在连续潜空间中同时表示连续顶点位置和离散连通性
- **3D Rectified Flow Transformer**: 并行生成所有网格顶点和边
- **关键创新**: 潜空间比基于token的表示更紧凑

## 算法复杂度
- 时间：生成速度比最快AR生成器快 **18倍**
- 空间：潜空间紧凑

## 创新点
1. 首个将VAE与对比学习结合用于网格生成
2. 连续表示避免量化误差
3. 并行生成突破AR瓶颈

## 开源参考
- 代码: https://github.com/facebookresearch/meshflow
- 主页: https://mesh-flow.github.io/

## 相关笔记
[[MeshWeaver]] - 同样是网格生成，但方法不同

## 可行性评估
✅ **推荐实现**

对于需要快速生成高质量网格的应用，MeshFlow的VAE+Rectified Flow架构值得借鉴。其连续潜空间表示可与libigl的网格处理流程结合。
