# 📅 每日论文报告 — 2026-08-30

**来源**: arXiv physics.flu-dyn | **采集时间**: UTC 2026-08-30 14:03

---

## 📊 今日概览

| 日期 | 论文数 |
|------|--------|
| Fri 28 Aug | 19 |
| Thu 27 Aug | 14 |
| Wed 26 Aug | 12 |
| Tue 25 Aug | 15 (部分) |

**关键词覆盖**: FEM, Mortar Element, Diffusion Models, Lagrangian Tracer, Voigt-regularised Turbulence, Canopy Turbulence, Surface Gravity Waves, Quantum-Inspired CFD, Elastic Turbulence, Rayleigh-Taylor ROM, Viscoelastic Coating, NOx DNS, Phononic Materials, Variational Acoustics, Bubble Bursting, AI-Driven CFD

---

## 🥷 核心论文摘要 (CFD/Numerical Methods)

### 1. [[2608.27423]] — High-order stabilized matrix-free simulation of rotating mixing devices using the Mortar Element Method
**分类**: 数值方法 / FEM / 旋转几何  
**作者**: (待补充)  
**日期**: 2026-08-28

**核心创新**:
- **Mortar Element Method** 作为区域分解策略连接转子-定子界面
- **Matrix-free Navier-Stokes** + **Continuous Galerkin** (高阶)
- **ALE** (Arbitrary Lagrangian-Eulerian) 处理转子-定子相对运动
- **SUPG/PSPG** 稳定化
- 弱强制连续性通过 **Discontinuous Galerkin** 风格边界积分

**数值方法**:
- 离散化: Continuous Galerkin, 高阶
- 求解器: Matrix-free, 避免存储大型刚度矩阵
- 稳定性: SUPG/PSPG

**关键结果**:
- 2D/3D 强可扩展性: 大规模问题理想强标度
- Rushton 桨叶扭矩分析: 与现有数值结果一致
- Pitched blade turbine: $N_p$ vs $Re$ 在 $Re=1$–$2000$ 与实验数据良好一致
- 能量分析: $Re=200$ 时数值耗散 ~1%; $Re=2000$ 时 ~10%

**关键词**: `#FEM` `#Mortar-Element` `#Matrix-Free` `#ALE` `#Rotating-Mixer` `#SUPG-PSPG`

---

### 2. [[2608.27378]] — How well can Diffusion Models learn Lagrangian-Tracer Statistics in Non-reciprocal Turbulence?
**分类**: 湍流 / 生成模型 / 非互易流体  
**作者**: Biswajit Maji  
**日期**: 2026-08-27

**核心创新**:
- 首次将 **Diffusion Models (生成扩散模型)** 应用于 **非互易二元流体湍流** 的拉格朗日统计
- **非互易 Cahn-Hilliard-Navier-Stokes (NRCHNS)** 模型
- **伪谱 DNS** 生成真值数据
- 系统研究 **Lagrangian 多尺度** 特性: 速度增量、结构函数、平坦度

**控制方程**: NRCHNS (非互易 Cahn-Hilliard-Navier-Stokes)
$$\frac{\partial c}{\partial t} + \mathbf{u} \cdot \nabla c = M \nabla^2 \mu$$
$$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nu \nabla^2 \mathbf{u} + \alpha \nabla^2 c$$

**关键发现**:
- 速度分量 PDF 是 **双峰分布** (bimodal)，与 2D 经典湍流完全不同
- 双峰性与 **车道型结构** (lane-type structures) 相关
- 扩散模型能生成合成拉格朗日轨迹，但存在挑战

**关键词**: `#Diffusion-Models` `#Non-Reciprocal` `#Lagrangian-Turbulence` `#NRCHNS` `#Cahn-Hilliard`

---

### 3. [[2608.27355]] — Dynamical slowdown, bottlenecks, and multiscaling in Voigt-regularised turbulence
**分类**: 湍流理论 / 湍流模型  
**日期**: 2026-08-27

**核心创新**:
- 使用 **Voigt-regularised SABRA shell model** 和 **Voigt-Navier-Stokes (NSV) DNS** 研究瓶颈形成
- Voigt 正则化引入尺度依赖的非线性相互作用减速
- 发现三个不同谱区: 惯性区、部分热化区、高-$k$ 热化区

**控制方程**: Voigt-Navier-Stokes
$$\frac{\partial \mathbf{u}}{\partial t} - \alpha \nabla^2 \frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nu \nabla^2 \mathbf{u}$$

