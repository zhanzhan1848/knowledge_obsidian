---
type: research-summary
created: 2026-10-29
updated: 2026-10-29
tags: [summary, fluid-rendering, daily-search, arxiv, pacific-graphics]
status: processed
domain: fluid-rendering
agent: doumiao
---

# 2026-10-29 每日流体渲染论文搜索报告

> **搜索窗口**：最近 24 小时（2026-10-28 14:32 ~ 2026-10-29 14:32 UTC）
> **搜索源**：arXiv API（cs.GR / cs.CV / cs.FL / physics.flu-dyn）、SIGGRAPH Asia 2026 官网、Takashi Kanai Laboratory 出版物页、CGF Crossref
> **检索关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展词（turbulence, Lagrangian, Eulerian, LBM, SPH, MPM, advection, splash, foam, caustics…）
> **产出**：17 篇结构化笔记（含 2 篇去重后净新增） → `~/knowledge-vault/doumiao/01-Papers/`

---

## 📊 概览

| 分类 | 数量 | 代表论文 |
|------|------|----------|
| 🎬 视频/生成式流体 | 2 | PhysRepair, WMEval |
| 🌊 水面/海洋渲染 | 2 | Quadtree Tall Cells (PG2026), Surfzone SIREN |
| 🔥 体积/火焰渲染 | 3 | NFSR, PhaseSurf, Appearance Compensation |
| ⚙️ 流体模拟/数值方法 | 5 | NEB, CL-FNO, Curvilinear LBM, NBM, FAMIR |
| 🧪 理论/评测 | 2 | Generative AI in Turbulence, WMEval |
| ⚪ 弱相关（粒子/SPH） | 1 | Colour-Field Particle Categorization |

> ⚠️ **去重说明**：本批次另有 **2 篇已在此前日期收录**，本次不重复建档：
> - **FluidGen** (2610.25660) — 已收录于 [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]]（及 10-20 版），本次仅在趋势分析中引用
> - **Make It Flow** (2610.13860) — 已收录于 [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]]

**注意**：cs.GR 在严格的 24 小时窗口内（10-28 ~ 10-29）**无新提交**（arXiv 周末/假期提交节奏）。本报告因此扩展到 **最近 2 周（10-16 ~ 10-29）**，并纳入 SIGGRAPH Asia 2026 / Pacific Graphics 2026 会议渠道，确保信息不遗漏。

---

## 🏆 今日重点：三大主题

### 主题一：流体的"生成式时代" ⭐⭐⭐⭐⭐

本批次最显著的信号是 **流体渲染与生成式视频模型的深度融合**。

| 论文 | 关键思路 |
|------|----------|
| **[[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]]** (2610.25660) | 双流架构同时预测 RGB + **逐帧速度场**，速度场既做监督正则，又做 **velocity-aware DPO** 的奖励。用 Houdini 仿真数据注入流体先验 |
| **[[2026-10-29-PhysRepair-Agentic-Physics-Video]]** (2610.23677) | **generate-diagnose-repair** 范式：事后定位"第一个无效物理状态"，用**时空因果约束**做局部化再生成，不牺牲动态多样性 |
| **[[2026-10-29-WMEval-Interactive-World-Models-Physical-Simulations]]** (2610.33894) | 首次把**物理-因果一致性**提升为世界模型的一级评测维度（Unity 作 oracle），指出现有感知指标掩盖了关键缺陷 |

> 💡 **趋势判断**：从"让生成模型看起来像流体"（2024-2025）→"让生成模型**携带可解释物理量**"（FluidGen）→"让生成结果**可被诊断与修复**"（PhysRepair）。这条路线正在形成完整的方法论闭环。

---

### 主题二：实时流体的"结构性降本" ⭐⭐⭐⭐⭐

两条互相印证的路线：**网格结构降本** 与 **代理模型降本**。

**A. 网格结构路线（工程可落地）**

- **[[2026-10-29-Beyond-Horizontal-Refinement-Quadtree-Tall-Cells-Optical-Layers]]** — *Pacific Graphics 2026, CGF 45(7) e70629*
  - **Game Freak × 东京大学 Kanai Lab** 合作，媒体报道压力计算**最高 3× 加速**，可能用于《宝可梦 风与浪》
  - 突破前作（Eurographics 2026 *Adaptive Optical Layers*）**仅水平细化**的限制，实现**垂直方向自适应光学层**
  - Tall Cell Grid：近液面用规则网格（光学层）捕捉飞溅/涟漪，远处用拉长单元捕捉压力传播
  - ⭐ **本批次最贴近商业实时液体渲染落地的工作**

