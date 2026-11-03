---
type: research-summary
created: 2026-11-03
updated: 2026-11-03
tags: [summary, fluid-rendering, daily-search, arxiv, cross-category, stable-fluids, sph, ocean, turbulence, foam]
status: processed
domain: fluid-rendering
agent: doumiao
period: 2026-11-02 14:11 UTC → 2026-11-03 14:11 UTC (严格 24h) + 3 天扩展窗口
search_scope: arXiv cs.GR (主) + cs.FL / cs.CV / cs.LG / physics.flu-dyn / math.NA / math.AP / math.DS / physics.ao-ph / eess.IV (辅) + SIGGRAPH Asia 2026
---

# 📅 每日流体渲染论文搜索报告 — 2026-11-03（周二）

> **搜索窗口**：严格 24 小时（2026-11-02 14:11 → 2026-11-03 14:11 UTC）+ 3 天扩展窗口（10-31 14:00 起）
> **搜索源**：arXiv API（12+ 组查询串 + id_list 逐篇核验）、arXiv 分类列表页 `/list/cs.GR/recent`（含 **11-03 周二公告榜 19 篇**）、asia.siggraph.org、physicsbasedanimation.com
> **检索关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展（stable fluids, SPH, vortex tube, gravity-capillary, wave scattering, sharp interface, dissipation, lattice Green function…）
> **产出**：**7 篇结构化笔记** → `~/knowledge-vault/doumiao/01-Papers/2026/11/`

---

## 📊 概览

| 分类 | 数量 | 代表论文 |
|------|------|----------|
| 🧮 求解器精度 | 3 | **KSF-Chol** ⭐⭐⭐（Stable Fluids 2.0）、**Lattice Green's** ⭐⭐（涡管 Poisson 陷阱）、**SPH explog** ⭐⭐⭐（零成本高精度） |
| 🌊 水面 / 海洋 | 2 | **重力-毛细波稳定控制** ⭐⭐、**绕水柱波浪散射** ⭐ |
| 🔥 燃烧 / 湍流 | 1 | **Eulerian vs Lagrangian 耗散** ⭐⭐ |
| 🫧 界面热力学 | 1 | **Enriched Surface Thermodynamics** ⭐⭐ |

---

## ⚠️ 关键观察 1：cs.GR 主分类本窗口**零流体渲染论文**，但 arXiv 公告榜**今天有 19 篇新公告**

### 多重交叉校验

| 检查项 | 结果 |
|--------|------|
| arXiv API `cat:cs.GR AND submittedDate:[202611021400 TO 202611031500]` | **0 篇** ⚠️（API 的 submittedDate 与公告日错位） |
| arXiv API `cat:cs.GR AND submittedDate:[202610271200 TO 202611031500]` | 37 篇 → 逐篇核验 |
| **arXiv 列表页 `/list/cs.GR/recent`（11-03 周二公告，19 篇）** | **0 篇流体相关** ✅ 已逐 ID 核验 |
| 11-03 公告榜内容分布 | CAD / 3DGS / 几何参数化 / CAD 生成 / 语音口型 / 无缝展开 — **无流体** |
| SIGGRAPH Asia 2026 | 技术论文页仍为 **"Stay tuned"**；论文清单（16 篇流体）已于 **11-02** 收录完毕 |

### ⚠️ 重要方法论教训

**arXiv API 的 `submittedDate` 过滤在本场景不可靠**：
- 论文的 `submitted` 时间戳 = **首次投稿时间**
- 公告（announcement）时间 = **审核通过后进入公告榜的时间**
- 一篇 10-27 提交的论文可能**今天（11-03）才被公告**
- → **必须同时查 `/list/cs.GR/recent` 公告榜**，否则会漏掉整天的 cs.GR 新论文

> 本期严格窗口 API 返回 0 篇，但公告榜有 19 篇 —— **若只看 API 会完全错过当日 cs.GR 动态**。已修正搜索流程。

---

## 📌 本期 7 篇逐篇要点

### 1. ⭐⭐⭐ Scholz, Bacho, Owhadi — KSF-Chol：Kernelized Stable Fluids
**[[2026-11-03-KSF-Chol-Kernelized-Stable-Fluids]]**

- **结论**：Stable Fluids 的**物理不准确主因 = 平流步线性插值导致涡量过度扩散**。换**核插值**即可修复，用**稀疏 Cholesky 预条件 + 近/远场分解**把代价压回**近线性** $\mathcal{O}(N\log^d)$。
- **渲染价值**：**这是 Stable Fluids（25 年 VFX 工业标准基线）的"物理保真 2.0"**。核的选择本身是**可调"风格旋钮"**（高斯核=写实涡旋 / 紧支撑核=风格化粒子感 / 边界友好）。
- **⭐ 可落地**：改动**只在平流步**，其余（投影、涡量提取、粒子化）完全复用。

### 2. ⭐⭐ Poncelet & Chatelain — Lattice Green's Functions（涡管/尾流/射流）
**[[2026-11-03-Poncelet-Lattice-Green-Functions-Vortex-Tubes]]**

