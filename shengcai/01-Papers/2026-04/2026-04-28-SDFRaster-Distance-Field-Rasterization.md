---
type: paper
created: 2026-04-28
updated: 2026-04-28
tags: [paper, rasterization, SDF, mesh-reconstruction, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.23537
---

# Distance Field Rasterization for End-to-End Mesh Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Distance Field Rasterization for End-to-End Mesh Reconstruction |
| **作者** | Jinkai Cui et al. |
| **发表** | SIGGRAPH 2026 (TOG) |
| **链接** | [原文](https://arxiv.org/abs/2604.23537) |
| **DOI** | - |
| **代码** | https://ustc3dv.github.io/SDFRaster/ |
| **机构** | University of Science and Technology of China |

---

## 核心贡献

> 提出 SDFRaster，结合光栅化效率与 SDF 表面定义的可微渲染表示，实现端到端网格重建

1. 提出基于 Delaunay 四面体化的可光栅化 SDF 表示
2. 集成可微 Marching Tetrahedra 到优化循环，实现端到端网格重建
3. 提出 surface-centric adaptive resolution 策略

---

## 技术方案

### 核心思想

**桥接光栅化效率与 SDF 精确表面**：
- 使用 Delaunay 四面体化作为几何网格
- 在四面体顶点参数化连续 SDF
- 通过光栅化四面体进行高效渲染，避免 ray marching 的密集采样

### 方法流程

1. **表示**：四面体网格顶点存储 SDF 值，体内通过重心坐标线性插值
2. **渲染**：将 SDF 映射为不透明度，通过四面体光栅化和 alpha compositing 渲染
3. **优化**：可微 Marching Tetrahedra 提取网格，直接在提取的网格上应用几何损失

### 关键技术

| 技术 | 说明 |
|------|------|
| Delaunay Tetrahedral SDF | 四面体网格上的连续 SDF |
| Rasterization-based Differentiable Rendering | 高效 GPU 光栅化代替 ray marching |
| Differentiable Marching Tetrahedra | 端到端网格提取 |
| Surface-centric Adaptive Resolution | 在表面附近集中表示能力 |

### 与 3DGS 关系

基于 Radiance Meshes 思想，但专注于精确表面重建

---

## 实验结论

- 比隐式 SDF 基线快 6 倍以上
- DTU 上达到最低 Chamfer Distance（显式方法中）
- TnT 上 F1 竞争力
- 存储紧凑（比 TSDF fusion 小 3 倍）

---

## 局限性

- 依赖 Delaunay 四面体化质量
- 网格自适应分辨率策略可能影响大规模场景

---

## 相关工作

- 3D Gaussian Splatting (3DGS)
- Neural SDF (NeuS, VolSDF, Neuralangelo)
- Radiance Meshes
- Differentiable Marching Tetrahedra

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 实时级别渲染，高质量网格提取
- **适用场景**: 多视角 3D 重建、表面重建、数字化文化遗产

---

## 标签

#渲染 #光栅化 #SDF #网格重建 #可微渲染 #SIGGRAPH2026 #中国科大
