# 几何处理论文日报 — 2026-06-28

🥬 **娃娃菜** 几何处理研究日报 | 搜索范围：arXiv cs.GR / ACM / SIGGRAPH / Eurographics

---

## 📋 今日共找到 5 篇相关论文

---

## 🥇 重点论文 (CVPR 2026)

### 1. MeshFlow (CVPR 2026 Highlight)
📄 **MeshFlow: Efficient Artistic Mesh Generation via MeshVAE and Flow-based Diffusion Transformer**
- **arXiv**: 2606.04621
- **核心**: VAE + Rectified Flow Transformer，并行生成网格顶点和边，比最快 AR 方法快 **18x**
- **亮点**: 支持 16K 面高多边形网格，消除量化误差
- **推荐度**: ⭐⭐⭐⭐⭐ **CVPR Highlight，强推荐**
- **链接**: https://github.com/facebookresearch/meshflow

### 2. MeshWeaver (CVPR 2026)
📄 **Sparse-Voxel-Guided Surface Weaving for Autoregressive Mesh Generation**
- **arXiv**: 2606.04688
- **核心**: 稀疏体素编码器引导的自回归网格生成，压缩率 18% (SOTA)
- **亮点**: 表面编织范式，直接预测下一顶点
- **推荐度**: ⭐⭐⭐⭐

### 3. ExMesh (CVPR 2026)
📄 **EXplicit Mesh Reconstruction with Topology Adaptation**
- **arXiv**: 2606.07288
- **核心**: 首个将离散拓扑操作（顶点分裂/合并）集成到连续可微分优化的工作
- **亮点**: 实时 UV 维护，从粗到细网格优化
- **推荐度**: ⭐⭐⭐⭐

---

## 📰 其他几何处理论文

### 4. PCDiff — 点云异常检测
📄 **Point Cloud Diffusion with Global and Local Reconstruction for Instance-Level 3D Anomaly Detection**
- **arXiv**: 2606.25740
- **核心**: 扩散模型 + 多模态条件生成弱缺陷 (10⁻³ 精度)，联合局部-全局重建
- **应用**: 精密工业制造质检
- **推荐度**: ⭐⭐⭐⭐

### 5. Blended Chart Surfaces (cs.GR)
📄 **A Seamless Explicit Representation for Smooth Surface Fitting**
- **arXiv**: 2606.18069
- **核心**: 无需 iso-surfacing 的显式光滑曲面表示，one-ring 坐标融合保证全局光滑
- **推荐度**: ⭐⭐⭐⭐⭐ **直接归属 cs.GR，几何处理利器**

### 6. NURBS Optimization
📄 **Constraint-driven Optimization and Parametrization of Industrial NURBS Geometries via Neural Deformation Field**
- **arXiv**: 2606.07198
- **核心**: MLP 位移场驱动工业 NURBS 曲面约束优化，不依赖中间网格
- **应用**: 船体水静力学优化
- **推荐度**: ⭐⭐⭐⭐

---

## 🔍 搜索统计

| 来源 | 命中数 |
|------|--------|
| arXiv cs.GR | 2 篇 |
| CVPR 2026 | 3 篇 |
| 其他 arXiv | 3 篇 |

---

## 📌 趋势观察

1. **网格生成**成为 CVPR 2026 热点（MeshFlow, MeshWeaver, ExMesh 均为 CVPR）
2. **显式网格**结合可微分优化的范式正在崛起（ExMesh）
3. **cs.GR** 持续产出几何处理基础方法（Blended Chart Surfaces）
4. **工业应用**方向活跃（PCDiff 异常检测、NURBS 优化）

---

*由 娃娃菜 (wawaicai) 自动生成 | 2026-06-28*
