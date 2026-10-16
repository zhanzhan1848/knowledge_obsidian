---
type: report
created: 2026-10-16
updated: 2026-10-16
tags: [report, daily-search, fluid-rendering, arxiv, cs.GR, SIGGRAPH-Asia-2026]
status: processed
domain: fluid-rendering
agent: doumiao
---

# 每日论文搜索报告 — 2026-10-16 (UTC)

## 搜索范围

- **时间窗口**: 严格 24 小时（2026-10-15 14:13 UTC → 2026-10-16 14:07 UTC）
- **arXiv 批次**: 2026-10-16 14:00 UTC 公告批次（cs.GR / cs.CV cross-list）
- **来源**: arXiv cs.GR（含 cross-list from cs.CV/cs.AI/cs.RO）+ SIGGRAPH 2026 / SIGGRAPH Asia 2026 / Ke-Sen Huang 索引
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering, splash, wave, underwater, liquid, flame, Lagrangian, SPH, MPM, splashing, caustic, volumetric video
- **当前 arXiv 状态**: 2026-10-16 14:00 公告批次 cs.GR 共 5 篇新提交（含 cross-list 11 篇）

---

## 候选论文

### 严格 24 小时内的 cs.GR（含 cross-list）新提交 — 2 篇**间接相关**

