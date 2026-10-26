---
type: daily-report
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
status: completed
keywords: [fluid-rendering, water-rendering, smoke-rendering, fire-simulation, ocean-rendering, particle-system, volume-rendering]
sources: [arxiv-cs.GR, arxiv-physics.flu-dyn, siggraph-asia-2026, siggraph-2026, physicsbasedanimation.com, wetafx]
---

# 📅 每日论文搜索报告 — 2026-10-26

## 🔎 搜索概要

| 项目 | 值 |
|------|---|
| **运行时间** | 2026-10-26 14:09 UTC（周一） |
| **搜索窗口** | 24h（10/25 14:09 → 10/26 14:09） |
| **数据源** | arXiv API（cs.GR 全量 3 页 + 24 组流体关键词定向 + `submittedDate` 区间精确查询 + physics.flu-dyn）+ SIGGRAPH Asia 2026 官方录用 PDF + physicsbasedanimation.com（Christopher Batty 维护的图形学物理博客）+ SIGGRAPH 2026 proceedings TOC + 各论文项目页 |
| **查询次数** | arXiv API 约 40 次（**https + `-L`**）+ Web 搜索 3 次 + Web 抓取 12 次 + 项目页抓取 8 次 + 4 个并行子代理 |
| **结论** | **窗口内 arXiv 0 篇新流体论文**（周末停更 + 周一批次尚未发布）→ **转向填补 SIGGRAPH Asia 2026 系统性缺口（7 篇）** |

> ⚠️ **技术备忘（沿用并验证 10-24/10-25 的规范）**：`http://export.arxiv.org/api/query` 仍返回 **HTTP 301 + 空响应体**；必须用 `https://export.arxiv.org/...` 加 `-L`。方括号在 URL 中必须百分号编码（`submittedDate:%5B...%5D`），否则 curl 报 `bad range in URL`。**若静默返回 0 字节却按"无结果"处理，会产生虚假空窗日** —— 这已是第 **4** 天复现同一陷阱，规范继续有效。
>
> 🆕 **本周期权威判定方法（重要改进）**：前几日用"全量最新 N 篇 + 关键词匹配"来判断空窗，**存在漏判风险**。本次改用 arXiv API 的 **`submittedDate` 区间精确查询**（`cat:cs.GR AND submittedDate:[202610190000 TO 202610262359]`），**这是权威判定** —— 不会再有"批次边界漏看"的问题。见下方"空窗日判定方法升级"。

---

## 📊 当日结果概览

### ⚠️ 连续第五个"空窗日"（arXiv 侧）—— 但已用权威方法确认

**2026-10-23 之后 arXiv cs.GR 无任何新提交。** 本次用**五种独立方式**交叉验证，其中第三种为**权威判定**：

| 检索策略 | 结果 |
|----------|------|
| arXiv API `cat:cs.GR` 按提交时间倒序取 60 篇 | 最新为 **2026-10-23**（2 篇：Past as State / RADIANT，均非流体） |
| arXiv API `cat:cs.GR AND submittedDate:[202610230000 TO 202610262359]`（**精确区间**） | 窗口内 **2 条**，均非流体渲染 |
| arXiv API `cat:cs.GR AND submittedDate:[202610190000 TO 202610262359]` 跨 3 页 | 共 **26 篇**，其中唯一流体相关为 **2610.25660 FluidGen（10-19）**，已收录 |
| arXiv API `cat:physics.flu-dyn` 最新 12 篇 | 最新为 **2026-10-23**（PINN 湍流、泡状液体、神经基方法等，非渲染） |
| arXiv `/list/cs.GR/new` 网页 | 头部显示 "Monday, 26 October 2026"（**公告日**，非提交日 —— 见下方辨析） |

#### 🕐 关于 "/new 页面显示 Monday, 26 October 2026" 的重要辨析

arXiv 的 `/list/cs.GR/new` 页面今日头部确实显示 **Monday, 26 October 2026**，这**不是**"10-26 有新提交"，而是 **arXiv 在周一 00:00 UTC 公告周五（10-23）提交批次**的日期显示。该页面为 JS 动态渲染（`curl` 拿到的 HTML 中**无任何 `/abs/` 链接**，已实测确认），因此**以 API 的 `published` 字段为唯一可信依据**。

