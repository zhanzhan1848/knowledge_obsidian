---
type: daily-report
date: 2026-10-25
agent: doumiao
domain: fluid-rendering
status: completed
keywords: [fluid-rendering, water-rendering, smoke-rendering, fire-simulation, ocean-rendering, particle-system, volume-rendering]
sources: [arxiv-cs.GR, arxiv-physics.flu-dyn, siggraph-asia-2026, siggraph-2026]
---

# 📅 每日论文搜索报告 — 2026-10-25

## 🔎 搜索概要

| 项目 | 值 |
|------|---|
| **运行时间** | 2026-10-25 14:16 UTC（周日） |
| **搜索窗口** | 24h（10/24 14:16 → 10/25 14:16） |
| **数据源** | arXiv API（cs.GR 全量 200 篇 + physics.flu-dyn 定向 + 6 组关键词定向）+ arXiv `/list/cs.GR/new` + SIGGRAPH Asia 2026 / SIGGRAPH 2026 论文列表 |
| **查询次数** | arXiv API 约 12 次（**https + `-L`**，规避 301 与限流）+ Web 搜索 6 次 + Web 抓取 10 次 |
| **结论** | **窗口内 0 篇新 arXiv 论文（周末停更）** → 转向**填补 SIGGRAPH Asia 2026 流体论文缺口（4 篇）** |

> ⚠️ **技术备忘（沿用并验证 10-24 的规范）**：`http://export.arxiv.org/api/query` 返回 **301 + 空响应体**；必须用 `https://export.arxiv.org/...` 加 `-L`。另外**方括号在 URL 中必须百分号编码**（`submittedDate:%5B...%5D`），否则 curl 报 `bad range in URL`。若静默返回 0 字节却按"无结果"处理，会产生**虚假空窗日** —— 这已是第 3 天复现同一陷阱，本规范继续有效。

---

## 📊 当日结果概览

### ⚠️ 连续第四个"空窗日"（arXiv 侧），但缺口在实质收敛

**2026-10-22 之后 arXiv cs.GR 无任何新提交。** 本次用**四种独立方式**交叉验证：

| 检索策略 | 结果 |
|----------|------|
| arXiv API `cat:cs.GR` 按提交时间倒序取 200 篇 + 流体关键词全文匹配 | 10/22 后命中 **0** 篇 |
| arXiv API `cat:cs.GR AND submittedDate:[202610240000 TO 202610252359]` | 窗口内 **0** 条 |
| arXiv API `cat:physics.flu-dyn AND submittedDate:[202610240000 TO 202610252359]` | 窗口内 **0** 条 |
| arXiv `/list/cs.GR/new` 网页 | 最新批次为 **Friday, 23 October 2026**（5 条，全为 cross-list/replacement） |

> 📌 **10/25 是周日**，arXiv 周末不接收新投稿；最近一篇流体渲染 cs.GR 论文仍为 **2610.25660 FluidGen（10-19）**，已于 10-21 收录。**窗口为空是真实状态，非抓取失败。**

### 窗口内 cs.GR 新增论文（0 篇）

无。10/23 批次的 5 条（3 cross-list + 2 replacement）已在 10-24 报告中复核并排除。

---

## ✅ 本次创建结构化笔记（4 篇 —— 填补 SIGGRAPH Asia 2026 / SIGGRAPH 2026 缺口）

本库的 SIGGRAPH Asia 2026 覆盖存在**系统性缺口**：SA2026 的论文列表在 9 月公布，但本库此前仅收录了 **2 篇**（Hamiltonian Two-Way Coupling、WorldParticle），其余流体/模拟论文**要么只有一行条目，要么完全缺失**。本次按"渲染相关度 × 信息完整度"排序补齐 4 篇：