**关键发现**:
- 瓶颈形成可能与**尺度依赖动力学减速**和**初始热化**相关，而非纯耗散起源
- 间歇性被逐步抑制，小尺度趋向高斯性
- 当 $\alpha \ll$ 耗散尺度时，Voigt 模型与 Navier-Stokes 有相同惯性区统计 → **优秀实用近似**

**关键词**: `#Voigt-Regularisation` `#Turbulence-Bottleneck` `#Shell-Model` `#SABRA` `#Thermalisation`

---

### 4. [[2608.26995]] — Quantum-Inspired Computational Fluid Dynamics for Transient Turbulent Compressible Flows
**分类**: 量子计算 / 可压缩湍流  
**日期**: 2026-08-27

**核心创新**:
- **首个** 完整 QICFD 求解器用于**可压缩 Navier-Stokes** DNS
- 所有算术运算在 **Tensor Train (TT) 格式** 中进行
- 新 TT 格式 **除法** 和 **平方根** 算法 → Sutherland 粘度定律可行
- 与 HiPSTAR 和 Taylor-Green Vortex ($M=0.8, 0.1$) 验证

**数值方法**:
- 离散化: TT-format 全量子启发式
- 可压缩 NS + Sutherland 粘度
- Taylor-Green Vortex 瞬态湍流测试

**关键结果**:
- QICFD 能以极低额外开销并行运行多个不同初始化的 TGV 案例
- 证明了 TT 除法/平方根算法的正确性
- 但需要更多进展才能在工业相关条件下可行

**关键词**: `#Quantum-Inspired` `#Tensor-Train` `#Compressible-NS` `#TGV` `#QICFD`

---

### 5. [[2608.26783]] — Linear and Nonlinear Latent-Space Reduced-Order Models for the Rayleigh-Taylor Instability
**分类**: 降阶模型 / Rayleigh-Taylor / PINN  
**日期**: 2026-08-27

**核心创新**:
- 大规模 DNS 数据库研究 **Rayleigh-Taylor 不稳定性** 向湍流过渡
- 两种 ROM 策略对比:
  1. **线性 POD 编码器-解码器** + **物理信息网络 (PINN)** 学习非线性降阶动力学
  2. **非线性自编码器** 学习非线性编码-解码， latent 动态保持**线性** + 物理约束

**关键发现**:
- 两种方法都能良好重建、插值和外推 RT 不稳定性动力学
- 分析了 TKE 和耗散率的一维剖面
- 非线性编码器 + 线性 latent 可能更适合外推

**关键词**: `#Reduced-Order-Model` `#POD` `#PINN` `#Autoencoder` `#Rayleigh-Taylor` `#DNS`

---

### 6. [[2608.26711]] — SnapPINN: Pressure and Energy Dissipation Reconstruction from Sparse Noisy Velocity Snapshot
**分类**: PINN / 流动重建 / 实验CFD  
**日期**: 2026-08-27

**核心创新**:
- **SnapPINN**: 两阶段 **物理信息网络**
- 从**单个稀疏噪声速度快照**重建 3D 速度、压力、TKE 耗散率
- Stage 1: sine-激活架构 + 分离的速度/压力子网络
- Stage 2: 冻结速度网络，用压力 Poisson 方程训练压力网络

**关键结果**:
- bulk 速度重建误差 < 0.5%
- 耗散率误差 < 50% (极端稀疏条件)
- $Re_\tau$ 误差: 4–24%
- 稀疏度低至 0.07% 全分辨率 DNS 网格

**关键词**: `#PINN` `#Flow-Reconstruction` `#Sparse-Data` `#Turbulent-Pipe-Flow` `#TKE-Dissipation`

---

### 7. [[2608.26064]] — Neural-Network and Reduced-order Modeling Workflows for AI-Driven CFD
**分类**: AI-CFD / SINDy / POD  
**日期**: 2026-08-27

**核心创新**:
- **AI-Driven CFD** 工作流: 标量响应建模 + 降阶动态
- **MLP** (多层感知机) 映射喷嘴间距 → 氢气吞吐量、壁面传热等
- **SINDy** (稀疏非线性动力学识别) 用于场导出的 Reynolds 应力统计

**关键发现**:
- MLP 对不同量鲁棒性不同: 体积温度浓度鲁棒，壁面传热和未燃氢气吞吐量预测困难
- SINDy 提供的紧致场级预测在样本内外间距均有效
- 结论: MLPs 适合快速标量响应; POD-SINDy 更适合瞬态降阶动态和场统计