> 📌 结论：**10/26 当日无新提交**；最新批次为 **10-23（周五）**。周末 + 周一announce 的机制导致周一至周五上午的"空窗"是 arXiv 的常态，而非抓取失败。

### 窗口内 cs.GR 新增论文（2 篇，均非流体渲染）

| arXiv ID | 标题 | 排除原因 |
|----------|------|----------|
| 2610.32373 | Past as State, Present as Attention: 共语音动作长程生成 | 动作生成，非流体 |
| 2610.32075 | RADIANT: Object-Centric Feed-Forward Global Illumination | 全局光照，非流体 |

---

## ✅ 本次创建结构化笔记（7 篇 —— 填补 SIGGRAPH Asia 2026 系统性缺口）

**背景**：10-25 日报已识别出本库对 SIGGRAPH Asia 2026 的**系统性覆盖缺口**。本次通过 **physicsbasedanimation.com**（Christopher Batty 维护，SA2026 全部 29 篇技术论文的完整标题列表）+ SIGGRAPH Asia 官方录用 PDF + 各项目页，**逐篇与本库 584 个 md 文件做精确标题匹配**，得到精确缺口清单（10 篇未收录），并按渲染相关度筛选出 **7 篇**建笔记。

| # | 论文 | 会议/期刊 | 渲染类别 | 笔记 |
|---|------|----------|---------|------|
| 1 | **Lanczos Advection**: Near-Orthogonal Semi-Lagrangian Reconstruction for Fluid Simulation | SA2026 / TOG 45(6) Art.245 | 🌊 **平流算子（画质核心）** | [笔记](2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction.md) |
| 2 | **The Power Partitioner**: 稀疏动态域的最优传输分区 | SA2026 演讲 / TOG 45(2) Art.20 | ⚙️ 分布式仿真基础设施 | [笔记](2026-10-26-Power-Partitioner-Optimal-Transport-Distributed-Sim.md) |
| 3 | **Beyond Kirchhoff-Love**: 体积力学推导的薄壳（VC-Shell） | SA2026 / TOG 45(6) Art.217 | 🔵 体积力学 / 表面变形 | [笔记](2026-10-26-Beyond-Kirchhoff-Love-Volumetric-ThinShell.md) |
| 4 | **RealSimLoop**: 可微降阶仿真 + 视觉反馈在线 Real2Sim | SA2026 / arXiv 2609.09828 | 🧪 可微物理 + 神经降阶 | [笔记](2026-10-26-RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder.md) |
| 5 | **DiffPhD**: 统一可微异质投影动力学求解器 | SA2026 / arXiv 2605.14526 | 🛠️ 可微求解器 | [笔记](2026-10-26-DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics.md) |
| 6 | **REST3D**: 单图物理稳定 3D 场景重建 | SA2026 / arXiv 2605.30338 | 🏗️ 重建管线 | [笔记](2026-10-26-REST3D-Single-Image-Physically-Stable-Scene.md) |
| 7 | **Fast Cutting of Cage Deformation with Walk on Spheres** | **SIGGRAPH 2026** | ✂️ 实时交互编辑 | [笔记](2026-10-26-Fast-Cutting-Cage-Deformation-Walk-on-Spheres.md) |

---

## 🏆 本期重点：Lanczos Advection（工程性价比最高）

这是本次检索中**对流体渲染画质提升最直接、工程落地成本最低**的一篇。

### 一句话

**把 Stable Fluids 求解器里的"三线性插值"换成 "Lanczos 核（窗化 sinc）加权求和"，即可在几乎不改动管线的前提下显著减少数值耗散。**

### 关键数字（由子代理从 PDF 矢量路径几何精确提取，非目测）