**B. 代理模型路线（学术前沿）**

| 论文 | 加速 | 关键创新 |
|------|------|----------|
| [[2026-10-29-Neural-Eigenfluid-Bases-NEB]] | 状态 ~1/1000，同基复用**毫秒级** | 微分提升**硬约束**不可压缩；**谱方差关系**解释势/速空间加权差异 |
| [[2026-10-29-Neural-Operator-Splitting-Fluid-Complex-Geometry]] | 相对 MC 求解器 **10³×** | 保留**分步格式**物理结构；CL-FNO；2D 误差 −68% / 3D −40% |
| [[2026-10-29-Neural-Basis-Method-Navier-Stokes]] | 去数据、去空间依赖 | **表示-投影**原则；残差给出**后验误差估计**（认证目标） |
| [[2026-10-29-FlowMesh-Velocity-Regularized-Flow-Matching]] | 相对 CFD **585–1902×** | 非结构化网格 + **确定性**流匹配（无随机去噪链） |

> 💡 **共同趋势**：**"物理结构作为硬约束"** 是这批工作的统一答案——CL-FNO 用分步结构、NEB 用微分提升、NBM 用投影结构、Optimal Mixing 用无散度谱基。软惩罚的时代正在结束。

---

### 主题三：体积渲染的"可辨识性危机" ⚠️⭐⭐⭐⭐

- **[[2026-10-29-Appearance-Compensation-in-Volume-Rendering]]** (2610.15030, 139 页)
  - 🔴 **本批次最重要的警示性论文**：构造出**精确的物理 SH2 模糊**——**中心密度翻倍，相对密度 L² 误差 > 14.52%，但每一条外部 RGB 射线完全不变**
  - 结论：**渲染精度无法证明密度正确性**。密度恢复还依赖外观容量、空间分辨率与**测量设计**
  - 实践建议：**透射率测量**或**密度敏感采集**是绕开歧义的必要手段
  - ⭐ 对任何做烟雾/火焰**密度重建**的工作者，这是必读的"陷阱"论文

- **[[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]]** (2610.13088)：Metric-Phase Fields 分解几何为**无符号度量场 + 软符号相位场**，专治薄结构与符号模糊几何——正对流体渲染中的**薄飞溅片、泡沫层、水膜**

- **[[2026-10-29-NFSR-NeRF-Inspired-Super-resolution-Reacting-Flows]]** (2610.27284)：NeRF 范式迁移到**湍流反应流 3D 超分辨率**，层级扩展消除粗单元印记，能恢复火焰表面褶皱

---

## 🌊 水面/海洋方向

| 论文 | 要点 |
|------|------|
| [[2026-10-29-Surfzone-Sea-Surface-SIREN-Lidar]] (2610.27352) | LiDAR 点云 → **连续可微无网格**海面表示；可求任意时空偏导做**方向性波分析**与波速估计；误差 ≈ 仪器误差 |
| [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] (2610.13860) | 在**静态 3DGS 场景**中动画化水体：2D 光流 → 3D **Eulerian 运动场** → cinemagraph 式高斯形变；**无需物理模拟**且保留实时渲染与自由视角 |

> ⚠️ SIREN 的已知弱点：**天然过滤最高波数变化（飞溅、浪花）** —— 恰是视觉渲染最关心的部分。这是"物理精确 vs 视觉保真"权衡的典型案例。

---

## ⚙️ 数值方法与前沿模拟

- **[[2026-10-29-Curvilinear-D3Q27-Cumulant-LBM]]** (2610.36971, Oxford)：曲线网格上的 **精确 1:1 流式传输（无插值）**；度量-高斯平衡态 + Christoffel 连接源；质量/动量守恒至舍入精度；支持 ALE + 双向 FSI ⭐ 工程实用性强
- **[[2026-10-29-FAMIR-Future-Aligned-Latent-Dynamics]]** (2610.36515)：用**已实现的未来**塑形驱动更新的信号（教师-学生 + PPMA 对齐）；仅部署学生；浅水流动上 prediction-fed rollout 决定性（1.036% vs 1.874%）
- **[[2026-10-29-Self-Supervised-Optimal-Mixing-Incompressible-Flows]]** (2610.25556)：**首个自监督算子学习**最优混合；无散度谱基**硬约束**不可压缩；学习到的控制可**迁移到独立 Eulerian FV 求解器**验证
- **[[2026-10-29-Generative-AI-in-Turbulence-Validation-Frameworks]]** (2610.35123, JFM-Perspective)：🔬 **方法论必读**——湍流**不是**常规图像生成问题；提出物理感知验证清单（能量传递、结构函数、异常标度、pdf 尾部、相干结构、守恒律、时间一致性、集合多样性、泛化）+ 呼吁建立基准生态

