# 每日流体渲染论文搜索报告

**日期**: 2026-05-29
**搜索范围**: 最近 5 天 (2026-05-25 ~ 2026-05-29)
**搜索源**: arXiv cs.GR, SIGGRAPH/SIGGRAPH Asia

---

## 搜索结果摘要

本次搜索未发现直接针对以下关键词的近期论文:
- fluid rendering
- water rendering  
- smoke rendering
- fire simulation
- ocean rendering
- particle system (流体相关)
- volume rendering (流体相关)

**搜索覆盖**: 共检查 arXiv cs.GR 分类下 42 篇近期论文

---

## 相关论文发现

虽然未发现直接针对流体渲染的论文，但发现以下**间接相关**论文：

### 1. 仿真与渲染技术

| 论文ID | 标题 | 领域 | 相关性 |
|--------|------|------|--------|
| 2605.27852 | ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation | 布料仿真 | ⭐⭐⭐ |
| 2605.29318 | Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes | 粒子仿真 | ⭐⭐⭐⭐ |
| 2605.26391 | Garment Particles: A 2D-3D Symmetric Garment Representation | 粒子表示 | ⭐⭐⭐ |
| 2505.20349 | FD-Bench: A Modular and Fair Benchmark for Data-driven Fluid Simulation | 数据驱动流体仿真 | ⭐⭐⭐⭐⭐ |

### 2. 渲染技术

| 论文ID | 标题 | 领域 | 相关性 |
|--------|------|------|--------|
| 2605.27323 | Megakernel vs Wavefront GPU Path Tracing | GPU路径追踪 | ⭐⭐⭐ |
| 2605.26137 | Deployable 3D Asset Generation at Interactive Speed | 实时渲染资产 | ⭐⭐ |

---

## 重点论文摘要

### FD-Bench: 数据驱动流体仿真基准
- **arXiv**: [2505.20349](https://arxiv.org/abs/2505.20349)
- **更新**: v2 (2026-05-21)
- **会议**: KDD 2026
- **核心贡献**:
  - 首个公平、模块化、可复现的数据驱动流体仿真基准
  - 系统评估 85 个 baseline 模型，覆盖 10 种流场景
  - 模块化设计，支持空间/时间/损失函数模块的公平比较
  - 提供与数值求解器的系统性对比框架
- **开源**: https://github.com/WillDreamer/FD-Bench

### ClothTransformer: 统一隐空间 Transformer 布料仿真
- **arXiv**: [2605.27852](https://arxiv.org/abs/2605.27852)
- **核心贡献**:
  - 将布料仿真重新定义为隐空间自回归序列建模
  - 单一模型处理服装/人形/机器人等多种场景
  - 潜在空间公式压缩任意分辨率网格为固定尺寸 token
  - ~493.4k 帧高质量穿透-free 数据集
  - 误差比 SOTA 方法低 4-9 倍

### Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes
- **arXiv**: [2605.29318](https://arxiv.org/abs/2605.29318)
- **会议**: CVPR 2026
- **核心贡献**:
  - 基于 RKPM (Reproducing Kernel Particle Method) 的无网格降阶仿真
  - 通过 Hessian 矩阵广义特征系统构建降阶蒙皮权重
  - 比神经场单形状优化快 40 倍
  - 支持网格/Gaussian Splatting 等多种表示

### Garment Particles: 2D-3D 对称服装表示
- **arXiv**: [2605.26391](https://arxiv.org/abs/2605.26391)
- **核心贡献**:
  - 5D 点云表示，联合编码 2D 纸样和 3D 几何
  - Garment Particles Flow (GPF) 修正流框架
  - 支持文本/图像/草图生成和各种编辑操作

### Megakernel vs Wavefront GPU Path Tracing
- **arXiv**: [2605.27323](https://arxiv.org/abs/2605.27323)
- **核心贡献**:
  - 比较前向路径追踪 (PT) 和波前路径追踪 (WPT)
  - WPT 比 PT 快约 16%，归因于更好的缓存局部性
  - 为实时路径追踪优化提供参考

---

## 领域动态观察

1. **数据驱动流体仿真**仍是热点，FD-Bench 提供统一基准
2. **Transformer/扩散模型**扩展到布料和粒子仿真
3. **实时渲染**资产生成快速发展 (14秒交互速度)
4. **Gaussian Splatting** 在仿真和渲染中均有应用
5. **神经渲染**开始整合到传统渲染管线

---

## 下次搜索建议

1. 扩大关键词范围: "neural rendering", "splatting", "particles"
2. 检查 cs.LG 和 cs.CV 交叉列表
3. 搜索特定会议: I3D, PG, EG, Eurographics

---

*由 Doumiao (豆苗) 自动生成 - 2026-05-29 14:10 UTC*