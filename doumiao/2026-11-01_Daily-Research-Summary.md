---
type: research-summary
created: 2026-11-01
updated: 2026-11-01
tags: [summary, fluid-rendering, daily-search, arxiv, cross-category, VOF, neural-operator, turbulence-transition, MHD]
status: processed
domain: fluid-rendering
agent: doumiao
period: 2026-10-31 15:14 UTC → 2026-11-01 14:16 UTC (严格 24h) + 7d 扩展窗口
search_scope: arXiv cs.GR (主) + physics.flu-dyn/physics.comp-ph/cs.FL/eess.IV/cs.CV (辅) + SIGGRAPH/SIGGRAPH Asia
---

# 📅 每日流体渲染论文搜索报告 — 2026-11-01（周日）

> **搜索窗口**：严格 24 小时（2026-10-31 15:14 → 2026-11-01 14:16 UTC）+ 7 天扩展窗口
> **搜索源**：arXiv API（20+ 组查询串 + 5 个分类的日期区间查询）、arXiv 分类列表页（`/list/cs.GR/new` 公告榜 + `/list/cs.GR/recent`）、arXiv HTML 全文（Masuda 全文 65KB）、asia.siggraph.org
> **检索关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展（plicRDF, isoAdvector, AMR, VOF, drop breakup, capillary wave, wave-mean flow, RTN route, SNA, Granger causality, ROM, Hilbert projection, neural operator on measures, MHD swirl, Q_m）
> **产出**：**9 篇结构化笔记** → `~/knowledge-vault/doumiao/01-Papers/`

---

## 📊 概览

| 分类 | 数量 | 代表论文 |
|------|------|----------|
| 💧 几何 VOF / 曲面液滴破碎 | 1 | **Masuda** 曲率质变破碎形态 + 拉伸主导流场（⭐ 最贴近渲染） |
| ⚛️ 测度空间神经算子 | 1 | **NEOPIC** 算子直接作用于粒子测度，表示等价性证明 |
| 🌀 短波失稳 / 螺旋涡 | 1 | **Nishiyama & Hattori** 弱非线性饱和是普适特征 |
| 🌊 分层流 / 临界层吸收 | 1 | **Lévy-Dauchez** 周期↔混沌的物理开关 |
| 🔥 电磁驱动涡流相变 | 1 | **Kompalli** RTN 路线 + $Q_m$ 单参数归约 |
| 🔬 曲壁湍流 / 线性-非线性分离 | 1 | **Souza** 幅值与拓扑的分离 |
| 🛠️ GPU 原生网格 / 物理 AI 基建 | 1 | **PhysicsNeMo-Mesh** I/O 提速 8–88× |
| 🪶 扑翼形状优化 / ROM | 1 | **Karbasian** Hilbert 投影稳定灵敏度（+37% 推力） |
| 📉 因果正则化 DMD | 1 | **Pan & Kou** GC-DMD 深读（**有开源代码**） |

---

## ⚠️ 关键观察 1：严格 24h 窗口内 cs.GR **仍无流体渲染论文**（连续第三期）

### 多重交叉校验

| 检查项 | 结果 |
|--------|------|
| arXiv API：`cat:cs.GR` 按 submittedDate 降序（60 条全量扫描 + 关键词过滤） | **最新流体相关为 2026-10-19 FluidGen** ⚠️ |
| arXiv 列表页 `/list/cs.GR/new`（**10-30 周五公告榜**，22 条：7 new + 7 cross + 8 replacement） | **0 篇流体相关**（new 全为 3DGS/几何/MPM/植被/人群） |
| arXiv 列表页 `/list/cs.GR/recent`（36 条，10-23 ~ 10-30） | **0 篇流体相关** |
| arXiv API：`cat:cs.GR AND abs:fluid / water / smoke / particle / volume` 五组查询 | 最新分别为 10-29(MG-CD-MPM，已收录)、10-19、10-19、10-29、10-27 |
| 跨分类日期区间查询（physics.flu-dyn 13 + physics.comp-ph 20 + cs.FL 5 + eess.IV 2 + cs.CV 100） | 去重后 **~15 篇新增相关** |
| SIGGRAPH Asia 2026 | 会议 **12-01~04 吉隆坡**；技术论文页仍为**投稿指南**（"Technical Papers / Submissions"），论文清单未公布 |

