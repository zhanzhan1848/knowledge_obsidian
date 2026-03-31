---
tags: [渲染, 论文, 每日搜索, 2026]
date: 2026-03-31
status: 已分析
---

# 🥬 每日渲染论文搜索报告 — 2026-03-31

## 搜索范围
- **来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, neural rendering
- **时间**: 最近1个月

---

## 📄 RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering

| 属性 | 值 |
|------|-----|
| **标题** | Radiometrically Consistent Gaussian Surfels for Inverse Rendering |
| **作者** | Kyu Beom Han et al. |
| **会议** | ICLR 2026 Oral |
| **链接** | [arXiv:2603.01491](https://arxiv.org/abs/2603.01491) |
| **代码** | 待发布 |

### 核心贡献
1. **Radiometric Consistency（辐射一致性）**: 提出一种基于物理的约束，通过最小化每个 Gaussian 基元的学习 radiance 与其物理渲染结果之间的残差，为未观测视角提供监督
2. **自纠正反馈循环**: 在物理渲染和新型视角合成两个方向上同时提供监督，实现精确的 inter-reflection 建模
3. **RadioGS 框架**: 基于 Gaussian surfels 和 2D Gaussian ray tracing 的高效逆渲染框架
4. **快速重光照策略**: 分钟级适应新光照，渲染成本 <10ms

### 技术方案
- 利用 Gaussian surfels 而非传统 3D Gaussians
- 2D Gaussian ray tracing 实现高效积分
- 辐射一致性约束实现材质属性与复杂全局光照的解耦

### 创新性评估
- **创新性**: ⭐⭐⭐⭐⭐（ICLR Oral，辐射一致性概念新颖）
- **实用性**: ⭐⭐⭐⭐（分钟级重光照，<10ms 渲染）
- **难度**: 高（需同时理解 PBR 和 Gaussian Splatting）

### 标签
#逆渲染 #全局光照 #Gaussian-Splatting #PBR #ICLR2026

---

## 📄 3DGEER: 3D Gaussian Rendering Made Exact and Efficient for Generic Cameras

| 属性 | 值 |
|------|-----|
| **标题** | 3D Gaussian Rendering Made Exact and Efficient for Generic Cameras |
| **作者** | Zixun Huang et al. |
| **会议** | ICLR 2026 |
| **链接** | [arXiv:2505.24053](https://arxiv.org/abs/2505.24053) |
| **代码** | [GitHub: boschresearch/3dgeer](https://github.com/boschresearch/3dgeer) |

### 核心贡献
1. **闭合形式射线积分**: 从第一性原理推导出 Gaussian 密度沿射线精确积分的闭合形式表达式，实现任意相机模型下的精确前向渲染和可微分优化
2. **Particle Bounding Frustum (PBF)**: 无需 BVH 遍历即可实现紧密的射线-Gaussian 关联
3. **Bipolar Equiangular Projection (BEAP)**: 统一 FoV 表示，加速关联，改善重建质量
4. **性能**: 比现有精确射线方法快 5 倍，支持 pinhole 和 fisheye

### 技术方案
```math
\text{Gaussian density along ray} = \int_0^{\infty} G(\mathbf{o} + t\mathbf{d}) dt
```
- 推导了上述积分的闭合形式解
- PBF 替代传统 BVH 实现高效关联
- BEAP 统一不同相机的 FoV 表示

### 创新性评估
- **创新性**: ⭐⭐⭐⭐⭐（数学推导精确，ICLR 2026）
- **实用性**: ⭐⭐⭐⭐⭐（5x 加速，开源代码）
- **难度**: 高（需深厚数学基础）

### 标签
#3D-Gaussian-Splatting #精确渲染 #BVH #光线追踪 #ICLR2026

---

## 📄 R3GW: Relightable 3D Gaussians for Outdoor Scenes in the Wild

| 属性 | 值 |
|------|-----|
| **标题** | Relightable 3D Gaussians for Outdoor Scenes in the Wild |
| **作者** | Margherita Lea Corona et al. |
| **会议** | VISAPP 2026 |
| **链接** | [arXiv:2603.02801](https://arxiv.org/abs/2603.02801) |

### 核心贡献
1. **双 Gaussian 集合分离**: 将场景分离为可重光照的前景和天空背景两组 Gaussians
2. **PBR + 3DGS 融合**: 在变化光照条件下，通过物理渲染结合 3DGS 场景表示，建模视图相关光照效果
3. **天空建模**: 减轻天空-前景边界处的深度重建伪影

### 技术方案
- 前向：可重光照的 Gaussian 表示
- 背景：天空 Gaussian（无反射）
- 支持任意光照条件下的 photorealistic 新视角合成

### 创新性评估
- **创新性**: ⭐⭐⭐（户外场景重光照的针对性方案）
- **实用性**: ⭐⭐⭐⭐（NeRF-OSR 数据集上 SOTA）
- **难度**: 中

### 标签
#3D-Gaussian-Splatting #重光照 #PBR #全局光照 #VISAPP2026

---

## 📄 PhyGaP: Physically-Grounded Gaussians with Polarization Cues

| 属性 | 值 |
|------|-----|
| **标题** | Physically-Grounded Gaussians with Polarization Cues |
| **作者** | Jiale Wu et al. |
| **会议** | CVPR 2026 |
| **链接** | [arXiv:2603.14001](https://arxiv.org/abs/2603.14001) |

### 核心贡献
1. **Polarimetric Deferred Rendering (PolarDR)**: 通过偏振反射建模偏振效应
2. **GridMap**: 自遮挡感知的环境图构建技术，解决非凸物体的间接光照问题
3. **精确属性重建**: PSNR 提升 ~2dB，余弦距离提升 45.7%

### 技术方案
- RGB 图像缺乏形状和材质信息 → 引入偏振线索
- PolarDR 处理偏振反射
- GridMap 处理自遮挡和间接光照
- 支持部分偏振线索的场景

### 创新性评估
- **创新性**: ⭐⭐⭐⭐⭐（偏振线索用于物理 grounding，CVPR 2026）
- **实用性**: ⭐⭐⭐⭐（高精度重光照能力）
- **难度**: 高

### 标签
#偏振渲染 #物理渲染 #3D-GS #逆渲染 #PBR #CVPR2026

---

## 📄 UniLight: A Unified Representation for Lighting

| 属性 | 值 |
|------|-----|
| **标题** | UniLight: A Unified Representation for Lighting |
| **作者** | Zitian Zhang et al. |
| **链接** | [arXiv:2512.04267](https://arxiv.org/abs/2512.04267) |
| **项目页** | [lvsn.github.io/UniLight](https://lvsn.github.io/UniLight) |

### 核心贡献
1. **统一光照表示**: 提出 joint latent space，统一文本、图像、irradiance、environment maps 等多种模态
2. **对比学习对齐**: modality-specific encoders 通过对比学习对齐到共享 embedding
3. **球谐预测辅助任务**: 强化方向性理解
4. **三大任务**: 基于光照的检索、环境图生成、扩散图像合成中的光照控制

### 技术方案
- 统一 latent space 整合多种光照表示
- 支持跨模态迁移
- 大规模训练和评估

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（统一表示框架新颖）
- **实用性**: ⭐⭐⭐⭐（跨模态应用广泛）
- **难度**: 中

### 标签
#光照表示 #环境贴图 #神经渲染 #全局光照

---

## 📄 Icarus: Full Dynamic Range Sky-Modelling For Image Based Lighting

| 属性 | 值 |
|------|-----|
| **标题** | Full Dynamic Range Sky-Modelling For Image Based Lighting |
| **作者** | Ian Maquignaz et al. |
| **链接** | [arXiv:2603.05758](https://arxiv.org/abs/2603.05758) |
| **cs分类** | cs.GR, cs.CV, cs.LG |

### 核心贡献
1. **全动态范围天空模型**: 解决 DNN 天空模型在 14EV+ 高动态范围 solar region 建模不足的问题
2. **Icarus**: 全天候天空模型，学习 FDR 物理捕获的户外图像的曝光范围
3. **用户可控**: 支持太阳和云层位置的直观控制，支持大气形成物的文本纹理控制
4. **高精度照明**: 在 IBL 中展示前所未有的精度、写实性、光照方向性（阴影）和色调

### 技术方案
- 物理仿真的天空模型 + 深度学习
- 条件生成环境贴图
- 支持 FDR（Full Dynamic Range）

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（FDR 天空建模针对性强）
- **实用性**: ⭐⭐⭐⭐⭐（IBL 实用价值高）
- **难度**: 中

### 标签
#天空建模 #IBL #HDR #全局光照 #PBR #渲染

---

## 本次发现技术总结

### 3D Gaussian Splatting 仍是主流
- **RadioGS**: 辐射一致性约束解决材质解耦问题
- **3DGEER**: 精确数学推导 + 无 BVH 高效关联
- **R3GW**: 户外场景重光照
- **PhyGaP**: 偏振线索物理接地

### 光照与天空建模
- **UniLight**: 多模态统一光照表示
- **Icarus**: FDR 全动态范围天空模型

### 与渲染领域的关联
以上论文主要涉及 **神经渲染** 与 **PBR 逆渲染**，均属于渲染领域的研究前沿。

### 已同步至知识库
- `/root/knowledge-vault/shengcai/01-Papers/2026-03/2026-03-31-daily-search-report.md`

---
*🥬 生菜 · 每日论文搜索 · 2026-03-31 14:00 UTC*
