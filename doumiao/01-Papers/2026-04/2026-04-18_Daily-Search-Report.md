# 每日论文搜索报告

**日期**: 2026-04-18
**Agent**: doumiao (豆苗)
**搜索范围**: arXiv cs.GR (2026-04-13 ~ 2026-04-17)

---

## 搜索结果概览

| 日期 | cs.GR论文数 | 体积渲染相关 |
|------|-------------|-------------|
| 04-13 | 5 | 1 (NeuVolEx) |
| 04-14 | 9 | 2 (Voxelization+LoD, VVGT*) |
| 04-15 | 4 | 1 (VVGT) |
| 04-16 | 7 | 1 (SSD-GS, MSGS) |
| 04-17 | 5 | 0 |
| **合计** | **30** | **5** |

*VVGT 已在 2026-04-15 单独存档

---

## 发现的相关论文

### 🔬 体积渲染相关

#### 1. NeuVolEx: Implicit Neural Features for Volume Exploration
- **arXiv ID**: 2604.11172
- **发布时间**: 2026-04-14
- **类别**: cs.GR, cs.CV
- **作者**: Anonymous (under review)
- **链接**: https://arxiv.org/abs/2604.11172
- **相关度**: ⭐⭐⭐ (体积渲染 → 可视化)

**核心创新**:
- 将 INR (Implicit Neural Representation) 从体积压缩扩展到体积探索
- 提出结构编码器 + 多任务学习方案，改善 ROI 表征的空间连贯性
- 在稀疏用户监督下实现精确 ROI 分类（传递函数设计）
- 支持无监督聚类，识别揭示不同 ROI 簇的互补视点
- 超越传统局部特征表示和隐式卷积特征表示

**技术要点**:
- Direct Volume Rendering (DVR)
- Implicit Neural Representation (INR)
- Transfer Function Design
- Viewpoint Recommendation
- Multi-task Learning

**流体渲染价值**: INR 在流体体积数据压缩和探索中已有应用 (如 Neural VDB)，本工作可作为流体体积数据的快速探索和分类参考。

---

#### 2. Fast Voxelization and LoD for Microgeometry Rendering
- **arXiv ID**: 2604.13191
- **发布时间**: 2026-04-14
- **类别**: cs.GR, cs.LG
- **作者**: Javier Fabre et al.
- **链接**: https://arxiv.org/abs/2604.13191
- **发表**: The Visual Computer (已接受)
- **相关度**: ⭐⭐⭐ (体积渲染 → 微几何)

**核心创新**:
- 高效并行体素化方法，支持多分辨率级别的快速数据聚合
- 层次化 SGGX 聚类表示，比基线方法提供更好精度
- 验证于 CUDA 实现，测试于三角网格和具有显式纤维的体积织物
- Path tracer 集成的 LoD 渲染模型

**技术要点**:
- Parallel Voxelization (CUDA)
- Level-of-Detail (LoD)
- SGGX Spherical Gaussian
- Microgeometry / Anisotropic Scattering
- Path Tracing

**流体渲染价值**: 纤维结构渲染技术可类比烟雾/云层等参与介质的微观结构表示；层次化方法对流体体积的多分辨率渲染有参考价值。

---

#### 3. SSD-GS: Scattering and Shadow Decomposition for Relightable 3DGS
- **arXiv ID**: 2604.13333
- **发布时间**: 2026-04-14
- **类别**: cs.CV, cs.GR (交叉)
- **发表**: ICLR 2026
- **链接**: https://arxiv.org/abs/2604.13333
- **代码**: https://github.com/irisfreesiri/SSD-GS
- **相关度**: ⭐⭐ (次表面散射 → 间接相关)

**核心创新**:
- 将反射分解为四个分量：漫反射、镜面反射、阴影、次表面散射 (SSS)
- 可学习偶极子散射模块用于次表面传输
- 遮挡感知阴影公式，结合可见性估计和细化网络
- 各向异性 Fresnel 镜面模型
- 在 OLAT 数据集上实现高质量 relighting

**技术要点**:
- 3D Gaussian Splatting
- Subsurface Scattering (SSS)
- Physically-based Relighting
- Anisotropic Fresnel
- Shadow Decomposition

**流体渲染价值**: 次表面散射是液体（牛奶、皮肤）和半透明流体的核心视觉特征；该分解方法可用于流体材质的物理精确渲染。

---

#### 4. MSGS: Multispectral 3D Gaussian Splatting
- **arXiv ID**: 2604.13340
- **发布时间**: 2026-04-14
- **类别**: cs.CV, cs.GR (交叉)
- **发表**: IEEE ISMAR 2025 Adjunct
- **链接**: https://arxiv.org/abs/2604.13340
- **相关度**: ⭐⭐ (透明材质 → 间接相关)

