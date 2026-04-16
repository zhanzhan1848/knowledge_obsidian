---
tags: [几何, 体素化, microgeometry, LOD]
date: 2026-04-16
arxiv: 2604.13191
subject: cs.GR
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 核心方法

**问题**：各向异性散射材料（纤维、拉丝金属等）的微结构需要高分辨率体素表示，体素获取耗时且占内存，且需要 LOD 结构来聚合多距离视觉外观。

**贡献**：
1. **高效并行体素化方法**：CUDA 实现，支持多分辨率级别的快速数据聚合
2. **层次 SGGX 聚类表示**：比基线方法精度更高的新型表示
3. **路径追踪验证**：基于提议的 LOD 渲染模型的路径追踪器验证

## 算法要点

- **输入**：三角形网格 + 显式纤维建模的体积织物
- **方法**：并行体素化 → 多分辨率聚合 → 层次 SGGX 聚类
- **验证**：CUDA 实现 + 路径追踪器

## 开源参考

- 补充材料: https://javierfabre.com/projects/voxel-lod/supp.pdf
- 发表：The Visual Computer (2026)

## 相关笔记

[[2026-04-16-DAILY-SUMMARY]]
