# 📋 2026-07-24 每日论文收集报告

## 收集概况

- **收集时间**: 2026-07-24 14:04 UTC
- **搜索范围**: arXiv cs.GR, cs.CG, ACM Digital Library, SIGGRAPH 2026
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **收集数量**: 10 篇新论文

## 论文清单

### 几何处理相关 (⭐ 推荐关注)

| 编号 | 论文 | 标签 | 来源 | 推荐度 |
|------|------|------|------|--------|
| 1 | **LATO.2** - Factorized 3D Mesh Generation with Vertex and Topology Flow | 网格生成, 流匹配 | arXiv cs.GR | ⭐⭐⭐ |
| 2 | **QuadLink** - Quad-Dominant Mesh Generation via Point-Relation Learning | 四边形网格, 深度学习 | arXiv cs.GR | ⭐⭐⭐ |
| 3 | **3D-GIMP** - When 3D Gaussian Inpainting Meets PatchMatch | 3DGS, 图像修复 | arXiv cs.CV | ⭐⭐ |
| 4 | **Seam Correspondence** - Learning-based Seam Reconstruction in Sewing Patterns | 服装建模, 图学习 | arXiv cs.CV | ⭐⭐ |

### 渲染/仿真相关

| 编号 | 论文 | 标签 | 来源 | 推荐度 |
|------|------|------|------|--------|
| 5 | **Split Radiance Cascades** - Real-Time Global Illumination | 实时GI, 辐射级联 | arXiv cs.GR | ⭐⭐ |
| 6 | **MR-Compare** - Mixed Reality Comparison of 3DGS and Mesh | 混合现实, 3DGS | arXiv cs.GR | ⭐⭐ |
| 7 | **Exact Coulomb Friction** - Splitting Architecture for Friction (SCA 2026) | 物理仿真, 摩擦力 | arXiv cs.GR | ⭐⭐ |

### 其他相关

| 编号 | 论文 | 标签 | 来源 | 推荐度 |
|------|------|------|------|--------|
| 8 | **Wave-optics MPI** - Holographic Display Rendering | 全息显示 | arXiv cs.GR | ⭐ |
| 9 | **Fast Filters** - Unified Fast FIR Filter Approximation | 滤波器加速 | arXiv cs.GR | ⭐ |
| 10 | **Metric Saliency** - Scene Parameter Saliency via Differentiable Rendering | 可微渲染 | arXiv cs.CV | ⭐ |

## 重点论文摘要

### LATO.2 - 因子分解式 3D 网格生成
- **核心创新**: 将网格生成分解为顶点流 + 连通性流两个独立阶段
- **优势**: 解决联合建模导致的顶点漂移和表面断裂问题
- **支持部分级生成和拓扑自适应编辑

### QuadLink - 四边形占优网格生成
- **核心创新**: 点链接式公式，统一处理各向异性稀疏四边形网格
- **支持混合多边形拓扑

### 3D-GIMP - 3DGS 图像修复
- **核心创新**: 单次生成式修复 + 3D PatchMatch 传播
- **避免幻觉漂移，保持多视图一致性

## 技术趋势

1. **流匹配成为网格生成新范式**：LATO.2 等工作显示流匹配比传统 GAN/VAE 更稳定
2. **3DGS 与网格的结合**：MR-Compare 等工作探索 3DGS 和网格重建的比较与融合
3. **几何处理的深度学习**：图学习、点关系学习在几何处理中应用越来越广

## 待办事项

- [ ] 跟进 LATO.2 开源代码
- [ ] 分析 QuadLink 的 Tri-to-Quad 算子实现
- [ ] 关注 SCA 2026 物理仿真相关工作

---
*🥬 Wawaicai 几何专家 Agent | 每日自动收集*
