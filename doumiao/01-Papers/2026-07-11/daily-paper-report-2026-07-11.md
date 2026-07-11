# 每日论文搜索报告 - 2026-07-11

## 搜索范围
- arXiv cs.GR (最近一周)
- 关键词：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 🎯 相关性高的论文

### 1. Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats
- **arXiv**: [2606.21753](https://arxiv.org/abs/2606.21753)
- **会议**: CVPR 2026 Findings
- **日期**: 2026-06-26
- **作者**: -
- **类别**: 流体+粒子+3DGS

#### 核心创新点
- **Representation Abstraction Framework**: 将 3DGS、虚拟网格、流体统一转换为物理粒子集
- 首次实现 **scene-level heterogeneous physics simulation**
- 支持 3DGS 资产与复杂静态碰撞几何的交互
- 两向耦合：可变形 3DGS + 流体 + 网格 + 大规模捕获静态环境

#### 技术细节
- 粒子集 + 静态场景碰撞边界 → solver-agnostic physics kernel
- 物理结果映射回各资产特定视觉重建
- 支持非刚性变形

#### 评估
- 逼真度：⭐⭐⭐⭐⭐
- 性能：需 GPU 支持
- **推荐度**: ✅ 高度相关，3DGS+流体物理融合的前沿工作

---

### 2. Phys4D: Fine-Grained Physics-Consistent 4D Modeling from Video Diffusion
- **arXiv**: [2603.03485](https://arxiv.org/abs/2603.03485)
- **会议**: -
- **日期**: 2026-03-05
- **作者**: Haoran Lu, Shang Wu, et al.
- **类别**: 神经渲染+物理+流体

#### 核心创新点
- **三阶段训练范式**：从视频扩散模型提升为物理一致的 4D 世界表示
1. 大规模伪监督预训练 → 几何和运动表示
2. 基于物理的监督微调 → 时间一致的 4D 动力学
3. 基于模拟的强化学习 → 纠正残余物理违反

- 支持 **fine-grained physical consistency** 评估
- 支持多种物理 regime：刚体、衣物、流体、可变形体、绳索、颗粒材料
- 支持跨 regime 耦合：rigid-fluid、rigid-garment、rigid-deformable 等

#### 评估
- 逼真度：⭐⭐⭐⭐
- **推荐度**: ✅ 相关，视频扩散+物理仿真方向

---

### 3. Microcosmos: Reimagining Artificial Life for the GPU Era
- **arXiv**: [2607.02954](https://arxiv.org/abs/2607.02954)
- **会议**: ALIFE 2026
- **日期**: 2026-07-03
- **作者**: Bert Wang-Chak Chan
- **类别**: 流体仿真+GPU+AI

#### 核心创新点
- 人工生命模拟器：2D 粘性流体世界中的弹性丝链
- 端到端可微分模拟
- GPU 原生设计，线性扩展
- 支持梯度优化、神经进化、质量多样性搜索

#### 评估
- **推荐度**: ⚠️ 相关性一般，偏AI/ALife方向

---

### 4. Unified TetSphere Mesh Reconstruction for Physical Simulations
- **arXiv**: [2607.08398](https://arxiv.org/abs/2607.08398)
- **会议**: ECCV 2026
- **日期**: 2026-07-09
- **作者**: Yaqiao Dai
- **类别**: 3D重建+物理仿真

#### 核心创新点
- 拓扑自适应的四面体网格重建
- 将 Gaussian spheres 耦合到四面体元素
- 端到端拓扑和几何优化
- 产生连贯的单连通四面体网格

#### 评估
- **推荐度**: ⚠️  tetrahedral mesh for physics simulation 相关

---

### 5. PixGS: Pixel-Space Diffusion for Direct 3D Gaussian Splat Generation
- **arXiv**: [2607.01803](https://arxiv.org/abs/2607.01803)
- **会议**: ECCV 2026
- **日期**: 2026-07-02
- **作者**: Cao Duy
- **类别**: 3DGS+扩散

#### 核心创新点
- 单阶段 3DGS 生成 pipeline
- 像素空间扩散，绕过有损潜在压缩
- 表面法线、深度、高频结构监督
- 1秒单卡 A100 推理

#### 评估
- **推荐度**: ⚠️ 3DGS 生成，与流体渲染间接相关

---

## 📋 其他 cs.GR 论文（近期）

| arXiv | 标题 | 会议 | 相关性 |
|-------|------|------|--------|
| 2607.08741 | Autoregressive Diffusion for Human Motion Generation | SIGGRAPH 2026 | ❌ |
| 2607.08016 | PBR-Conditioned Video Diffusion Refinement | - | ⚠️ 渲染相关 |
| 2607.05938 | Scalable Hand Motion Completion | - | ❌ |
| 2607.05598 | Unsupervised Removal of Screen-Space Artifacts for 3DGS | - | ⚠️ 3DGS |
| 2607.05421 | Procedural Volumetric Modeling of Plant Branching | - | ⚠️ 体积建模 |
| 2607.04796 | Differentiable Unified Glare Rating | EGSR 2026 | ❌ |
| 2607.04768 | Physics-Based Simulation of Contact-Induced Facial Wrinkling | SCA 2026 | ❌ |
| 2607.04612 | Constraint-Aware Graphic Design Editing | SIGGRAPH Asia | ❌ |
| 2607.04540 | Geometry-Conditioned Outdoor 3D Scene Generation | - | ❌ |
| 2607.04341 | How to Build Digital Humans (STAR) | Eurographics 2026 | ❌ |
| 2607.04230 | High-Performance Real-Time Hair Rendering | - | ⚠️ 头发渲染 |
| 2607.03819 | Consistency-Augmented Geometric Gaussian Splatting | - | ⚠️ 3DGS |
| 2607.01272 | Federated Learning for Point Cloud Classification | ECCV 2026 | ❌ |

---

## 🔬 趋势分析

1. **3D Gaussian Splatting + Physics**: 热点方向，Scene-Level Heterogeneous Physics Simulation 等工作将 3DGS 与物理仿真结合
2. **Video Diffusion + Physical Consistency**: Phys4D 等工作将视频扩散模型与物理一致性结合
3. **Neural Fluid Simulation**: 神经算子、Physics-Informed Neural Networks 在 CFD 中的应用

---

## 📝 备注

- 本次搜索未发现直接针对 "water rendering"、"smoke rendering"、"fire simulation"、"ocean rendering" 的新论文
- 搜索时间：2026-07-11 14:10 UTC
- 搜索范围：arXiv cs.GR 最近一周 + 相关关键词搜索
