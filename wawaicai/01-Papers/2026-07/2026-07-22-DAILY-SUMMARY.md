# 📋 每日几何处理论文收集报告 — 2026-07-22

**收集时间**: 2026-07-22 14:05 UTC  
**搜索范围**: arXiv cs.GR (最近 7 天)  
**关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 🔍 搜索结果概览

arXiv cs.GR 过去 7 天共 **29 篇**新提交，筛选出 **3 篇**几何处理相关：

| # | arXiv ID | 标题 | 来源 | 相关度 |
|---|----------|------|------|--------|
| 1 | 2607.16946 | Points as Tori: Fast Pointwise Signed Distance for Point Clouds | TOG 2026 | ⭐⭐⭐ |
| 2 | 2607.18798 | UVFaceFusion: Multi-view Face Mesh Reconstruction via UV-space Neural Fusion | arXiv (CV) | ⭐⭐ |
| 3 | 2607.17725 | FastVEM: Fast Virtual Element Method Fluid Simulation | TOG 2026 | ⭐⭐ |

---

## 🥬 重点论文分析

### ⭐⭐⭐ 强烈推荐: Points as Tori
**2607.16946** | [arXiv](https://arxiv.org/abs/2607.16946) | TOG 2026

- **核心方法**: 用 Torus 局部拟合点云，实现解析 SDF 查询
- **关键创新**: 前馈网络 O(n) 拟合，无需全局优化；Torus SDF 闭式解；统一 winding number / Poisson / SDF 理论
- **性能**: 任意分辨率点态查询，O(1) 每点
- **应用**: 点云偏移、布尔运算、sphere tracing

### ⭐⭐ 推荐: UVFaceFusion
**2607.18798** | [arXiv](https://arxiv.org/abs/2607.18798) | arXiv

- **核心方法**: UV 空间神经融合多视角点图，固定拓扑 mesh 采样
- **性能**: 16 视图 < 3s (RTX 4090)
- **应用**: 人脸/avatar 3D 重建

### ⭐⭐ 推荐: FastVEM
**2607.17725** | [arXiv](https://arxiv.org/abs/2607.17725) | TOG 2026

- **核心方法**: VEM 离散化 + 凸性保持 cut-cell + 几何多重网格
- **性能**: 压力投影比传统 cut-cell 快 **100x**
- **应用**: 复杂边界流固耦合仿真

---

## 📁 新增笔记

```
wawaicai/01-Papers/2026-07/
├── 2026-07-22-PointsAsTori-Signed-Distance-Point-Cloud.md  ⭐
├── 2026-07-22-UVFaceFusion-Multi-View-Face-Mesh-Reconstruction.md
└── 2026-07-22-FastVEM-Virtual-Element-Fluid-Mesh.md
```

---

## 📊 统计

| 指标 | 数值 |
|------|------|
| 搜索论文总数 | 29 |
| 几何相关 | 3 |
| TOG/期刊 | 2 |
| arXiv | 1 |
| 强烈推荐 | 1 |

---

## 🔗 链接

- arXiv cs.GR: https://arxiv.org/list/cs.GR/recent
- SIGGRAPH 2026: https://s2026.siggraph.org/
- SIGGRAPH Asia 2026: https://asia.siggraph.org/2026/ (12月 吉隆坡)

---
*🥬 娃娃菜 · 计算机图形学几何处理专家*
