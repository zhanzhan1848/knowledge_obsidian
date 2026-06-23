---
type: daily-report
created: 2026-06-23
agent: caixin
domain: fluid-dynamics
keywords: [CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence]
sources: [arXiv physics.flu-dyn, arXiv cs.FL]
date_range: 2026-06-22 to 2026-06-23
---

# 每日流体力学论文搜索报告 — 2026-06-23

## 搜索概况

| 项目 | 结果 |
|------|------|
| **搜索时间** | 2026-06-23 14:07 UTC |
| **搜索范围** | arXiv physics.flu-dyn, cs.FL (最近24小时) |
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence |
| **physics.flu-dyn 今日新文** | 40篇 |
| **cs.FL 今日新文** | 4篇 (无CFD相关) |
| **识别相关论文** | 16篇 |
| **创建笔记** | 10篇 |

---

## 论文清单

### 🔥 核心数值方法类 (CFD/数值方法)

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.22820](2026-06-23-Conservative-DG-LTS-Low-Mach-Flows.md) | Conservative Time-Accurate Local-Time-Stepping DG Scheme for Low-Mach-Number Flows | DG, LTS, Low-Mach, CFD |
| [2606.22048](2026-06-23-LBM-MD-Nonideal-Fluids.md) | Molecular Dynamics vs Lattice Boltzmann for Nonideal Fluids | LBM, MD, multiphase |

### 🔥 湍流模型类 (RANS/LES/DNS)

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.23287](2026-06-23-RANS-Flow-MRI-Assimilation.md) | Data Assimilation of Flow MRI into RANS Models | RANS, data assimilation, turbulence |
| [2606.23520](2026-06-23-TKE-Budget-Wall-Bounded-Turbulence.md) | Scaling Patch Analysis of TKE Budget in Wall-Bounded Turbulence | turbulence, TKE, wall-bounded |
| [2606.23269](2026-06-23-Turbulence-Transition-Pipe-Flow.md) | Minimal Energy for Turbulence Transition in Pipe Flow | turbulence, transition, pipe flow |
| [2606.21942](2026-06-23-DNS-Dissimilar-Heat-Transfer-Spanwise-Oscillation.md) | Pressure-Strain DHT under Spanwise Wall Oscillation (DNS) | DNS, heat transfer, spanwise oscillation |
| [2606.23059](2026-06-23-Non-normal-Weakly-Nonlinear-Analysis.md) | Non-normal Weakly Nonlinear Analysis | fluid stability, nonlinear |
| [2606.21046](2026-06-23-Vertical-Velocity-Intermittency-Wall-Flows.md) | Large-Scale Vertical Velocity Intermittency in Wall Flows | turbulence, intermittency |

### 🔥 涡旋/涡方法类

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.22638](2026-06-23-Bi-stable-NES-VIV-Subsea-Cables.md) | BNESs for VIV Mitigation in Subsea Cables | VIV, vortex, nonlinear energy sink |
| [2606.21484](2026-06-23-Multifractal-Vortex-Structures-Turbulence.md) | Multifractal Sets of Coherent/Incoherent Vortices in Turbulence | vortex, multifractal, turbulence |

### 🔥 神经网络/CFD交叉类

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.22084](2026-06-23-Patched-Flow-Matching-Wall-Pressure.md) | Patched Flow Matching for Wall-Pressure Reconstruction | AI, turbulence, generative model |
| [2606.21781](2026-06-23-PPLC-Latent-Compression-3D-Turbulence.md) | Physics-Preserving Latent Compression for 3D Turbulence | AI, compression, turbulence |
| [2606.21538](2026-06-23-ML-Predictability-Ceiling-Turbulence.md) | ML Predictability Ceiling Scaling Law in Chaotic Flow | AI, turbulence, predictability |

### 📊 Navier-Stokes/理论类

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.23338](2026-06-23-Eulerian-Lagrangian-2D-NS.md) | Eulerian-Lagrangian Relations in 2D Navier-Stokes Fluids | Navier-Stokes, Eulerian-Lagrangian |
| [2606.23342](2026-06-23-Interscale-Energy-Transfer-Boundaries.md) | Interscale Energy Transfer at Solid Boundaries | turbulence, energy transfer |

### 其他相关

| ID | 标题 | 关键词 |
|----|------|--------|
| [2606.22848](2026-06-23-Elastic-Turbulence-Viscoelastic-Porous.md) | Elastic Turbulence in Viscoelastic Flow through Porous Media | viscoelastic, chaos, porous media |
| [2606.21330](2026-06-23-Sonic-Fluidic-Oscillator-PIV.md) | Flow Mechanisms in Sonic Fluidic Oscillator | fluidics, PIV, oscillation |

---

## 值得关注的趋势

1. **AI+CFD 融合加速**: 3篇论文涉及 AI/ML 与湍流建模结合 (PPLC压缩, Flow Matching重建, ML预测极限)
2. **LBM 方法新进展**: MD与LBM的对比验证，为非理想流体LBM模型提供分子动力学基准
3. **DG方法**: 局部时间步进 DG 格式处理低马赫数流动，保持局部性和守恒性
4. **RANS数据同化**: flow MRI 实验数据同化到 RANS 模型，贝叶斯推断参数后验分布

## 同步状态

- Git同步: `~/knowledge-vault/.scripts/git-sync.sh` 待执行
