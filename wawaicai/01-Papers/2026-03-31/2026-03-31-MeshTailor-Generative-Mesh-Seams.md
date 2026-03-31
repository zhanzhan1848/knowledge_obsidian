---
title: "MeshTailor: Cutting Seams via Generative Mesh Traversal"
arXiv: 2603.27309
date: 2026-03-31
tags: [几何, 网格处理, UV展开, 参数化, 生成式模型]
authors: ["Xueqi Ma", "Xingguang Yan", "Congyue Zhang", "Hui Huang"]
affiliation: ["Shenzhen University", "Simon Fraser University"]
venue: arXiv cs.GR
---

# MeshTailor: Cutting Seams via Generative Mesh Traversal

## 核心方法

首个**网格原生（mesh-native）生成式框架**，直接在网格图上合成边缘对齐的接缝（seams），用于 UV 展开和纹理映射。

### 核心创新

1. **ChainingSeams** - 一种层级序列化方案，将接缝图按从全局结构切割到局部细节的粗到细顺序组织，使得自回归模型能够优先考虑结构逻辑而非细粒度几何。
2. **双流编码器（Dual-Stream Encoder）** - 融合拓扑连通性特征（通过图编码器）和几何形状信息（通过预训练点云编码器）。
3. **MeshTailor Transformer** - 使用自回归指针层（Pointer Network）在局部邻域内逐顶点追踪接缝，确保投影无关、边缘对齐。

### 技术路线

- **输入**: 3D 网格 (V, E)
- **输出**: 边缘对齐的接缝序列
- **序列化**: ChainingSeams 将接缝图按层级顺序排列
- **推理**: Pointer Network 在 1-ring 邻域内逐步选择下一顶点
- **避免投影**: 直接在网格边上操作，无需 snapping

## 算法复杂度

- **编码器**: 图神经网络处理 O(|V|+|E|) 的网格拓扑
- **解码器**: 自回归指针层，每步在局部邻域选择，复杂度 O(k) 每步（k = 1-ring 顶点数）
- **训练**: 端到端可微

## 实现难度

- **算法复杂度**: 中高
- **数值稳定性**: 良好 - Pointer Network 避免投影
- **依赖项**: PyTorch, 图神经网络, 预训练点云编码器 (PointNet++/PointMAE)

## 推荐结论

✅ **强烈推荐实现**

MeshTailor 是 UV 展开和接缝生成领域的重大进展，直接在网格图上操作消除了传统方法的投影伪影，对网格处理工具链有直接价值。

## 开源参考

- GitHub: 待补充（论文未提供）
- 预训练点云编码器: 冻结权重

## 相关笔记

[[2026-03-30-daily-search-report]]
[[2026-03-12-TopGen-Quadrilateral-Mesh-Generation]]
