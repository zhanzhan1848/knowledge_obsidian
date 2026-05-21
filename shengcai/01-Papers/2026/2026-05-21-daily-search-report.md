# 生菜 - 每日渲染论文搜索报告

## 执行时间
2026-05-21 14:00 UTC

## 搜索范围
- **arXiv cs.GR**: 最近 48 小时提交
- **ACM Digital Library**: 近期 Graphics 论文
- **SIGGRAPH/SIGGRAPH Asia**: 2026 会议相关

## 关键词
`ray tracing`, `path tracing`, `real-time rendering`, `global illumination`, `PBR`, `rasterization`, `BVH`, `ray marching`

---

## 本次发现论文

### 2026-05-21 (今日 9 篇)

| 编号 | arXiv ID | 标题 | 标签 |
|------|----------|------|------|
| 1 | 2605.20460 | Realtime Bone-driven Neural Garment Simulation with Hypernetwork Conditioning | garment, neural-simulation, real-time |
| 2 | 2605.20290 | Physics-Grounded Multi-Object Scene Generation from a Single Image | physics, scene-generation |
| 3 | 2605.20274 | A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation | mesh-generation, hexahedral |
| 4 | 2605.20185 | PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars ⭐SIGGRAPH | gaussian-avatar, neural-rendering |
| 5 | 2605.19889 | 3D Gaussian Lookup Table for Continuous Color Transformation | color-processing, LUT |
| 6 | 2605.19737 | Decentralized Direct Volume Rendering with WebGPU **体渲染** | volume-rendering, ray-marching, webgpu |
| 7 | 2605.19551 | Editable SVG Reconstruction via Sparse Anchor Point Fields | vector-graphics, SVG |
| 8 | 2605.19411 | Factorized B-rep Synthesis via Wireframe Composition | CAD, B-rep |
| 9 | 2605.19355 | Skinned Motion Retargeting with Spatially Adaptive Interaction Guidance ⭐SIGGRAPH | motion-retargeting |

### 2026-05-20 (昨日 12 篇)

| 编号 | arXiv ID | 标题 | 标签 |
|------|----------|------|------|
| 10 | 2605.20185 | PiG-Avatar (v2 更新) | gaussian-avatar |
| 11 | 2605.19889 | 3D Gaussian Lookup Table | color-LUT |
| 12 | 2605.19737 | WebGPU Volume Rendering | ray-marching |
| 13 | 2605.19551 | Editable SVG Reconstruction | vector-graphics |
| 14 | 2605.19411 | B-rep Synthesis | CAD |
| 15 | 2605.19355 | Motion Retargeting ⭐SIGGRAPH | animation |
| 16 | 2605.19350 | CompoSE: 3D Shape Synthesis and Editing | shape-editing |
| 17 | 2605.19305 | Matérn Noise for Triangulation-Agnostic Flow Matching ⭐SIGGRAPH | mesh-processing |
| 18 | 2605.19200 | Spatially Accelerated Winding Numbers for Curved Geometry | geometry, BVH |
| 19 | 2605.18894 | Generative and isoparametric geometric modeling of microstructures | microstructure |

### 2026-05-19 (前两日 31 篇)

重要论文:
- 2605.18215: Tangent Blow-Ups for Processing Non-Manifold Geometry
- 2605.17855: **Accelerating 3D Gaussian Splatting using Tensor Cores** ⭐
- 2605.17448: Self-Improving CAD Generation Agents with FEA Feedback
- 2605.17102: Anchor-Conditioned Voxel Diffusion for Indoor Scene Arrangement

---

## 已创建笔记

| 文件名 | 论文 | 来源 |
|--------|------|------|
| `2026-05-20_PiG-Avatar-Hierarchical-Neural-Field-Gaussian-Avatars.md` | PiG-Avatar | SIGGRAPH 2026 |
| `2026-05-19_Matern-Noise-Triangulation-Agnostic-Flow-Matching.md` | Matérn Noise | SIGGRAPH 2026 |
| `2026-05-19_3D-Gaussian-LUT-Color-Transformation.md` | GLUT | cs.GR |
| `2026-05-19-Decentralized-Direct-Volume-Rendering.md` | WebGPU Volume Rendering | cs.GR |
| `2026-05-18-Accelerating-3D-Gaussian-Splatting-Tensor-Cores.md` | TensorGS | cs.GR |

---

## 渲染领域相关发现

### 直接相关 (ray tracing / rendering / volume rendering)
1. **2605.19737** - WebGPU Ray Marching 医学体渲染
2. **2605.17855** - 3DGS Tensor Core 加速

### 间接相关 (gaussian splatting / neural rendering)
1. **2605.20185** - PiG-Avatar (Gaussian Avatar)
2. **2605.19889** - Gaussian LUT

### 几何/处理相关
1. **2605.19305** - Matérn Noise on Meshes
2. **2605.19200** - Winding Numbers with BVH

---

## 统计
- 本次扫描论文总数: ~85 篇
- 渲染领域相关: ~6 篇
- 已创建笔记: 5 篇
- SIGGRAPH 2026 论文: 3 篇

---

## 下一步
- 分析 PiG-Avatar 的实现细节
- 追踪 TensorGS 的代码开源情况
- 关注 Matérn Noise 在 mesh 处理中的潜力

---
*生成时间: 2026-05-21 14:00 UTC*
*Agent: shengcai (生菜)*