- **结论**：FFT-based Poisson 求解器在"**两无界 + 一周期**"（涡管/尾流/射流）几何下有**与网格尺寸无关、不收敛**的系统误差 = 源的**周期镜像场**。量级 $\exp(-2\pi d/L_z)$，极端细长时 $\to (L_z/L_x)^2$。
- **渲染价值**：**VFX 场景恰恰是细长的**（烟柱、尾流、火焰羽流、瀑布、河流）→ 误差可**超过解本身**。表现为**远场周期性伪影**，常被误判为美术/粒子问题。
- **⭐ 可落地**：**最优周期长度在 $L_z \sim L_x$ 量级**（不是越大越好）；padding test 可作体检项。

### 3. ⭐⭐⭐ Bilotta et al. — 弱可压 SPH 声学项精度
**[[2026-11-03-Bilotta-Weakly-Compressible-SPH-Acoustic-Terms]]**

- **结论**：Cole EOS 在 $\gamma\neq1$ + **单精度**（GPU 默认）下有**显著精度损失**（大数相减的灾难性抵消）。`explog` 高精度形式：参数 $<0.125$ 时**最大 ULP ≈ 2**。
- **渲染价值**：精度提升 **GPU 上反而更快**，CPU 仅略慢 → **零成本高精度修复**。症状对应"斑点噪声""边界鬼影抖动"，常被误诊为重建半径不足。
- **⭐ 可落地**：**最高优先级**，通常 < 1 天。诊断法：**单精度切双精度做 A/B**。

### 4. ⭐⭐ Ding & Zhao — 常涡量重力-毛细波的指数稳定
**[[2026-11-03-Ding-Zhao-Gravity-Capillary-Waves-Stabilization]]**

- **结论**：自由面上施加 $p = \chi(\mathbf{x})\cdot\partial_t\eta$（非负截断 × 表面高度时间导数）可**指数稳定**水面。
- **渲染价值**：**一行公式的"水面平静控制器"**，GPU 落地极低（一个纹理乘积 + 投影步修正）。核心洞见：**涡量持续供能 → 全局阻尼无效，必须用"与表面运动耦合的定域反馈"**。
- **⭐ 可落地**：实时游戏水面、涟漪衰减、场景切换的"静下来"。

### 5. ⭐ Bec et al. — Eulerian vs Lagrangian 湍流耗散
**[[2026-11-03-Bec-Eulerian-Lagrangian-Turbulent-Dissipation]]**

- **结论**：**经典 bridge relation 在单轨迹层面失效**。Eulerian 空间统计 = **平方对数**级联深度 + 尺度依赖乘子；Lagrangian 沿轨迹 = **多重分形** + **近似尺度不变**时间级联。
- **渲染价值**：回答了"**该追踪还是该取样**"。Eulerian 网格 + ray marching 若只加速度场**不够** → 实时烟雾"越跑越糊且糊得没规律"有了物理解释。
- **⭐ 可落地**：涡量历史注入 / 多历史 curl 噪声叠加 / 粒子追踪预览。

### 6. ⭐ Chen, Wang, Shang, Lin — 穿水圆柱高非线性波浪散射（Part I）
**[[2026-11-03-Chen-Wang-Shang-Nonlinear-Wave-Scattering-Cylinder]]**

- **结论**：时域伪谱 + Fredholm 第二型积分方程 + Legendre 多项式 → 高效解**圆柱面速度势**与**自由面竖直速度**。
- **渲染价值**：输出的**圆柱面通量**正是渲染"**水痕带高度/随时间变化**"与"**沿柱下泄水流**"所需。立柱两侧的水面**更快、更陡、偏转**（绕射场）——纯 Gerstner 波会显得"死板"。
- **⭐ 可落地**：**离线预烘焙**局部绕射场修正 + 水痕带高度曲线 + 分离涡图案，实时叠加。

### 7. ⭐ Enriched Surface Thermodynamics for Sharp-Interface Fluid Models
**[[2026-11-03-Enriched-Surface-Thermodynamics-Sharp-Interface]]**

- **结论**：锐界面方法（VOF/level-set）把界面当**纯几何** → 丢弃过渡区全部信息。框架让界面携带**成分表面质量密度** + **厚度描述符**，厚度有**压力型共轭量**与**独立演化方程**。
- **渲染价值**：**泡沫/飞沫生成变成物理判据而非美术判断**；厚度 = **光学厚度** → 直接改善"水花像塑料片"。
- **⭐ 可落地**：**零求解器改动的阶段 1** —— 用 level-set 的 $\|\nabla\phi\|$ 作厚度代理，驱动泡沫生成与消光系数调制。

---

## 📌 本期另纳入候选（未单独成篇，已在上文提及）

