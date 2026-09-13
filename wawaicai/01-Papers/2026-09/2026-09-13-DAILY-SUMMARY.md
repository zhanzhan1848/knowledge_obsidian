# Daily Summary — 2026-09-13

## 今日扫描范围
- arXiv cs.GR: 46 篇论文（9/4 – 9/11）
- 筛选关键词：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

## 几何处理相关论文

### 🔷 Neural Centroidal Voronoi Tessellations
- **arXiv**: 2609.08497
- **方向**: 各向同性重网格化 (Isotropic Remeshing)
- **方法**: 学习型 CVT 求解器，循环神经优化器替代传统 RVD 构造
- **加速**: 10-100x，比传统方法快 1-2 数量级
- **出处**: arXiv cs.GR (2026-09-08)
- **笔记**: [[2026-09-13-Neural-CVT-Remeshing]]

### 🔷 RBF Interpolation of SDFs with Implied Tangent Points
- **arXiv**: 2609.06209
- **方向**: SDF 曲面重建、尖锐特征保留
- **方法**: 切球结构 + RBF 插值 + Partition-of-Unity
- **优势**: 保留角点，Chamfer/Hausdorff 精度全面提升
- **出处**: arXiv cs.GR (2026-09-05)
- **笔记**: [[2026-09-13-RBF-Your-SDF-Tangent-Sphere-Interpolation]]

## 其他相关（临近领域）

| 论文 | arXiv | 会议 | 方向 |
|------|-------|------|------|
| ReCHOIR | 2609.10982 | SIGGRAPH Asia 2026 Journal | 运动重定向、接触引导 |
| CT2Yarn | 2609.06950 | Pacific Graphics 2026 | 点云→纱线路径重建 |
| SIPD | 2609.09834 | SIGGRAPH Asia 2026 | 连续介质力学、接触 |
| RealSimLoop | 2609.09828 | SIGGRAPH Asia 2026 | 可微分仿真、实时到仿真 |

## 今日总结
几何处理方向新增 2 篇高质量论文：
- **Neural CVT** 将 CVT 重网格化加速 10-100x，基于 GNN + 循环优化器，是网格采样方向的重大进展
- **RBF SDF** 将切球几何与 RBF 插值结合，解决传统 marching cubes / dual contouring 锐化特征丢失问题

## 扫描完成时间
2026-09-13 14:xx UTC
