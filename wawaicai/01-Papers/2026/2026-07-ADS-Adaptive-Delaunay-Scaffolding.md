---
tags: [几何, 网格生成, Delaunay, 采样, SIGGRAPH2026]
date: 2026-07
venue: SIGGRAPH 2026
---

# ADS: Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding

## 论文信息

- **DOI**: https://doi.org/10.1145/3799902.3811146
- **作者**: Suzuran Takikawa, Leo Foord-Kelcey, Oliver Oxford, Nicholas Vining (NVIDIA), Alla Sheffer (UBC)
- **venue**: SIGGRAPH 2026 (SIG)
- **代码**: https://github.com/stakikawa/ads
- **项目页**: https://www.cs.ubc.ca/labs/imager/tr/2026/ads/

## 核心问题

从占用函数（occupancy function）中随机采样并重建网格表面是许多几何处理任务的核心。现有方法难以同时保证采样质量和表面重建精度。

## 核心方法

### Adaptive Delaunay Scaffolding (ADS)

1. **构建自适应 Delaunay 脚手架**: 使用 Delaunay  tetrahedralization 作为临时网格结构
2. **占用函数采样**: 在 Delaunay 顶点处采样占用函数
3. **表面提取**: 使用 Marching Tetrahedra 或类似方法从采样中重建表面
4. **迭代细化**: 自适应地细化脚手架直到满足精度要求

### 关键创新

- **自适应密度控制**: 根据表面复杂度自动调整采样密度
- **保证收敛性**: 通过 Delaunay 结构的数学保证
- **GPU 友好**: 可在 GPU 上高效实现

## 应用场景

- 神经隐式表示的表面重建
- 点云表面重建
- 体积数据可视化

## 开源实现

- https://github.com/stakikawa/ads

## 推荐度

✅ **推荐** - 网格生成领域的重要进展，适合与神经隐式方法结合

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
[[Fast-Exact-Winding-Numbers-Triangle-Meshes]]
