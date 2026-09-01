---
tags: [几何, 网格重建, UV参数化, PBR材质, 多视图重建]
date: 2026-08-29
---

# ExMesh++: Multi-View to Relightable UV-PBR Mesh Assets

## 论文信息

| 字段 | 内容 |
|------|------|
| arXiv | [2608.24109](https://arxiv.org/abs/2608.24109) |
| 版本 | v2 (2026-08-29) |
| 作者 | Chuanjin Fan |
| 项目页 | [fan-treasure.github.io/ExMeshpp_page/](https://fan-treasure.github.io/ExMeshpp_page/) |

## 核心问题

现有表面重建方法优化隐式场、Gaussian 原语或其他中间表示，转换为最终网格需要表面提取和纹理烘焙。逆渲染方法估计的材质仍与神经场或点原语绑定。需要可编辑、可重光照的网格资产。

## 两阶段框架

### Stage 1: 几何细化
- 自适应顶点分裂和合并
- 保持拓扑变化时的 UV 一致性
- 输出: 良拓扑的显式网格

### Stage 2: UV-PBR 分解
- 固定网格-UV 载体
- 联合优化 UV 空间 PBR 材质图 + 环境光
- 次级光线追踪建模一次反弹漫反射间接光照
- 共享 UV-PBR 材质的 secondary-ray tracing

## 技术细节

### 关键创新
- **拓扑自适应**: 顶点分裂/合并时保持 UV 一致性
- **稳定载体**: UV-PBR 联合优化建立在稳定几何基础上
- **PBR 材质**: albedo, metallic-roughness, surface normals

### 输出格式
- 良拓扑网格
- 有效 UV 参数化
- PBR 材质图 (albedo, normal, roughness, metallic)
- 环境光照

## 创新点

1. **完整资产重建**: 几何 + 材质 + 光照联合优化
2. **拓扑自适应**: 隐式/点云 → 显式网格的拓扑转换
3. **直接可用**: 导出资产可直接用于标准 DCC 流程

## 几何分类

- 类别: 网格重建 (Mesh Reconstruction)
- 子类: Multi-View Reconstruction / UV Parametrization / PBR Material
- 关联: 表面重建, 纹理映射, Inverse Rendering

## 开源参考

- libigl: `decimate`, `remesh_along_isosurface`, `uv_coordinates`
- CGAL: `surface_mesh_parameterization`
- 项目代码: 待发布

## 可行性评估

| 指标 | 评分 |
|------|------|
| 算法复杂度 | 高 |
| 数值稳定性 | 中 |
| 实现难度 | 高（两阶段+光线追踪） |
| 工程价值 | 极高 |

**推荐度**: ✅ 推荐实现（重点关注 UV 一致性保持机制）

## 关联笔记

[[网格重建]]
[[UV参数化]]
[[多视图重建]]
[[表面重建]]

---

*🥬 Wawaicai | 2026-09-01*
