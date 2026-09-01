---
tags: [日报, 几何处理, arXiv, SIGGRAPH-Asia]
date: 2026-09-01
---

# 📅 日报 | 2026-09-01 几何处理论文速递

## 📊 搜索概况

| 项目 | 数据 |
|------|------|
| 搜索时间 | 2026-09-01 14:08 UTC |
| 搜索范围 | arXiv cs.GR (最近26篇) + SIGGRAPH Asia 2026 |
| 关键词 | mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing |
| 几何相关 | **11篇** |

---

## 🔥 重点论文（几何处理相关）

### 1. Domain-Varying Green's Functions for Cage-based Deformation
> 📝 **arXiv:2608.31003** | SIGGRAPH Asia 2026 | Dong Xiao

**核心方法**: 提出 Domain-Varying Green Coordinates (DVGC)，用域变化的 Green 函数统一 Harmonic Coordinates 和 Green Coordinates，实现从 HC 到 GC 的连续过渡。

**创新点**:
- 新的控制空间，支持变化域的 Green 函数
- 2D 简化 cage 有解析/半解析表达式
- 盘状域时存在闭式解，无需数值积分

**技术细节**:
- 域从 cage 区域 Ω 扩展到整个 ℝ² 时，效应从 HC 连续过渡到 GC
- 支持分析/半分析的 Green 函数（圆盘或矩形）
- 用于 3D 形状编辑的交互式工具

**几何分类**: 🟢 网格变形

---

### 2. ExMesh++: Multi-View to Relightable UV-PBR Mesh Assets
> 📝 **arXiv:2608.31003v2** (cross-ref 2608.24109) | Fan et al.

**核心方法**: 从多视图图像重建可编辑、可光照的 UV-PBR 网格资产。两阶段框架：几何细化 + UV-PBR 分解。

**创新点**:
- 自适应顶点分裂/合并保持 UV 一致性
- 稳定 UV 载体上优化 PBR 材质图 + 环境光
- 次级光线追踪建模一次反弹间接光照

**技术细节**:
- 导出资产可直接用于标准 DCC 流程
- 竞争性几何精度 + 强重光照性能

**几何分类**: 🟢 网格重建 / UV参数化

---

### 3. ViSculpt: Visual-Centric Agentic Geometry Editing
> 📝 **arXiv:2608.24169** | CVPR cross | Bo Pang et al.

**核心方法**: 训练-free 多 agent 系统，通过 Blender GUI 直接编辑现有 3D 网格。模仿人类艺术家的迭代工作流。

**创新点**:
- 多模态 LLM agent 观察 viewport 并执行局部编辑
- 无需生成脚本，直接在 GUI 操作
- 保留输入资产整体 identity

**几何分类**: 🟢 网格编辑 / Agent

---

### 4. Procedura: Agentic 3D Modeling with Procedural Control
> 📝 **arXiv:2608.26238** | CVPR cross | Youtan Lin et al.

**核心方法**: 将 3D 形状作为代码，利用 LLM 编写参数化程序。框架将目标规划为装配图，逐 part 编写程序。

**创新点**:
- 程序化装配体，带类型化、机器可检查的 mates
- 从配合 frame 求解放置而非猜测
- 视觉 critic 逐步修复装配问题

**几何分类**: 🟢 3D建模 / 程序化几何

---

### 5. Three-Parameter Binary Subdivision Scheme for Curve Design
> 📝 **arXiv:2608.23637** | Rabia Hameed et al.

**核心方法**: 通过组合 7 点 Lagrange 和 7 点 B-spline 细分方案，提出三参数 9 点二进制逼近细分格式。

**创新点**:
- 三个独立设计控制参数
- 保持逼近性质同时调整几何特性
- 推导出两个代表性子格式

**技术细节**:
- 支撑、连续性、端点规则、 Gibbs 振荡行为
- CAGD 和相关工程应用

**几何分类**: 🟢 细分曲面

---

### 6. Geometric Local Self-Similarity Learning for Texture Fill
> 📝 **arXiv:2608.25461** | Chenyue Cai et al.

**核心方法**: 利用几何自相似性和几何-纹理相关性，训练形状特定的局部纹理生成和补全模型。

**创新点**:
- 几何感知参考 patch 引导
- 任意新颖参考 patch 传递到目标纹理
- Blender 插件形式，3D 纹理专业人士反馈积极

**几何分类**: 🟢 纹理映射 / 几何自相似

---

### 7. Orientation in XPBD: Application to Rigid Bodies and Cosserat Rods
> 📝 **arXiv:2608.23606** | Samuel Tobin et al.

