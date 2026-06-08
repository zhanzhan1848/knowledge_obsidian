# 每日流体渲染论文搜索报告

**日期**: 2026-06-08  
**搜索范围**: arXiv cs.GR 最近列表 (6月2日-8日)  
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering  

---

## 搜索结果摘要

在本次搜索周期内，arXiv cs.GR 共 53 篇新投稿，经过标题和摘要审查，**未发现直接与流体渲染相关的论文**。

本次搜索覆盖的论文主题涵盖：
- 3D Gaussian Splatting 相关研究
- 视频扩散模型与物理推断
- CAD/几何处理
- 渲染框架与光照估计
- 程序化内容生成
- 神经网络渲染加速

---

## 本周期审查的论文列表

### 直接相关（cs.GR）

| ID | 标题 | 关键词 | 相关度 |
|----|------|---------|--------|
| 2606.07337 | Skeletal-Anchored Dual Harmonics for Structured 3D Modeling | 3D形状表示，球谐函数 | ❌ |
| 2606.06511 | Differentiable 3D Triangle-Triangle Intersection Energy | 网格优化，注入式变形 | ❌ |
| 2606.06500 | Cubic Hermite Lattice Structures | 晶格结构，增材制造 | ❌ |
| 2606.05581 | Monte Carlo Steklov Operators for Large-Scale Geometry Processing | 几何处理，拉普拉斯算子 | ❌ |
| 2606.05124 | Decoupling Appearance and Geometry in Gaussian Splatting | 3DGS，几何外观解耦 | ⚠️ 间接 |
| 2606.04319 | Learning Complex Luminaires with Light Tracing | 光线追踪，复杂光源 | ❌ |
| 2606.04108 | Symmetry-Enforced Voxel Latents for 3D Generation | 3D生成，对称性 | ❌ |
| 2606.02226 | Composable Function Systems as a General-Purpose Rendering Framework | 渲染框架，函数系统 | ⚠️ 间接 |
| 2606.01538 | Material-Point-Method Simulations for Inferring Physical Dynamics | MPM，物理仿真 | ⚠️ 间接（流体属于MPM应用场景） |
| 2606.00817 | Directed Distance Fields for Constant-Time Ray Queries on 3DGS | 3DGS，射线查询 | ⚠️ 间接 |
| 2606.00454 | Subgrid Marching Tetrahedra | 网格重建，等值面提取 | ⚠️ 间接 |

### 交叉列表（cs.CV, cs.LG, cs.MM 等）

| ID | 标题 | 来源 | 相关度 |
|----|------|------|--------|
| 2606.05328 | The Invisible Hand of Physics: Video Diffusion Models Know More Than They Show | cs.CV | ⚠️ 间接（物理推断） |
| 2606.02586 | Coherence-First World-Model Rendering with FSR4 | cs.CV | ❌ |

---

## 值得关注的间接相关论文

### 1. Material-Point-Method Simulations for Inferring and Extrapolating Physical Dynamics
- **ID**: arXiv:2606.01538
- **链接**: https://arxiv.org/abs/2606.01538
- **领域**: cs.GR, cs.CV, cs.LG
- **摘要**: 构建了包含流体、可变形物体、离散物体的 MPM 物理仿真数据集，对比了代码生成和视频扩散方法在物理动力学推断上的优劣。
- **流体相关性**: MPM 是流体模拟的常用方法，该研究包含流体仿真案例
- **创新点**: 
  - 首个 MPM 物理视频数据集 (MPMWorlds)
  - 代码生成方法在时间稳定性上优于视频扩散
  - 视频扩散在几何属性识别上更强

### 2. Composable Function Systems as a General-Purpose Rendering Framework
- **ID**: arXiv:2606.02226
- **链接**: https://arxiv.org/abs/2606.02226
- **领域**: cs.GR
- **摘要**: 提出使用函数系统（Function Systems）作为通用渲染框架，实现 GPU 上的元编程，支持拓扑复杂物体创建、点云变形和帧间插值。
- **流体相关性**: 函数系统方法可应用于体积渲染和烟雾等效果
- **创新点**: 
  - 低内存占用的网格less方法
  - 支持拓扑非平凡物体
  - 可用于低帧率动画的帧间插值

### 3. Decoupling Appearance and Geometry in Gaussian Splatting
- **ID**: arXiv:2606.05124
- **链接**: https://arxiv.org/abs/2606.05124
- **领域**: cs.GR, cs.CV, cs.LG
- **摘要**: 发现 3DGS 默认形式无法同时表示纹理和几何，提出几何不透明度参数解决透明物体场景。
- **流体相关性**: 3DGS 可用于流体表面渲染，该方法对透明流体场景有价值
- **创新点**: 
  - 发现 3DGS 几何-外观耦合问题
  - 几何不透明度参数
  - 透明物体场景显著提升

---

## SIGGRAPH/SIGGRAPH Asia 2026

**状态**: 暂未检索到 2026 年 SIGGRAPH/SIGGRAPH Asia 接收论文列表（会议通常在年中举行，投稿截止通常在年初）。建议后续定期检索。

---

## 下次搜索建议

1. 扩大关键词范围：加入 "implicit neural rendering", "neural radiance field fluid", "physically-based rendering"
2. 增加交叉列表检查范围：cs.LG, cs.CV, cs.MM 中常有流体相关论文
3. 关注 SIGGRAPH 2026 投稿列表（预计 2026年初截止）
4. 考虑搜索 "splash rendering", "spray simulation", "foam rendering" 等细分方向

---

## 知识库同步状态

- 笔记位置: `~/knowledge-vault/doumiao/01-Papers/2026-06/`
- Git 同步: 待执行 `git-sync.sh`

---

*报告生成时间: 2026-06-08 14:14 UTC*  
*Agent: 豆苗 (Doumiao) — 计算机图形学流体渲染专家*