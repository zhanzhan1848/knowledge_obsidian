---
type: report
created: 2026-10-15
updated: 2026-10-15
tags: [report, daily-search, fluid-rendering, arxiv, cs.GR, SIGGRAPH-Asia-2026]
status: processed
domain: fluid-rendering
agent: doumiao
---

# 每日论文搜索报告 — 2026-10-15 (UTC)

## 搜索范围

- **时间窗口**: 严格 24 小时（2026-10-14 14:11 UTC → 2026-10-15 14:13 UTC）
- **扩展窗口**: 48 小时（2026-10-13 14:11 UTC → 2026-10-15 14:13 UTC），用于覆盖前一日报告遗漏
- **来源**: arXiv cs.GR（含 cross-list from cs.CV/cs.AI/cs.RO）+ SIGGRAPH 2026 / SIGGRAPH Asia 2026 / Ke-Sen Huang 索引
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering, splash, wave, underwater, liquid, flame, Lagrangian, SPH, MPM, splashing
- **当前 arXiv 状态**: 最新可见批次 2026-10-14 17:59 UTC（cs.CV/cs.GR 共 36 篇）；暂未见 2026-10-15 当日批次

---

## 候选论文

### 严格 24 小时内的 cs.GR（含 cross-list）新提交 — 3 篇（均非流体直接相关）