**核心创新**:
- 多光谱扩展 3DGS，每个高斯增加光谱辐射（per-band spherical harmonics）
- 像素级光谱到 RGB 转换，保留丰富光谱线索
- 对透明材质和各向异性反射场景效果显著

**技术要点**:
- Multispectral Rendering
- 3D Gaussian Splatting
- Spherical Harmonics
- Translucent Materials
- Spectral Radiance

**流体渲染价值**: 透明材质和各向异性反射是水面、冰块等流体相关场景的视觉特征。

---

## 完整论文列表 (2026-04-13 ~ 2026-04-17)

### 2026-04-17
| ID | 标题 | 类型 | 相关度 |
|----|------|------|--------|
| 2604.14927 | Geometric Partitioning of B-Reps | CAD | ❌ |
| 2604.14468 | Progressive Convex Hull Simplification | 几何 | ❌ |
| 2604.15310 | Precise Lighting Control (TokenLight) | 光照/Relight | ⚠️ 间接 |
| 2604.14928 | Hybrid Latents Surfel Splatting | 3DGS | ⚠️ |
| 2604.14216 | Neuro-Oracle Epilepsy Prognosis | 医学 | ❌ |

### 2026-04-16
| ID | 标题 | 类型 | 相关度 |
|----|------|------|--------|
| 2604.13427 | Unified Conditional Flow Motion | 动画 | ❌ |
| 2604.13254 | TCR-pMHC Binding Prediction | 生物 | ❌ |
| 2604.13191 | Fast Voxelization + LoD | **体积** | ✅ |
| 2604.14025 | Feed-Forward 3D Scene Survey | 综述 | ⚠️ |
| 2604.13340 | MSGS Multispectral 3DGS | 3DGS | ⚠️ |
| 2604.13333 | SSD-GS Scattering/Shadow | **次表面** | ⚠️ |
| 2604.13256 | Counterfactual TCR Editing | 生物 | ❌ |

### 2026-04-15
| ID | 标题 | 类型 | 相关度 |
|----|------|------|--------|
| 2604.12625 | Neural Dynamic GI (NDGI) | 全局光照 | ⚠️ |
| 2604.12217 | VVGT Volume-Grounded Transformer | **体积** | ✅ |
| 2604.12023 | Twisted Edges LK Structures | 几何 | ❌ |
| 2604.12765 | Markerless 4D MoCap Dataset | 动作捕捉 | ❌ |

### 2026-04-14
| ID | 标题 | 类型 | 相关度 |
|----|------|------|--------|
| 2604.11723 | User Satisfaction Education | 教育 | ❌ |
| 2604.11172 | NeuVolEx Volume Exploration | **体积** | ✅ |
| 2604.10393 | CV-HoloSR Hologram SR | 全息 | ⚠️ |
| 2604.10263 | Infernux Game Engine | 引擎 | ❌ |
| 2604.10199 | FatigueFusion Motion | 动画 | ❌ |
| 2604.10885 | Facial Expression Detection | 表情 | ❌ |
| 2604.10356 | Conducting Patterns Model | 数学 | ❌ |
| 2604.10259 | Real-Time Human GS | 3DGS/人形 | ⚠️ |
| 2604.10223 | 129FPS 3DGS Accelerator | 硬件 | ❌ |

### 2026-04-13
| ID | 标题 | 类型 | 相关度 |
|----|------|------|--------|
| 2604.08799 | MeshOn Mesh Composition | 网格 | ❌ |
| 2604.08746 | AniGen Animatable 3D Assets | 3D资产 | ❌ |
| 2604.09260 | Facade Parsing (EUROGRAPHICS) | 建筑 | ❌ |
| 2604.09134 | OTC Drug Visualization | 可视化 | ❌ |
| 2604.09132 | SATO UV Mesh Generation | 网格 | ❌ |

---

## 结论

本次扫描 (2026-04-13 ~ 2026-04-17) 在 arXiv cs.GR 中 **未发现直接相关** 的流体渲染论文（水面、烟雾、火焰、海洋渲染）。

发现的体积渲染相关论文可间接服务于流体渲染研究：
- **NeuVolEx** — INR 体积探索方法可应用于流体体积数据的快速分类
- **Fast Voxelization + LoD** — 体积织物渲染方法类比于烟雾/云层微结构
- **SSD-GS** — 次表面散射分解为液体材质渲染提供参考
- **MSGS** — 多光谱 3DGS 处理透明材质

---

## 下一步

1. 关注即将到来的 SIGGRAPH 2026 论文提交截止日期
2. 持续追踪 INR + 流体体积压缩交叉领域
3. 关注 3DGS 在体积/流体场景的新进展

---

*由 doumiao (豆苗) 自动生成 | 2026-04-18*
