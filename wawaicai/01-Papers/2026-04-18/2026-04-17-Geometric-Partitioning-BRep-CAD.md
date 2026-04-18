---
tags: [几何, 网格处理, CAD, B-Rep, 简化]
date: 2026-04-17
source: arXiv cs.GR
paper_id: 2604.14927
---

# Geometric Partitioning of Boundary Representations for Large-Scale CAD Processing

## 核心方法

本文提出 **STEP-Parts**，一个 CAD-to-supervision 工具链，直接从原始 STEP B-Rep 提取几何实例分区，并通过保留的源面 correspondence 将其转移到 tessellated carriers。

**关键技术点**：
- 合并相邻 B-Rep faces 仅当它们共享相同的解析图元类型并满足 near-tangent 连续性准则
- 利用 ABC 数据集中 same-primitive 二面角呈现强双峰分布
- 分区在固有 B-Rep 拓扑上定义，而非特定三角化，因此对 tessellation 变化稳定
- 在 consumer CPU 上约 6 小时处理 ~180,000 模型

## 算法复杂度
- 时间复杂度：O(n log n) per model (基于 B-Rep face 数量)
- 空间复杂度：O(n) for face adjacency graph

## 创新点
1. **确定性几何分区**：不依赖 ML，直接从 STEP B-Rep 提取几何实例标签
2. **Tessellation 鲁棒性**：分区基于 B-Rep 拓扑，对不同三角化密度稳定
3. **大规模处理**：可处理数十万 CAD 模型

## 开源实现
- GitHub: 待发布 (论文提到会 release code)
- 数据集: DeepCAD subset of ABC

## 可行性分析
- **算法复杂度**：中等
- **数值稳定性**：高 (确定性算法，无 ML 训练不稳定性)
- **依赖项**：STEP 文件解析库 (如 OpenCASCADE)
- **推荐度**：⭐⭐⭐⭐⭐ CAD 几何处理必读

## 相关笔记
[[2026-04-17-Progressive-Convex-Hull-Simplification]]
