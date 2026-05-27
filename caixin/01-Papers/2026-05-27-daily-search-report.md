# 每日论文搜索报告 - 2026-05-27

## 搜索概况
- **日期范围**: 2026-05-25 至 2026-05-27 (最近48小时)
- **数据源**: arXiv physics.flu-dyn, cs.FL
- **检索关键词**: CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence
- **匹配论文数**: 20 篇 (physics.flu-dyn)
- **cs.FL**: 无流体动力学相关论文

---

## 论文列表

### 数值方法与求解器

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.25403]] | A High-Performance, Cross-Platform Open-Source Solver for the Incompressible Navier-Stokes Equations in FEALPy | FEM / 后端无关设计 (NumPy/PyTorch/JAX) |
| [[2605.25544]] | A semi-implicit 2D solver for a covariant formulation of the shallow water equations | 协变浅水方程, 半隐式 |
| [[2605.27004]] | Lattice Boltzmann Methods with Anisotropic Equilibrium Distributions | LBM 各向异性平衡分布 |
| [[2605.26677]] | A total-Lagrangian vectorial lattice Boltzmann method for finite-strain hyperelastic dynamics | LBM, 有限应变超弹性 |

### 湍流与LES/RANS

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.26358]] | Deep Learning-based Algebraic Reynolds Stress Closures for RANS | DARSM, ML湍流闭合 |
| [[2605.25329]] | Quantum field approach to relativistic turbulence | 相对论湍流, Israel-Stewart框架 |
| [[2605.26359]] | Perturbative anomalous exponents from Kolmogorov multipliers | Kolmogorov乘子, 标度率 |
| [[2605.26981]] | Asymmetric particle transport in turbulent flows within concentric annular ducts | DNS, turbophoresis, 横向曲率 |
| [[2605.25056]] | Time-Symmetry of Lagrangian Coherent Structures in Active Turbulence | LCS, 主动湍流 |

### 机器学习与CFD

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.26806]] | Supervised machine learning of compressible flow past a rotating cylinder | 可压缩流 + 贝叶斯回归/神经网络 |
| [[2605.26059]] | Accelerating Bayesian inverse design in CFD using neural operators | 神经算子代理, 贝叶斯逆设计 |
| [[2605.25679]] | Transformer-based Neural Operators for 3D Wind Field Prediction over Complex Mountainous Terrain | Transformer神经算子, 风场预测 |
| [[2605.26416]] | Differentiable Programming Framework for Reduced-Order Modeling of Chaotic Flows | POD-Galerkin ROM, 可微分编程 |

### 多相流与界面

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.27108]] | Quantifying the liquid flow between a soap film and a vertical meniscus | 薄膜排水, 边缘再生 |
| [[2605.25167]] | Energetic variational formulation for electrohydrodynamics of surfactant-laden droplets | 能量变分法, 电渗流, 表面活性剂 |
| [[2605.24672]] | Contaminant-concentration-dependent surface tension does not explain absence of solutal Marangoni flow | Marangoni流, 蒸发液滴 |
| [[2605.26746]] | Sub-surface turbulence and free-surface features | 湍流, 自由表面关联 |

### 颗粒与涡动力学

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.27010]] | Direct numerical simulation of particle-laden flow in a linear compressor cascade | PP-DNS, 颗粒侵蚀 |
| [[2605.25539]] | Finite-Time Relaxation of Inertial Particle Clustering in Non-Equilibrium Turbulence | DNS, 粒子聚集, 非平衡湍流 |
| [[2605.24901]] | Geometry, elasticity, and activity in the transport of self-propelled filaments in turbulence | 活性丝状体, 涡旋捕获 |

### 环境流与工程应用

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.26699]] | Vibroacoustic Underwater Noise from Fixed and Floating Offshore Wind Turbines | 气动-水动-伺服-弹性耦合 |
| [[2605.25096]] | Fractal-based variable drag model for porous-media tree representations | 分形变曳力, 多孔介质 |
| [[2605.24997]] | A real-variable unidirectional reduction of deep-water gravity waves | 深水重力波, 渐近约化 |

### 其他

| ID | 标题 | 方法 |
|----|------|------|
| [[2605.26989]] | Acoustic radiation force on a liquid particle in a standing surface acoustic wave field | 声辐射力, Rayleigh极限 |

---

## 重点关注

1. **[[2605.27004]]** - LBM各向异性平衡分布：经典LBM各向同性假设的突破
2. **[[2605.25403]]** - FEALPy: 后端无关N-S求解器，支持PyTorch/JAX GPU加速
3. **[[2605.26358]]** - DARSM: 深度学习RANS湍流闭合，物理约束结构
4. **[[2605.26416]]** - 可微分POD-Galerkin: 混沌流ROM稳定化新框架
5. **[[2605.26677]]** - 全拉格朗日矢量LBM: 有限应变超弹性

---

*由 鲜毛肚 (Caixin) 自动生成 - 2026-05-27*