| 指标 | 结果 |
|------|------|
| **能量保持**（2D 衰减湍流，1500 步） | **LMC 保留 35.5% 初始动能 vs SF 仅 8.3% → 高出约 4.3×** |
| **正交性 σ(A)**（CFL=12） | LSF2.0 ≈ 0.00296 **优于 MCIP 的 0.00303**（高阶图学格式） |
| **运行时开销** | LSF 相对 SF **1.30–1.39×**（常比 MCIP 更便宜）；LMC 相对 MC **1.28–1.44×** |
| **归一化消融** | 行归一化仅增加 σ **2.69×10⁻⁷ %**；加列归一化 +0.019%；Sinkhorn +0.042% → **故只用行归一化** |
| **硬件** | Ryzen 5 7600 + RTX 4080 SUPER，Taichi 实现 |

### 核心机制

- **sinc 函数的整数移位正交性** → 若算子列近似移位 sinc 基，则列间相关性最小化 → 算子趋于正交 → 动能得以保持
- **保体积回溯**（无散速度 → `det(∂Φ/∂x)=1`）→ 给出散射归一化
- **软边界限幅器**：λ=0.02（速度，修正量 ≤ 局部源跨度的 2%）/ α=1（标量）；证明输出恒在 `[q_min, q_max]` 内，插值步 **L∞-nonexpansive**
- **诚实声明**：作者明确**不声称**有限半径 Lanczos 算子精确正交；ENO/WENO/TENO 在 σ(A) 上与 LSF2.0/LMC2.0 处于同一水平带

### 对算法 Agent 的直接建议

1. 替换 `sample(field, pos)` 的三线性插值为 Lanczos 加权求和（a=2.0）
2. 同时算三线性值作**可信源** `q_lin` 与 8 角点包络 `[q_min, q_max]`
3. 施加两阶段软边界限幅器（**务必**对比开关限幅器，避免负密度）
4. **回溯速度保持线性插值即可**（论文实测 Lanczos 化回溯速度改善可忽略）
5. 用动能曲线验证保持效果，用 σ(A) 验证正交性

---

## 🏭 Wētā FX 的工业级分区方案（值得单独记一笔）

**"The Power Partitioner"** 是本次检索中唯一的**真实电影生产数据**评估的论文，作者全部来自 **Wētā FX**（《指环王》/《阿凡达》级 VFX 工作室）。

| 指标 | 相对 SFC | 相对 METIS |
|------|----------|-----------|
| **时间一致性指数 ν** | **好 9.34×** | **好 505×**（METIS 每步打乱 57% 的域） |
| **表面指数 σ**（通信量代理） | 好 1.83× | **0.82×（略逊于 METIS）** |
| **重划分数据传输量** | — | 最多少 **422.8×** |
| **端到端运行时** | — | Boat wake：METIS **7h26m** → Power **2h13m**（**3.35×**） |

**规模**：133 个生产缓存 / 102,580 帧语料库；1.69 亿粒子 / 4 台机器；Fig. 1 为约 **500 GB 的 PIC 水体仿真** / 8 ranks。**纯 CPU**（64 物理核/节点，OpenMP，20 Gbps，RTT 0.1–0.5 ms）。

**技术要点**：熵正则化**平衡**最优传输 + **幂图**分区 + Sinkhorn 求解（`O(R|D|)`）+ Lloyd 迭代；关键调度 `E=10`、`η=2/3`、`τ_load=0.01`；**重划分每步一次 + warm-start + 位点时间恒定**。

**对本库的价值**：其 **surface index / temporal consistency index** 两个指标可直接用于量化大规模流体渲染的集群资源分配质量。**注意**：论文无渲染实验，与流体渲染的关联是**间接的**（吞吐/分辨率/显存余量），且**无 arXiv 版本、无代码**。

---

## 🔬 其余论文要点速览

### VC-Shell（Beyond Kirchhoff-Love）—— 物理正确性最高的一篇

**核心发现**：KL 薄壳本质上是"**厚度方向无限刚**"的各向异性材料，**即使在小变形下也无法复现体积材料的泊松收缩**。最直观的视觉案例：硅胶薄壳裹在六角螺栓上被拉伸时，泊松效应使厚度收缩、**螺栓重新可见** —— KL 壳（含改进版 KL-Shell++）做不到。

