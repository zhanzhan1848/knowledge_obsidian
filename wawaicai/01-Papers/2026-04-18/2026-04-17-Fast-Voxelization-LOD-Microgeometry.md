---
tags: [几何, 体素化, LOD, 微几何, 渲染]
date: 2026-04-14
source: arXiv cs.GR
paper_id: 2604.13191
conference: The Visual Computer
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 核心方法

本文提出两个贡献：
1. **高效并行体素化方法**：设计用于快速数据聚合的多分辨率级别
2. **层次 SGGX 聚类表示**：比基线方法提供更好精度

**关键技术点**：
- CUDA 实现体素化器
- 测试于三角形网格和具有显式纤维的体积织物
- 基于提出的 LOD 渲染模型的路径追踪器生成结果

## 算法复杂度
- 并行算法，复杂度与体素数量线性相关
- LOD 聚类减少存储和计算

## 创新点
1. **层次 SGGX 聚类**：新颖的 LOD 表示
2. **并行体素化**：GPU 加速
3. **微几何渲染**：支持纤维等微观结构

## 开源实现
- 补充材料: https://javierfabre.com/projects/voxel-lod/supp.pdf

## 可行性分析
- **算法复杂度**：中等
- **数值稳定性**：高
- **依赖项**：CUDA
- **推荐度**：⭐⭐⭐⭐ 微几何渲染必读

## 相关笔记
[[2026-04-17-Geometric-Partitioning-BRep-CAD]]