**关键词**: `#AI-CFD` `#MLP` `#SINDy` `#POD` `#Jet-in-Crossflow` `#Reduced-Order`

---

## 🌊 应用/理论论文

### 8. [[2608.27272]] — Energy transfer and scale organisation in dense canopy turbulence
**分类**: 环境流体力学 / 植被湍流  
**关键词**: `#Canopy-Turbulence` `#Energy-Budget` `#Inter-scale-Transfer`

### 9. [[2608.27105]] — Stochastic Transport and Wave Interactions for Multiscale Surface Gravity Waves (Part II)
**分类**: 海浪 / 随机理论  
**关键词**: `#Stochastic-Variational` `#Wave-Kinetic-Theory` `#Hasselmann` `#Ocean-Waves`

### 10. [[2608.27042]] — Biomass pyrolysis: quantitative synchrotron μCT + 3D particle-resolved simulations
**分类**: 多相流 / 生物质  
**关键词**: `#Pyrolysis` `#Particle-Resolved` `#Multiphase-Flow`

### 11. [[2608.26967]] — Turbulent diffusivity of buoyant particles in free-surface boundary layer
**分类**: 粒子输运 / 海洋  
**关键词**: `#Buoyant-Particles` `#Free-Surface` `#Schmidt-Number` `#Microplastics`

### 12. [[2608.26835]] — Density Field of Dilute Particle Flow in Two-Fluid Model (icing simulations)
**分类**: 两相流 / 钝体绕流  
**关键词**: `#Two-Fluid-Model` `#Stokes-Number` `#Icing-Simulation`

### 13. [[2608.26769]] — Gravity current fronts advancing along a heated wall
**分类**: 重力流 / Boussinesq  
**关键词**: `#Gravity-Current` `#Wall-Heating` `#Front-Velocity`

### 14. [[2608.26611]] — Resolvent analysis for viscoelastic coatings in turbulent drag reduction
**分类**: 减阻 / 粘弹性  
**关键词**: `#Viscoelastic-Coating` `#Drag-Reduction` `#Resolvent-Analysis` `#Compliant-Wall`

### 15. [[2608.26479]] — The ultimate state of elastic turbulence
**分类**: 弹性湍流 / 粘弹性流体  
**关键词**: `#Elastic-Turbulence` `#Viscoelastic` `#Oldroyd-B` `#FENE-P` `#Deborah-Number`

### 16. [[2608.26435]] — DNS of NOx formation in turbulent lean premixed hydrogen-air flames
**分类**: 燃烧 / DNS  
**关键词**: `#NOx` `#Hydrogen-Combustion` `#DNS` `#Turbulence-Chemistry-Interaction`

### 17. [[2608.26381]] — Phononic material vibrations and FSI in separated aerodynamic flows
**分类**: 流固耦合 / 气动弹性  
**关键词**: `#Phononic-Materials` `#FSI` `#Fluid-Structure` `#Flow-Control`

### 18. [[2608.26340]] — Variational Acoustics
**分类**: 声学 / 变分原理  
**关键词**: `#Variational-Principles` `#Lagrangian-Frame` `#Acoustics`

### 19. [[2608.26296]] — Mass ejected by a bubble bursting from a free drop
**分类**: 多相流 / 液滴生成  
**关键词**: `#Bubble-Bursting` `#Sea-Spray` `#Droplet-Ejection` `#Navier-Stokes`

---

## 🏷️ 关键词索引

| 关键词 | 论文编号 |
|--------|---------|
| FEM/Mortar Element | 2608.27423 |
| Diffusion Models / AI | 2608.27378, 2608.26064 |
| Elastic Turbulence | 2608.26479 |
| Voigt-regularised | 2608.27355 |
| Quantum-Inspired CFD / TT | 2608.26995 |
| PINN | 2608.26711, 2608.26783 |
| Rayleigh-Taylor | 2608.26783 |
| Viscoelastic / Drag Reduction | 2608.26611 |
| DNS / Combustion | 2608.26435 |
| Canopy Turbulence | 2608.27272 |
| Surface Gravity Waves | 2608.27105 |
| Bubble Dynamics | 2608.26296 |
| SINDy / POD | 2608.26064 |
| Buoyant Particles | 2608.26967 |
| Phononic Materials | 2608.26381 |

---

*由 🐟 鲜毛肚 自动采集 | arXiv physics.flu-dyn | 2026-08-30*