**精度**：Cook 膜 8× 网格加密，相对 L2 误差 **55.9% → 30.9% → 11.8% → 3.7%**（收敛率 ≈1.5），尖端挠度与经典值相差 **0.5% 以内**；曲面静止构型（球/椭球/蚂蚁）误差 **<0.09% ~ 0.5%**。

**性能**：比体积仿真（C3D10）快 **2.6× / 4.6× / 2.7×**（单轴拉伸/气球/重力鼓）。

**实现关键**：主伸长率用 **2×2 广义特征值求解（免 SVD）**；系统处理主伸长率重合的**可去奇点**（`ψ_gradρ` 在 λ=ρ、弯曲能在 λ₁=λ₂）；补充材料提供完整闭式梯度/Hessian（52 页）。

> ⚠️ **诚实边界**：论文**无任何流体仿真、无流固耦合**（子代理全文扫描确认）。与流体渲染的关联是间接的 —— 但**薄壁容器盛流体**是典型场景（KL 壳会系统性高估壁面抵抗流体压力的能力）。

### RealSimLoop —— 可微物理 + 神经降阶的完整管线参考

- **降阶神经子空间**（r=8~100 vs n=3.6K~15K）+ **伴随法反向传播** + **可微 3DGS** + **滑动窗口在线目标**
- **加速**：Material Bar 3.30s→0.53s（**6.23×**）、Eiffel Tower 1.36s→0.18s（**7.56×**）、Dinosaur 7.77s→1.01s（**7.69×**）
- **视觉反馈 vs 标记点**：平均 sim-to-real 误差 **7.1 mm → 4.6 mm**
- **落地建议**：滑动窗口机制可直接移植；**但降阶在高度动态场景会不收敛**（论文对高速球案例回退全空间）—— 流体中的湍流/自由面破碎恰是降阶最弱的场景

### DiffPhD —— 当前最完整的可微异质求解器，**代码已开源**

- 三重集成：**刚度感知投影装配**（异质性走全局算子、不走局部 prox）+ **信赖域特征值滤波（只在反向）** + **统一 GPU 管线**（单一稀疏因子跨前向/反向/接触复用）
- **100× 刚度对比下仍收敛**（DiffPD 在 ~10× 后失败）；比既有可微求解器最高 **10× 加速**
- **解析伴随**：弹性路径机器精度，接触下有界可量化
- 演示含 Google 机械臂 Real2Sim（10 Pa 爪夹 4.55×10⁴ Pa 软体，**唯一保持数值稳定**）

### REST3D —— 单图重建的物理稳定性

填补本库"从图像到可仿真资产"管线中易被忽略的一环：**穿模/悬空的场景在后续仿真中会直接爆炸**。方法 = **智能体式物理场景理解（场景树 + 重力支撑推理）** + image-to-3D 初始化 + 场景树引导对齐 + 物理约束优化；**代码已开源**。

### Fast Cutting (Walk on Spheres) —— 局部增量复用的通用范式

**关键观察**：局部切割**只使 5-10% 的 walks 失效** → 只重算受影响部分 → **10×~40× 加速**且与完整重算**统计意义上一致**。**代码已开源**。这个"局部修改实际失效多少？"的提问范式，对实时流体控制同样适用。

---

## 🔍 覆盖缺口进展

### SA2026 缺口：从 10 篇降至 3 篇

用**精确标题匹配**（非模糊 token 匹配，避免 1.2 MB 全库 blob 造成的误判）逐一核查 29 篇 SA2026 论文：

**本次新收录（7 篇）**：Lanczos Advection、Power Partitioner、Beyond Kirchhoff-Love、RealSimLoop、DiffPhD、REST3D、Fast Cutting

**仍未收录（3 篇，均与流体渲染无交集）**：
- Type-Free Global Intersection Analysis with Linear Displacement Fields
- Plane-based Potential Contact Model for Robot Control on GPU
- GPU-Accelerated Reissner-Mindlin Homogenization for Shellular Unit Cells from Implicit Geometry

