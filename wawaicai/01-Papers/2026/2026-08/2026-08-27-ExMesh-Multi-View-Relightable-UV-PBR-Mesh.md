---
title: "From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition"
authors: ["Chuanjin Fan"]
date: 2026-08-25
arXiv: "2608.24109"
tags: [几何重建, 参数化, PBR材质, UV展开, 网格重建]
---

# ExMesh++: 多视图图像到可重光照UV-PBR网格资产

## 核心方法

提出 **ExMesh++**，一个分阶段框架，从多视图图像重建可重光照的 UV-PBR 网格资产。

### 两阶段架构

**第一阶段：几何与拓扑优化**
- 通过自适应顶点分裂与合并优化显式网格几何与拓扑
- 保持 UV 一致性（拓扑变化时）
- 关键创新：拓扑自适应重构

**第二阶段：材质与光照优化**
- 修复 mesh-UV 载体
- 联合优化 UV 空间 PBR 贴图与环境光照
- 通过 secondary-ray tracing 建模一次 bounce 漫反射间接光照
- 使用共享 UV-PBR 材质

## 关键创新点

1. **拓扑自适应顶点分裂/合并**：在保持 UV 一致性的同时优化网格拓扑
2. **稳定 UV 载体**：为后续材质优化提供稳定基础
3. **PBR 材质分解**：分离 albedo, metallic, roughness 等材质分量

## 算法复杂度
- 时间复杂度：待评估（涉及迭代优化）
- 空间复杂度：O(n) 网格顶点数

## 开源实现
- libigl: 可参考 `remesh_along_isocontours`, `vertex_triangle_adjacency`
- CGAL: `Polygon_mesh_processing` 包

## 可行性评估

✅ **推荐实现**

- 问题明确：解决多视图重建到可编辑 PBR 网格的端到端问题
- 方法清晰：两阶段框架逻辑清晰
- 实用性高：导出资产可直接用于标准 DCC 工作流
- 相关工作：与 Google 的 Fulmar、Adobe 的 STRMD 等相关

## 相关论文
[[2026-08-27-TopoSurfel-Gaussian-Surfels-Mesh-Reconstruction]]
