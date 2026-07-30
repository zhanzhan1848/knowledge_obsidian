---
tags: [几何, SIGGRAPH2026, 网格生成, SDF, CAD]
date: 2026-07-30
venue: SIGGRAPH 2026
---

# SIGGRAPH 2026 几何处理论文摘要

## 网格生成与重建

### 1. Nexus: Native Mesh Generation with Diffusion
- **作者**: Hanxiao Wang et al.
- **方法**: 扩散模型 + 解耦顶点+拓扑生成
- **创新**: 首个原生网格生成的扩散方法
- **关键词**: mesh generation, diffusion model, topology

### 2. Dual Contouring of Signed Distance Data
- **作者**: Xiana Carrera et al. (Columbia University)
- **方法**: 从 SDF 数据进行网格重建
- **创新**: 保持尖锐特征
- **关键词**: SDF, mesh reconstruction, sharp features
- **参考**: [论文 PDF](https://www.cs.columbia.edu/~silviasellan/pdf/papers/dcsdd.pdf)

### 3. Subgrid Marching Tetrahedra
- **作者**: Hossein Baktash, Mark Gillespie, Keenan Crane
- **方法**: 子网格四面体化算法
- **创新**: 改进 Marching Tetrahedra 精度
- **关键词**: marching tetrahedra, isosurface

### 4. SuperSDF: Sparse SDF Super-Resolution for Surface Extraction
- **作者**: Sagar Panwar et al.
- **方法**: SDF 超分辨率用于表面提取
- **创新**: 从稀疏 SDF 高效提取精细网格
- **关键词**: SDF, super-resolution, surface extraction

---

## 神经隐式表示

### 5. The PhaseTree: Multiphase Signed Distance Fields
- **作者**: Eric Galin et al.
- **方法**: 多相 SDF 表示
- **创新**: 支持多种材质/相位的 SDF
- **关键词**: multiphase, SDF, heterogeneous materials

### 6. SAND: Spatially Adaptive Network Depth
- **作者**: Chuanxiang Yang et al.
- **方法**: 自适应网络深度用于神经隐式曲面快速采样
- **创新**: 加速神经隐式曲面评估
- **关键词**: neural implicit, fast sampling

### 7. Gaussian Point Splatting
- **作者**: Joris Rijsdijk et al.
- **方法**: 基于点的 Gaussian 渲染
- **创新**: 无需高斯椭球，直接点渲染
- **关键词**: point rendering, splatting

---

## CAD / B-rep 几何

### 8. DualBrep: A Dual-Field Continuous Representation for B-rep Modelling
- **作者**: Yilin Liu et al.
- **方法**: 双向场表示 B-rep
- **创新**: 连续表示改进 CAD 建模
- **关键词**: B-rep, CAD, solid modeling

### 9. Autoregressive B-Rep Shape Generation with Parametric Surfaces
- **作者**: Dafei Qin et al.
- **方法**: 自回归生成参数曲面 B-rep
- **创新**: 端到端 CAD 模型生成
- **关键词**: B-rep, parametric surfaces, generative

### 10. B-repLer: Language-guided Editing of CAD Models
- **作者**: Yilin Liu et al.
- **方法**: 语言引导 CAD 模型编辑
- **创新**: 自然语言接口
- **关键词**: CAD, NLP, editing

---

## 点云几何处理

### 11. Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds
- **作者**: Pengfei Wang et al.
- **方法**: 流形点云加速 k-NN
- **创新**: 利用流形结构加速
- **关键词**: point cloud, k-NN, manifold

### 12. Scalable GPU Construction of 3D Voronoi and Power Diagrams
- **作者**: Bernardo Taveira et al.
- **方法**: GPU 可扩展 Voronoi 图构建
- **创新**: 大规模并行化
- **关键词**: Voronoi, power diagram, GPU

---

## 网格度量与处理

### 13. GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes
- **作者**: Haopeng Fan et al.
- **方法**: GPU 加速 Hausdorff 距离
- **创新**: 有保证的距离上界
- **关键词**: Hausdorff distance, mesh comparison

### 14. InvSculpt: Inverse Sculpting via Vector Displacement Field
- **作者**: Hengyu Meng et al.
- **方法**: 逆向雕刻建模
- **创新**: 控制 3D 生成 + 位移场
- **关键词**: 3D editing, displacement

---

## 几何深度学习

### 15. ShapeUP: Scalable Image-Conditioned 3D Editing
- **作者**: Inbar Gat et al.
- **方法**: 可扩展图像条件 3D 编辑
- **创新**: 潜在空间翻译
- **关键词**: 3D editing, image-conditioned

### 16. CubePart: Open-Vocabulary Part-Controllable 3D Generator
- **作者**: Yiheng Zhu et al.
- **方法**: 开放词汇部件可控 3D 生成
- **创新**: 部件级别控制
- **关键词**: 3D generation, part control

---

## 📊 趋势分析

1. **扩散模型 + 网格**: Nexus 等工作探索从扩散模型直接生成网格
2. **SDF 仍是主流**: 多种 SDF 表示方法（SuperSDF, PhaseTree）
3. **CAD B-rep 复兴**: 多篇论文关注 CAD 表示与生成
4. **GPU 并行化**: Voronoi、Hausdorff 距离等几何算法 GPU 化
5. **几何 + 语言**: B-repLer, ShapeUP 探索几何与 NLP 结合

---

## 🔬 重点关注

1. **Nexus** - 扩散模型生成原生网格
2. **Dual Contouring** - Keenan Crane 团队，值得关注
3. **DualBrep** - CAD B-rep 新表示
4. **Manifold k-NN** - 点云处理加速

---

*娃娃菜笔记 | 2026-07-30*
