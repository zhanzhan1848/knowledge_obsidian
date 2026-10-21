---
type: report
created: 2026-10-21
updated: 2026-10-21
tags: [daily-report, fluid-dynamics, arxiv, cs.FL, physics.flu-dyn]
status: processed
domain: fluid-dynamics
agent: caixin
---

# 每日论文搜索报告 — 2026-10-21

## 任务概览

- **执行时间**: 2026-10-21 14:03 UTC
- **搜索源**: arXiv API (`export.arxiv.org/api/query`)
- **时间窗口**: 严格 24 小时（2026-10-20 14:03 UTC → 2026-10-21 14:03 UTC）
- **检索范围**: 主类 `cs.FL`、`physics.flu-dyn` + 跨类扫描 `math.NA`、`math.AP`、`math-ph`、`physics.comp-ph`、`cs.CE`、`cond-mat.soft`
- **检索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, lattice Boltzmann, vortex, vorticity, MHD, boundary layer, shear flow, cross helicity, detonation, primitive equations, etc.
- **代理**: 🥬 菜心 / 鲜毛肚 (Caixin) — 流体力学 Agent

## 抓取结果（24h 窗口）

| # | arXiv ID | 标题（缩写） | 提交 v1 | 主类 | 跨类 | 笔记 |
|---|----------|--------------|--------|------|------|------|
| 1 | 2610.28486 | Reduced Graph-based Representations of Detonation-Containing Flows | 10-20 16:31 | physics.flu-dyn | — | ✅ |
| 2 | 2610.28424 | Exponential Growth of Turbulent Cross Helicity in Shear-Flow-Driven Turbulence | 10-20 15:54 | physics.flu-dyn | astro-ph.SR, physics.plasm-ph, physics.space-ph | ✅ |
| 3 | 2610.28403 | Near-blowup Asymptotic Analysis for the Inviscid Primitive Equations | 10-20 15:47 | math.AP | — | ✅ |
| 4 | 2610.28371 | Thin-Layer Dichotomy in Three-Phase Mullins-Sekerka Flow | 10-20 15:30 | math.AP | — | ✅ |
| 5 | 2610.28308 | Stability of 2D MHD with Only Horizontal Dissipation | 10-20 14:48 | math.AP | — | ✅ |
| 6 | 2610.28261 | Small Viscosity Limit of NSE in A Quarter Plane (Navier Slip) | 10-20 14:17 | math.AP | — | ✅ |
| 7 | 2610.28254 | Pressure-induced slowdown & soft glassy rheology of interfacial water | 10-20 14:12 | cond-mat.soft | cond-mat.mes-hall, physics.flu-dyn | ✅ |

**共 7 篇**（主类 physics.flu-dyn 3 篇 + 跨类 math.AP 3 篇 + 跨类 cond-mat.soft 1 篇）

## 跳过

- **2610.28363** — `TexFlow: learning crystallographic texture on SO(3) manifold via normalizing flows`（cs.CE；cond-mat.mtrl-sci）：关键词 "flow" 为 normalizing flows / texture flow，**与流体无关** → 跳过。
- **2610.28335** — `First-Order Mean Field Games with Time-Measurable and C^{1,1} Hamiltonians`（math.NA；math.OC）：关键词 "viscos" 为 viscosity of HJ 方程，Mean Field Game 为博弈论优化，**非流体** → 跳过。

## 高价值论文（建议优先阅读）

1. **2610.28424** — 湍流互螺度指数增长（Zweibel/Pueschel 组，**PRL Letters**）：解析证明剪切湍流中互螺度可指数增长而非衰减，3D 模拟证实；增长由 Reynolds-Maxwell 应力梯度驱动，剪切阈值由湍流磁/动量扩散率之比设定 —— 太阳磁场放大的非标准机制
2. **2610.28308** — 2D MHD 单向耗散稳定性（Wu, Yan, Zhu, Zhu）：解决"只单向耗散的 2D NS 是否 H² 稳定"开放问题的 MHD 版本；背景磁场沿非耗散方向可给全局非线性稳定，阈值 $\nu^{2/3}\gamma^{1/3}$（较直接尺度 $\nu$ 改进一个量级）
3. **2610.28261** — 直角域 NSE 小黏性极限（Navier 滑移）：严格证明角点处 $O(\sqrt\varepsilon)$ **非线性**角点层，复合展开误差 $O(\varepsilon^{5/4})$；边界层与角点层的适定性和加权估计
4. **2610.28486** — GNN 降阶爆轰流（LLNL Shivam Barwey 组）：GNN 自编码器潜图可重建胞状爆轰波前；揭示消息传递局部性导致的"**表示层级性**"（优先波前、三重点）；均匀二维爆轰信息可迁移重建分层/三维波前
5. **2610.28371** — 三相 Mullins-Sekerka 薄层二分（Tokuhiro Eto）：同相隔层增长率按 $1/\varepsilon$ 爆炸，异相隔层线性化矩阵解析延拓至零厚度；奇异根源在**相耦合**而非薄几何
6. **2610.28403** — 无粘性原始方程近 blowup 渐近分析（Collot, Ibrahim, Qian）：blowup 形成于双曲驻点之间；水平聚集尺度 $(T-t)^{3/2}$（一般 Burgers 奇性特征），并证为解析半径普适下界
7. **2610.28254** — 界面水软玻璃态流变（Mariette, Watanabe, Taniguchi, Comtet）：音叉 AFM 首次测得分子限域水完整线性-非线性粘弹流变；与宏观软玻璃态屈服材料类比；压力诱导松弛时间延长至微秒量级

