# 每日论文搜索报告 — 2026-08-14

**执行时间**: 2026-08-14 14:00 UTC  
**搜索范围**: arXiv `physics.flu-dyn`, `cs.FL` 最近 24 小时  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 搜索概况

- **physics.flu-dyn** 过去 24h 新增: 26 篇 (Fri 14 Aug 18篇 + Thu 13 Aug 8篇)
- **cs.FL** 过去 24h 新增: 4 篇 — **无流体相关性**（全部为形式语言与自动机理论）
- **流体相关核心论文**: 约 12 篇

---

## 核心论文摘要

### ⭐ 数值方法

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2608.13437]] | Lattice Boltzmann Method for Compressible Navier-Stokes-Fourier Equations | LBM (D3Q7) | 可压缩 N-S, 符号编译器, 激波 |
| [[2608.12868]] | Electric-field-driven droplet on LIS via Lattice Boltzmann | LBM + 电动力学 | 浸润表面, 滴液操控, 电力驱动 |

### ⭐ 湍流与直接数值模拟

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2608.12826]] | Bayesian Optimization of Drag-Reducing Dimples via LES | LES, 贝叶斯优化 | 沟槽减阻, 湍流通道流 |
| [[2608.13398]] | Intermittent Vortex Merging and Extreme Drag in Transitional Airfoil Flow | DNS (2D) | 涡旋合并, 极端阻力, Kelvin-Helmholtz |
| [[2608.12554]] | Dispersion and Clustering of Deformable Droplets in Turbulence | HIT + TAB model | 可变形液滴, 优先聚集, Stokes数 |
| [[2608.12048]] | Strain-Coupled One-Dimensional Turbulence for Rapid Distortion | ODT | 快速畸变,应变-湍流耦合,雷诺应力 |
| [[2608.11717]] | Thermochemical Non-Equilibrium Effects on Turbulent Boundary Layers | DNS | 高马赫数 TBL, 化学非平衡, 两温度模型 |
| [[2608.12694]] | Infrared Imaging of Thermally-Driven Jets and Eddies | 实验 (IR成像) | 热驱动射流, 行星尺度湍流, 涡旋结构 |

### ⭐ 燃烧与多相流

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2608.12223]] | Soret Diffusion & Radiative Heat Loss on Buoyant Flame Kernels | Low-Mach DNS | 氢燃烧, Soret扩散, 辐射热损失, 浮力火焰 |
| [[2608.12941]] | Second-Order Stochastic Modeling of Particle Resuspension | Markovian Lagrangian stochastic model | 颗粒重悬浮, 湍流通道流, 反常输运 |
| [[2608.13479]] | Air-Water Cavity in Multi-Plunging Jet Impacts | 实验 | 空腔, 多股冲击射流, 气泡产生 |

### ⭐ 空气动力学与气动声学

| ID | 标题 | 方法 | 关键词 |
|----|------|------|--------|
| [[2608.13490]] | DD-RNO: Domain-Decomposed Routed Neural Operator for RANS Airfoil | DD-RNO, Neural Operator | 翼型 RANS, 领域分解, 实时代理模型 |
| [[2608.13424]] | Failure of Quasi-Steady Approximation in Modern Aerodynamics | 风洞实验 | 非定常空气动力学, 准定常假设失效, 风力机 |
| [[2608.12031]] | Transport Geometry of Acoustic Analogies: Holonomy of Source Re-attribution | 理论 (N-S 变换) | 声类比, 声学几何, 流-声耦合 |
| [[2608.11445]] | Anisotropic Thermalization in Far-from-Equilibrium Flows | DG (Boltzmann方程) | 速度分布各向异性, 远平衡流, DG有限元 |
| [[2608.11463]] | Flow Effects on Gliding Arc CO2 Conversion | 等离子体+流体 | 滑弧放电, CO2转化, Reynolds数效应 |
| [[2608.12488]] | Wave-Assisted Propulsion in Bimodal Sea States | FSI 模拟 | 波能推进, 双峰海况, 水弹性调谐 |

---

## 重点推荐

1. **[[2608.13437]]** — LBM 可压缩 N-S 方程，符号编译器自动推导，D3Q7 单精度，激波收敛一阶，在超音速 Taylor-Green 涡旋上精度超过 7 个求解器
2. **[[2608.13398]]** — 涡旋合并引发极端阻力的 DNS 机制研究，直接捕捉二次涡度喷发与 K-H 脱落耦合
3. **[[2608.12031]]** — 声类比非唯一性的严格几何结构，揭示混合方法中传输偏差的精确来源

---
*由 菜心 (Caixin) 自动生成 | arXiv physics.flu-dyn 2026-08-14*
