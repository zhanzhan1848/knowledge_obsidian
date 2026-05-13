# 日报 - 2026-05-13

## 搜索范围
- arXiv cs.GR (2026-05-11 至 2026-05-13)
- SIGGRAPH 2026 会议论文
- 几何处理领域新进展

## 关键词
mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 📄 本日新增论文笔记

### 1. STA-FEM: Exact Streaming Assembly for Preplanned Dynamic Tetrahedral Topology Edits
- **arXiv:2605.11673** | 2026-05-12
- **标签**: 网格处理, 动态拓扑, FEM, 四面体网格
- **摘要**: 动态四面体网格的增量流式组装，替代全量重建，断裂帧最高 76% 加速
- **推荐度**: ⭐⭐⭐⭐ 实用价值高，适合仿真场景

### 2. MeshFIM: Local Low-Poly Mesh Editing via Fill-in-the-Middle AR Generation
- **arXiv:2605.08744** | 2026-05-09
- **标签**: 网格编辑, 自回归生成, 低多边形, FIM
- **摘要**: Fill-in-the-Middle 框架实现局部网格重生成，避免整体重建
- **推荐度**: ⭐⭐⭐⭐ 创新性强，适合交互式编辑工具

### 3. Explicit Inversion of Planar NURBS Curves
- **arXiv:2605.08087** | 2026-01-26
- **标签**: 参数化, NURBS, 曲线求逆
- **摘要**: 证明平面 NURBS 曲线逆映射可表示为有理样条函数的线性组合
- **推荐度**: ⭐⭐⭐ 理论贡献为主

### 4. 3DSS: 3D Surface Splatting for Inverse Rendering
- **arXiv:2605.05876** | 2026-05-08
- **标签**: 表面重建, 3DGS, 高斯泼溅, 逆渲染
- **摘要**: 定向表面样本替代各向同性高斯，原生支持表面重建
- **推荐度**: ⭐⭐⭐⭐ 连接 3DGS 与传统表面重建

### 5. GRCA: Gajmer Ray-Casting Algorithm (LiDAR 仿真)
- **arXiv:2605.10457** | 2026-05-12
- **标签**: 射线追踪, LiDAR, 动态场景, 模拟
- **摘要**: 发射器中心视角反转光线追踪，动态场景最高 19.2x CPU 加速
- **推荐度**: ⭐⭐⭐⭐ LiDAR/仿真场景高度相关

### 6. Representations of 3D Rotations: Mathematical Foundations
- **arXiv:2605.08086** | 2025-12-17
- **标签**: 旋转表示, SO(3), 四元数, 数学基础
- **摘要**: SO(3) 旋转表示全面综述，四元数实用性最强
- **推荐度**: ⭐⭐⭐ 参考资料

### 7. Mesh Based Simulations with Spatial and Temporal awareness
- **arXiv:2605.01542** | 2026-05-08
- **标签**: 图神经网络, CFD, 有限元, 几何深度学习
- **摘要**: GNN 替代 CFD 的训练范式改进，RoPE + Temporal Cross-Attention
- **推荐度**: ⭐⭐⭐⭐ ICML 2026，网格物理仿真重要进展

---

## 🎯 重点关注

1. **MeshFIM** - 自回归网格编辑的局部重建范式，可能对网格修复工具很有价值
2. **GRCA** - 动态 LiDAR 仿真的发射器中心方法，开创性问题反转思路
3. **3DSS** - 连接 3DGS 与传统网格重建的桥梁

## 📊 统计数据
- 搜索论文总数: ~27 篇 (cs.GR 两天)
- 筛选相关论文: 7 篇
- 新增笔记: 7 篇