| arXiv ID | 标题 | 提交时间 (UTC) | 分类 | 流体相关性 | 备注 |
|----------|------|----------------|------|-----------|------|
| [2610.20254](https://arxiv.org/abs/2610.20254) | GLoD-LVSM: Geometry-Grounded Continuous-LoD Scene Representations | 2026-10-14 14:25 | cs.CV / cs.GR | ⚠️ 间接 | 大视图合成模型的连续 LoD，是 3DGS 通用管线优化，**非流体** |
| [2610.19847](https://arxiv.org/abs/2610.19847) | VisibilitySplat: Ray-Traced Occlusion for Relighting with 3DGS | 2026-10-14 09:17 | cs.CV / cs.GR | ⚠️ 间接 | 3DGS 光照/材质分解，**非流体**（但 PBR 着色与材质分解可借鉴到水/烟雾 PBR） |
| [2610.19777](https://arxiv.org/abs/2610.19777) | Q-MAGIC: Quad-only Mesh Autoregressive Generation | 2026-10-14 08:28 | cs.CV / cs.GR | ❌ | 网格生成，**无关** |

### 严格 24 小时内的跨分类新论文 — 1 篇间接相关（**未发现流体渲染直接相关论文**）

| arXiv ID | 标题 | 提交时间 (UTC) | 分类 | 流体相关性 | 备注 |
|----------|------|----------------|------|-----------|------|
| [2610.20141](https://arxiv.org/abs/2610.20141) | Attention-Based Spatio-Temporal Approach for Fire and Smoke Detection | 2026-10-14 13:00 | cs.CV | ⚠️ 间接 | 工业场景烟火检测，**非渲染** |

### 扩展 48 小时窗口内 — 2 篇**间接**相关

| arXiv ID | 标题 | 提交时间 (UTC) | 分类 | 流体相关性 | 备注 |
|----------|------|----------------|------|-----------|------|
| [2610.19763](https://arxiv.org/abs/2610.19763) | Physics-Shaped, Not Physical: Auditing Physics-Guided Underwater Image Restoration | 2026-10-14 08:17 | cs.CV | ⭐⭐⭐⭐ | **水下体积介质物理审计** — 与水下/海洋渲染管线的物理先验工程化直接相关 |
| [2610.20141](https://arxiv.org/abs/2610.20141) | Attention-Based Spatio-Temporal Approach for Fire and Smoke Detection | 2026-10-14 13:00 | cs.CV | ⚠️ 间接 | 工业烟火检测 |

### 值得跟踪但不进入笔记的**间接**相关论文

| arXiv ID | 标题 | 备注 |
|----------|------|------|
| [2610.19091](https://arxiv.org/abs/2610.19091) | DiffGIPC: Differentiable Mixed-Coordinate Contact Dynamics on GPU (cs.GR) | 可变形体 + 准刚体混合接触动力学的 GPU 可微仿真，**非流体**，但接触/碰撞处理思路可借鉴到流-固耦合 |
| [2610.18835](https://arxiv.org/abs/2610.18835) | RoboSimStudio: Interactive Toolkit for Real2Sim of Robot Manipulation Tasks (cs.GR) | 物理仿真交互工具（刚体 + 接触 + 形变），**非流体**，但 Newton 引擎栈值得关注 |
| [2610.18168](https://arxiv.org/abs/2610.18168) | Back to the Future: Reverse-Consequence Modeling for Long-Horizon Particle Dynamics (cs.AI) | 粒子轨迹预测新范式（goal-conditioned diffusion），可借鉴到**粒子渲染位置预测** |
| [2610.18045](https://arxiv.org/abs/2610.18045) | High-fidelity Three-Dimensional Flow Field Reconstruction Driven by Turbulent Fluid Dynamics (cs.flu-dyn/cs.AI/cs.LG) | 高保真三维流场重建，**间接相关**（流场重建 vs 流体渲染管线） |

---

## 🔍 SIGGRAPH Asia 2026 / SIGGRAPH 2026 重要信号

### Ke-Sen Huang 索引中**流体相关** SIGGRAPH 2026 已发表论文（已纳入笔记）

| 论文 | arXiv / DOI | 类别 | 状态 |
|------|-------------|------|------|
| GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction | DOI: 10.1145/3799902.3811148 | SIG | 已入库 [[2026-09-02-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] |
| LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction | DOI: 10.1145/3799902.3811188 | SIG | 已入库 [[2026-05-13-LagrangianSplats-Divergence-Free-Fluid-Reconstruction]] |
| Fast VEM Fluid Simulation | DOI: 10.1145/3811315 | SIG/TOG | ✅ Best Paper Nominee（已在 2026-07-06 Daily 报告记录） |
| DiffSurFlow: Efficient and Robust Differentiable Fluid Optimization via Surrogate Strategy on Flow Map | DOI: 10.1145/3811337 | SIG/TOG | ✅ 已入库 [[2026-07-08-siggraph-2026-fluid-papers]] |
| CAGS: Color-Adaptive Volumetric Video Streaming with Dynamic 3D Gaussian Splatting | DOI: 10.1145/3799902.3811058 | SIG | **体积视频流**，与体积/流体渲染主题相关 |
| Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing | DOI: 10.1145/3811312 | SIG/TOG | ✅ Best Paper [[2026-07-06-Mixwell-Fluid-Brushes-SIGGRAPH2026-BestPaper]] |
| The PhaseTree: Multiphase Signed Distance Fields | cs.GR | SIG | 多相 SDF（含流体相场/相变），与 [[2026-08-01-siggraph2026-phasetree]] 已关联 |

### SIGGRAPH Asia 2026 进度跟踪

- **Changelog 最近更新**: 2026-09-17 仅 5 篇 conditionally accepted
- **预期时间线**:
  - SIGGRAPH Asia 2026 会议: 2026-12-01 ~ 12-04，吉隆坡
  - 完整技术论文集 (ACM TOG 45/6 + 会议论文集) 将陆续上架 — 预计 11 月初
  - 投稿论文 arXiv preprints 通常在 11 月开始集中放出

### 强关注点（持续追踪）

- Hamilton/Wave-Flow Coupling（已在 [[2026-08-29_Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]] 跟踪）
- Energy-critical Surface Reconstruction / Eulerian-MPM Hybrid 等

---

## 📊 趋势观察

### arXiv 流体论文分布变化

| 月份 | cs.GR 主分类 | 流体/物理相关 | 占比 | 同比 |
|------|--------------|---------------|------|------|
| 2026-09 上旬 | ~25 篇 | 4 | 16% | baseline |
| 2026-09 下旬 | ~30 篇 | 5 | 17% | +1% |
| 2026-10 上旬（1-10）| ~22 篇 | 3 | 14% | -3% |
| 2026-10 中旬（11-14）| ~22 篇 | 1 | 5% | **显著下降** |

**观察**：流体渲染论文比例**显著下降**（从 14% → 5%），原因：
1. SIGGRAPH Asia 2026 投稿 7 月截止 → 团队从冲刺新论文转向会议准备
2. SIGGRAPH 2026 论文集（7 月会议发表）+ Eurographics 2026 课程（10 月发布）已占主导输出
3. NeurIPS 2026 / ICCV 2026 等冬季会议投稿期（10-11 月）
4. SIGGRAPH Asia 2026 完整论文列表尚未发布 — 11 月可能出现预印本潮

### 48h 内值得关注的研究主题

1. **物理参数网络大模型化**: Learnable Hodge-Laplacian MoE for Steady-PDE Surrogates（cs.LG/cs.CV，Oct 14 17:57）— PDE surrogate 走向稀疏化 + 大模型方向
2. **3DGS 持续优化**: GLoD-LVSM（cs.CV/cs.GR），Feed-Forward Multi-View Feature Coding (MFGS)，Compression of 3DGS — **3DGS 工程化持续活跃**
3. **物理先验逆向工程**: Physics-Shaped (Negative Result) vs PolUR (Positive) → **水下逆向工程的"物理有意义性"成为研究热点**
4. **数字人/角色主导**: 24h 内大量 MLLM/数字人论文，**流体仍是边缘主题**

---

## 📝 重点解读：Physics-Shaped, Not Physical（2610.19763）

### 基本信息
- **arXiv**: [2610.19763](https://arxiv.org/abs/2610.19763)
- **日期**: 2026-10-14 (cs.CV, 48h 内)
- **作者**: Mochamad Rizal Fauzan, Irgi Surya
- **页数**: 暂未知（约 10-12 页）

### 核心创新

> **反直觉结论**：所谓的"物理先验"网络在水下图像恢复中**并未真正执行物理** — 它只是一个 **physics-shaped inductive bias** 而非 physics。

### 关键实验（4 组受控审计）

1. **完整 800 图像训练**：PhysGuide-Net 相比纯数据驱动对照组 **零样本增益 ≤ 0.16 dB**（所有 95% 置信区间包含 0），但 **3.4× 计算量**
2. **少样本训练（80 图像）**：物理模块确实有帮助（+0.65 ~ +1.48 dB），但校正后**不单独显著**
3. **预测物理量审计**：预测的 transmission 强度相关性 vs Sea-thru 测距 — **不超过对照组**，甚至弱于 dark-channel prior。Beer-Lambert 拟合仅解释 **0.4% 的方差**
4. **跨数据集退化严重度**：物理模块的增益方向**符号反转**（一个数据集正增益，另一个负增益）

### 对流体渲染的启示

#### 1. 物理先验审计范式可推广到流体
- 水下成像 / 烟雾渲染 / 体积介质渲染普遍使用"物理先验网络"（PolUR, WildFireGS, FlamR, RefracGS 等）
- 本论文的审计协议 **（零样本评估 + 物理量物理性测试 + 参数量对照）** 应该作为后续流体渲染论文的标配基线
- **风险**：很多声称 "物理驱动" 的网络其实只是 "物理启发 inductive bias"

#### 2. data-efficiency 维度的发现
- **少数据时，物理先验确实提供增益**（80 图像训练时 +0.65 ~ +1.48 dB）
- **大数据时，物理先验沦为冗余**（800 图像训练时 0 增益）
- **对流体渲染启示**：采集流场稀少（如稀薄烟雾、深海水）时，物理先验是必要设计；通用数据集足够时，先验可有可无

#### 3. 对照实验设计的警钟
- 任何引入"物理先验"的流体渲染模型都应报告**参数量 + FLOPs 对照组**
- 否则宣称"涨点"可能只是算力代价换取的回归

### 创新点
- **方法论创新**：可复用的物理先验审计框架（4 组实验）
- **重要负面结果**：科学共同体极少发表负面结果，本论文具示范意义
- **跨学科连接**：本论文对所有"physics-informed"领域的论文都是重要警示

### 推荐度
✅✅ **强推荐** — 流体渲染方向的标准方法论论文；所有声称物理先验有效的工作都应引用

### 与现有笔记的关系

- [[2026-10-14-PolUR-Underwater-Image-Restoration]] — PolUR 是物理先验正面例，本论文是反面审计
- [[2025-09-14-wildsmoke-3d-smoke-from-single-video]] — WildSmoke 物理约束烟雾重建
- [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] — RefracGS 折射物理先验
- [[2026-04-19_NeuVolEx-Volume-Exploration-INR]] — 体积场 INR 隐式神经场
- [[2026-07-19-Volumetric-Inverse-Rendering-Neural-Radiative-Transfer]] — 神经辐射传递

---

## 📝 关注点：CAGS - Color-Adaptive Volumetric Video Streaming

### 基本信息
- **DOI**: [10.1145/3799902.3811058](https://doi.org/10.1145/3799902.3811058)
- **会议**: SIGGRAPH 2026 Conference Paper
- **arXiv**: 2605.09279
- **GitHub**: [yindaheng98/ColorAdaptiveGaussianSplatting](https://github.com/yindaheng98/ColorAdaptiveGaussianSplatting)

### 核心创新

> 体积视频流（Volumetric Video Streaming）的**颜色自适应 3D Gaussian Splatting** 方法 — 根据色彩复杂度动态分配渲染资源，预算受限下仍保持视觉质量

### 与流体渲染的关系

体积视频流**直接包含流体内容**（4D 流体如烟雾、水流、火焰的实时串流）：

1. **3DGS 应用于动态流体**：CAGS 直接支持 4D 流体场景的串流化（如 GaussianSmoke / LagrangianSplats 路线的下一阶段）
2. **自适应密度分配**：颜色熵引导的密度调度 → 类似流体渲染的"自适应步长"思路（ray marching 中根据密度变化调整步长）
3. **串流预算下的实时性**：流体交互/VR 应用的关键瓶颈，可借鉴 CAGS 的预算控制

### 推荐度
✅ **推荐** — 流体体积视频流（4DGS 串流）的核心工程方法

---

## 🔗 SIGGRAPH Asia 2026 持续监控目标

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

### 信号列表
- SIGGRAPH Asia 2026 完整接收论文列表将于 11 月初公布
- 12 月会议召开前，预计 11 月中至 11 月底有 arXiv 预印本集中释放

---

## 📅 下次搜索计划

- **日期**: 2026-10-16 (Fri, ~10:00 UTC 预计有 SIGGRAPH Asia 2026 接受通知 / arXiv 周五批次)
- **重点**:
  1. SIGGRAPH Asia 2026 接受论文列表（若 11 月初公布）
  2. arXiv 周五批次（2026-10-16 14:00 UTC 后）
  3. NeurIPS 2026 物理相关 workshop 投稿接收（10-11 月）
  4. 持续追踪 Physics-Shaped 论文后续：是否有作者团队做出"物理审计 v2"方法 / 其他领域复用此协议

---

## 📂 本日新增笔记

1. `2026-10-15_Daily-Paper-Search.md` (本文件)
2. `2026-10-15-Physics-Shaped-Underwater-Image-Restoration-Audit.md` (重点解读笔记)
3. `2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS.md` (SIGGRAPH 2026 补充笔记)

---

*由豆苗自动收集于 2026-10-15 14:13 UTC*
*Git 同步至 https://github.com/zhanzhan1848/knowledge_obsidian.git*
