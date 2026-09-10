# 📅 每日几何处理论文汇总 — 2026-09-10

## 搜索范围
- arXiv cs.GR (最近72h内)
- SIGGRAPH Asia 2026 / Pacific Graphics 2026 / ECCV 2026

---

## 🥬 本日新论文 (7篇)

### 🔥 高优先级

| 论文 | 会议 | 核心领域 | 推荐度 |
|------|------|----------|--------|
| [Neural Centroidal Voronoi Tessellations](2026-09-10-Neural-CVT-Remeshing.md) | arXiv | remeshing/CVT/GNN | ✅ |
| [ADELE - Adaptive Delaunay Grids](2026-09-10-ADELE-Mesh-Reconstruction.md) | SIGGRAPH Asia 2026 | mesh reconstruction | ✅ |
| [RBF Your SDF](2026-09-10-RBF-Your-SDF.md) | arXiv | SDF/几何重建 | ✅ |
| [Kinematic Refinement Retargeting](2026-09-10-Kinematic-Refinement-Retargeting.md) | SIGGRAPH Asia 2026 | mesh变形/动画 | ✅ |

### 📌 中优先级

| 论文 | 会议 | 核心领域 | 推荐度 |
|------|------|----------|--------|
| [Heat Kernel Textures](2026-09-10-Heat-Kernel-Textures.md) | ECCV 2026 | UV映射/纹理 | ✅ |
| [CT2Yarn](2026-09-10-CT2Yarn-Point-Cloud.md) | Pacific Graphics 2026 | 点云/CT重建 | ✅ |
| [PLSR](2026-09-10-PLSR-3D-Super-Resolution.md) | arXiv | 3D超分辨率 | ⚠️ |

---

## 📊 主题分布

```
Remeshing         ████  (Neural CVT)
Mesh重建          ████  (ADELE, PLSR)
SDF几何          ███   (RBF Your SDF)
纹理映射         ██    (HKTex)
点云处理         ██    (CT2Yarn)
Mesh变形         ██    (Kinematic Refinement)
```

---

## 🔬 值得关注的技术趋势

1. **Learning-based Geometry** — Neural CVT 将 GNN/深度学习嵌入 CVT 优化，100x 加速
2. **Mesh-native Reconstruction** — ADELE 直接在网格空间优化，脱离 NeRF/3DGS 中间表示
3. **Eliminating UV Mapping** — HKTex 热核纹理完全消除参数化
4. **Tangent-sphere + RBF** — RBF Your SDF 融合 SDF 隐式与显式重建优势

---

## 📝 备注

- Brave Search API 遇到 rate limit，部分搜索使用 arXiv API 直接查询
- CT2Yarn (Nobuyuki Umetani) 值得关注其各向异性 mean-shift 在点云方向估计中的应用
- PLSR 主要为生成式方法，与纯几何处理关联度相对较低

---

*🥬 娃娃菜 · 几何处理专家 · 2026-09-10*
