# Daily arXiv Fluid Dynamics Report — 2026-07-06

## 搜索概况
- **搜索范围**: arXiv physics.flu-dyn, cs.FL (最近48小时)
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **生成时间**: 2026-07-06 14:10 UTC

---

## 📄 新增论文笔记 (7篇)

### 1. DNS / 湍流
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.01533](2607.01533-hydrodynamic-spin-coupling-2D-DNS.md) | 2D Hydrodynamic Spin Coupling in Two-Rotor Corral | DNS, vortex method, 2D turbulence |
| [2607.01981](2607.01981-shear-stratified-turbulence-DNS.md) | Energy Transfer, Intermittency and Mixing in Shear-Driven Stratified Turbulence | DNS, turbulence, stratified flows, mixing |
| [2607.02395](2607.02395-wall-pressure-variance-turbulence.md) | Inner-Scaled Linear Contribution to Wall-Pressure Variance | turbulence, boundary layer, vortex stretching |
| [2607.02398](2607.02398-piezo-turbulent-drag-reduction.md) | Turbulent Drag Reduction via Piezoelectric Actuation (DNS) | DNS, turbulence, drag reduction |

### 2. 多相流 / 相变
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.01575](2607.01575-second-order-diffusive-interface-IB.md) | Second-Order Diffusive-Interface IBM for Incompressible Flow with Phase Change | diffuse-interface, phase change, IBM |
| [2607.02310](2607.02310-pressure-drop-localization-multiphase.md) | Pressure-Drop Localization in Liquid-Gas Coexistence Poiseuille Flow | multiphase flow, Navier-Stokes, phase change |

### 3. 浸入边界 / FSI
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.01662](2607.01662-RIS-vs-IB-aortic-valve.md) | RIS vs IB Methods for Aortic Valve Simulation | immersed boundary, FSI, biomedical CFD |

### 4. 生物流体 / 空气动力学
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.02246](2607.02246-gliding-mammal-CFD-aerodynamics.md) | Gliding Mammal-Inspired Wing Aerodynamics (CFD) | CFD, aerodynamic performance |

### 5. 流体力学机器学习
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.02203](2607.02203-self-explainable-operator-fluid-flow.md) | Self-Explainable Operator Learning for Fluid Flow | ML for CFD, operator learning |
| [2607.02088](2026-07-05/2607.02088-fourier-neural-operators-convection.md) | Fourier Neural Operators for Rayleigh-Bénard Convection | FNO, operator learning, convection |

### 6. 黏弹性流体
| ID | 标题 | 关键词 |
|----|------|--------|
| [2607.01380](2026-07-05/2607.01380-lagrangian-polymeric-stress.md) | Lagrangian Evaluation of Polymeric Stress in Viscoelastic Fluids | viscoelastic, Lagrangian, FENE-P |

---

## 热点分析

### 🔥 湍流控制与减阻
本周持续热门方向：`2607.02398` 通过压电驱动作表面波实现最高 27.6% 减阻（spanwise wave），揭示了近壁湍流再生循环的破坏机制。

### 🔥 浸入边界方法
`2607.01662` 系统对比 RIS 与 IB 方法在主动脉瓣模拟中的差异，为生物医学 CFD 的方法选择提供量化依据。

### 🔥 机器学习可解释性
`2607.02203` 引入自解释算子学习框架，将积分方程线性分解实现直接可解释性，在血流动问题和非稳态空气动力学中验证。

---

## 知识库结构
```
~/knowledge-vault/caixin/01-Papers/
├── 2026-07-05/ (已存在)
└── 2026-07-06/ (本次新增 7 篇)
    ├── 2607.01533-hydrodynamic-spin-coupling-2D-DNS.md
    ├── 2607.01662-RIS-vs-IB-aortic-valve.md
    ├── 2607.01981-shear-stratified-turbulence-DNS.md
    ├── 2607.02246-gliding-mammal-CFD-aerodynamics.md
    ├── 2607.02310-pressure-drop-localization-multiphase.md
    ├── 2607.02395-wall-pressure-variance-turbulence.md
    └── 2607.02203-self-explainable-operator-fluid-flow.md
```

---
*由 鲜毛肚 (Xianmaodu) 自动生成 — 2026-07-06*
