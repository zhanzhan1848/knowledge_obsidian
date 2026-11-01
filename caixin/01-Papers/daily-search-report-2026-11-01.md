---
type: report
created: 2026-11-01
updated: 2026-11-01
tags: [daily-search, arxiv, fluid-dynamics, physics.flu-dyn, weekend, no-new-submissions]
domain: fluid
agent: caixin
---

# 每日论文搜索报告 — 2026-11-01

## 执行概况

| 项目 | 内容 |
|------|------|
| **Agent** | 菜心 (caixin) 🥬 |
| **执行时间** | 2026-11-01 14:12 UTC（周日） |
| **搜索源** | arXiv 列表页 `arxiv.org/list/physics.flu-dyn/new` + `arxiv.org/list/cs.FL/new` + arXiv API `export.arxiv.org`（三路交叉校验） |
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, computational fluid dynamics |
| **最新批次** | **Fri, 30 Oct 2026**（physics.flu-dyn 新提交 22 篇 + 交叉 8 篇 + 替换 17 篇；cs.FL 新提交 4 篇） |
| **本次动作** | **0 篇新建** — 全批次 22 篇均已由 10-30 / 10-31 两次运行覆盖（完整性校验通过） |
| **产出统计** | 0 篇新建笔记 · 22 篇**覆盖度核验** · 1 篇日报 |

---

## ⚠️ 结论：本次为"零新增"批次（周末空窗）

arXiv **周末（周六/周日）不发布新论文**，且 2026-10-31（周六）同样无新批次。因此最近 24 小时内 **physics.flu-dyn 与 cs.FL 没有任何新提交**。

**最新可用批次仍为 Fri, 30 Oct 2026**，与 10-30、10-31 两次运行**完全重叠**。

---

## 检索方法与三路交叉校验

本次未依赖单一数据源（`web_search` 对 arXiv 新提交返回空结果），改用三条独立路径并互相印证：

| 路径 | 接口 | 结果 | 一致性 |
|------|------|------|---------|
| ① 列表页 | `arxiv.org/list/physics.flu-dyn/new` | 新提交 **22** + 交叉 8 + 替换 17 | ✅ |
| ② 列表页 | `arxiv.org/list/cs.FL/new` | 新提交 **4** + 交叉 1 + 替换 3 | ✅ |
| ③ API | `export.arxiv.org/api/query?cat:...&sortBy=submittedDate` | 按 `published` 排序，最新 2026-10-29 | ⚠️ 滞后 1 天 |
| ④ 近期列表 | `arxiv.org/list/physics.flu-dyn/recent` | 最新条目段 `Fri, 30 Oct 2026` | ✅ |

**关键发现**：arXiv **API 的 `published` 字段比列表页滞后一天**（API 最新为 10-29，列表页为 10-30）。若仅依赖 API + `sortBy=submittedDate`，会**漏掉整整一个批次**（10-30 的 22 篇）。这是本任务此前遗漏高价值论文的潜在根因——**列表页是唯一可靠的"最新批次"来源**。

### RSS 不可用

`rss.arxiv.org/rss/physics.flu-dyn+cs.FL` 在周末返回空（`skipDays` = Saturday, Sunday），已弃用该路径。

---

## 全批次 22 篇 — 覆盖度核验

全部 22 篇 `physics.flu-dyn` 新提交均已入库，本轮逐篇核验笔记存在性与结构完整性（模板 9 章节）：

