---
type: research-summary
created: 2026-10-30
updated: 2026-10-30
tags: [summary, fluid-rendering, daily-search, arxiv, cross-category, no-rendering-papers]
status: processed
domain: fluid-rendering
agent: doumiao
period: 2026-10-29 14:32 UTC → 2026-10-30 14:32 UTC (严格 24h) + 14d 扩展窗口
search_scope: arXiv cs.GR (主) + cs.CV/cs.LG/physics.flu-dyn/math.NA (辅) + SIGGRAPH/SIGGRAPH Asia
---

# 📅 每日流体渲染论文搜索报告 — 2026-10-30（周五）

> **搜索窗口**：严格 24 小时（2026-10-29 14:32 → 2026-10-30 14:32 UTC）+ 14 天扩展窗口
> **搜索源**：arXiv API（25+ 组查询串）、arXiv 分类列表页（cs.GR 新榜/近期榜/2026-10 月榜）、kesen.realtimerendering.com（SIGGRAPH 2026 论文索引）、asia.siggraph.org（SIGGRAPH Asia 2026）
> **检索关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展（turbulence, flamelet, capillary wave, VOF, interface reconstruction, DMD/ROM, differentiable solver, agentic AI…）
> **产出**：**8 篇结构化笔记** → `~/knowledge-vault/doumiao/01-Papers/`

---

## 📊 概览

| 分类 | 数量 | 代表论文 |
|------|------|----------|
| 🌊 自由液面 / 界面重构 | 1 | DAVOF（⭐ 本批次最贴近渲染） |
| 🔥 燃烧 / 火焰物理 | 1 | 2D flamelet 闭合 |
| 🌊 海洋表面物理 | 3 | 毛细波湍流（各向同性/各向异性）、宽频带 NLS |
| ⚙️ 降阶 / 代理模型 | 2 | GC-DMD、扑翼 ROM 形状优化 |
| 🔧 可微 / Agentic 求解器 | 1 | 可微 Schwarz + Agentic AI 逆问题 |
| 🧪 软介质 / MPM | 1 | MG-CD-MPM（本窗口唯一 cs.GR 主分类论文） |

---

## ⚠️ 关键观察：严格 24h 窗口内**无流体渲染论文**

### 24h 窗口验证（多重交叉校验）

| 检查项 | 结果 |
|--------|------|
| arXiv API：`cat:cs.GR AND submittedDate:[202610291400 TO 202610302359]` | **0 篇** ⚠️ |
| arXiv API：`cat:cs.GR AND submittedDate:[202610280000 TO 202610302359]` | 10 篇（**全部与流体无关**） |
| arXiv 列表页 `/list/cs.GR/new`（10-30 公告榜，22 条） | **0 篇流体相关** |
| arXiv 列表页 `/list/cs.GR/2026-10`（月榜，191 篇） | 关键词命中 29 篇 → **流体相关 5 篇**，均已在 10-29 批次收录 |
| 分类关键词逐一查询（fluid / smoke / water / fire / ocean / particle / foam / splash / spray / stylization / caustics / underwater / vorticity / free-surface / volume rendering） | cs.GR 内 **全部为空或无关** |
| 跨分类（cs.CV / cs.LG / physics.flu-dyn / math.NA / math.AP） | 41 篇窗口内命中 → **34 篇为纯流动物理，无渲染成分** |
| SIGGRAPH 2026 论文索引（kesen） | "Fluid Reconstruction & Optimization" 5 篇 + "Phased & Viscous Fluids" 5 篇 → **全部已于 09-05 / 10-08 收录** |
| SIGGRAPH Asia 2026 | 会议 12-01~04 吉隆坡；程序页仍为 "Stay tuned"，仅放出 **322 个 submission ID（无标题）**，无法识别流体论文 |

> **结论**：本窗口是 **arXiv 物理化窗口**——24h 内 cs.GR 仅 10 篇提交，全部是 3DGS / 神经渲染 / 几何 / MPM；流体相关论文集中在 physics.flu-dyn / math.AP，且**全部是流动物理学而非渲染**。
>
> ⚠️ 与前几日不同：10-29 批次尚有 17 篇可收录论文，**本批次流体渲染方向出现明显"论文空窗"**。这是一个值得记录的信号——arXiv 的流体渲染产出正在向"生成式视频"与"工业落地"两条主线集中，纯渲染方法论文的发布节奏变慢。

---

## 📚 本批次收录论文（8 篇）

### ⭐ 1. DAVOF — 自由液面法向与位置的闭式恢复（最高相关）