> **结论**：arXiv **周末不公告**（最新公告周五 10-30）。本窗口完全落在周末 → **cs.GR 必然空窗，已连续三期（10-30、10-31、11-01）**。但跨分类扩展窗口持续产出高价值内容，说明**物理侧下沉**是稳定的知识来源。

---

## 📌 本期 9 篇逐篇要点

### 1. ⭐ Masuda et al. — 几何曲率质变液滴破碎
**[[2026-11-01-Masuda-Curved-Cylinder-Drop-Breakup-Geometric-VOF]]**

- **结论**：$\kappa_{\mathrm F}=d/R_i$ 不仅平移 $Re_{\mathrm{cr}}$，还**质变破碎形态与内部流场**：
  - 平面：对称颈部细化 → pinch-off，两个等大子滴
  - Type 1（$\kappa=0.52$）：曲率诱导迁移 + 非对称，$Re=1.2,Ca=0.3$ 出现**小卫星滴**
  - Type 3（$\kappa=1.04$）：周向拉伸成**新月薄丝** → 碎裂成**多碎片 + 多卫星滴**
- **内部流场转变**：$\Gamma=\|\mathbf D\|$ 分布从"关于轴对称的局部颈部" → "偏向迁移前部" → "分布于整个丝状区"；环流主导 → 拉伸主导。
- **关键澄清**：$Re_{\mathrm{cr}}$ 随 $\kappa$ 下降（曲率促进破碎），但破碎前最大伸长 $L_a/2R_d$ **反而随 $\kappa$ 上升** → **不能用阈值下降解释拉伸增强，机制本身变了**。
- **渲染价值**：⭐ 本期最贴近渲染 —— 杯子/瓶内液体破碎的物理依据；**plicRDF + isoAdvector + AMR** = 渲染级界面质量参考上限。

### 2. ⚛️ NEOPIC — 测度空间神经算子
**[[2026-11-01-NEOPIC-Neural-Operator-Particle-Kinetic-Plasma]]**

- **结论**：神经算子**直接作用于粒子的经验测度** $\mu_h=\sum w_i\delta_{x_i}$，输出在粒子位置求值 → **无 mesh、无 deposition、粒子噪声不混叠**。
- **三条理论**：① **表示等价性**（任意 $N$ 粒子下离散 = 连续）；② **误差分解**（采样/学习/时间步进分离，除学习误差外具有标准 MC 粒子法误差结构）；③ **粒子噪声 = 隐式正则化**。
- **复杂度**：$O(N_p)$，常数仅由架构决定，**与 mesh/tree 无关**。
- **渲染价值**：⭐ 直接为 SPH 密度/压力/涡量场建立神经代理；表示等价性保证"训练 10 万粒子、推理 1000 万粒子"仍稳定 → **粒子流体实时化的关键一步**。

### 3. 🌀 Nishiyama & Hattori — 螺旋涡短波失稳
**[[2026-11-01-Nishiyama-Hattori-Helical-Vortex-Short-Wave-Instability]]**

- **结论**：**"弱非线性饱和"是短波失稳的普适特征**（椭圆失稳 + 曲率失稳均验证）。仅当线性增长率足够大时才脱离该框架，此时高阶非线性与 WNA 中丢失的模态主导。
- **渲染价值**：螺旋涡 = 粒子系统模拟烟柱/龙卷风的标准构型；给出"何时卷曲"的定量条件；**弱非线性饱和区间 = 有序但已有波动的美术风格**。

### 4. 🌊 Lévy-Dauchez et al. — 临界层吸收控制混沌
**[[2026-11-01-Levy-Dauchez-Critical-Level-Wave-Absorption-Chaos]]**

- **结论**：两种物理不同的机制（宽谱小尺度重力波的**临界层动量沉积** / **指数密度层结**导致的波幅增长）**殊途同归**地抑制多重极值 → 阻断通往混沌的路径 → **对小尺度黏性不敏感** → 周期区显著加宽。
- **渲染价值**：⭐ 提供明确的物理开关 —— 改变层结强度即可在"周期"与"混沌"间切换 → **风格化大气/海洋动画的节律旋钮**；一维模型实时可行。

