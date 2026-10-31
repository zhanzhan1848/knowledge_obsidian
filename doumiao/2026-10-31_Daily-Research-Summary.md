---
type: research-summary
created: 2026-10-31
updated: 2026-10-31
tags: [summary, fluid-rendering, daily-search, arxiv, cross-category, geometry-curvature, water-surface, inverse-problem]
status: processed
domain: fluid-rendering
agent: doumiao
period: 2026-10-30 15:14 UTC → 2026-10-31 15:14 UTC (严格 24h) + 7d 扩展窗口
search_scope: arXiv cs.GR (主) + cs.FL/cs.CV/cs.LG/physics.flu-dyn/math.AP/math.NA (辅) + SIGGRAPH/SIGGRAPH Asia
---

# 📅 每日流体渲染论文搜索报告 — 2026-10-31（周六，第二次运行）

> **搜索窗口**：严格 24 小时（2026-10-30 15:14 → 2026-10-31 15:14 UTC）+ 7 天扩展窗口
> **搜索源**：arXiv API（20+ 组查询串）、arXiv 分类列表页（`/list/cs.GR/new` 公告榜 + `/list/cs.GR/recent`）、arXiv HTML 全文、asia.siggraph.org、physicsbasedanimation.com
> **检索关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展（capillary-gravity wave, point vortex, VOF, plicRDF, isoAdvector, drop breakup, Boussinesq, stratified flow, Deborah, VFP-INS, Navier-Stokes inverse problem, Taylor bubble…）
> **产出**：**7 篇结构化笔记** → `~/knowledge-vault/doumiao/01-Papers/`

---

## 📊 概览

| 分类 | 数量 | 代表论文 |
|------|------|----------|
| 💧 液滴破碎 / 几何 VOF | 1 | **Masuda** 圆柱曲率 → 破碎路径质变（⭐ 最贴近渲染） |
| 🌊 毛细-重力波 + 涡 | 2 | **Du & Zou** Part I + II（五部曲系列，涡核正则化 + 全局解曲线） |
| 🌬️ 分层流结构理论 | 1 | **Nualart** Boussinesq 刚性定理（大气/海洋分层） |
| 🫧 气泡-液滴组合体 | 1 | **Yao & Zhou** 上升速度反直觉继承 |
| 🔧 物理先验逆问题 | 1 | **Aigner** SFNS 强形式 NS 残差最小化（3× 加速） |
| ⚛️ 粒子-流体耦合降维 | 1 | **Fang** 小 Deborah 数 → NS-KS 宏观极限（逐点收敛率） |

---

## ⚠️ 关键观察 1：严格 24h 窗口内 cs.GR **仍无流体渲染论文**

### 多重交叉校验

| 检查项 | 结果 |
|--------|------|
| arXiv API：`cat:cs.GR AND submittedDate:[202610301400 TO 202610311500]` | **0 篇** ⚠️ |
| arXiv API：`cat:cs.GR AND submittedDate:[202610291400 TO 202610311500]` | 1 篇（HairDeck，与流体无关） |
| arXiv 列表页 `/list/cs.GR/new`（**10-30 周五公告榜**，22 条） | **0 篇流体相关** |
| arXiv API 全量 cs.GR（120 条） | 新 22 条全部为 3DGS / 神经渲染 / 几何 / MPM / 3D 代码编辑 |
| 跨分类 7 天窗口（cs.GR + cs.FL + eess.IV + physics.flu-dyn 等 20 组查询） | 320 篇去重 → 7 篇新增相关 |
| SIGGRAPH Asia 2026 | 会议 **12-01~04 吉隆坡**；技术论文页仍为 **"Stay tuned"**，尚未公布论文清单 |
| SIGGRAPH 2026（7-23 洛杉矶，已召开） | 论文索引页流体相关条目均已于 09-05 / 10-08 收录 |

> **结论**：arXiv **周末不公告**（最新公告为周五 10-30）。本窗口跨越周末，24h 内 cs.GR 必然空窗。**连续两期（10-30、10-31）严格窗口无渲染论文**——但本次通过跨分类扩展仍挖出 7 篇高价值新内容，说明"物理侧下沉"趋势持续，且**物理约束力继续增强**。

---

## 📌 本期 7 篇逐篇要点

### 1. ⭐ Masuda et al. — 几何曲率改写液滴破碎路径
**[[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]]**

- **结论**：曲率 $\kappa_{\mathrm{F}}=d/R_{\mathrm{i}}$ 不只是平移 $Re_{\mathrm{cr}}$，**更质变破碎形态**——平面近对称二分断裂 → Type 1 弱非对称+单卫星滴 → Type 3 丝状介导碎裂+多卫星滴。
- **机制**：圆形 Couette 剪切率 $\dot\gamma(r)/\dot\gamma_{\mathrm{R}}=(r_0/r)^2$ 空间不均匀 → **周向优先拉长**。
- **渲染价值**：曲率不可忽略——**曲面容器内液体破碎不能套用平面参数**；给出破碎形态分支条件与网格精度下限（直径 ≥8 单元，$R_d/8$ 不足）。

### 2-3. ⭐ Du & Zou — 毛细-重力波 + 紧支撑涡量（Part I / II）
**[[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-I-Local-Constructions]]** · **[[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-II-Continuation-Folds]]**

