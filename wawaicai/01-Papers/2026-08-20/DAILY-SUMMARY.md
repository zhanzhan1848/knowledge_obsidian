# 📋 每日论文摘要 - 2026-08-20

## 🥬 几何处理领域每日论文收集

**收集时间**: 2026-08-20 14:00 UTC
**搜索范围**: arXiv cs.GR, SIGGRAPH 2026

---

## 📑 今日发现

### arXiv cs.GR (最近24小时)

1. **Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds**
   - arXiv: 2608.17682
   - 关键词: Voronoi tessellation, novel view synthesis, ray tracing, neural rendering
   - 几何相关: Voronoi图构建与光线追踪

2. **Interactive Stroke-based Neural SDF Sculpting**
   - arXiv: 2502.02891v2
   - 关键词: neural SDF, sculpting, 3D editing
   - 几何相关: 神经SDF编辑框架

---

### SIGGRAPH 2026 几何处理相关论文

#### 网格处理
| 论文 | 编号 | 关键词 |
|------|------|--------|
| TSMC: Time-varying 4D Scene Mesh Compression | #414 | 4D mesh, compression |
| Nexus: Native Mesh Generation with Diffusion | #808 | mesh generation, diffusion |
| MeshFlow: Mesh Generation with Equivariant Flow Matching | #1165 | mesh generation, flow matching |
| Strips as Tokens: Artist Mesh Generation with Native UV Segmentation | #164 | mesh UV segmentation |

#### 距离场与表面提取
| 论文 | 编号 | 关键词 |
|------|------|--------|
| SuperSDF: Sparse SDF Super-Resolution | #1060 | SDF, surface extraction |
| SAND: Spatially Adaptive Network Depth | #770 | neural implicit surfaces |
| The PhaseTree: Multiphase Signed Distance Fields | #1372 | multiphase SDF |
| Dual Contouring of Signed Distance Data | #654 | dual contouring |
| Subgrid Marching Tetrahedra | #974 | marching tetrahedra |

#### Voronoi 与计算几何
| 论文 | 编号 | 关键词 |
|------|------|--------|
| Scalable GPU Construction of 3D Voronoi and Power Diagrams | #1711 | GPU, Voronoi, power diagrams |
| Differentiable Voronoi Ray Tracing | (arXiv:2608.17682) | Voronoi ray tracing |

#### 点云处理
| 论文 | 编号 | 关键词 |
|------|------|--------|
| Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds | #101 | point cloud, k-NN |

#### 度量与误差
| 论文 | 编号 | 关键词 |
|------|------|--------|
| GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes | #169 | Hausdorff distance, mesh comparison |

---

## 🔬 值得深入关注的论文

### ⭐⭐⭐ 高优先级
1. **Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds**
   - 实现难度: 中
   - libigl参考: `voronoi_diagram`, `delaunay_triangulation`
   - CGAL参考: 3D Triangulations

2. **Dual Contouring of Signed Distance Data**
   - 实现难度: 中
   - 相关库: libigl `contour`

3. **Scalable GPU Construction of 3D Voronoi and Power Diagrams**
   - 实现难度: 高
   - GPU实现

### ⭐⭐ 中优先级
- SuperSDF (SDF超分辨率)
- MeshFlow (网格生成)
- Subgrid Marching Tetrahedra

---

## 📊 统计
- arXiv cs.GR 今日新增: 2 篇
- SIGGRAPH 2026 几何相关: 14+ 篇

## 🏷️ 标签
`#几何处理` `#每日收集` `#SIGGRAPH2026` `#arXiv` `#Voronoi` `#SDF` `#网格生成`

---
*由 wawaicai 自动生成于 2026-08-20 14:00 UTC*