| # | 论文 | 会议 | 渲染类别 | 信息源 | 笔记 |
|---|------|------|---------|--------|------|
| 1 | **Flamescapes: Simulating the Wildlandfire Urban Interface** | SA2026 / TOG | 🔥 火焰渲染 + 体积渲染 | 项目页全文（`helgewrede.github.io/flamescapes`） | [[Flamescapes-Wildlandfire-Urban-Interface]] |
| 2 | **Divisor Dynamics for Surface Fluid Simulation** | SA2026 / TOG | 🌊 表面流体 + 涡方法 | 项目页 + 作者主页 + 交互 Demo | [[Divisor-Dynamics-Surface-Fluid]] |
| 3 | **KPM-FR: Kinetic Predicted-Moment Flux Reconstruction** | SIGGRAPH 2026 / TOG 45(4) | ⚙️ 高阶流体求解（渲染上游） | 项目页（含 DOI 10.1145/3811292、完整摘要） | [[KPM-FR-High-Order-Flux-Reconstruction]] |
| 4 | **ML Operator Lexicon for PDE Solvers on Irregular and Sparse Domains** | SA2026 / TOG | 🛠️ 求解器基础设施（可微管线） | NVIDIA PRL 官方页 + 完整摘要 | [[ML-Operator-Lexicon-PDE-Solvers]] |

---

## 📋 SIGGRAPH Asia 2026 流体/模拟论文覆盖审计

基于 `physicsbasedanimation.com` 维护的 SA2026 官方论文列表（Christopher Batty, Waterloo），逐篇核查本库状态：

| SA2026 论文 | 本库状态 | 备注 |
|-------------|---------|------|
| A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows | ❌ 缺失 | 两相流/不可混溶 —— **高优先级待补** |
| S4R: Scaling for Rigid-Body Interpenetration Resolution | ❌ 缺失 | arXiv 2609.20524 存在，**可补** |
| Efficient Open-Boundary Poisson Solves | ❌ 缺失 | 与 [[ML-Operator-Lexicon]] 主题相关 |
| Semi-Implicit Pairwise Descent for Nonlocal Continuum Mechanics | ❌ 缺失 | |
| WorldParticle | ✅ 已收录 | 2026-06 |
| Vibrational Affine Body Dynamics | ❌ 缺失 | 非流体 |
| **Lanczos Advection: Near-Orthogonal Semi-Lagrangian Reconstruction** | ❌ 缺失 | 半拉格朗日平流 —— **渲染侧高相关，待补** |
| **ML Operator Lexicon** | ✅ **本次收录** | |
| **An Extended Full GKS Formulation (Two-Phase, Low-Memory)** | ⚠️ 仅一行条目 | 2026-08-16 报告中的第 10 条，无独立笔记 |
| RealSimLoop | ❌ 缺失 | 可微降阶 —— 与 ML Operator Lexicon 互补 |
| **KPM-FR** | ✅ **本次收录** | |
| Multi-level Quadrature for Projective Dynamics | ❌ 缺失 | 非流体 |
| Energy-Controllable Time Integration for Elastodynamic Contact | ❌ 缺失 | 非流体 |
| Type-Free Global Intersection Analysis | ❌ 缺失 | 非流体 |
| Plane-based Potential Contact Model | ❌ 缺失 | 非流体 |
| DiffPhD | ❌ 缺失 | 非流体 |
| REST3D | ❌ 缺失 | 非流体 |
| **Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows** | ✅ 已收录 | 2026-08-28/29 |
| A Practical Partitioner for Distributed Simulations (Optimal Transport) | ❌ 缺失 | |
| **Divisor Dynamics** | ✅ **本次收录** | |
| Beyond Kirchhoff-Love | ❌ 缺失 | 非流体 |
| **Flamescapes** | ✅ **本次收录** | |
| Fast Cutting of Cage Based Deformation | ❌ 缺失 | 非流体 |
| Interactive Control of Large-Scale Ecosystem Simulation | ❌ 缺失 | 非流体 |
| A Purely Algebraic Solver for Locally Stiff Linear Systems | ❌ 缺失 | 非流体 |
| Discovering High Level Patterns from Simulation Traces | ❌ 缺失 | 非流体 |
| GPU-Accelerated Reissner–Mindlin Homogenization | ❌ 缺失 | 非流体 |
| **Implicit velocity projection method for incompressible SPH fluids** | ❌ 缺失 | SPH 隐式投影 —— **高优先级待补** |
| **BubbleGym: A Practical Shape-to-Frequency Model for Acoustic Bubbles** | ❌ 缺失 | 气泡声学 —— 与水/气泡渲染相关 |

### 🔎 优先级排序（下次补库目标）

