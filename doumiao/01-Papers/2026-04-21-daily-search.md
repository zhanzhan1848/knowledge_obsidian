# 每日流体渲染论文搜索报告
**日期**: 2026-04-21 (UTC)  
**搜索范围**: arXiv cs.GR 最近24小时 + 本周  
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📋 搜索结果总结

### 直接相关论文
**未发现**直接涉及流体渲染（fluid/water/smoke/fire rendering）的论文。

### 间接相关论文（体积渲染）

| 论文ID | 标题 | 领域 | 相关性 |
|--------|------|------|--------|
| 2604.12217 | VVGT: Visual Volume-Grounded Transformer | 体积渲染 → 3DGS | ⭐⭐⭐ |
| 2604.13191 | Fast Voxelization and LoD for Microgeometry Rendering | 体积渲染 | ⭐⭐⭐ |

---

## 📄 论文详情

### 1. VVGT: Visual Volume-Grounded Transformer
**arXiv**: [2604.12217](https://arxiv.org/abs/2604.12217)  
**分类**: cs.GR  
**日期**: 2026-04-14  
**作者**: Youcheng Cai

**摘要**:
Volumetric visualization has long been dominated by Direct Volume Rendering (DVR), which operates on dense voxel grids and suffers from limited scalability as resolution and interactivity demands increase. Recent advances in 3D Gaussian Splatting (3DGS) offer a representation-centric alternative; however, existing volumetric extensions still depend on costly per-scene optimization, limiting scalability and interactivity.

We present VVGT (Visual Volume-Grounded Transformer), a feed-forward, representation-first framework that directly maps volumetric data to a 3D Gaussian Splatting representation, advancing a new paradigm for volumetric visualization beyond DVR.

Unlike prior feed-forward 3DGS methods designed for surface-centric reconstruction, VVGT explicitly accounts for volumetric rendering, where each pixel aggregates contributions along a ray. VVGT employs a dual-transformer network and introduces Volume Geometry Forcing, an epipolar cross-attention mechanism that integrates multi-view observations into distributed 3D Gaussian primitives without surface assumptions.

**创新点**:
- 提出前馈式体积渲染范式，无需逐场景优化
- Dual-transformer network + Volume Geometry Forcing
- 支持零样本泛化

**对流体渲染的意义**: 体积渲染技术可用于烟雾、体积光等效果

---

### 2. Fast Voxelization and LoD for Microgeometry Rendering
**arXiv**: [2604.13191](https://arxiv.org/abs/2604.13191)  
**分类**: cs.GR  
**日期**: 2026-04-14  
**作者**: Javier Fabre  
**发表**: The Visual Computer (accepted)

**摘要**:
Many materials show anisotropic light scattering patterns due to the shape and local alignment of their underlying micro structures: surfaces with small elements such as fibers, or the ridges of a brushed metal, are very sparse and require a high spatial resolution to be properly represented as a volume.

The acquisition of voxel data from such objects is a time and memory-intensive task, and most rendering approaches require an additional Level-of-Detail (LoD) data structure to aggregate the visual appearance.

We introduce first, an efficient parallel voxelization method designed to facilitate fast data aggregation at multiple resolution levels, and second, a novel representation based on hierarchical SGGX clustering that provides better accuracy than baseline methods.

**创新点**:
- 高效并行体素化方法
- 层次SGGX聚类
- CUDA实现 + Path tracer验证

**对流体渲染的意义**: 体素化是体积渲染的基础技术，可用于流体表示

---

## 本周 cs.GR 完整论文列表 (Apr 15-21)

### 直接提交 (cs.GR)
1. 2604.18468 - Extracting 3D Assets from Autonomous Driving Logs (NVIDIA)
2. 2604.18364 - LLM-based Manim Animation Generation
3. 2604.17959 - Chatting about Upper-Body EHPS
4. 2604.17831 - Probabilistic Camera Modeling for NeRF
5. 2604.17623 - Video-informed Pose Spaces (ViPS)
6. 2604.17390 - Restoring Ancient Inscription Textures
7. 2604.17155 - Instant Colorization of Gaussian Splats
8. 2604.16976 - Unsupervised Geometric Distance for Point Cloud
9. 2604.16629 - Amortized IK via Graph Attention
10. 2604.16512 - Medial Axis Aware Learning of SDFs
11. 2604.15513 - Divide and Truncate (DAT) - multi-physics collision
12. 2604.15310 - Precise Lighting Control in Images
13. 2604.14927 - STEP-Parts: CAD Processing
14. 2604.14928 - Hybrid Latents: Geometry-Appearance-Aware Surfel
15. 2604.14468 - Progressive Convex Hull Simplification
16. 2604.14216 - Neuro-Oracle: Epilepsy Surgical Prognosis
17. 2604.14025 - Feed-Forward 3D Scene Modeling Survey
18. 2604.13427 - Unified Conditional Flow for Motion
19. 2604.13340 - MSGS: Multispectral 3DGS
20. 2604.13333 - SSD-GS: Scattering/Shadow Decomposition
21. 2604.13331 - Physics-Informed Video Diffusion for Shallow Water
22. 2604.13256 - Counterfactual Peptide Editing
23. 2604.13254 - Calibrated Abstention for TCR
24. 2604.13191 - Fast Voxelization and LoD (Volume)
25. 2604.12765 - 4D Markerless Human Motion Capture
26. 2604.12625 - Neural Compression for Temporal Lightmaps
27. 2604.12217 - VVGT: Visual Volume-Grounded Transformer
28. 2604.12023 - Linked Knot Structures
29. 2604.15941 - Neural Gabor for High-frequency Surface
30. 2604.16237 - Ellipsography: Speckle-Free Holography

---

## 🔍 行业动态

### SIGGRAPH 2026 倒计时
- **投稿截止**: 已过 (通常1月)
- **通知日期**: 通常5-6月
- **会议日期**: 2026年8月

---

## 📝 下次搜索计划
- 扩大搜索范围至 cs.CV (交叉列表)
- 添加更多关键词: "ray marching", "sdf", "neural rendering"
- 检查 Physics/Fluid Dynamics 相关论文的渲染应用

---

*报告生成时间: 2026-04-21 14:18 UTC*
