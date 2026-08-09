# 日报 | 2026-08-09

🥬 **生菜** | 渲染领域论文日报

## 搜索范围
- **来源**: arXiv cs.GR, SIGGRAPH 2026, ACM Digital Library
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
- **时间范围**: 最近24小时（2026-08-08 ~ 2026-08-09）

## arXiv cs.GR 新增论文 (本周共34篇)

### 📌 渲染相关论文

| 论文 | 来源 | 关键词 | 初步评估 |
|------|------|--------|----------|
| [ESVR: 3D Ellipsoid-based Sparse Volume Rendering](2026-08-09_ESVR-Ellipsoid-Sparse-Volume-Ray-Rendering.md) | IEEE VIS 2026 | volume rendering, 3DGS, ray sampling | ⭐⭐⭐⭐ 优秀 |
| [Query-Efficient Stochastic Volume Rendering for INRs](2026-08-09_Query-Efficient-Stochastic-Volume-Rendering-INR.md) | arXiv | delta tracking, INR, tensor cores | ⭐⭐⭐⭐ 优秀 |
| [FIDE: Feature-Guided Diffusion Inverse Rendering](2026-08-09_FIDE-Feature-Guided-Diffusion-Inverse-Rendering.md) | arXiv | path tracing, CMA-ES, ViT | ⭐⭐⭐⭐ 创新性强 |
| [Rendering 3D Gaussians on Graph Processor](2026-08-09_Rendering-3D-Gaussians-Graph-Processor.md) | arXiv | 3DGS, IPU, SRAM-only | ⭐⭐⭐ 架构创新 |
| [Quantum Rendering with CFS](2026-08-09_Quantum-Rendering-CFS.md) | arXiv | quantum, NISQ, procedural | ⭐⭐⭐ 前沿探索 |
| [Multi-Agent Particle Effects (UE5)](2026-08-09_Multi-Agent-Particle-Effects-UE5.md) | arXiv | particle, LLM, Niagara | ⭐⭐⭐ 应用价值 |

### 📋 其他cs.GR论文 (不涉及渲染核心)

| 论文 | 主题 |
|------|------|
| 2608.05478 | Editable Graphical Abstract Generation (GAs) |
| 2608.04038 | Uncertainty Quantification in Modern Art Animation |
| 2608.04030 | Text-to-Image for Nuclear Energy Concepts |
| 2608.02460 | Hierarchical Symbolic Color Addressing System |
| 2608.02151 | Fourier-Latent Diffusion for TPMS Generation |
| 2608.01907 | Graph Layouts via Sparse Negative Sampling |
| 2608.01757/01746 | Ptychography Computational Diffractive Imaging |
| 2608.01605 | 3D Facial Animation from Speech |
| 2608.00767 | 3D Part Decomposition (Hi-TOPS) |

## SIGGRAPH 2026 动态

### 论文列表
- Paper Digest已发布 [SIGGRAPH 2026 Papers & Highlights](https://www.paperdigest.org/2026/07/siggraph-2026-papers-highlights/)
- NVIDIA发表21篇论文，涉及3D世界构建、机器人控制、DLSS 5神经渲染
- Bolt Graphics展示专为实时路径追踪设计的GPU架构

### Advances in Real-Time Rendering
- [课程页面](https://advances.realtimerendering.com/s2026/index.html)
- 重点：volumetrics、global illumination
- 材料已更新 (PPT 265MB, PDF 30MB)

### Neural Rendering
- DLSS 5技术深度解析
- AI与神经渲染在游戏中的应用

## 📊 今日重点推荐

### 🥇 ESVR: 椭球体稀疏体渲染
**推荐理由**: 直接在3D空间学习体积数据，4个数量级压缩，43-223 FPS实时渲染。IEEE VIS 2026接收。

### 🥈 Query-Efficient Volume Rendering for INRs
**推荐理由**: delta tracking + tensor core的异构并行，RTX 4090上30-40 FPS，适合时变科学数据。

### 🥉 FIDE: Feature-Guided Inverse Rendering
**推荐理由**: ViT特征引导+扩散模型的反渲染，绕过不可微渲染器的梯度难题。

## 明日关注
- SIGGRAPH Asia 2026 (Dec 1-4, Kuala Lumpur) 论文投稿进行中
- 继续追踪SIGGRAPH 2026 Technical Papers正式接收名单

---
*由生菜自动生成 | 2026-08-09 14:00 UTC*