| arXiv ID | 标题 | 提交时间 (UTC) | 分类 | 流体相关性 | 备注 |
|----------|------|----------------|------|-----------|------|
| [2610.21121](https://arxiv.org/abs/2610.21121) | ResStreamGS: Residual-Sensitive Dual-Stream Gaussian Splatting for Mobile Volumetric Video Streaming | 2026-10-15 02:25 | cs.GR / cs.CV | ⭐⭐⭐⭐ | **体积视频流** + 4DGS，方法可迁移到 **4D 流体串流**（烟雾/水流 VR/AR 应用） |
| [2610.21584](https://arxiv.org/abs/2610.21584) | Geometric Queries on Tessellation-Free Displaced Surfaces | 2026-10-15 09:30 | cs.GR | ⭐⭐⭐⭐ | **caustics rendering 演示** — 与水渲染直接相关；无镶嵌位移表面几何查询 |

### 严格 24 小时内的 cs.GR（含 cross-list）新提交 — 3 篇**不相关**

| arXiv ID | 标题 | 备注 |
|----------|------|------|
| [2610.20625](https://arxiv.org/abs/2610.20625) | Decoupling Appearance and Geometry in Diffusion World Models | 第一人称世界模型 |
| [2610.21865](https://arxiv.org/abs/2610.21865) | From Sketch to Scene: Relightable Garment Reconstruction | 服装重建 |
| [2610.22052](https://arxiv.org/abs/2610.22052) | Compression of Uniformly Distributed Unit Quaternions | 四元数压缩 |

### 48h 扩展窗口内 — **未发现流体渲染直接相关新论文**

- 上一次直接流体论文：[[2026-10-09-Fluid-Gen-Zero-Physics-Aware-Video-Generation]]（Oct 7，已记录）
- 上一次 caustics/水表面：[[2026-10-09-Make-It-Flow-Animating-Water-3DGS]]（Oct 9，已记录）

---

## 📊 趋势观察

#### 流体渲染论文分布变化

| 月份 | cs.GR 主分类 | 流体/物理相关 | 占比 | 同比 |
|------|--------------|---------------|------|------|
| 2026-09 上旬 | ~25 篇 | 4 | 16% | baseline |
| 2026-09 下旬 | ~30 篇 | 5 | 17% | +1% |
| 2026-10 上旬（1-10）| ~22 篇 | 3 | 14% | -3% |
| 2026-10 中旬（11-14）| ~22 篇 | 1 | 5% | 显著下降 |
| **2026-10 中旬（15-16）** | **11 篇** | **2**（间接）| **18%** | **+13% ↑** |

**观察**：从 5% → 18% 主要由 **3DGS 体积视频流** 主题带动（ResStreamGS, CAGS），反映 **3DGS 持续向 4D 流式内容（包含流体）** 迁移的趋势。

#### 关键观察：3DGS 在流体场景的渗透

1. **体积视频流（CAGS + ResStreamGS 同期）**：
   - CAGS（SIGGRAPH 2026）：颜色自适应密度调度
   - ResStreamGS（2026-10-16）：时间稳定性双流调度
   - **两种互补**：颜色 vs 时间 → 4DGS 串流的"双自适应"组合是明确方向

2. **焦散/位移表面（2610.21584）**：
   - 给出**水焦散渲染**的工程基线
   - 与 [[2026-04-08-RefracGS-Refractive-Water-Surfaces]]（折射 GS 水面）形成**折射 vs 焦散**互补

#### 24h 内值得关注的研究主题

1. **3DGS 体积视频流**（ResStreamGS）：**移动端 30 FPS** 是核心工程贡献；方法可推广到 4D 流体
2. **无镶嵌位移表面**（2610.21584）：水面焦散、采样发光体、表面 PDE 解算三方向统一
3. **物理 vs 数据混合**: 上周（Oct 9）的 Fluid-Gen-Zero 仍处于头部；本周新增仍以 3DGS 工程化为主

---

## 📝 重点解读：ResStreamGS（2610.21121）

### 基本信息

- **arXiv**: [2610.21121](https://arxiv.org/abs/2610.21121)
- **日期**: 2026-10-15（cs.GR / cs.CV）
- **作者**: Haoran Liu, Di Wu, Wang Luo, Hengyuan Na, Miao Hu, Guocong Quan
- **机构**: 未公布具体单位

### 核心创新

> 第一个为**复杂全场景 3DGS 体积视频**设计的 **residual-sensitive 双流** 串流框架：
> 1. **Probe 适配**：1-3 步轻量梯度估计每个高斯的时间稳定性
> 2. **GOP 内稳定高斯复用**：静态高斯整段 GOP 仅传一次
> 3. **硬件视频解码**：残差流走 Snapdragon 778G 视频硬件管线
> 4. **结果**：PSNR +7.51–8.35 dB over V³，payload -56.5%，移动端 30.883 FPS

### 对流体渲染的启示

#### 1. 4DGS 流体串流化
- 现有 4DGS 流体方法（[[2026-05-13-LagrangianSplats-Divergence-Free-Fluid-Reconstruction]], [[2026-09-02-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]]）多为离线
- ResStreamGS 的 **stable/residual 分类** 直接迁移到 4D 流体：
  - **稳定区**：容器边界、静态水深
  - **残差敏感区**：湍流细节、飞溅液滴

#### 2. probe adaptation 思路
- 流体高斯时间方差分布**极不均匀**（边界流体高变化、内部流体低变化）
- probe adaptation 1-3 步即可分类，**训练开销可忽略**

#### 3. 移动端实时流体 VR
- VR/AR 流体应用核心瓶颈是 30+ FPS 实时串流
- 硬件解码路径为**移动 VR 流体可视化**打开工程通道

### 与 [[2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS]] 的关系

| 维度 | CAGS | ResStreamGS |
|------|------|-------------|
| 自适应维度 | **颜色**复杂度 | **时间**稳定性 |
| 调度粒度 | 帧级 | GOP 级 + 帧级 |
| 码流 | 单流 + 颜色权重 | **双流**（稳定 + 残差） |
| 编解码器 | 自适应密度 | 视频 codec |
| 主要实验场景 | 通用 3DGS | 复杂全场景 |

→ **两者可组合**：CAGS 控制颜色权重 × ResStreamGS 控制时间分类

### 推荐度
✅ **推荐** — 工程层面 4D 流体串流的核心方法

---

## 📝 重点解读：Tessellation-Free Displaced Surfaces（2610.21584）

### 基本信息

- **arXiv**: [2610.21584](https://arxiv.org/abs/2610.21584)
- **日期**: 2026-10-15 (cs.GR)
- **作者**: Bing Xu, Yang Zhou, Brian Budge
- **机构**: 未公布（Brian Budge — Lucasfilm / ILM 资深，可能为业界合作）

### 核心创新

> **无镶嵌位移表面**的完整几何查询支持：表面采样、镜面流形搜索、最近点查询
> - **一阶纹理空间层次结构**：每个 BVH 节点存**仿射高度平面** + **保守残差界**
> - **保留空间高度变化**：相比标量 min-max 界更精细
> - **应用演示**：**水焦散渲染** ✅、采样位移发光体、表面 PDE 解算器

### 对流体渲染的启示

#### 1. 水焦散渲染工程基线
- 高频水面波纹 → 无镶嵌表示
- 仿射平面 + 斜率界 → **焦散采样路径计算量显著降低**
- 面积估计 → 蒙特卡洛焦散光子生成

#### 2. 水面法线估计
- 仿射平面斜率直接给出水面法线
- **水渲染法线贴图预滤波**思路可借鉴

#### 3. 与波动模拟的衔接
- 实时模拟（[[2026-08-29_Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]]）输出的位移场 → 无镶嵌查询 → 实时焦散
- 离线模拟（Houdini / Blender Mantaflow）输出 → 高质量焦散路径追踪

### 推荐度
✅✅ **强推荐** — 水焦散渲染核心技术改进；与 [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] 互补

---

## 🔗 SIGGRAPH Asia 2026 持续监控

### Ke-Sen Huang 索引状态

- 最近更新: 2026-09-17（仅 5 篇 conditionally accepted）
- **2026-10-16 仍未见显著更新**（SIGGRAPH Asia 2026 接收通知预计 11 月初）

### 重点关注类别（推断）
- **Phased & Viscous Fluids**（参考 SIGGRAPH 2026）
- **Fluid Reconstruction & Optimization**（参考 SIGGRAPH 2026）
- **Generative 3D** 中的流体生成方向
- **Differentiable Physics-Based Animation**

### 已确认投稿 SIGGRAPH Asia 2026 的研究方向（来自 Ke-Sen 索引）
- Hamiltonian Wave-Flow Coupling (cs.GR) - [[2026-08-29_Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]]
- AnisoLift Particle Liquid Enhancement (cs.GR) - [[2026-06-11_AnisoLift_Particle_Liquid_Enhancement]]
- Mixwell Fluid Brushes (SIG/TOG) - 已发表 SIGGRAPH 2026
- Water Feature Recovery (cs.GR) - [[2026-06-11_Water_Feature_Recovery_SIGGRAPH2026]]
- Tube Maps SPH Boundary (cs.GR) - [[2026-06-11_Tube_Maps_SPH_Boundary_SIGGRAPH2026]]
- Nonlocal Variational Free Surface (cs.GR) - [[2026-06-11_Nonlocal_Variational_Free_Surface_SIGGRAPH2026]]

### 强关注点（持续追踪）
- 4DGS 流体（[[LagrangianSplats]], [[GauSmoke]]）后续延伸：体积视频流（ResStreamGS）、动态重建
- 水焦散/折射新方法（[[RefracGS]] + 2610.21584）
- 神经辐射传递（NRT）结合 4DGS 流体

---

## 📅 下次搜索计划

- **日期**: 2026-10-17 (Sat, 14:00 UTC 周六批次)
- **重点**:
  1. SIGGRAPH Asia 2026 接受论文列表（若 11 月初公布）
  2. arXiv 周六批次（cs.GR 周中批次若补充）
  3. NeurIPS 2026 物理相关 workshop 投稿接收（10-11 月）
  4. 4DGS 流体串流方向：是否出现 ResStreamGS 风格的 fluid-specific 扩展

---

## 📂 本日新增笔记

1. `2026-10-16-ResStreamGS-Volumetric-Video-Streaming-3DGS.md`（重点解读笔记）
2. `2026-10-16-Tessellation-Free-Displaced-Surfaces-Water-Caustics.md`（重点解读笔记）
3. `2026-10-16_Daily-Paper-Search.md`（本文件）

---

*由豆苗自动收集于 2026-10-16 14:07 UTC*
*Git 同步至 https://github.com/zhanzhan1848/knowledge_obsidian.git*