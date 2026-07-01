# 📋 每日几何处理论文搜索报告 - 2026-07-01

**搜索时间**: 2026-07-01 14:05 UTC
**搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH 2026
**关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 📥 今日新收录论文 (5篇)

### 1. PolyFlow: Continuous Topology Embedding Flow Matching for Artist-style Mesh Generation
| 字段 | 内容 |
|------|------|
| **arXiv** | [2606.30673](https://arxiv.org/abs/2606.30673) |
| **发表** | 2026-06-25 (arXiv) |
| **作者** | Chunshi Wang et al. |
| **标签** | `mesh-generation` `flow-matching` `topology-embedding` |
| **代码** | 未公开 |

**核心创新**: 将离散网格拓扑通过"拓扑嵌入器"投影到连续空间，解决流匹配无法直接处理网格的问题。基于 Transformer 流匹配实现完全并行生成，支持精确分辨率控制。

**推荐度**: ⭐⭐⭐⭐ 高关注 — 开创性将流匹配引入网格生成

---

### 2. DualBrep: A Dual-Field Continuous Representation for B-rep Modelling
| 字段 | 内容 |
|------|------|
| **arXiv** | [2606.31579](https://arxiv.org/abs/2606.31579) |
| **发表** | SIGGRAPH 2026 |
| **作者** | Yilin Liu et al. (Autodesk) |
| **标签** | `B-rep` `CAD` `dual-field` `SDF` `flow-matching` |
| **代码** | [AutodeskAILab/DualBrep](https://github.com/AutodeskAILab/DualBrep) |

**核心创新**: 用 SDF+UDF 双场统一 CAD 几何和拓扑，Flow Matching 联合采样避免错误累积。神经重建器提取显式 B-rep 模型。

**推荐度**: ⭐⭐⭐⭐⭐ 强烈推荐 — SIGGRAPH 2026 论文，开源，CAD 深度学习突破

---

### 3. DANTE-W: Diffuse Albedo Neural Texturing in the Wild
| 字段 | 内容 |
|------|------|
| **arXiv** | [2606.30677](https://arxiv.org/abs/2606.30677) |
| **发表** | 2026-06-26 (arXiv) |
| **作者** | Guangyu Wang et al. |
| **标签** | `mesh-texturing` `diffuse-albedo` `relighting` `parameterization` |
| **代码** | 未公开 |

**核心创新**: 从无结构图像恢复高保真漫反射反照率纹理，解决 baked-in 着色问题。与传统 3D 重建流程无缝集成。

**推荐度**: ⭐⭐⭐ 中等 — 纹理化方向有参考价值

---

### 4. Intrinsic Decomposition and Editing of 3D Gaussian Splats
| 字段 | 内容 |
|------|------|
| **arXiv** | [2606.31637](https://arxiv.org/abs/2606.31637) |
| **发表** | Proc. ACM Comput. Graph. Interact. Tech. 2026 (I3D) |
| **作者** | George Drettakis et al. |
| **标签** | `intrinsic-decomposition` `Gaussian-splatting` `editing` |
| **代码** | 未公开 |

**核心创新**: 将内禀分解扩展到 3DGS，通过独立高斯图元集合建模 albedo/shading，支持图像编辑传播到任意视角。

**推荐度**: ⭐⭐⭐ 中等 — 与几何处理间接相关

---

### 5. GRay: Ray Tracing 3D Gaussians Near the Speed of Splats
| 字段 | 内容 |
|------|------|
| **arXiv** | [2606.30869](https://arxiv.org/abs/2606.30869) |
| **发表** | I3D 2026 |
| **作者** | Yohan Poirier-Ginter et al. (Inria) |
| **标签** | `ray-tracing` `3D-Gaussian` `rendering` |
| **代码** | [repo-sam.inria.fr/nerphys/gray](https://repo-sam.inria.fr/nerphys/gray) |

**核心创新**: 利用光线追踪的对数缩放特性，密集初始化反而加速光线追踪。渲染速度比 3DGRT 快 4x，优化速度快 10x。

**推荐度**: ⭐⭐⭐ 中等 — 渲染方向，非核心几何处理

---

## 📊 今日趋势分析

### 热点方向
1. **流匹配 (Flow Matching) + 网格生成**: PolyFlow 和 DualBrep 都采用 Flow Matching 作为生成框架，说明流匹配已成为 3D 生成的新范式
2. **连续表示学习**: 将离散几何拓扑投影到连续空间是热门研究方向
3. **CAD 深度学习**: DualBrep 代表了 B-rep 建模的最新进展

### 与几何处理的相关度
- **高相关**: PolyFlow (网格生成), DualBrep (B-rep 几何), DANTE-W (表面参数化+纹理)
- **中相关**: Intrinsic Decomposition (3DGS 编辑)
- **低相关**: GRay (纯渲染)

---

## 📁 文件位置
- 笔记存储: `~/knowledge-vault/wawaicai/01-Papers/2026/2026-07/`
- Git 同步: `https://github.com/zhanzhan1848/knowledge_obsidian.git`

---

*由 wawaicai (娃娃菜) 自动生成 — 2026-07-01*