| 论文 | 分类 | 一句话 | 处理 |
|------|------|--------|------|
| 2611.03243 — 2D 微游动子在滑移边界附近 | physics.flu-dyn | 单一边界参数（粘度比 $\sigma_c=1/2$ / 滑移长度）组织**质性不同的运动模式** | 提及（低渲染相关） |
| 2611.01010 — 高 Karlovitz 数预混火焰燃烧极限 | physics.flu-dyn | 火焰速度随 $u'$ 先增后**减**；$\mathrm{Kolmogorov}\approx4\,\mu$m 时出现局部熄灭 | 提及（火焰渲染相关） |
| 2611.01014 — 点涡系统有限时奇性 I：上半平面 | math.DS | 三涡内部坍缩，$O(\sqrt{T-t})$ 速率 | 提及（**点涡视觉正则化**相关，见 10-31 Du&Zou） |
| 2611.01433 — 2D NS 自相似涡坍缩附近 $L^1$ 放大 | math.AP | 粘性趋零时三涡坍缩的定量 $L^1$ 不稳定性 | 提及 |
| 2611.01924 — 高阶拓扑水波晶体 | physics.app-ph | 水波在**结构角点**局域化，实测自由面响应 | 提及（艺术化水面结构参考） |
| 2611.02372 — 木星极涡生成（浅水 + 拟随机对流） | physics.ao-ph | **"涡旋晶体"**、**shielded cyclone**、Biot–Savart 漂移诊断 | 提及（**烟柱/龙卷涡形态参考**） |
| 2611.01227 — 锐界面流体模型 | physics.flu-dyn | （见第 7 篇） | ✅ 成篇 |

---

## 🧭 本期方法论与流程改进

| 项 | 变更 |
|----|------|
| **arXiv 检索流程** | ✅ **新增 `/list/cs.GR/recent` 公告榜逐日核验**（API `submittedDate` 会漏掉公告日的论文） |
| **窗口策略** | 保留"严格 24h + 3 天扩展"双层设计（本期扩展窗口产出 4/7 篇） |
| **SIGGRAPH Asia 2026** | 论文清单已完整收录（11-02），程序页仍 "Stay tuned"；**会议 12-01~04 吉隆坡**，距今约 4 周，可开始准备追踪补充材料 |
| **主题聚类** | 本期出现清晰主题：**"求解器精度与物理保真"**（KSF-Chol / Lattice Green's / SPH explog 三篇同源）——这是本领域当前最活跃的主线，值得单独建 MOC |

---

## 🎯 建议传递给 @墨鱼丸（算法 Agent）的落地清单

| 优先级 | 项目 | 出处 | 工作量 |
|--------|------|------|--------|
| 🔴 **P0** | SPH EOS 精度 A/B 诊断（单精度 vs 双精度）→ 若有差异，换 `explog` 形式 | SPH explog | < 1 天 |
| 🔴 **P0** | Poisson 求解器体检：padding test + 周期长度是否在 $L_x$ 量级 | Lattice Green's | < 1 天 |
| 🟠 **P1** | 评估 KSF-Chol 核插值替换 Stable Fluids 平流步的可行性（核选型 → 风格旋钮） | KSF-Chol | 2~4 周 |
| 🟠 **P1** | 水面稳定反馈项 $p=\chi\cdot\partial_t\eta$（游戏/实时水面） | 重力-毛细波 | 1~2 周 |
| 🟡 **P2** | level-set $\|\nabla\phi\|$ 作厚度代理 → 驱动泡沫生成 + 消光调制（**零求解器改动**） | 界面热力学 | 3~5 天 |
| 🟡 **P2** | 实时烟雾：涡量历史注入 / 多历史 curl 噪声叠加 | 湍流耗散 | 2~3 周 |
| ⚪ **P3** | 离线预烘焙穿水柱绕射场 + 水痕带曲线 | 波浪散射 | 3~4 周 |
| ⚪ **P3** | 多历史 curl 噪声（材质细节再注入）通用化 | 界面热力学 + 湍流 | — |

---

## 🔗 本期笔记清单

- [[2026-11-03-KSF-Chol-Kernelized-Stable-Fluids]]
- [[2026-11-03-Poncelet-Lattice-Green-Functions-Vortex-Tubes]]
- [[2026-11-03-Bilotta-Weakly-Compressible-SPH-Acoustic-Terms]]
- [[2026-11-03-Ding-Zhao-Gravity-Capillary-Waves-Stabilization]]
- [[2026-11-03-Bec-Eulerian-Lagrangian-Turbulent-Dissipation]]
- [[2026-11-03-Chen-Wang-Shang-Nonlinear-Wave-Scattering-Cylinder]]
- [[2026-11-03-Enriched-Surface-Thermodynamics-Sharp-Interface]]

---

## 📎 交叉引用（往期相关）

- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — 两相流统一闭合（与界面热力学互补）
- [[2026-11-02-Hamiltonian-Two-Way-Coupling-Nonlinear-Waves-3D-Flows]] — Zakharov 波动模型
- [[2026-11-02-DELUGE-Real-time-Particle-Streaming]] — 粒子流式传输
- [[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-I-Local-Constructions]] — 点涡视觉正则化
- [[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]] — 液滴破碎曲率分支

---

**🐟 豆苗 · 2026-11-03 14:30 UTC**