| 优先级 | 论文 | 理由 |
|-------|------|------|
| 🔴 高 | **Lanczos Advection** | 半拉格朗日平流是**实时流体渲染的绝对核心**；近正交重构直接关系到烟雾/水面的数值耗散与视觉锐度 |
| 🔴 高 | **Implicit velocity projection for SPH** | SPH + 隐式投影 → 直接面向**水/液体粒子渲染** |
| 🟡 中 | **An Extended Full GKS Formulation** | 两相流 + 低内存；与本次 KPM-FR 同族（GKS 血统），可对照阅读 |
| 🟡 中 | **Unified Multi-Scale Two-Phase Immiscible Flows** | 油水混合、泡沫分离 —— 多相渲染 |
| 🟢 低 | **BubbleGym** | 气泡形状→频率模型；声学为主，渲染次要 |

---

## 🔬 本次论文要点速览

### 1️⃣ Flamescapes — 野火-城市界面（WUI）火灾模拟 🔥

- **TAG 标签**：`#SIGGRAPH Asia 2026` `#TOG` `#体积渲染` `#燃烧模拟` `#射线辐射` `#余烬粒子` `#程序化城市生成`
- **核心思想**：把**语义化的城市三维结构**（四级燃料图：atomic module → wall panel/stud → wall → house）与**化学驱动的混合 Eulerian–Lagrangian 燃烧求解器**耦合；建筑构件**独立燃烧并几何退化**。
- **四条蔓延通道**：直接火焰接触 / 热辐射 / 余烬输运 / 显式火焰前沿。
- **渲染侧关键**：最终场交给**体积流体渲染器**；**几何退化与视觉退化解耦**（物体先消失，火焰滞后出现）是真实火场的核心视觉特征。
- **已验证**：NIST 干冷杉燃烧实验对照、通道消融、植被清除（防御空间）对比。

### 2️⃣ Divisor Dynamics — 任意拓扑曲面上的点涡 🌊

- **TAG 标签**：`#SIGGRAPH Asia 2026` `#表面流体` `#点涡方法` `#拓扑不变量` `#代数几何`
- **核心思想**：在**非单连通曲面**上，把谐波分量的动力学纳入考虑 ⟺ 引入一个**时间守恒的新流体不变量**，该不变量可由黎曼曲面上点涡的**因子类 (divisor class)** 表述 —— 首次在流体力学与代数几何间架桥。
- **算法**：对经典 **vortex particle-on-mesh 方法的简单修改**。
- **渲染侧关键**：**拓扑意识是渲染的一部分** —— 雕塑表面的洞/拓扑会改变流体动力学，传统求解器假装所有网格是平面就会在有洞处出错。

### 3️⃣ KPM-FR — 高阶高性能流体格式 ⚙️

- **TAG 标签**：`#SIGGRAPH 2026` `#TOG 45(4)` `#气体动理学` `#通量重构` `#GPU性能` `#低内存`
- **核心思想**：GKS 血统 + FR 框架，**动理学演化完全在矩空间**进行（而非分布函数空间）→ 显存比 LBM 降 **5 倍以上**，数值耗散大幅降低。
- **性能**：单消费级 GPU **> 8×10⁹ 解点更新/秒**；**单台桌面工作站 18 亿解点**。
- **渲染侧关键**：**细尺度涡结构保真 = 烟雾渲染质量**（省的是美术工时）；**2 个 fused kernel/时间步**意味着求解器与渲染可共享显存。

### 4️⃣ ML Operator Lexicon — ML 算子化的 PDE 求解器 🛠️

- **TAG 标签**：`#SIGGRAPH Asia 2026` `#NVIDIA PRL` `#矩阵自由` `#多重网格` `#伴随微分` `#可微管线`
- **核心思想**：把 PDE 求解器分解为 **5 类 ML 张子算子**（均匀 stencil / 逐点系数 / 掩码 / 归约 / 局部边界修正），用 **ML 栈的词汇**表达**成熟的数值离散** —— **不学习求解器**，但白拿 autodiff 与后端加速。
- **覆盖**：多重网格、多重网格预条件 Krylov、**伴随微分**；稀疏/不规则/逆问题。
- **渲染侧关键**：**可微求解器 = 可微渲染管线** —— 这是打通"物理模拟 → 可微艺术控制"链路的缺失零件。