### 5. 🔥 Kompalli et al. — 液态金属涡流的混沌转变
**[[2026-11-01-Kompalli-Liquid-Metal-Swirl-MHD-Chaos-Transition]]**

- **结论**：经 **Ruelle–Takens–Newhouse 路线**进入混沌，中间存在 **SNA（奇异非混沌吸引子）**。转变由单无量纲群 $Q_m$（洛伦兹力/黏性力）控制，$Re\sim Q_m^{2/3}$ 与力矩平衡一致。
- **重要修正**：前人（Davidson 2022）在长宽比 1/6、100 A 下测得混沌起始 $B_0\approx1$–1.5 G；本文在 16 A、长宽比 1/2 下阈值**移至 16–17 G** → **旧结论不可迁移**。
- **渲染价值**：⭐ RTN 路线是"强迫流从平稳到湍流"的**通用模板**；$Q_m$ 单旋钮 + SNA 的奇异几何是很好的视觉中间态。

### 6. 🔬 Souza et al. — 曲壁超音速边界层
**[[2026-11-01-Souza-Curved-Wall-Supersonic-TBL-Triadic-Cascade]]**

- **结论（方法论价值最高）**：
  $$
  \text{非线性三元交互} \Rightarrow \text{主导尺度幅值};\quad \text{线性平均流感受性 + 空间发展对流不稳定性} \Rightarrow \text{相干结构空间拓扑}
  $$
  → **"什么幅值"与"什么形状"可分离控制**。
- **凹壁 vs 凸壁**：凹 → 近壁转为两分量态 + 外层多步三元级联 → **流向涡破碎**（非三维逆级联）；凸 → 能量被困在拉长一分量条带，resolvent wavemaker 驱动下游恢复。
- **渲染价值**：⭐ 程序化噪声可**分层设计**（低频团块噪声 / 高频丝状噪声）；SPOD 模态是天然的降阶流场基底。

### 7. 🛠️ PhysicsNeMo-Mesh — GPU 原生网格基建
**[[2026-11-01-PhysicsNeMo-Mesh-GPU-Native-Meshes-Simulation-Cases]]**

- **结论**：物理 AI 的瓶颈不是算力而是 **I/O 与预处理**。单张 GB200 上网格操作比 VTK（72 线程）**快 6.2–1068×**，加载整个案例**快 8.0–88×**，与训练重叠后仅占 **2.1%** 吞吐。
- **关键设计**：**具名边界条件**（per-boundary BC）→ 形状与壁面条件同时变化时，热传导误差 **87% → 6–9%**。
- **渲染价值**：一个数据集喂多个模型（Transolver/GeoTransolver/GLOBE）；**"逐边界条件"对渲染端的壁面类型区分同样关键**。

### 8. 🪶 Karbasian & Vermeire — 扑翼 ROM 形状优化
**[[2026-11-01-Karbasian-Flapping-Wing-ROM-Shape-Optimization]]**

- **结论**：把 PDE 约束优化**投影到 Hilbert 空间的系统动力学优化问题**，规避前向灵敏度不稳定性，同时降低内存与算力。$Re=2400$ 含混沌流结构下，**平均推力 +37%、推进效率 +40%**。
- **渲染价值**：ROM = 实时流体降阶路线；扑翼是影视常见题材；Hilbert 投影对"用可微模拟器自动调参"有借鉴。

### 9. 📉 Pan & Kou — GC-DMD 深读
**[[2026-11-01-Pan-Kou-GC-DMD-Causality-Informed-DMD-Detail]]**

- **结论**：用条件 Granger 因果性**正则化 DMD 算子辨识** → 抑制弱支撑耦合、保留动力学相关耦合 → 稀疏且可预测的降阶算子。
- **效果**：算子辨识精度 ↑、谱鲁棒性 ↑、长时程预测误差 ↓（lid-driven cavity）；跨声速湍流射流上算子更稀疏 + 精度 ↑。
- **⭐ 有开源代码**：`github.com/JiaqingKou/GC-DMD-Granger-Causality-informed-DMD`

---

## 🔭 趋势观察

### 1. 「非线性选幅值、线性选拓扑」的分离 —— 本期最强方法论信号
Souza（边界层）+ Nishiyama（螺旋涡失稳）**独立地**指向同一结论：**非线性决定模态幅值，线性（平均流感受性 / 失稳增长率）决定空间结构**。这对**程序化湍流生成**意义重大 —— 意味着可以**分别控制**噪声的"强度"和"形状"，这是风格化渲染的核心需求。**建议在知识库中单独建立概念条目。**

