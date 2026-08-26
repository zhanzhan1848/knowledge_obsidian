---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [geometry, mesh-reconstruction, UV-parametrization, PBR, multi-view, topology-adaptive]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.24109
---

# ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition |
| **作者** | Chuanjin Fan et al. |
| **发表** | arXiv cs.GR · 2026-08-25 |
| **链接** | [原文](https://arxiv.org/abs/2608.24109) · [PDF](https://arxiv.org/pdf/2608.24109) |
| **DOI** | 10.48550/arXiv.2608.24109 |

---

## 核心贡献

> 从多视角图像重建可编辑、可打光的 UV-PBR 网格资材，解决现有方法中几何、材质、照明耦合导致的歧义问题

1. **拓扑自适应网格精化**：通过自适应顶点分裂/合并精化显式网格几何与拓扑，同时在拓扑变化时保持 UV 一致性
2. **稳定 UV-PBR 载体**：在稳定载体上优化 UV 空间 PBR 贴图与环境光照
3. **次级光线追踪**：利用共享 UV-PBR 材质进行单次弹跳漫反射间接光照建模

---

## 技术方案

### 核心思想

现有表面重建方法优化隐式场、高斯基元或其他中间表示，转换为可编辑资材需要表面提取和纹理烘焙。逆渲染方法估计的材质和光照仍与神经场或点基元绑定。本方法提出 ExMesh++，分阶段框架：

**阶段一：拓扑自适应网格重建**
- 自适应顶点分裂 (adaptive vertex splitting) + 合并 (merging)
- 拓扑变化时保持 UV 一致性
- 输出良好拓扑结构的显式网格

**阶段二：UV 空间 PBR 贴图优化**
- 修复 mesh-UV 载体
- 联合优化 UV 空间 PBR 贴图 + 环境光照
- 基于共享 UV-PBR 材质的次级光线追踪（单次弹跳漫反射间接光照）

### 关键技术

| 技术 | 说明 |
|------|------|
| 自适应顶点分裂/合并 | 拓扑精化同时保持 UV 一致性 |
| UV-space PBR 优化 | 在稳定 UV 载体上优化材质贴图 |
| Secondary-ray tracing | 共享 UV-PBR 材质的次级光线追踪 |
| 可直接导出至 DCC | 输出资产可直接用于标准 DCC 工作流 |

---

## 实验结论

- **几何精度**：competitive geometry accuracy
- **打光性能**：strong relighting performance
- **工作流兼容性**：可直接导出用于标准 DCC（Digital Content Creation）软件

---

## 局限性

- 依赖多视角输入，单图重建挑战性较高
- 间接光照仅建模单次弹跳

---

## 相关工作

- 3D Gaussian Splatting 相关表面重建方法
- 神经辐射场 (NeRF) 逆渲染方法
- UV 展开与参数化方法 (LSCM, ABF++)

---

## 实现建议

- **实现难度**: 中高（需要多阶段管线）
- **预期性能**: 离线重建，生成质量高
- **适用场景**: 电影/游戏资材生产、数字化资产重建
- **开源参考**: libigl 有类似网格精化工具；可参考 [libigl mesh_delaunay](https://libigl.github.io/libigl.github.io/) 等

---

## 可行性分析

🥢 **ExMesh++ 可行性评估**

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 中高 (多阶段管线) |
| 数值稳定性 | 良好 (显式网格 + UV 约束) |
| 实现难度 | 高 (需要顶点分裂/合并 + UV 优化 + 光线追踪) |
| 开源可复现性 | 待确认 (官方代码未公开) |

✅ **推荐**：UV 参数化 + 拓扑精化的组合思路值得参考，建议关注官方代码发布