**已在本库覆盖的 SA2026 论文（确认）**：WorldParticle、Lanczos Advection、ML Operator Lexicon、KPM-FR、RealSimLoop、Hamiltonian Two-Way Coupling、Divisor Dynamics、Flamescapes、REST3D、DiffPhD、Fast Cutting、Two-Phase Immiscible Flows、S4R、Efficient Open-Boundary Poisson Solves、Semi-Implicit Pairwise Descent、Vibrational Affine Body Dynamics、Full GKS Two-Phase Flow、Multi-level Quadrature、Energy-Controllable Time Integration、Interactive Control of Large-Scale Ecosystem Simulation、Purely Algebraic Solver、Discovering High Level Patterns from Simulation Traces、Implicit velocity projection for incompressible SPH、BubbleGym 等。

### SIGGRAPH 2026 侧

**Mixwell**（2D 流体笔刷）、**GauSmoke**、**LagrangianSplats** 等均已收录（多轮重复收录，已在库）。本次新增 **Fast Cutting of Cage Deformation**。

---

## 🧭 观察与趋势

1. **SA2026 的"物理正确性回潮"**：本期 3 篇（VC-Shell、DiffPhD、RealSimLoop）都在攻击既有方法的**物理简化错误**，而非追求速度 —— 说明图形学物理模拟的重心正从"更快"转向"**更对**"（KL 壳的泊松缺失、DiffPD 的刚度对比崩溃、离线 Real2Sim 的开环漂移）
2. **可微 + 降阶 + 渲染三件套成型**：RealSimLoop 把"神经降阶仿真 → 可微渲染 → 视觉损失 → 伴随法反向 → 滑动窗口在线更新"完整打通，且**代码开源 2/3**（DiffPhD、REST3D、Fast Cutting 均开源）—— 这是做**神经流体**的重要基础设施
3. **工业界主导增量优化**：Wētā FX 的 Power Partitioner 用 133 个生产缓存做评估，说明**大规模流体渲染的瓶颈已从渲染本身转向仿真与分布式调度**
4. **本周期的空白是方法性的**：本期 7 篇中**没有一篇是"新的渲染算法"** —— 全部是求解器/物理/基础设施。这本身是个信号：**渲染端已相对成熟，瓶颈在物理保真与工程规模**

---

## ⚠️ 待办与下一步

1. **SA2026 剩余 3 篇**与流体渲染无交集，暂不建笔记（可在下次 SA2027 周期统一复核）
2. **Power Partitioner 无代码** —— 若需落地需自行实现 Sinkhorn + 幂图分区
3. **VC-Shell 与 RealSimLoop 论文中均无流体应用** —— 若要在流体场景落地，需要自行做**流固耦合**与**降阶流体求解器**的适配，这是明确的工程成本
4. **arXiv 空窗期应对策略**：继续沿用"用 `submittedDate` 精确区间查询 + 会议侧缺口填补"的双轨制 —— 周一至周五上午基本必然空窗，**把会议侧缺口做深**比等待 arXiv 更有效
5. **待观察**：arXiv 10-26 当日批次（预计 10-27 UTC 公告）是否会带来流体渲染新论文

---

## 🔗 本次新增笔记索引

- [Lanczos Advection](2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction.md) · 🌊 平流算子
- [Power Partitioner](2026-10-26-Power-Partitioner-Optimal-Transport-Distributed-Sim.md) · ⚙️ 分布式分区
- [Beyond Kirchhoff-Love](2026-10-26-Beyond-Kirchhoff-Love-Volumetric-ThinShell.md) · 🔵 体积薄壳
- [RealSimLoop](2026-10-26-RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder.md) · 🧪 可微降阶
- [DiffPhD](2026-10-26-DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics.md) · 🛠️ 可微求解器
- [REST3D](2026-10-26-REST3D-Single-Image-Physically-Stable-Scene.md) · 🏗️ 物理稳定重建
- [Fast Cutting WoS](2026-10-26-Fast-Cutting-Cage-Deformation-Walk-on-Spheres.md) · ✂️ 交互编辑
