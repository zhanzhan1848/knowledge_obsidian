---
title: "SIGGRAPH 2026 几何处理相关论文汇总"
date: 2026-08-07
tags: [几何, SIGGRAPH2026, 曲面处理, 点云, 网格]
---

# SIGGRAPH 2026 几何处理相关论文

## 曲面表示与缠绕数 (Winding Numbers)

### Fast and Exact Winding Numbers for Triangle Meshes (SIG/TOG)
- **作者**: Peiyuan Xie, Christian Hafner, Chris Wojtan (ISTA)
- **领域**: 网格缠绕数计算

### Spatially Accelerated Winding Numbers for Curved Geometry (SIG/TOG)
- **作者**: Jacob Spainhour, Brad Whitlock, Kenneth Weiss (LLNL)
- **领域**: 曲线几何加速缠绕数

### The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers (SIG/TOG)
- **作者**: Cedric Martens, Philip Trettner, Mikhail Bessmeltsev
- **领域**: 广义缠绕数

### Robust containment queries over collections of trimmed NURBS surfaces via generalized winding numbers (TOG)
- **作者**: Jacob Spainhour, Kenneth Weiss (LLNL)
- **领域**: NURBS 曲面 containment 查询

## 曲面重建与采样

### ADS: Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding (SIG)
- **作者**: Suzuran Takikawa, Alla Sheffer et al. (UBC)
- **领域**: 自适应 Delaunay 采样

### Differentiable Voxelization of Surface Representations (SIG)
- **作者**: Tobias Djuren, Marc Alexa et al. (TU Berlin)
- **领域**: 可微体素化

### Uncertainty-aware geometry processing on Gaussian Process Implicit Surfaces (SIG/TOG)
- **作者**: Baptiste Genest, David Coeurjolly (CNRS)
- **领域**: 高斯过程隐式曲面

## 点云处理

### Learning Laplacian Eigenspace with Mass-Aware Neural Operators on Point Clouds (SIG)
- **作者**: Zherui Yang, Ligang Liu et al. (USTC, Tsinghua)
- **领域**: 点云拉普拉斯特征空间

### Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds (SIG/TOG)
- **作者**: Pengfei Wang, Shiqing Xin et al. (Shandong University)
- **领域**: 流形点云加速 k-NN

## 网格处理

### GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes (SIG/TOG)
- **作者**: Haopeng Fan, Min Tang et al. (Zhejiang University)
- **领域**: 网格 Hausdorff 距离

### PQ-Free HD: Priority-Queue-Free Hausdorff Distance for Triangle Meshes on GPU (SIG/TOG)
- **作者**: Zhihao Hu, Renjie Chen (USTC)
- **领域**: GPU 网格距离

### Locality-Aware Automatic Differentiation on the GPU for Mesh-Based Computations (SIG/TOG)
- **作者**: Ahmed H. Mahmoud, Justin Solomon et al. (MIT)
- **领域**: 网格自动微分

### Fast Sparse Matrix Permutation for Mesh-Based Direct Solvers (SIG)
- **作者**: Behrooz Zarebavani, Justin Solomon et al.
- **领域**: 网格直接求解器

## 几何处理系统

### Iskra: A System for Inverse Geometry Processing (SIG/TOG)
- **领域**: 逆几何处理系统

### DJM: Compact Base Meshes for Displacement Mapping using Triangle Jacobians (TOG)
- **领域**: 位移映射紧凑基网格

## 三角剖分与 Voronoi

### gCDT: A Highly Parallel GPU Algorithm for Large-Scale Constrained Delaunay Triangulation (SIG)
- **作者**: Peng Fan, Min Tang et al. (Zhejiang University)
- **领域**: GPU 约束 Delaunay 三角剖分

### Scalable GPU Construction of 3D Voronoi and Power Diagrams (SIG)
- **作者**: Bernardo Taveira, Carl Lindstrom et al. (Chalmers)
- **领域**: GPU 3D Voronoi

## 备注
- 数据来源: https://kesen.realtimerendering.com/sig2026.html
- 完整 SIGGRAPH 2026 论文列表请参考原页面