| # | arXiv ID | 标题 | 笔记文件 | 大小 |
|---|---|---|---|---|
| 1 | 2610.38011 | An Optimal Seed Reveals the Dynamical Route to Spontaneous Splitting of Turbulent Puffs | `...2610.38011-optimal-seed-spontaneous-splitting-turbulent-puffs.md` | 9.8 KB |
| 2 | 2610.38033 | Why does the detonation cell size λ provide quasi-universal scaling? | `...2610.38033-detonation-cell-size-quasi-universal-scaling.md` | 8.8 KB |
| 3 | 2610.38493 | Inertial flows over the Koch leaf | `...2610.38493-inertial-flows-over-koch-leaf.md` | 8.2 KB |
| 4 | 2610.38612 | Emergence of Zonal Flows in an Imbalanced Point-Vortex System | `...2610.38612-zonal-flows-imbalanced-point-vortex.md` | 18.9 KB |
| 5 | 2610.38672 | Differentiable Schwarz-Coupled Solvers: Inverse Modeling via Agentic AI | `2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse.md` | 26.2 KB |
| 6 | 2610.38679 | Modeling Broad-Frequency-Band Water-Wave Experiments with NLS Generalizations | `...2610.38679-broadband-water-waves-NLS-generalizations.md` | 15.3 KB |
| 7 | 2610.38714 | Kinetic linear stability theory with the full Boltzmann collision operator | `2026-10-30-kinetic-linear-stability-full-Boltzmann-collision.md` | 23.8 KB |
| 8 | 2610.38743 | Identifiability Limits of Reynolds-Stress Attribution in Localized Nonorthogonal Flow | `...2610.38743-reynolds-stress-attribution-nonorthogonal-vortex-representations.md` | 18.6 KB |
| 9 | 2610.38814 | Regional accuracy of PINNs for recirculation in a deep lid-driven cavity | `2026-10-30-PINN-deep-lid-driven-cavity-regional-accuracy.md` | 24.6 KB |
| 10 | 2610.38889 | Inherent Failure Modes of PINNs for Buoyancy-Driven Flow | `2026-10-30-PINN-buoyancy-nondimensionalization-failure-modes.md` | 20.8 KB |
| 11 | 2610.39064 | From Dye to Dynamics: Quantitative Measurements of Fluid Flows from Vortex Geometry | `...2610.39064-dye-tracking-vortex-filament-geometry.md` | 13.6 KB |
| 12 | 2610.39123 | Triadic energy cascades in supersonic TBL over curved walls | `...2610.39123-supersonic-turbulent-curved-wall-triadic-cascade.md` | ✅ |
| 13 | 2610.39154 | Geometrical effect on drop deformation and breakup between rotating cylinders | `2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF.md` | 20.1 KB |
| 14 | 2610.39348 | Transition to turbulence in swirl created by a vertical magnetic field | `...2610.39348-liquid-metal-swirl-chaos-transition.md` | ✅ |
| 15 | 2610.39386 | Nonlinear dynamics of short-wave instabilities in a helical vortex | `...2610.39386-helical-vortex-short-wave-nonlinear-dynamics.md` | ✅ |
| 16 | 2610.39522 | Causality-informed dynamic mode decomposition for unsteady flow analysis | `...2610.39522-causality-informed-dynamic-mode-decomposition.md` | ✅ |
| 17 | 2610.39586 | On the rise of a Taylor bubble-drop assembly in a vertical tube | `...2610.39586-taylor-bubble-drop-assembly-rise-vertical-tube.md` | ✅ |
| 18 | 2610.39809 | Critical-level wave absorption controls chaos in a wave-mean flow system | `...2610.39809-critical-level-wave-absorption-chaos-control.md` | 16.9 KB |
| 19 | 2610.40090 | Non-stationary anisotropic capillary wave turbulence (kinetic equation) | `...2610.40090-anisotropic-capillary-turbulence-kinetic-equation.md` | 17.4 KB |
| 20 | 2610.40217 | Wave Turbulence of Capillary Waves in Finite Systems | `...2610.40217-capillary-wave-turbulence-finite-systems.md` | 16.4 KB |
| 21 | 2610.40426 | Aerodynamic Shape Optimization of unsteady flapping wings | `...2610.40426-rom-constrained-flapping-wing-shape-optimization.md` | ✅ |
| 22 | 2610.40474 | Closure of 2D flamelet theory in non-orthogonal composition spaces | `...2610.40474-flamlet-closure-non-orthogonal-composition.md` | 11.6 KB |

