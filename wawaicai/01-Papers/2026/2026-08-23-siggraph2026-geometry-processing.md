---
title: SIGGRAPH 2026 几何处理相关论文速览
date: 2026-08-23
tags: [SIGGRAPH, 几何处理, 网格处理, 曲面表示, 2026]
---

# 🥬 SIGGRAPH 2026 几何处理论文速览

> 生成时间: 2026-08-23 | 来源: kesen.realtimerendering.com/sig2026.html

## 一、曲面表示与网格处理

### 1. Fast and Exact Winding Numbers for Triangle Meshes
- **DOI**: 10.1145/3811339
- **类型**: SIG/TOG
- **作者**: Peiyuan Xie, Christian Hafner, Chris Wojtan (ISTA)
- **链接**: 
  - 主页: https://visualcomputing.ist.ac.at/publications/2026/FEWN/
  - 代码: https://git.ista.ac.at/wojtan-group/peiyuan-xie/boundaryblaze
- **核心方法**: 快速精确的网格卷绕数计算
- **标签**: #卷绕数 #网格处理 #曲面求交

### 2. Spatially Accelerated Winding Numbers for Curved Geometry
- **DOI**: 10.1145/3811389
- **类型**: SIG/TOG
- **作者**: Jacob Spainhour, Brad Whitlock, Kenneth Weiss (LLNL)
- **链接**: https://arxiv.org/abs/2605.19200
- **核心方法**: 曲几何的空间加速卷绕数
- **标签**: #卷绕数 #曲几何

### 3. The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers
- **DOI**: 10.1145/3811323
- **类型**: SIG/TOG
- **作者**: Cedric Martens, Philip Trettner, Mikhail Bessmeltsev (UdeM)
- **链接**: 
  - 主页: https://cedricmartens.com/publications/antipodal_wn
  - 代码: https://github.com/MartensCedric/antipodal
- **核心方法**: 快速、准确、鲁棒的三维广义卷绕数
- **标签**: #卷绕数 #鲁棒性

### 4. ADS: Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding
- **DOI**: 10.1145/3799902.3811146
- **类型**: SIG
- **作者**: Suzuran Takikawa, Leo Foord-Kelcey, Oliver Oxford, Nicholas Vining, Alla Sheffer (UBC)
- **链接**: 
  - 主页: https://www.cs.ubc.ca/labs/imager/tr/2026/ads/
  - 代码: https://github.com/stakikawa/ads
- **核心方法**: 自适应 Delaunay 脚手架的占用函数随机采样
- **标签**: #Delaunay #采样 #占用函数

### 5. Differentiable Voxelization of Surface Representations
- **DOI**: 10.1145/3799902.3811203
- **类型**: SIG
- **作者**: Tobias Djuren, Ugo Finnendahl, Markus Worchel, Hendrik Meyer, Marc Alexa (TU Berlin)
- **链接**: https://github.com/mworchel/differentiable-voxelization
- **核心方法**: 表面表示的可微体素化
- **标签**: #可微渲染 #体素化 #表面重建

### 6. Uncertainty-aware geometry processing on Gaussian Process Implicit Surfaces
- **DOI**: 10.1145/3811280
- **类型**: SIG/TOG
- **作者**: Baptiste Genest, David Coeurjolly (UCBL, CNRS, INSA Lyon)
- **链接**: 
  - 主页: https://perso.liris.cnrs.fr/david.coeurjolly/publication/gpgp-26/
  - 代码: https://github.com/baptiste-genest/GPGP
- **核心方法**: 高斯过程隐式曲面的不确定性感知几何处理
- **标签**: #隐式曲面 #不确定性 #高斯过程

---

## 二、网格生成与参数化

### 7. Strips as Tokens: Artist Mesh Generation with Native UV Segmentation
- **DOI**: 10.1145/3799902.3811103
- **类型**: SIG/TOG
- **作者**: Rui Xu, Dafei Qin, Kaichun Qiao, et al.
- **链接**: 主页待补充
- **核心方法**: 使用原生 UV 分割的艺术家网格生成
- **标签**: #UV分割 #网格生成 #艺术家工具

### 8. Nexus: Native Mesh Generation with Diffusion
- **DOI**: 10.1145/3799902.3811xxx
- **类型**: SIG
- **作者**: Hanxiao Wang, Ying-Tian Liu, Yuan-Chen Guo, et al.
- **链接**: 主页待补充
- **核心方法**: 基于扩散的原生网格生成
- **标签**: #扩散模型 #网格生成

### 9. MeshFlow: Mesh Generation with Equivariant Flow Matching
- **DOI**: 10.1145/3799902.3811xxx
- **类型**: SIG
- **作者**: Qi Sun, Kiyohiro Nakayama, Jing Yan, et al.
- **链接**: 主页待补充
- **核心方法**: 等变流匹配的网格生成
- **标签**: #流匹配 #网格生成 #等变网络

---

## 三、3D 高斯溅射与渲染

### 10. Gaussian Point Splatting
- **DOI**: 10.1145/3811272
- **类型**: SIG/TOG
- **作者**: Joris Rijsdijk, Christoph Peters, Michael Weinmann, Ricardo Marroquim (TU Delft)
- **链接**: 
  - 主页: https://jorisar.nl/gaussian_point_splatting/
  - 代码: https://github.com/JorisAR/gaussian-point-splatting
