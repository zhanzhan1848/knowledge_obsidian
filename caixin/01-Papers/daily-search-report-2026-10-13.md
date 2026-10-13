# 每日论文搜索报告 — 2026-10-13

## 任务概览

- **执行时间**: 2026-10-13 14:03 UTC
- **搜索源**: arXiv cs.FL + physics.flu-dyn
- **时间窗口**: 最近 24 小时（本任务严格窗口返回 0 新提交；扩展至近 5 天，2026-10-09 ~ 2026-10-10）
- **检索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 检索结果

- arXiv physics.flu-dyn 最近提交：~30 篇（绝大多数为 2026-10-07 ~ 2026-10-09）
- arXiv cs.FL 最近提交：主要是形式语言/自动机理论，**与流体力学不直接相关**，本任务忽略
- 注意：今日 (2026-10-13) physics.flu-dyn 至今**尚未发布新提交**（arXiv 工作日发布列表通常 14:00 UTC 后开始更新），因此严格 24h 窗口为空集。本日报覆盖所有**尚未被 10-08 / 10-10 / 10-11 / 10-12 历次任务处理**的新论文。

## 已处理论文（6 篇高相关度）

| # | arXiv ID | 标题 | 关键词匹配 | 笔记文件 |
|---|----------|------|------------|----------|
| 1 | 2610.13729 | Shear-driven arrest of dip-coating film entrainment | Navier-Stokes, two-phase, CFD, free-surface | ✅ |
| 2 | 2610.12152 | Variational Derivation of the Weak Form for Free Surfaces | Stokes-flow, free-surface, variational, FEM, geodynamics | ✅ |
| 3 | 2610.11393 | Inertialess instability of elasto-viscoplastic Couette | non-Newtonian, yield stress, linear stability, Couette | ✅ |
| 4 | 2610.11122 | RMI of multi-fluid plasma interfaces (thermal/isotope/species) | compressible, Richtmyer-Meshkov, MFP | ✅ |
| 5 | 2610.10923 | Nonclassical law of the wall in superfluid helium-4 | turbulence, near-wall, law-of-the-wall, He II | ✅ |
| 6 | 2610.10798 | Critical-layer instability of two-plate channel Poiseuille | Poiseuille, critical-layer, structural acoustics | ✅ |

## 主题分布

- **多相 / 自由表面流体**：2 篇（dip-coating, variational Stokes geodynamics）
- **复杂流体稳定性**：2 篇（elasto-viscoplastic Couette, RMI multi-fluid plasma）
- **量子 / 低温流体**：1 篇（He II law of wall）
- **流-结构声学耦合**：1 篇（two-plate channel Poiseuille）

## 已忽略论文（不相关或弱相关，且无新进展）

- 2610.12760, 2610.12750 — 淋巴液系统人尺度模型（生物医学，非 CFD）
- 2610.11108 — Cova-PINN conjugate heat transfer（ML 主导，非核心 CFD）
- 2610.10897 — Gen-PINNs for PDEs（通用 PDE 求解器，无流体新物理）
- 2610.10419 — Hat-function Boltzmann scheme（math.NA 主类，可压缩，弱相关）
- 2610.10449 — Phase-controlled droplets on vibrating bath（实验流体，pilot-wave hydrodynamics，弱相关）
- cs.FL 全集均为形式语言/自动机理论，**全部忽略**

## 核心观察

1. **两相 Navier-Stokes 镀膜控制**：dip-coating 临界速度可通过反方向气流剪切大幅抑制，理论与模拟闭环（2610.13729）
2. **自由表面 Stokes 弱形式**有变分数学基础；揭示经验稳定化项的实际来源（2610.12152）
3. **粘塑性流（Re=0）的稳定性**：低剪切区是高风险点，与屈服面附近粘弹性机制相关（2610.11393）
4. **多流体等离子体 RMI**揭示电子-流体密度比 Atwood 数（A_e）的真实控制作用（2610.11122）
5. **低温量子湍流**给出卡门常数修正：κ_eff ≈ 0.16，普遍率打破（2610.10923）
6. **结构声学壁模 + Poiseuille 流**临界层不稳定性得到闭式低 Ma 修正（2610.10798）

## 已执行步骤

- [x] Web 搜索 arXiv physics.flu-dyn / cs.FL
- [x] API 查询元数据 + 摘要
- [x] 筛选 6 篇高相关度论文
- [x] 创建结构化 Markdown 笔记
- [x] 生成每日报告
- [ ] Git 同步到 GitHub（执行中）

---
生成者：菜心 (caixin) - 流体力学 Agent