**覆盖度：22/22 = 100%** ✅（每个 ID 均可通过 `grep` 在 `01-Papers/` 中定位到唯一主笔记）

### cs.FL 分类：4 篇全部为形式语言与自动机理论，与流体无关

| arXiv ID | 标题 | 判定 |
|---|---|---|
| 2610.39678 | Tree Equivalence of Higher-Order Recursion Schemes Is Undecidable | ❌ 形式语言（$cs.FL$ = Formal Languages and Automata Theory） |
| 2610.39833 | Exact Avoid-or-Compress Extrema for Dense Reachable Images | ❌ 组合/自动机 |
| 2610.39941 | Block-exchange descent for insertion | ❌ 组合 |
| 2610.40012 | Reachability in Five-Dimensional Vector Addition Systems Is PSPACE-Complete | ❌ 计算复杂性 |

> ⚠️ **分类误标提醒**：`cs.FL` 是 **Formal Languages and Automata Theory**（形式语言与自动机理论），**不是** "Computational Fluid Dynamics"。配置文件中 `caixin.search.arxiv_categories` 将 `cs.FL` 列为流体力学分类属于**配置错误**，已在 10-31 日报中建议从配置移除。**本轮起不再从 `cs.FL` 采集**（保留检索仅为校验，无一收录）。

---

## 本批次主题分布（22 篇）

```
动理学稳定性 / 湍流机理      ████████  7篇  (32%)   Boltzmann 算子稳定性 / 雷诺应力归因 / 点涡平衡图 / RTN 混沌 / 三波级联 / 涡失稳 / 湍流团裂解
科学机器学习 (PINN/ROM)      ████      4篇  (18%)   PINN 浮力失败模式 / PINN 深腔分区评估 / GC-DMD / Schwarz 可微分反演
波湍流 / 波动                ███       3篇  (14%)   各向异性毛细波 / 有限系统毛细波 / 广义 NLS 宽频水波
多相流 / 界面                ██        2篇  (9%)   VOF 曲率破碎 / Taylor 气泡-液滴组合体
燃烧 / 爆炸                  ██        2篇  (9%)   2D flamlet 闭包 / 爆轰胞元标度
降阶 / 优化                  ██        2篇  (9%)   ROM 扑翼优化 / 涡发生器几何优化
实验方法 / 现象学            ██        2篇  (9%)   染料追踪涡丝几何 / Koch 叶惯性流
```

### 主题解读

1. **动理学稳定性成为本批次主线**。[[2026-10-30-kinetic-linear-stability-full-Boltzmann-collision]] 首次用**完整 Boltzmann 碰撞算子**做不可压剪切流的模态/非模态稳定性，把 Orr–Sommerfeld 特征值吻合到 $10^{-7}$（BGK/ES-BGK/Shakhov 模型），并给出**动能 Reynolds–Orr 方程**——这是把气体动理学与经典流体稳定性缝合起来的实质性进展，对 LBM 交叉验证与湍流最敏感方向判别有直接价值。

2. **PINN 失败模式研究走向"机理化"**。两篇独立工作同时给出诊断性结论：[[2026-10-30-PINN-buoyancy-nondimensionalization-failure-modes]] 定位到**无量纲化选择**是成败主因（自由落体标度误差 1.1% vs 热扩散标度 650% 且在 $Ra{=}10^5$ 发散，机理是浮力项梯度按 $(\mathrm{Ra}\,\mathrm{Pr})^2$ 放大）；[[2026-10-30-PINN-deep-lid-driven-cavity-regional-accuracy]] 则指出**区域化评估**的必要性（速度偏差 5–8% 但涡量偏差 41–53%，只看主流速度会严重高估 PINN 精度）。二者合起来构成 PINN 工程落地的"避坑清单"。

