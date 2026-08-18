# 每日几何处理论文总结 - 2026-08-18

## 今日搜索摘要

**搜索时间**: 2026-08-18 14:07 UTC  
**搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/Eurographics  
**关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 发现的论文

### 1. MeshFlow (SIGGRAPH 2026)
- **arXiv**: [2606.23489](https://arxiv.org/abs/2606.23489)
- **标题**: Mesh Generation with Equivariant Flow Matching
- **核心方法**: 等变最优传输流匹配直接生成三角形网格
- **创新点**: 绕过序列化，支持面片置换不变性，推理速度快18倍

### 2. ExMesh (CVPR 2026)
- **arXiv**: [2606.07288](https://arxiv.org/abs/2606.07288)
- **标题**: EXplicit Mesh Reconstruction with Topology Adaptation
- **核心方法**: 自适应顶点分裂/合并 + 实时UV维护
- **创新点**: 首次将离散拓扑操作融入可微分优化流程

### 3. AI Mesh Survey (International Meshing Roundtable 2026)
- **arXiv**: [2512.23719](https://arxiv.org/abs/2512.23719)
- **标题**: A Survey of AI Methods for Geometry Preparation and Mesh Generation in Engineering Simulation
- **核心方法**: 综述CAD-to-mesh流程中的AI方法
- **覆盖**: 部件分类、网格质量预测、defeaturing、块结构化网格

### 4. ArtMesh
- **arXiv**: [2605.16582](https://arxiv.org/abs/2605.16582)
- **标题**: Part-Aware Articulated Mesh Fields with Motion-Consistent Dynamics
- **核心方法**: 网格原生关节体重建，限制Delaunay重网格化
- **创新点**: 提出Articulate-100基准数据集

### 5. Meschers (ACM TOG 2025)
- **arXiv**: [2605.14960](https://arxiv.org/abs/2605.14960)
- **标题**: Geometry Processing of Impossible Objects
- **核心方法**: 基于离散外微分的不可能物体网格表示
- **应用**: 逆向渲染、距离计算、光照

### 6. Isotropic Remeshing (ICIG 2025)
- **arXiv**: [2507.13641](https://arxiv.org/abs/2507.13641)
- **标题**: Isotropic Remeshing with Inter-Angle Optimization
- **核心方法**: 角度间优化控制各向同性重网格
- **创新点**: 预测边长调整对后续优化影响，加速收敛

---

## 详细笔记

详见子文件：
- [[2026-08-18-MeshFlow-SIGGRAPH-2026]]
- [[2026-08-18-ExMesh-CVPR-2026]]
- [[2026-08-18-AI-Geometry-Preparation-Survey-IMR-2026]]
- [[2026-08-18-ArtMesh-Articulated-Reconstruction]]
- [[2026-08-18-Meschers-Impossible-Objects-TOG-2025]]
- [[2026-08-18-Isotropic-Remeshing-Inter-Angle-ICIG-2025]]

---

## 知识链接

[[网格生成]]
[[等变深度学习]]
[[几何处理]]
[[网格重建]]
[[关节体重建]]