- **Part I**：点涡 → 光滑紧支撑涡核的**守恒正则化**（保持环量 $\Gamma$ 与涡量律）；液面四阶展开含首个毛细修正；Kirchhoff–Routh 平衡存在性 + 一致局部化；周期情形涡深 $\propto\log(1/W)$（孤立波 $\propto 1/W$）。
- **Part II**：**全局解曲线** + 集中紧性备择（无需单调性假设的有限剖面分解）；**简单速度折叠点** Hessian 负指数差恰为 1。
- **渲染价值**：① **点涡视觉正则化模板**（消除 $1/r$ 奇异性且守恒）；② **色散关系 $W=(g/|k|+\sigma|k|)^{1/2}$ → 法线贴图频谱在 $k_{\min}=(g/\sigma)^{1/2}$ 换斜率**；③ 折叠点 = 水面形态的"转场触发点"；④ 有限剖面分解 → **人工远场边界条件**。

### 4. Nualart et al. — Boussinesq 稳定结构刚性
**[[2026-10-31-Nualart-Park-Penafiel-Boussinesq-Stationary-Structures]]**

- **结论**：稳定层结 + 层流速度 ⟹ **必为分层剪切流**；但 Boussinesq 情形存在**层流/非定常/非剪切**稳定解（Euler 下不存在）。
- **渲染价值**：**$Ri\approx1$ = 混合活跃带**（垂直输运强），远离处 = 层结锁定带 → 烟柱/云层垂直混合强度的**零成本分层调制器**；停滞点附近"岛"结构 → 等密度面断裂提示。

### 5. Yao & Zhou — Taylor 气泡-液滴组合体
**[[2026-10-31-Yao-Zhou-Taylor-Bubble-Drop-Assembly-Riser]]**

- **反直觉**：TBDA 上升速度 **= 孤立 Taylor 气泡**，与液滴长度无关；液滴被**加速**而非拖慢。
- **渲染价值**：**速度继承规则**——气泡+液滴特效中液滴直接取气泡速度（不要按密度比减速）；液滴保持 Taylor 长椭球形；给出管内流动的**解析速度剖面**可作着色器解析场。

### 6. Aigner et al. — SFNS：物理先验 vs 数据驱动
**[[2026-10-31-Aigner-SFNS-Airflow-Sparse-Sensing-Physics-Prior]]**

- **结论**：直接罚 NS **强形式残差**比弱形式**更准且快 3×**；物理先验在**稀疏区间收益最大**；SFNS 全设置最优，GPR 随样本增加逼近但**从未反超**。
- **渲染价值**：**"稀疏控制点 → 物理一致流场"范式**——用 3–5 个美术控制点 + SFNS 解流场驱动体积平流，毫秒级且物理自洽；$E_s=\int\|\nabla u\|^2$ 可作**烟流细节锐度旋钮**。

### 7. Fang et al. — 小 Deborah 数流体-粒子极限
**[[2026-10-31-Fang-Qi-Wen-Small-Deborah-Fluid-Particle-Limit]]**

- **结论**：VFP-INS → NS-KS 宏观极限**首次在逐点意义严格证明**，给出显式收敛速率（全局时间）；需全新展开形式 + 匹配的能量/耗散结构。
- **渲染价值**：**两级粒子渲染架构**——宏观解 NS-KS，微观按 $n_0$ 采样，成本从六维降到两维；KS 方程 = 带漂移 Fokker–Planck → **直接写为渲染端粒子更新规则**；$g_1$ 项编码流体对粒子分布的一阶反作用（忽略会导致"过度均匀化"失真）。

---

## 🧭 前沿观察（本期新增）

22. **几何不是修饰，是动力学变量**（10-31 期）— 曲率 $\kappa_{\mathrm{F}}$ 改变液滴破碎的**质**而非仅阈值；渲染端若支持曲面容器（杯/瓶/管壁），平面剪流的破碎参数**不可直接复用**。
23. **点涡奇异性有守恒解**（10-31 期）— 紧支撑涡核正则化保持环量与涡量律 → 渲染中点涡着色奇异性可**守恒地**消除，优于简单截断。
24. **频谱必须分段构造**（10-31 期）— 毛细-重力色散 $g+\sigma k^2$ 意味着法线贴图频谱在 $k_{\min}=(g/\sigma)^{1/2}$ **换斜率**；单一幂律在两个尺度段都不准。
25. **物理先验的收益在稀疏区间最大**（10-31 期）— SFNS 实证：数据少时加物理约束 ≫ 加采样。**对渲染同构成立**：特效参考少时应强化物理约束而非加采样。
26. **强形式残差 > 弱形式**（10-31 期）— 多数管线默认用弱形式（构造线性系统）；实测强形式更准且快 3×，值得替换。
27. **轻粒子渲染可大幅降维**（10-31 期）— 小 Deborah 数极限给出"何时可丢弃 $v$ 维"的判据 → 喷雾/雾滴特效从六维 $f(t,x,v)$ 降到 $(x,t)$ + 一次 NS 求解。
28. **"反直觉速度继承"是可直接落地的渲染规则**（10-31 期）— 气泡携带液滴时液滴取气泡速度；这类"违背直觉但有实证"的结论往往是特效实现中最易搞错的点。

---

## 📌 承接 10-30 期结论

> 连续两期严格窗口无流体渲染算法论文。本期 7 篇**全部仍是物理/数学侧**，但**约束力极强**：几何曲率（形态分支）、色散分段（频谱构造）、层结刚性（混合调制）、涡核正则化（着色稳定性）、强形式残差（管线替换）、宏观极限（架构降维）。**"物理下沉"已从趋势变为常态**。

---

## 🔗 相关 Agent

- [[生菜]] — 渲染基础（光线追踪/全局光照）
- [[娃娃菜]] — 几何处理
- [[菜心]] — 流体力学（CFD/SPH/LBM 数值方法）