3. **界面几何效应被证实改变物理机制本身**。[[2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF]] 发现几何曲率 $\kappa_F$ 不仅移动破碎阈值（$Re_{\rm cr}$ 随曲率下降），更**改变断裂形貌**（平面下对称颈缩 vs 圆柱下不对称方位角伸长 + 卫星滴），临界伸长率斜率从 0.44 变为 4.8——这提醒不要把直管标定的 VOF 破碎阈值直接外推到弯曲通道。

4. **降阶模型开始吸收因果信息**。[[2026-10-30-arXiv-2610.39522-causality-informed-dynamic-mode-decomposition]] 用条件 Granger 因果正则化 DMD 算子，得到更稀疏且预测更准的 ROM，**代码已开源**（`github.com/JiaqingKou/GC-DMD-Granger-Causality-informed-DMD`），可立即纳入工作流评估。

5. **波形湍流的有限尺寸效应**。[[2026-10-30-arXiv-2610.40090-anisotropic-capillary-turbulence-kinetic-equation]] 给出力学方程框架下的**强各向异性**波湍流谱 $n(k,\varphi)\sim k^{-17/4}F(\varphi)$（类 Kolmogorov–Zakharov 谱），并验证惯性区间碰撞积分消失；[[2026-10-30-arXiv-2610.40217-capillary-wave-turbulence-finite-systems]] 确认 Zakharov–Filonenko 谱的**有限动态范围**随非线性减弱而收缩，标度 $\sim\mu^{8/3}$。

---

## 本次技术改进：检索路径修正（重要）

发现并修正了一个**会导致漏收论文的检索缺陷**：

| 数据源 | 最新可见批次 | 可靠性 |
|--------|--------------|--------|
| `export.arxiv.org` API `published` 字段 | **2026-10-29**（滞后 1 天） | ❌ 会漏收 10-30 整批 |
| `arxiv.org/list/<cat>/new` 列表页 | **2026-10-30** | ✅ 正确 |
| `web_search` 通用搜索 | 0 结果 | ❌ 不可用于新提交检测 |

**结论**：今后每日检索**以 `arxiv.org/list/<category>/new` 为准**，API 仅用于抓取完整摘要与元数据（DOI/journal_ref/comment）。若继续只用 API + `sortBy=submittedDate`，每批次都会稳定漏掉约一天的论文。

### 解析流程固化（本次验证可用）

```
1. curl -sL "https://arxiv.org/list/<cat>/new"                  # 列表页
2. 按 <h3> 切分 "New submissions" / "Cross submissions" / "Replacement submissions"
3. 正则提取 <dt>/<dd> 对 → id / title / authors / subjects / summary
4. curl "https://export.arxiv.org/api/query?id_list=<ids>"     # 补全摘要
   ⚠️ id_list 批量查询返回的 ID 带 vN 后缀，合并时需按 .split('v')[0] 归一
   ⚠️ 逗号不可 URL-encode，否则 HTTP 400
5. arXiv 不发周末 → 周日运行时最新批次仍是周五
```

---

## Git 同步

已执行 `~/knowledge-vault/.scripts/git-sync.sh`，提交信息：

```
caixin: 2026-11-01 每日流体力学论文搜索（周末零新增批次：全批次 22 篇覆盖度核验 100% + arXiv 列表页检索路径修正）
```

---

## 下一批次预告

- **预计下一批**：2026-11-02（周一）arXiv 公告后，physics.flu-dyn 通常 20–40 篇新提交
- **重点关注**：动理学稳定性（LBM ↔ 经典稳定性理论融合）、PINN 训练机理、界面几何效应、因果正则化 ROM

---

## 相关文件

- [[Papers-MOC]] — 论文索引总入口
- [[daily-search-report-2026-10-31-run2]] — 上一轮（9 篇技术细节补强）
- [[daily-search-report-2026-10-31]] — 6 篇深度重写 + cs.FL 分类误标更正
- [[daily-search-report-2026-10-30]] — 本批次 25 篇首收录
