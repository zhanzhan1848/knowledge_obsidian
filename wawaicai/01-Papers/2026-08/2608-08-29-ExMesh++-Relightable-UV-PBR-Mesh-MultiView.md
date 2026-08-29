---
type: paper
created: 2026-08-29
updated: 2026-08-29
tags: [mesh-reconstruction, UV-parametrization, PBR-material, multi-view, surface-reconstruction]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.24109
---

# ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition |
| **作者** | Chuanjin Fan et al. |
| **发表** | arXiv cs.GR (2026-08-25) |
| **链接** | [原文](https://arxiv.org/abs/2608.24109) |
| **DOI** | 10.48550/arXiv.2608.24109 |

---

## 核心贡献

> 从多视角图像重建可编辑、可光照的 UV-PBR 网格资产生成框架

1. **拓扑自适应网格细化**: 通过自适应顶点分裂与合并，在保持 UV 一致性的同时细化显式网格几何和拓扑
2. **稳定 UV-PBR 材质优化**: 在稳定几何载体上优化 UV 空间 PBR 材质贴图与环境光照
3. **次级光线追踪间接光照**: 建模一次反弹漫反射间接光照，通过共享 UV-PBR 材质进行次级光线追踪

---

## 技术方案

### 核心思想

现有表面重建方法优化隐式场、高斯原语或其他中间表示，转换为网格资产需要表面提取和纹理烘焙。逆渲染方法估计的材质仍与神经场或点原语绑定。ExMesh++ 提出两阶段框架：

**阶段一：拓扑自适应网格重建**
- 自适应顶点分裂 (adaptive vertex splitting) + 顶点合并 (vertex merging)
- 拓扑变化时维护 UV 一致性
- 得到良好拓扑的显式网格

**阶段二：UV-PBR 材质与光照分解**
- 固定网格-UV 载体
- 优化 UV 空间 PBR 贴图 (albedo, roughness, metallic, normal)
- 联合优化环境光照
- 次级光线追踪建模一次反弹漫反射间接光照

### 关键技术

| 技术 | 说明 |
|------|------|
| 自适应顶点分裂/合并 | 拓扑细化时保持 UV 坐标一致性 |
| UV-space PBR 分解 | 在 UV 空间独立优化各向异性材质 |
| 次级光线追踪 | 基于共享 UV-PBR 材质的间接光照 |

---

## 实验结论

- **几何精度**: 与现有方法相比具有竞争力的几何精度
- **光照性能**: 强重光照 (relighting) 性能
- **DCC 工作流兼容**: 导出资产可直接用于标准 DCC (Maya, Blender 等)

---

## 局限性

- 次级光线追踪计算成本较高
- 依赖多视角输入，单图重建效果有限
- UV 接缝处材质连续性需进一步优化

---

## 实现建议

- **实现难度**: 高 — 需实现顶点拓扑操作 + PBR 材质优化 + 光线追踪
- **预期性能**: 多视图输入下重建质量高，材质分离效果好
- **适用场景**: 文物数字化、电商产品重建、游戏资产准备
- **开源参考**: libigl 有相关网格拓扑操作函数；CGAL 有表面重建管线

---

## 相关工作

- [[ExMesh-Topology-Adaptation]] - 前身版本
- [[Meshy-T2-Flow-Matching-Mesh-Generation]] - 神经网格生成
- [[TopoSurfel]] - 3DGS 表面重建
