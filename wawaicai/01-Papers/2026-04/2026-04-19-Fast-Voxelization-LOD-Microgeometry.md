---
tags: [几何, 体素化, LOD, microgeometry, 渲染]
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 论文信息

- **arXiv**: [2604.13191](https://arxiv.org/abs/2604.13191)
- **Authors**: Javier Fabre et al.
- **Submitted**: Tue, 14 Apr 2026 (v1)
- **Accepted**: The Visual Computer (accepted paper)
- **Subjects**: cs.GR, cs.LG
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2604.13191)
- **Supplementary**: [PDF](https://javierfabre.com/projects/voxel-lod/supp.pdf)

## 核心方法

针对各向异性光散射微结构（纤维、刷纹金属棱脊）的高效体素化和多分辨率 LOD 表示。

### 关键算法
1. **并行体素化**：CUDA 实现的高效并行体素化方法，支持三角网格和含纤维的体积数据
2. **层次 SGGX 聚类**：Hierarchical SGGX Clustering，比 baseline 提供更高精度
3. **LOD 数据结构**：多分辨率聚合结构，MIP-map 风格的多距离视觉聚合

### 创新点
- SGGX（The Disney BRDF 的体积版本）用于微几何 LOD
- 显式纤维建模的体积织物数据
- 路径追踪验证

## 复杂度分析
- **时间**：并行 CUDA 实现
- **空间**：O(n) 体素存储 + LOD 多分辨率层次

## 实现难度
- **算法复杂度**：中（CUDA 并行 + SGGX 体积散射）
- **数值稳定性**：GPU 浮点精度
- **依赖项**：CUDA、路径追踪器（可用 OSL 或自作）

## 推荐结论
✅ 推荐实现（微几何渲染和体素化方向）

## 开源参考
- SGGX: Disney/PBRT 相关体积散射文献
- CUDA 并行体素化参考: OpenVDB, Intel TBB

## 相关笔记
[[Voxelization-LOD-Microgeometry]]
