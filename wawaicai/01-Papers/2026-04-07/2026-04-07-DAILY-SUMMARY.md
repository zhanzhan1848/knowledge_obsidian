---
title: "每日几何处理论文总结 - 2026-04-07"
date: 2026-04-07
tags: [daily-summary, geometry-processing, mesh-processing]
---

# 每日几何处理论文总结 - 2026-04-07

## 📋 今日扫描概况

- **扫描来源**：arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **搜索关键词**：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **时间范围**：最近 24 小时（2026-04-06 ~ 2026-04-07）
- **cs.GR 新论文总数**：6 篇 (Apr 7) + 2 篇 (Apr 6) + 5 篇 (Apr 3)

## 🎯 几何处理相关论文

### 🆕 本次新增

| 论文 | 领域 | 相关度 | 备注 |
|------|------|--------|------|
| [[2026-04-07-VisACD-Approximate-Convex-Decomposition\|VisACD: GPU-Accelerated ACD]] | 网格分解 | ⭐⭐⭐ | 凸分解、GPU加速、旋转等变 |

### 📌 往期已记录 (本周有效)

| 论文 | 领域 | 日期 | 备注 |
|------|------|------|------|
| [[2026-04-03-Topology-First-BRep-Meshing\|Topology-First B-Rep Meshing]] | 网格生成 | Apr 2 | CAD B-Rep 拓扑保征网格化 |
| [[2026-04-03-Dual-Contouring-Signed-Distance-Data\|Dual Contouring of SDF]] | 表面重建 | Mar 31 | SDF 离散采样重建 |
| [[2026-04-03-Non-Rigid-3D-Shape-Correspondences\|Non-Rigid 3D Shape Correspondences]] | 形状匹配 | Apr 1 | Eurographics 2026 STAR |

## 📝 论文摘要

### VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

**作者**：Egor Fokin  
**arXiv**：2604.04244  
**领域**：cs.GR, cs.CG  
**提交时间**：2026-04-05

**核心贡献**：
- 提出基于可见性的 GPU 加速近似凸分解算法
- 旋转等变设计，不受输入方向影响
- 产生高质量少量凸部件分解
- 支持 intersection-free 保证

**算法要点**：
1. 顶点间可见性计算
2. 可见性驱动切割方向
3. GPU 并行分解操作
4. 迭代直到满足凸性

**可行性**：
- 推荐度：⭐⭐⭐
- 适合物理模拟碰撞检测场景
- GPU 实现可考虑 CUDA 或 compute shaders

## 🔬 领域趋势观察

### 本周几何处理热点

1. **B-Rep 网格化** - CAD 与图形学交汇，拓扑保征成为热点
2. **神经隐式几何** - INR/NeRF 相关几何编辑持续活跃
3. **3DGS 几何处理** - Gaussian Splatting 相关的几何分解、压缩方法
4. **表面重建** - SDF 离散数据重建方法

## 📅 下次扫描计划

- 时间：2026-04-08 02:00 (UTC)
- 重点关注：SGP 相关预印本、CAD 网格化进展

---

*由 wawaicai 自动生成 | 扫描时间: 2026-04-07 14:06 UTC*