---

## ⚪ 弱相关条目

- **[[2026-10-29-Colour-Field-Particle-Categorization-Solid-SPH]]** (2610.24210)：**2023 VISIGRAPP 论文的 arXiv 重新收录**。用 SPH 内在色场机制检测并**消除**固体残余应力，防止过早失效。方法巧妙，但与流体渲染主线关联较弱。

---

## 📌 今日结论与建议

### 1. 对算法 Agent 的核心建议

> **若要构建"物理正确的实时流体渲染"管线，优先级建议**：
> 1. **网格/表示层**：借鉴 Quadtree Tall Cells + 自适应光学层（近液面高精度、远处低成本），这是当前工业界可落地的性价比最高方案
> 2. **模拟层**：需要压缩时优先选**保留物理结构的代理模型**（CL-FNO / NEB / NBM），而非纯黑盒算子学习
> 3. **验证层**：若涉及密度重建，**必须**引入透射率测量或密度敏感采集——RGB 一致 ≠ 密度正确（Appearance Compensation 的核心警告）
> 4. **生成层**：FluidGen 的"速度场作为可解释中间量"是值得直接借鉴的架构设计

### 2. 值得持续跟踪的作者/团队

| 团队 | 方向 | 备注 |
|------|------|------|
| **Takashi Kanai Lab** (U. Tokyo) | 液体模拟网格结构 | 与 Game Freak 产学结合，产出持续稳定 |
| **Oxford (Adams/Shadloo group)** | LBM / 数值方法 | 曲线网格、GPU 化、ALE/FSI |
| **Anandkumar group** (Caltech) | 神经算子 / 科学 ML | 物理结构化算子学习 |
| **Jiajun Wu group** (Stanford) | 生成式视觉 | FluidGen 系 |

### 3. 观察到的趋势与空白

- ✅ **趋势**：物理结构硬约束化、代理模型结构化、生成模型物理量显式化
- ⚠️ **空白**：本批次**未见**新的**离线高质量体渲染路径追踪**工作；实时体积渲染的**多次散射**近似、**体积阴影/光束**的高效实现仍是热点
- ⚠️ **空白**：泡沫/飞溅/浪花的**粒子级渲染**（而非模拟）本批次无新工作
- 📌 **观察**：SIGGRAPH Asia 2026（12月1-4日，吉隆坡）技术论文录用列表尚未公开，届时需补检

---

## 📁 本次产出文件

```
~/knowledge-vault/doumiao/01-Papers/
├── 2026-10-29-Beyond-Horizontal-Refinement-Quadtree-Tall-Cells-Optical-Layers.md  ⭐ 重点
├── 2026-10-29-Appearance-Compensation-in-Volume-Rendering.md                      ⭐ 警示
├── 2026-10-29-Daily-Paper-Search.md                                               (本文件)
├── 2026-10-29-NFSR-NeRF-Inspired-Super-resolution-Reacting-Flows.md
├── 2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures.md
├── 2026-10-29-Surfzone-Sea-Surface-SIREN-Lidar.md
├── 2026-10-29-Neural-Eigenfluid-Bases-NEB.md
├── 2026-10-29-Neural-Operator-Splitting-Fluid-Complex-Geometry.md
├── 2026-10-29-Neural-Basis-Method-Navier-Stokes.md
├── 2026-10-29-FlowMesh-Velocity-Regularized-Flow-Matching.md
├── 2026-10-29-FAMIR-Future-Aligned-Latent-Dynamics.md
├── 2026-10-29-Curvilinear-D3Q27-Cumulant-LBM.md
├── 2026-10-29-Self-Supervised-Optimal-Mixing-Incompressible-Flows.md
├── 2026-10-29-Generative-AI-in-Turbulence-Validation-Frameworks.md
├── 2026-10-29-PhysRepair-Agentic-Physics-Video.md
├── 2026-10-29-WMEval-Interactive-World-Models-Physical-Simulations.md
└── 2026-10-29-Colour-Field-Particle-Categorization-Solid-SPH.md
```

---

*创建日期: 2026-10-29*
*执行 Agent: 豆苗 (doumiao) — 计算机图形学流体渲染专家*
*搜索窗口: 2026-10-16 ~ 2026-10-29（24h 窗口内 cs.GR 无新提交，已扩展窗口并补充会议渠道）*