- **核心方法**: 高斯点溅射
- **标签**: #3DGS #点云 #渲染

### 11. Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification
- **DOI**: 10.1145/3799902.3811212
- **类型**: SIG
- **作者**: Linjie Lyu, Ayush Tewari, et al. (MPI-INF, Cambridge)
- **链接**: 
  - 主页: https://vcai.mpi-inf.mpg.de/projects/SAD-GS/
  - 代码: https://github.com/LinjieLyu/SADGS
- **核心方法**: 结构感知致密化加速 3DGS 收敛
- **标签**: #3DGS #加速收敛

---

## 四、B-rep 与 CAD

### 12. DualBrep: A Dual-Field Continuous Representation for B-rep Modelling
- **类型**: SIG
- **作者**: Yilin Liu, Pradeep Jayaraman, et al.
- **核心方法**: B-rep 建模的双场连续表示
- **标签**: #B-rep #CAD #参数化曲面

### 13. Autoregressive B-Rep Shape Generation with Parametric Surfaces
- **DOI**: 10.1145/3799902.3811xxx
- **类型**: SIG
- **作者**: Dafei Qin, Rui Xu, et al. (HKU, ShanghaiTech)
- **链接**: https://kesen.realtimerendering.com/sig2026.html
- **核心方法**: 基于自回归的参数化曲面 B-rep 形状生成
- **标签**: #B-rep #自回归 #参数化曲面

### 14. B-repLer: Language-guided Editing of CAD Models
- **类型**: SIG
- **作者**: Yilin Liu, Niladri Shekhar Dutt, Changjian Li, Niloy J. Mitra
- **核心方法**: 语言引导的 CAD 模型编辑
- **标签**: #CAD #自然语言 #编辑

---

## 五、神经隐式与 SDF

### 15. SuperSDF: Sparse SDF Super-Resolution for Surface Extraction
- **类型**: SIG
- **作者**: Sagar Panwar, Nissim Maruani, Céline Loscos, Mathieu Desbrun, Pierre Alliez
- **链接**: 待补充
- **核心方法**: 稀疏 SDF 超分辨率表面提取
- **标签**: #SDF #超分辨率 #表面提取

### 16. SAND: Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces
- **类型**: SIG
- **作者**: Chuanxiang Yang, Junhui Hou, et al.
- **核心方法**: 空间自适应网络深度的神经隐式曲面快速采样
- **标签**: #神经隐式 #自适应采样

### 17. The PhaseTree: Multiphase Signed Distance Fields
- **类型**: SIG
- **作者**: Eric Galin, Pierre Hubert-briere, Marie-Paule Cani, et al.
- **核心方法**: 多相有符号距离场
- **标签**: #SDF #多相 #材质

### 18. Dual Contouring of Signed Distance Data
- **类型**: SIG
- **作者**: Xiana Carrera, Ningna Wang, Christopher Batty, Oded Stein, Silvia Sellán
- **核心方法**: 有符号距离数据的对偶轮廓
- **标签**: #等值面提取 #对偶轮廓

### 19. Subgrid Marching Tetrahedra
- **类型**: SIG
- **作者**: Hossein Baktash, Mark Gillespie, Keenan Crane
- **核心方法**: 子网格行进四面体算法
- **标签**: #等值面提取 # marching tetrahedra

---

## 六、几何计算与距离

### 20. Scalable GPU Construction of 3D Voronoi and Power Diagrams
- **类型**: SIG
- **作者**: Bernardo Taveira, Carl Lindström, et al. (Chalmers)
- **核心方法**: 可扩展 GPU 构造 3D Voronoi 和 Power 图
- **标签**: #Voronoi #GPU #计算几何

### 21. GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes
- **类型**: SIG
- **作者**: Haopeng Fan, Min Tang, Leonardo Sacht, et al.
- **核心方法**: GPU 加速的网格hausdorff距离计算
- **标签**: #GPU #Hausdorff距离 #网格比较

### 22. Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds
- **类型**: SIG
- **作者**: Pengfei Wang, Qinghao Guo, Haisen Zhao, et al.
- **核心方法**: 流形点云的加速 k-NN 查询
- **标签**: #点云 #k-NN #流形

---

## 📊 论文分类统计

| 类别 | 数量 |
|------|------|
| 曲面表示与网格处理 | 6 |
| 网格生成与参数化 | 3 |
| 3D 高斯溅射 | 2 |
| B-rep 与 CAD | 3 |
| 神经隐式与 SDF | 5 |
| 几何计算 | 3 |

---

## 🔗 参考资源

- **SIGGRAPH 2026 论文列表**: https://kesen.realtimerendering.com/sig2026.html
- **SIGGRAPH 2026 日程**: https://keenancrane.github.io/siggraph-papers-schedule/
- **ACM TOG 2026 Issue**: https://dl.acm.org/toc/tog/2026/45/4
- **ACM SIGGRAPH 2026**: https://dl.acm.org/doi/proceedings/10.1145/3799902