**核心方法**: 在 Extended Position-Based Dynamics 中使用李理论处理旋转自由度。

**创新点**:
- 李理论约束公式改进动态一致性 > 10⁴ 倍
- 线性有限元 Cosserat rod 优于 rigid body 链
- 高阶基函数提供更平滑解和更快收敛

**几何分类**: 🔵 物理仿真 / 几何计算

---

### 8. 3D Reconstruction Comparison: NeRF vs 3DGS vs Photogrammetry vs LiDAR
> 📝 **arXiv:2608.27301** | Maitrey Gramopadhye et al.

**核心方法**: 比较四种 3D 重建方法（Photogrammetry, NeRF, Gaussian Splatting, LiDAR）为教育全息表示创建的效果。

**发现**:
- NeRF 方法对透明/反射/低纹理物体重建效果最佳
- 形状和颜色普遍比纹理更易准确表示
- 为沉浸式学习环境提供实用工作流

**几何分类**: 🔵 3D重建对比

---

### 9. Relightable Gaussians for 3D Asset Generation (Luce)
> 📝 **arXiv:2608.23943** | Mayank Singh et al.

**核心方法**: 统一几何和 PBR 材质的 3D 表示，使用体素化多模态 Gaussian cloud。VAE 压缩到统一材质感知潜在空间。

**创新点**:
- 单图到 3D 生成，SOTA FID 改进 28%
- 生成可重光照、几何精确、材质真实的资产
- 保留文本、logo、铭文等精细细节

**几何分类**: 🔵 3D生成 / Gaussian 表示

---

### 10. As-Rigid-As-Possible Deformation of Gaussian Radiance Fields
> 📝 **arXiv:2608.29538** | Xinhao Tong et al.

**核心方法**: 在 3D Gaussian Splatting 上进行 as-rigid-as-possible 变形。几何编辑后进一步优化 Gaussian 以保证 rasterization 与变形辐射场一致。

**创新点**:
- 径向特征描述变形前后径向差异
- 自适应各向异性空间低通滤波器防混叠
- 保持变形前后 Gaussian 辐射场一致性

**几何分类**: 🟢 网格/Gaussian 变形

---

### 11. ABCD: Constant-VRAM Training for Large Radiance Fields
> 📝 **arXiv:2608.27735** | SIGGRAPH 2026 Posters | Ka Heng Shiu

**核心方法**: 显存 O(1) 的 3DGS 训练框架，通过 alpha-composited block coordinate descent 实现。

**创新点**:
- 仅一个 block 参数活跃，其他冻结
- 利用 alpha blending 结合性预渲染非活跃区域
- 重建质量仅下降 < 5%

**几何分类**: 🔵 辐射场训练

---

## 📋 非几何相关（仅标题）

| 论文 | 会议 | 原因 |
|------|------|------|
| Asymmetric Phase Coding Video Watermarking | cs.CR | 水印 |
| Frequency-Space Inverse Rendering for mmWave Radar | ECCV 2026 | 雷达 |
| Shape from Capacitive Proximity | cs.CV | 电容传感 |
| Diffusion Residuals for Stylized Gaussian Splatting | PG 2026 | 风格化 |
| Transparency Rendering in CAD | CAD&A | CAD渲染 |
| AR-Guided Needle Insertion | IEEE ISMAR | 医疗AR |
| Copper Surface Forecasting | cs.GR | 材质老化 |
| Egocentric Network Layouts in VR | CHI cross | 可视化 |
| Dynamic Tree Colors | GRAPP | 色彩地图 |
| Semantic Motion Codec | cs.CV | 运动 |
| Thread-Efficient Neural Texture Compression | cs.CV | 纹理压缩 |

---

## 📅 本周重要会议

- **SIGGRAPH 2026**: 已于 2026 年 7 月在洛杉矶举办（论文已公布）
- **SIGGRAPH Asia 2026**: 2026 年 12 月 1-4 日，马来西亚吉隆坡（征稿中）
- **Eurographics 2026**: 已有部分论文发表

## 🔧 开源工具/库动态

- mmWave Inverse Rendering: [mmwave-inverse-rendering.github.io](https://mmwave-inverse-rendering.github.io/)
- Procedura: [spatiaos.github.io/projects/procedura/](https://spatiaos.github.io/projects/procedura/)
- ExMesh++: [fan-treasure.github.io/ExMeshpp_page/](https://fan-treasure.github.io/ExMeshpp_page/)

---

*🥬 Wawaicai 日报 | 生成于 2026-09-01 14:10 UTC*
