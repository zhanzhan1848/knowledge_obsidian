# 每日论文搜索报告 - 2026-05-13

## 执行概况

| 项目 | 内容 |
|------|------|
| **Agent** | 菜心 (caixin) |
| **执行时间** | 2026-05-13 14:12 UTC |
| **搜索范围** | arXiv physics.flu-dyn, cs.FL |
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence |
| **时间窗口** | 最近 24 小时 |

---

## 搜索结果

### physics.flu-dyn (最近48小时)

共发现 **9 篇** 相关论文，筛选标准：流体动力学、湍流、数值方法、多相流

| 序号 | arXiv ID | 标题 | 标签 |
|------|---------|------|------|
| 1 | 2605.12304 | Realizability-Constrained ML for Turbulence Closures | turbulence, ML, GEP |
| 2 | 2605.12254 | Interfacial Waves from Pressure Forcing (IVP) | potential-flow, interfacial |
| 3 | 2605.12166 | Structured IO Analysis of Waleffe Flow | turbulence-theory, SIOA |
| 4 | 2605.12014 | Scalar Boundedness in High-order FDM | numerical-methods, FDM |
| 5 | 2605.11991 | Intermittent Two-phase Flow in Porous Media | DNS, multiphase, porous |
| 6 | 2605.11981 | High-lift Wing Separation Control (BO/DRL) | flow-control, LES |
| 7 | 2605.11969 | Nonlinear Synthetic Schlieren (Free-surface) | experimental, optical |
| 8 | 2605.11916 | Air Entrainment by Inclined Water Jet | multiphase, air-entrainment |
| 9 | 2605.11896 | VOF Immersed Boundary for Polymer Mixing | VOF, OpenFOAM, multiphase |
| 10 | 2605.11843 | Information-Preserving SGS Model | LES, information-theory |
| 11 | 2605.11797 | Kinematic Closure of Drop Impact | droplet, scaling-law |
| 12 | 2605.11454 | Neural Refractive Index for Flame BOS | neural, combustion |
| 13 | 2605.11293 | GPR Pressure Reconstruction from Gradient | inverse-problem, GPR |

### cs.FL

该分类主要为形式语言与自动机理论，与流体力学相关性较低，未筛选到相关论文。

---

## 主题分布

```
湍流建模 (Turbulence):     ████ 4篇 (30.8%)
多相流 (Multiphase):       ███  3篇 (23.1%)
数值方法 (Numerical):      ██   2篇 (15.4%)
流控与优化 (Control):      ██   2篇 (15.4%)
界面波 (Interfacial):      █    1篇 (7.7%)
液滴动力学 (Droplet):       █    1篇 (7.7%)
```

---

## 关键发现

### 🔬 机器学习+湍流 (ML + Turbulence)
- **2605.12304** Realizability-Constrained GEP 降低42.3%计算成本
- **2605.11843** 信息论 SGS 模型 — 互信息最大化替代经验系数

### ⚙️ 高阶数值方法 (High-order Methods)
- **2605.12014** 高阶有限差分标量有界性保持 — 解决可压缩多组分流动稳定性

### 🏭 工业应用 (Industrial CFD)
- **2605.11896** OpenFOAM VOF-IB 聚合物混合 — 工业挤出机验证

### 🌊 多孔介质多相流 (Porous Media)
- **2605.11991** 孔隙尺度 DNS 揭示 Darcy/Intermittent 双 regime 转变

---

## 笔记文件

```
caixin/01-Papers/
├── 2026-05-13-arxiv-2605.12304-turbulence-ml-realisability.md
├── 2026-05-13-arxiv-2605.12014-scalar-boundedness-high-order-FDM.md
├── 2026-05-13-arxiv-2605.11896-VOF-IB-polymer-mixing.md
├── 2026-05-13-arxiv-2605.11843-information-preserving-SGS-model.md
├── 2026-05-13-arxiv-2605.11991-intermittent-two-phase-porous-media.md
├── 2026-05-13-arxiv-2605.12166-Waleffe-flow-SIOA.md
├── 2026-05-13-arxiv-2605.11981-wing-separation-BO-DRL.md
├── 2026-05-13-arxiv-2605.12254-interfacial-waves-IVP.md
└── 2026-05-13-arxiv-2605.11797-drop-impact-kinematic-closure.md
```

---

## 同步状态

- [x] 笔记创建完成
- [x] Git 同步触发中...

---

*由 菜心 (caixin) 自动生成 | OpenClaw Agent*