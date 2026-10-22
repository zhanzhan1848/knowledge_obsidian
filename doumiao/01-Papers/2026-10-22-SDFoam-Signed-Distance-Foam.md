---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, volume-rendering, surface-reconstruction, NeRF, 3DGS, RadiantFoam, SDF, Voronoi]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2512.16706v1
---

# SDFoam: Signed-Distance Foam for explicit surface reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SDFoam: Signed-Distance Foam for explicit surface reconstruction |
| **arXiv ID** | 2512.16706v1 |
| **作者** | Antonella Rech, Nicola Conci, Nicola Garau |
| **发表** | arXiv cs.GR 2025-12-18 |
| **链接** | [原文](https://arxiv.org/abs/2512.16706v1) |
| **机构** | University of Trento |
| **渲染类别** | **体积渲染 + 表面重建** |

---

## 核心贡献

> 联合学习**显式 Voronoi Diagram** 与**隐式 Signed Distance Field**，用 SDF 的度量一致性等值面引导 Voronoi 单元面贴合零水平集，在保持 RadiantFoam 渲染速度的同时显著改善网格重建质量。

1. **混合隐式-显式表征**：显式 VD（负责高效 ray tracing）+ 隐式 SDF（负责精确表面），由 Eikonal 目标正则化。
2. **用 SDF 等值面偏置 Voronoi 单元面**：metric-consistent isosurface 反过来约束近表面 Voronoi cell face 对齐零水平集。
3. **产出更锐利、视角一致、少 floaters、拓扑更优的表面**，且保持 RadiantFoam 同等的训练速度与光度质量。

---

## 技术方案

### 核心思想

现有路线各有短板：

| 方法 | 优势 | 短板 |
|------|------|------|
| **NeRF** | 视图合成质量高 | 体积渲染慢；网格重建质量差 |
| **3DGS** | 光栅化快 | 网格重建差 |
| **RadiantFoam (RF)** | ray tracing 回归，吞吐 ≈ 3DGS | **网格重建仍然吃力** |

SDFoam 的洞察：**网格重建需要度量一致（metric-consistent）的等值面，而 Voronoi 显式表示擅长速度但不擅长表面**。于是把隐式 SDF 作为"表面真相"注入显式 VD。

### 关键技术

| 技术 | 说明 |
|------|------|
| **显式 Voronoi Diagram (VD)** | 场景组织形式，支撑高效 ray tracing |
| **隐式 SDF** | 提供度量一致的等值面（metric-consistent isosurface） |
| **Eikonal 正则化** | `\|∇d(x)\| = 1`，约束 SDF 为真正的距离场 |
| **零水平集偏置** | SDF 引导近表面 Voronoi cell face 对齐零水平集 |
| **联合优化** | ray tracing 渲染损失 + Eikonal 正则化联合训练 |

---

## 公式

SDF 的 Eikonal 约束：

```math
\|\nabla d(\mathbf{x})\| = 1,\quad \forall \mathbf{x} \in \Omega
```

几何一致性条件：Voronoi 单元面与 SDF 零水平集在近表面对齐：

```math
\Phi_{VD}(\mathbf{x}) \approx 0 \quad \text{where} \quad d(\mathbf{x}) = 0
```

---

## 实验结论

- **基线**: RadiantFoam、3DGS、NeRF
- **结果**:
  - 表面更锐利（crisper surfaces）
  - 视角一致（view-consistent）
  - floaters 显著减少
  - 拓扑结构改善
  - 光度质量与训练速度**保持** RadiantFoam 水平（par）
- **适用场景**: 需要高质量网格的 AR/VR、资产生成

---

## 局限性

- 联合优化增加了训练复杂度（SDF + VD 双重参数化）。
- 表面质量的定量评估仍依赖 marching cubes 类后处理。
- 论文摘要未给出与 RadiantFoam 明确的网格质量指标对比数值。

---

## 相关工作

- [[Radiant-Foam-Rendering-Graph-Processor]] — 同一 RadiantFoam 表示的众核硬件实现
- [[OV-Foam-3D-Representations-Semantic-Lifting]] — PowerFoam 表示（Voronoi 变体）
- [[NeRF]] / [[3D Gaussian Splatting]]
- [[Marching Cubes]] — 隐式表面提取后处理

---

## 实现建议

- **实现难度**: 🟡 中（在 RadiantFoam 代码库上加一路 SDF 分支）
- **预期性能**: 与 RadiantFoam 持平
- **适用场景**: 几何精度优先的场景（水体/泡沫表面重建）

### 🌱 豆苗评注

**这对流体渲染有直接价值**：流体表面（尤其是泡沫、水花、飞溅）的网格重建质量一直是痛点。SDFoam 的"隐式 SDF 定几何 + 显式 Voronoi 定速度"分工思路，可以迁移到**液体自由表面重建**上——SDF 保证水花拓扑干净无 floaters，Voronoi/foam 表示保证实时 ray tracing。与 [[SDFoam-Signed-Distance-Foam]] 同谱系的 [[OV-Foam]] 也值得一起看。