### 2. 神经算子正在脱离网格束缚
NEOPIC 的"作用于经验测度"是重要一步 —— 传统神经算子必须把粒子 deposition 到网格，这既引入混叠又破坏粒子方法的"粒子即自由度"结构。**表示等价性（任意 $N$ 成立）+ $O(N_p)$ 复杂度**的组合，使"训练用小粒子数、推理用大粒子数"成为可能 —— 这是**粒子流体实时化**的关键前提。可与 [[2026-10-24-FluidFormer-Transformer-Continuous-Convolution-SPH]]、[[2026-10-31-Fang-Qi-Wen-Small-Deborah-Fluid-Particle-Limit]] 串成线。

### 3. 「单参数归约」成为方法论标配
$Q_m$（Kompalli）、$\kappa_{\mathrm F}$（Masuda）、$Re\sim Q_m^{2/3}$（Kompalli）—— 把多个独立控制参数压缩为 1 个无量纲群，让美术/工程调参从"多参数试错"变成"单旋钮"。**这是本期最实用的一类可迁移洞察。**

### 4. RTN 路线作为"平稳 → 湍流"的通用模板
Kompalli 给出 RTN + SNA 的完整诊断链（相图 + FFT + 0-1 检验 + ACF + 关联维数）。这套"多指标交叉确认"模板可直接迁移到**烟雾从稳定到湍流**的过渡建模。

### 5. 基建类论文（I/O、数据管线）首次进入视野
PhysicsNeMo-Mesh 代表一个新的信号：**研究瓶颈正在从"算法"转向"数据流"**。对渲染侧同样成立 —— 大规模 3D 流体缓存的加载/流式化往往比求解器更卡。

---

## 📌 本期无流体渲染论文的说明

- **cs.GR 连续三期空窗**（10-30 / 10-31 / 11-01），主因是 arXiv 周末不公告。
- **SIGGRAPH Asia 2026**（12-01~04 吉隆坡）技术论文页仍是投稿指南，论文清单未公布 → 预计 11 月中下旬会有首批收录窗口，需重点盯防。
- **SIGGRAPH 2026**（7-23 洛杉矶）论文索引中的流体条目已于 09-05 / 10-08 全部收录，无新增。
- 本期产出全部来自**跨分类扩展窗口**（physics.flu-dyn / physics.comp-ph）+ 已收录论文的深读补充（GC-DMD）。

---

## 🔗 本期新增 wikilink 索引

- [[2026-11-01-Masuda-Curved-Cylinder-Drop-Breakup-Geometric-VOF]]
- [[2026-11-01-NEOPIC-Neural-Operator-Particle-Kinetic-Plasma]]
- [[2026-11-01-Nishiyama-Hattori-Helical-Vortex-Short-Wave-Instability]]
- [[2026-11-01-Levy-Dauchez-Critical-Level-Wave-Absorption-Chaos]]
- [[2026-11-01-Kompalli-Liquid-Metal-Swirl-MHD-Chaos-Transition]]
- [[2026-11-01-Souza-Curved-Wall-Supersonic-TBL-Triadic-Cascade]]
- [[2026-11-01-PhysicsNeMo-Mesh-GPU-Native-Meshes-Simulation-Cases]]
- [[2026-11-01-Karbasian-Flapping-Wing-ROM-Shape-Optimization]]
- [[2026-11-01-Pan-Kou-GC-DMD-Causality-Informed-DMD-Detail]]

---

## 🎯 下期关注

1. **arXiv 周一（11-02）公告** → cs.GR 恢复正常，应重点扫描 fluid/water/smoke/particle/volume 五个 abs 查询
2. **SIGGRAPH Asia 2026** 技术论文清单公布（预计 11 月中下旬）
3. **NEOPIC** 是否扩展到中性流体（NS 方程）—— 若成立即为里程碑
4. **"非线性选幅值、线性选拓扑"** 是否可形式化为通用风格化湍流框架
5. **plicRDF / isoAdvector** 的实时移植可能性（粒子→尖锐界面后处理）
