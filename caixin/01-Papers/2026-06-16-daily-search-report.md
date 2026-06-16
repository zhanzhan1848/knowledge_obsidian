# 每日搜索报告 — 2026-06-16

## 搜索概况
- **时间范围**: 2026-06-15 00:00 UTC 至 2026-06-16 14:00 UTC
- **搜索类别**: arXiv physics.flu-dyn, cs.FL
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 统计
- physics.flu-dyn 新论文: 23篇 (2026-06-16) + 15篇 (2026-06-15)
- cs.FL 新论文: 2篇 (2026-06-16) — 注: cs.FL 为形式语言与自动机理论，与流体力学无关
- 筛选命中: 11篇

---

## 命中论文列表

### 🥇 高优先级 — 湍流建模 / LES / DNS

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2606.14918]] | Learning turbulent transport via Mori-Zwanzig graph neural networks | MZ-GNN, DNS | turbulence, Lagrangian |
| [[2606.14696]] | Scalar dissipation anomaly and scalar-gradient scaling in turbulence | DNS (8192³), multifractal | turbulence, DNS, scalar |
| [[2606.15985]] | Quantum-enhanced MCMC sampling for Lagrangian tracer dispersion in turbulent boundary layer | QE-MCMC, turbulent channel flow | turbulence, Lagrangian |
| [[2606.15446]] | Sea Surface Roughness Dependence on Ocean Wave Parameters via LES with Local Subfilter Wave Drag | LES, wave drag model | LES, turbulence, MABL |
| [[2606.16390]] | Engine position effects on contrail evolution — LES with Eulerian microphysics | LES, RANS initialization | LES, vortex, contrail |
| [[2606.15820]] | Coherent structures in stenotic transitional flow via resolvent analysis | Resolvent analysis, SPOD, LES | turbulence, resolvent |
| [[2606.15023]] | Multiscale Hypersonic Boundary Layer Reconstruction via Spectral Binning and Conditional Diffusion | Conditional diffusion, DNS | DNS, hypersonic, BL |

### 🥈 中优先级 — CFD / 多相流 / 涡旋方法

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2606.16587]] | Learning Interface Breakup: Geometry-Conditioned Latent Surrogate for Spray Formation | VOF surrogate (latent), Basilisk | VOF, CFD, two-phase |
| [[2606.15140]] | Vorticity-dynamical analysis of Richtmyer-Meshkov instability | Orbital-spin vorticity decomposition | vortex, RMI |
| [[2606.15356]] | ShipNet: Geometric Deep Learning Surrogate for Ship Hydrodynamics | Geometric GNN, potential flow | CFD surrogate, ship |
| [[2606.14729]] | Machine Learning-Driven Chemical Reactor Network Modeling of Sandia-D Flame | PCA + k-means + ERN, CFD | turbulent combustion, CFD |

### 🥉 一般 — 理论 / 波浪湍流

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2606.14583]] | Wave turbulence theory of odd fluids and solids: kinetic equations | Wave turbulence theory | turbulence theory |
| [[2606.15803]] | Quantum vortex in a fluid flow: negative effective mass and turbulence formation | Quantum vortex, quantization | vortex, turbulence |

---

## 观察与趋势

1. **ML/CFD 融合加速**: 3篇论文（2606.16587, 2606.15356, 2606.14729）将深度学习作为 CFD 代理模型或加速工具，反映该方向持续火热
2. **Mori-Zwanzig  formalism 在湍流中的应用**: 2606.14918 将 MZ 内存效应与图神经网络结合，捕捉拉格朗日粒子加速的间歇性统计
3. **量子增强采样**: 2606.15985 用量子电路辅助 MCMC 采样湍流拉格朗日示踪粒子，展示了量子计算在流体领域的可行方向
4. **VOF + 隐式代理模型**: 2606.16587 以 AMR 网格密度场作为紧凑表征，绕过了完整流场编码的难题

---
*🥬 鲜毛肚 · 流体力学知识收集 · 2026-06-16*
