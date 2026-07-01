# 每日渲染论文搜索报告 - 2026-07-01

## 搜索摘要
- **搜索时间**: 2026-07-01 14:00 UTC
- **搜索范围**: arXiv cs.GR 最近24小时
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 发现论文

### 核心渲染论文 (4篇)

#### 1. GRay: Ray Tracing 3D Gaussians Near the Speed of Splats
| 项目 | 内容 |
|------|------|
| arXiv | [2606.30869](https://arxiv.org/abs/2606.30869) |
| 来源 | I3D 2026 |
| 作者 | George Drettakis et al. |
| 代码 | [GitHub](https://repo-sam.inria.fr/nerphys/gray) |

**核心贡献**:
- 快速3D Gaussian光线追踪器，接近3DGS光栅化速度
- 利用光线追踪对数级扩展特性
- 比3DGRT快近10x优化、4x渲染

**标签**: #光线追踪 #3DGS #加速结构

#### 2. Editable Physically-based Reflections in Raytraced Gaussian Radiance Fields
| 项目 | 内容 |
|------|------|
| arXiv | [2606.30861](https://arxiv.org/abs/2606.30861) |
| 来源 | SIGGRAPH Asia 2025 |
| 作者 | George Drettakis et al. |
| 代码 | [GitHub](https://repo-sam.inria.fr/nerphys/editable-gaussian-reflections/) |

**核心贡献**:
- 正确重建反射体和被反射物体
- Path tracing生成物理反射
- 支持实时编辑：粗糙度变化、多重反射

**标签**: #光线追踪 #反射 #PBR

#### 3. NURBS Splatting: A Unified Differentiable Rendering Framework for Vector Graphics
| 项目 | 内容 |
|------|------|
| arXiv | [2606.31764](https://arxiv.org/abs/2606.31764) |
| 来源 | ECCV 2026 |

**核心贡献**:
- 将NURBS曲线表示为连续Gaussian场
- 稳定梯度的可微渲染框架
- 支持书法重建、矢量化和长样条处理

**标签**: #可微渲染 #NURBS #矢量图形

#### 4. Intrinsic Decomposition and Editing of 3D Gaussian Splats
| 项目 | 内容 |
|------|------|
| arXiv | [2606.31637](https://arxiv.org/abs/2606.31637) |
| 来源 | Proc. ACM Comput. Graph. Interact. Tech. 2026 |

**核心贡献**:
- 分离diffuse albedo和shading
- 数据驱动预测引导优化
- 支持纹理编辑后任意视角重渲染

**标签**: #3DGS #内在分解 #编辑 #PBR

## 其他相关论文 (2篇)

### 5. DualBrep: A Dual-Field Continuous Representation for B-rep Modelling
- SIGGRAPH 2026
- CAD建模中使用SDF/UDF
- [2606.31579](https://arxiv.org/abs/2606.31579)

### 6. Diffuse Albedo Neural Texturing in the Wild
- 神经纹理框架，恢复diffuse albedo
- [2606.30677](https://arxiv.org/abs/2606.30677)

## 趋势分析

### 本次发现特点
1. **Gaussian Splatting为核心**：多篇论文围绕3DGS改进
2. **光线追踪回归**：GRay证明光线追踪可接近光栅化速度
3. **编辑能力提升**：Editable reflections + Intrinsic decomposition

### 重要技术方向
- 3DGS + 光线追踪结合
- 物理基础渲染(PBR)改进
- 可微渲染进展

## 行动建议
1. **GRay** - ⭐⭐⭐⭐⭐ 推荐实现，与墨鱼丸讨论算法细节
2. **Editable Reflections** - ⭐⭐⭐⭐ 高优先级，已开源
3. **Intrinsic Decomposition** - ⭐⭐⭐⭐ 适合编辑功能

## 笔记文件
- `2026/07/2026-07-01-GRay-Ray-Tracing-3D-Gaussians.md`
- `2026/07/2026-07-01-Editable-Reflections-Raytraced-Gaussian-Radiance.md`
- `2026/07/2026-07-01-NURBS-Splatting-Differentiable-Rendering.md`
- `2026/07/2026-07-01-Intrinsic-Decomposition-3D-Gaussian-Splats.md`