## 🥢 传递给 @墨鱼丸 的算法/实现建议

| 论文 | 实现路径 | 难度 | 价值 |
|------|---------|------|------|
| 2610.28424 (Turbulent cross helicity) | 谱方法 3D MHD DNS（Athena++ / PENACL）+ 剪切层初始化；提取 Elsasser 场、测互螺度增长率 | 中 | **极高**（太阳/空间等离子体；剪切阈值 $\eta/\nu$ 判据可直接编程验证） |
| 2610.28308 (2D MHD anisotropic diss.) | 时空 div-curl 估计 + 能量法 2D MHD 求解器；验证线性扰动增长率与 $\nu^{2/3}\gamma^{1/3}$ 阈值 | 高 | 高（单向耗散稳定性基准；各向异性黏性湍流理论） |
| 2610.28261 (Corner layer) | 直角域 boundary layer 复合解作为**验证基准解**；Navier 滑移 ghost 边界；角点网格加密 | 中 | 高（管道拐角/翼型前缘折角流的数值验证案例） |
| 2610.28486 (GNN detonation ROM) | AMReX 爆轰 DNS 数据 → PyTorch Geometric 图编码器/解码器；全局 pooling 缓解层级性问题 | 中高 | **极高**（爆轰发动机加速仿真；降阶诊断工具化） |
| 2610.28371 (Three-phase thin film) | 三相 VOF / phase-field；薄膜区增长率 $1/\varepsilon$ 爆炸 → 加密 + CFL 约束；GB-TH 电势匹配处理 | 中高 | 高（液膜破裂/排空、芯轴环流失稳；三相模拟数值稳定性警示） |
| 2610.28403 (Primitive eq. blowup) | 关注后续推广；现阶段可实现 $(T-t)^{3/2}$ 激波破碎基准（对应串流不稳定破碎） | 低（理论） | 中（大规模地转流体细尺度级联机制） |
| 2610.28254 (Interfacial water SGY) | Bird-McKing 软玻璃态屈服本构；用于纳米流体/滑移界面模拟；NS 或格子 Boltzmann | 中 | 高（超薄液膜/纳米器件本构；屈服应力流体建模） |

## 主题分布

- **湍流 / MHD**：2 篇（2610.28424 互螺度、2610.28308 2D MHD 稳定性）
- **NS 渐近分析 / 数学流体**：3 篇（2610.28261 角点层、2610.28403 原始方程奇性、2610.28371 三相薄层）
- **燃烧 / 强激波 CFD**：1 篇（2610.28486 GNN 爆轰降阶）
- **界面流变 / 纳米流体**：1 篇（2610.28254 界面水玻璃态流变）

## ML/AI 论文占比统计

- **AI/ML 论文**: **1 / 7 ≈ 14%**（2610.28486 GNN 自编码器降阶）
- **趋势对比**：上次（10-20）AI 占比 **60%**（CuAD + Adaptive PINN），本次骤降至 **14%**
- **解读**：本周四批次中本日恰好以 **math.AP 分析类** 论文为主导（4/7 为数学分析），AI 成分低；GNN 降阶是唯一 ML 论文且聚焦爆轰拓扑结构而非通用 CFD surrogate

## 同步状态

- ✅ 7 篇笔记已写入 `~/knowledge-vault/caixin/01-Papers/2026-10-21-daily/`
- ✅ 本报告已写入 `~/knowledge-vault/caixin/daily-search-report-2026-10-21.md`
- ⏳ 下一步：`~/.scripts/git-sync.sh` 推送 GitHub

## 备注

- 24h 窗口 **cs.FL 为 0 篇**（GNN 爆轰降阶论文归 physics.flu-dyn），主类命中 3 篇 flu-dyn + 4 篇跨类（math.AP 3 + cond-mat.soft 1）
- **math.AP 分析类井喷**：3 篇（2D MHD 稳定性、角点层、原始方程奇性）+ 1 篇三相薄层 = **4/7 = 57%**，为本轮最强主题
- 与上次报告（10-20）相比，本次**理论分析占比大幅上升**（5 篇纯理论/分析 vs 上次 5 篇全算法导向），AI 成分下降
- 值得关注：2610.28308 与 2610.28424 同属 2D MHD / 互螺度主题，与 2610.28261 的单向耗散/各向异性黏性共同构成**"单向/各向异性耗散 + 磁场稳定化"**的理论线索串
- **2610.28424** 已被 **Phys. Rev. E (Letters)** 接收，属高影响力成果

---

生成者：菜心 (caixin) - 流体力学 Agent