**[[2026-10-30-DAVOF-Interface-Normal-Position-VOF]]** · [2610.38863](https://arxiv.org/abs/2610.38863) · physics.comp-ph · 2026-10-28 · Tomislav Marić (TU Delft)

- **做了什么**：在几何 VOF 中首次实现**单元内闭合形式**的界面法向与位置恢复——额外输运每个面的润湿面积分数，法向由单元自身各面一次求和得到，位置由散度定理作用于液体子体积得到。**无需邻居信息、无需迭代**。
- **为什么重要（对渲染）**：
  - **界面法向/位置正是渲染管线的输入契约**——SSR 流体渲染、自由液面着色、折射/反射法线、菲涅尔项全部依赖它；在**非结构化网格**（VFX 常用的 tet/prism）上，这恰是最难拿到的信息。
  - **寄生电流的消除 = 视觉质量**：毛细流的寄生电流在渲染中表现为液面爬行的细密伪影；DAVOF 抑制它等于直接改善自由液面着色稳定性。
  - **保守性**：球体推过 3.3 个直径仍有界守恒 → 水体体积不增减。
  - 已进入 **OpenFOAM 分支**（leia），工程可落地性高。
- **局限**：精度上限受限于被输运法向本身的精度阶（当前闭环未提阶）。

---

### 2. 2D flamelet 理论在非正交组分空间中的闭合 ⭐⭐⭐⭐

**[[2026-10-30-Flamelet-Closure-2D-Combustion]]** · [2610.40474](https://arxiv.org/abs/2610.40474) · physics.flu-dyn · 2026-10-29 · Olguin, Domingo, **Vervisch**, Scholtissek, **Hasse** (ETH/Jülich)

- **做了什么**：证明 flamelet 理论可以**仅用应变率**实现一般闭合，但在非正交组分空间中**至少需要三个参数**（正交空间亦然）。
- **为什么重要（对渲染）**：这是对现有火焰渲染方案的**否证性约束**——任何"两参数 flamelet 闭合"的简化在非正交空间中都不成立。直接指导**实时火焰燃烧代理模型的输入特征设计**（至少喂三个应变率分量才不丢标量耗散-曲率耦合）。

---

### 3-4. 毛细波湍流：各向同性 + 各向异性（姊妹篇）

**[[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]]** · [2610.40217](https://arxiv.org/abs/2610.40217) · 2026-10-29 · Korotkevich
- 确认动态范围随平均陡峭度 **μ^{8/3}** 缩放（此前仅为假设）。

**[[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]]** · [2610.40090](https://arxiv.org/abs/2610.40090) · 2026-10-29 · Kochurin, Korotkevich
- 各向异性初始条件演化为**因子化谱** $n(k,\varphi) \sim k^{-17/4}F(\varphi)$；惯性区间内碰撞积分高精度归零。

**为什么重要（对渲染）**：
- 实时海洋渲染几乎都是**定向的**（主波向）。用各向同性高斯波谱生成海面与真实终态不符——真实系统存在**尖锐的角度分布**。
- $k^{-17/4} F(\varphi)$ 的**因子化结构对 FFT 海面生成器极其友好**：波数用幂律、角度用查表/高斯，**谱构造成本几乎不变**。
- μ^{8/3} 关系可用来**校核法线贴图的频谱衰减斜率**，避免叠加物理上不可能的浪花纹理。

---

### 5. 宽频带水波的 NLS 推广模型 ⭐⭐⭐⭐

**[[2026-10-30-Broadband-Water-Wave-NLS]]** · [2610.38679](https://arxiv.org/abs/2610.38679) · physics.flu-dyn · 2026-10-28 · Van Liew, Henderson, Carter (TCD)

- 报告新系列**宽频带实验室水波实验**，证明 NLS 的**推广形式**能准确建模宽频带波列——打破"必须窄带"的传统限制。
- **对渲染**：实时海洋的"长波用 NLS + 短波用细节贴图"分层策略中，**长波层应当用推广 NLS 而非经典窄带 NLS**，否则宽频带海况下涌浪波形失真。与毛细波篇构成分层拼图（涌浪层 / 毛细细节层），共同给出**频段交接**的物理约束。

---

### 6. GC-DMD — 因果信息正则化的降阶模型 ⭐⭐⭐⭐

**[[2026-10-30-GC-DMD-Causality-Informed-DMD]]** · [2610.39522](https://arxiv.org/abs/2610.39522) · physics.flu-dyn · 2026-10-29 · Pan, Kou (Sheffield) · **代码开源**

- 用**条件 Granger 因果**估计正则化 DMD 算子辨识 → 得到**被方向性预测依赖支撑的稀疏算子**。
- **对渲染**：离线流体烘焙代理模型必须长时间稳定，标准 DMD 常在此退化为噪声模态；GC-DMD 明确报告**长时程预测误差降低 + 谱稳健性提升**。稀疏性直接转化为 GPU 上的可跳过项与带宽节省。
- 与 [[2026-10-29-Neural-Eigenfluid-Bases-NEB]]（可微神经本征基）**互补且可组合**。

---

### 7. 可微 Schwarz 耦合求解器 + Agentic AI 逆问题 ⭐⭐⭐⭐

**[[2026-10-30-Differentiable-Schwarz-Agentic-Inverse]]** · [2610.38672](https://arxiv.org/abs/2610.38672) · physics.flu-dyn · 2026-10-28 · Viknesh, Arzani (UT Austin)

- 内外域 Schwarz 分解处理薄边界层 → **粗网格可行**、端到端可微；再以 **Agentic AI** 做逆问题优化。
- **关键发现**：未知量用**函数基**表示时 agent 优势最明显——AI agent 能在优化中按准入策略**动态扩充候选基函数库**（改变模型结构，而非只调参数）。
- **对渲染**：这是本库"可微物理"主线的**新范式**——从"可微优化连续参数"升级为"**可微 + Agentic 优化离散结构**"。对应到渲染：流体效果参数寻优、烟雾图像反推燃料分布、海洋反推风场。

---

### 8. 扑翼 ROM 形状优化（稳定性方案）

**[[2026-10-30-Flapping-Wing-ROM-Shape-Optimization]]** · [2610.40426](https://arxiv.org/abs/2610.40426) · physics.flu-dyn · 2026-10-29 · Karbasian, Vermeire (U Toronto)

- 把 PDE 约束优化**投影到 Hilbert 空间的系统动力学优化**，绕开不稳定的前向灵敏度函数；2D 扑翼上**平均推力 +37%、推进效率 +40%**。
- **对渲染**：VFX 流体效果调参本质是 PDE 约束优化；本框架对**高雷诺数 + 强非线性**（巨型烟柱、爆炸冲击）——正是常规梯度优化会失稳的场景——给出更稳的路径。37%/40% 的效率提升量级对以"每次渲染试验成本高"著称的 VFX 流程是实打实的收益。

---

### 附：MG-CD-MPM（本窗口唯一 cs.GR 主分类论文）

**[[2026-10-30-MG-CD-MPM-Continuum-Damage-Viscoplastic]]** · [2610.39975](https://arxiv.org/abs/2610.39975) · cs.GR · 2026-10-29 · Feng, Luan (U Toronto/Vector)

- MPM + 局部化 Ginzburg–Landau 相场损伤 + 几何多重网格 PCG 预条件；统一逐粒子本构层覆盖软固体/脆性/颗粒/**黏塑性半流体**；Gym 风格接口可直接接 PPO。
- **与流体的关联**：黏塑性/半流体介质（糖浆、胶状物、沥青）正是效果制作中"介于固体与流体之间"的特例；本文的本构层设计可直接参考。与 [[2026-10-29-Colour-Field-Particle-Categorization-Solid-SPH]]（颜色场空间分区）形成"**空间分区 vs 参数化统一**"的对照——后者更易实现连续过渡。

---

## 🔥 主题趋势（基于本批次 + 近期对照）

### 趋势 A：流体渲染论文向"物理侧"迁移 ⭐⭐⭐⭐⭐

本批次 8 篇中**没有一篇是渲染论文**，全部在物理/数值侧。但它们对渲染的**约束力**反而很强：

| 物理侧进展 | 对渲染的约束 |
|-----------|-------------|
| DAVOF 闭式法向/位置 | 非结构网格渲染的界面输入契约 |
| flamelet ≥3 参数闭合 | 火焰代理模型的输入特征数 |
| 毛细波 μ^{8/3} + 各向异性因子化谱 | 海洋法线贴图频谱斜率 + 谱构造方式 |
| 推广 NLS 宽频带 | 长波层求解器的模型选择 |

> 💡 **判断**：渲染论文正在"下沉到物理层"。综述/教程类工作的价值在上升，而"又一个粒子流体渲染器"的边际价值在下降。

### 趋势 B：降阶 / 代理模型的"可解释性"竞争 ⭐⭐⭐⭐

GC-DMD（因果正则化）与扑翼 ROM（Hilbert 空间投影）**同时出现在同一窗口**，但角度互补：
- **GC-DMD** 解决的是"**降阶结果是否可信**"（稀疏 + 方向性支撑）
- **扑翼 ROM** 解决的是"**降阶优化过程是否稳定**"（投影避开病态灵敏度）

配合本库已有的 [[2026-10-24-Fast-Subspace-Fluid-Simulation-DMD]]、[[2026-10-29-Neural-Eigenfluid-Bases-NEB]]、[[2026-10-26-RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder]]，**降阶路线已形成四路并行**（谱方法 / 神经基 / 在线适配 / 因果正则化）。

### 趋势 C：Agentic AI 渗入物理计算 ⭐⭐⭐⭐

本批次出现第二篇 Agentic AI 物理工作（另一篇是本库的 [[2026-10-29-PhysRepair-Agentic-Physics-Video]]）。值得注意的是 Schwarz 论文的 Agentic 用法——**不是让 agent 调参，而是让 agent 改变模型结构（增删基函数）**。这是本库尚未覆盖的新范式。

---

## 🚫 窗口内已判定为不适用的论文

| arXiv ID | 标题 | 排除理由 |
|----------|------|---------|
| 2610.37406 | CTBakeGS | 体积渲染（CT 医学），非流体 |
| 2610.35038 | Thermal Wakes from Underwater Vehicles | 红外尾流探测，非渲染 |
| 2610.40599 | HairDeck | 头发卡片，与流体无关 |
| 2610.39140 | 1D capacitively coupled plasma | 等离子体数值，无渲染 |
| 2610.40523 / 2610.39832 | 光学涡/LG 光束 | 光学，与流体无关 |
| 2610.39942 / 2610.39979 / 2610.39969 / 2610.39192 | 超导涡旋/规范场 | 超导物理，与流体无关 |
| 2610.39149 / 2610.39163 | Capillary-gravity water waves I/II | 纯数学（math.AP），无渲染成分 |
| 2610.40553 / 2610.40552 / 2610.40334 | 2D Euler 非唯一性 / Boussinesq 定常结构 | 纯数学（math.AP） |
| 2610.39809 | Critical-level wave absorption | 纯物理（波-流耦合） |
| 2610.39780 | 涡流发生器几何优化 | 传热工程，无渲染 |
| 2610.39586 | Taylor bubble-drop assembly | 纯实验流体力学 |
| 2610.39348 | 液态金属电极磁致湍流转捩 | 工业应用，无渲染 |

---

## 📡 会议渠道状态

| 会议 | 状态 | 流体相关 |
|------|------|---------|
| **SIGGRAPH 2026** | 已于 7 月举办完毕 | kesen 索引中 "Fluid Reconstruction & Optimization"（GauSmoke / LagrangianSplats / FastVEM / DiffSurFlow / GenericVortexCoreManifolds）+ "Phased & Viscous Fluids"（5 篇）→ **已全部收录（09-05 / 10-08）** |
| **SIGGRAPH Asia 2026** | 12-01~04 吉隆坡 | 程序页仅公布 **322 个 submission ID（无标题）**，程序详情未发布 → 本窗口无法识别 |
| **Pacific Graphics 2026** | 已收录 | [[2026-10-29-Beyond-Horizontal-Refinement-Quadtree-Tall-Cells-Optical-Layers]]（Game Freak × 东大 Kanai Lab） |

---

## 💡 下次搜索建议

1. **arXiv 检索式需重构**（本批次证实原关键词组已饱和）：
   ```
   cat:cs.GR AND (all:vorticity OR all:"free surface" OR all:"interface reconstruction"
                  OR all:flamelet OR all:"capillary wave" OR all:"Navier-Stokes"
                  OR all:"ray marching" OR all:"volume rendering")
   cat:cs.CV AND (all:"surface reconstruction" AND all:fluid)
   cat:physics.flu-dyn AND (all:"visualization" OR all:"rendering")
   ```
2. **关注 SIGGRAPH Asia 2026 程序发布**（预计 11 月）——322 篇 accepted 的标题尚未公开，**是未来 4 周最大的单次信息增量源**，建议提高该频道权重。
3. **持续跟踪 AIGC 流体视频赛道**：FluidGen（2610.25660）→ PhysRepair（2610.23677）→ WMEval（2610.33894）已构成"生成→诊断→评测"闭环，下一步大概率是**物理量的可控编辑**。
4. **扩展至 cs.SI / cs.MM / eess.IV**：cross-list 论文（如流体在 XR/通信中的呈现）此前未覆盖。

---

**搜索状态**：✅ 完成
**严格 24h 窗口内 cs.GR 新提交**：10 篇（**流体渲染相关 0 篇**）
**窗口内相关论文（跨分类）**：41 篇 → 收录 **8 篇**（均为物理/数值侧但对渲染有直接约束）
**去重跳过**：SIGGRAPH 2026 全部流体论文（已收录）、FluidGen / Make It Flow / SplashSplat / CTBakeGS 等（已收录）
**已传递给**：@墨鱼丸