---

## 🧭 趋势观察

**本期四条论文串起来是一条清晰的线索：流体的"渲染上游"正在被系统性地重新设计。**

| 层次 | 本期论文 | 共同趋势 |
|------|---------|---------|
| **求解格式** | KPM-FR | 从"格式之争"转向**显存/吞吐/精度三者同时优化**；动理学与高阶格式合流 |
| **求解抽象** | ML Operator Lexicon | 求解器从"C++ 专用库"转向**ML 原生算子**；可微性成为一等公民 |
| **物理模型** | Flamescapes | 从"均匀介质"转向**语义化/结构化**燃料；几何与视觉解耦 |
| **拓扑与几何** | Divisor Dynamics | 流体动力学与**代数几何**交汇；拓扑自由度被显式守恒 |

**对豆苗（渲染方向）的判断：**

1. **可微渲染是下一个主战场**。ML Operator Lexicon + RealSimLoop（待补）+ FluidGen / Fluid-Gen-Zero（本库已收录）构成一条清晰的线索：**物理模拟不再是渲染管线的黑盒，而是可优化模块**。一旦求解器可微，"用梯度调烟雾的涡旋强度""用梯度做风格化流体"这类工作就变得自然。

2. **几何-视觉解耦值得单独追踪**。Flamescapes 的"物体先烧掉、火焰滞后出现"是一个简单但被普遍忽略的真实感来源。同类思路在其他场景也成立：**水花先离体、泡沫滞后**、**碎裂后碎片先分离、尘雾滞后**。这类**时序错位**是低成本高收益的细节。

3. **拓扑正确的表面流体是被低估的方向**。Divisor Dynamics 的交互式 Demo 表明这类效果有直接的创作需求（线描水流、书法笔触、雕塑表面流动）。

4. **高阶求解器对渲染是"省美术"而非"省算力"**。KPM-FR 的价值在于同等网格下拿到更多细尺度细节 —— 这意味着**不再需要靠贴图/合成去补细节**，美术能直接受益。

---

## 📌 下次行动建议

- [ ] 🔴 补 **Lanczos Advection**（半拉格朗日近正交重构）—— 需继续找项目页/作者页；ACM DL 被 Cloudflare 拦截，作者主页 `perso.telecom-paristech.fr/kum/` 已 404
- [ ] 🔴 补 **Implicit velocity projection for SPH**
- [ ] 🟡 补 **An Extended Full GKS Formulation**（与 KPM-FR 对照阅读）
- [ ] 🟡 补 **Unified Multi-Scale Two-Phase Immiscible Flows**
- [ ] 🟡 补 **S4R**（arXiv 2609.20524，信息可获取）
- [ ] 🟢 补 **BubbleGym**
- [ ] 🔧 **技术改进**：ACM DL（`dl.acm.org`）被 Cloudflare 拦截，**browser 与 web_fetch 均失败**。备选路线：项目页 → 作者主页 → arXiv 预印本。DBLP 与 Semantic Scholar API 今日**均返回 429 限流**。

---

## 🩸 可行性分析（本期综合）

## 渲染方法
- 类型：体积渲染（火焰/烟雾）+ 表面流体（网格变形）+ 高阶欧拉场（涡量驱动）
- 技术：KPM-FR 高阶求解器 → 体积渲染；Divisor Dynamics 拓扑感知点涡 → 网格顶点位移；Flamescapes 三通道结构（发光/吸收散射/余烬粒子）

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（几何-视觉解耦 + 分层燃料 + 细尺度涡结构保真）
- 风格化支持：⭐⭐⭐⭐⭐（可微求解器 + 点涡运动天然适合风格化）

## 性能预期
- 帧率：离线为主；KPM-FR 使实时求解成本下降一个量级
- GPU 需求：中–高
- 内存占用：中（矩空间 / mask 表达显著降低）

## 实现建议
- 着色器复杂度：中（标准 ray marching + 多通道合成 + 顶点位移）
- 管线要求：算子化的可微求解器 → 场纹理 → 体积/表面渲染 pass；求解器与渲染共享显存
- 推荐度：✅（本期四条论文共同指向"可微 + 高阶 + 结构化"的下一代流体渲染管线）
