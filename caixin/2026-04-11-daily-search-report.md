# Daily Search Report — 2026-04-11

## 搜索概况
- **搜索时间**: 2026-04-11 14:10 UTC
- **数据源**: arXiv physics.flu-dyn, cs.FL (最近24小时)
- **检索词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 发现的相关论文

### 🔥 高相关性 (CFD 数值方法 / 湍流 / 神经网络算子)

| ID | 标题 | 关键词 |
|---|---|---|
| [[2604.08002]] | Helicity-Conservative Domain-Decomposed PINN for Incompressible Non-Newtonian Flow | PINN, helicity preservation, non-Newtonian, Navier-Stokes |
| [[2604.07854]] | Viscoelastic Droplet Impact — OpenFOAM VOF Simulation | VOF, OpenFOAM, viscoelastic, droplet impact |
| [[2604.07129]] | AegirJAX: Differentiable Hydrodynamic Solver (Shallow-water) | Differentiable solver, coastal hydrodynamics, inverse design |
| [[2604.07075]] | PINNs & Adjoint for Bottom Topography in Shallow Water | PINN, adjoint, shallow water, inverse problem |
| [[2604.06881]] | MENO: MeanFlow-Enhanced Neural Operators (Kolmogorov flow) | Neural operator, turbulence, Kolmogorov flow, surrogate |
| [[2604.07373]] | Collective Dynamics of Vortex Clusters on a Flat Torus | Vortex method, Hamiltonian, quadrupole |

### ⚡ 中等相关 (流体力学现象 / 建模)

| ID | 标题 | 关键词 |
|---|---|---|
| [[2604.07222]] | Viscous Bending Mitigates Meandering in Hele-Shaw Cells | Navier-Stokes, linear stability, rivulet, wavelength selection |
| [[2604.08413]] | Elastic & Viscous Effects in Viscoelastic Flows (De & Wi numbers) | Viscoelastic, Deborah number, Weissenberg number, Oldroyd-B |
| [[2604.08061]] | Soret Diffusion Effects on Hydrogen Flame Instability | DNS, combustion, flame instability, hydrogen |
| [[2604.08323]] | Preferential Orientation of Slender Elastic Floaters in Gravity Waves | Hydro-elastic, wave-structure interaction |
| [[2604.08164]] | Ultimate Regimes in Horizontal & Internally Heated Convection | Turbulent convection, scaling laws, Rayleigh-Bénard |
| [[2604.08035]] | Cavity-Stabilized Rotating Flames in Hele-Shaw Burner | Flame dynamics, micro-combustion, Hele-Shaw |

---

## 核心创新点提炼

### 1. 2604.08002 — Helicity-Conservative PINN (⭐重点)
- **创新**: 通过自动微分从神经网络速度场直接计算涡量，避免兼容误差污染helicity守恒
- **方法**: domain decomposition (FBPINNs) + causal slab-wise temporal continuation
- **方程**: 旋转形式的不可压非牛顿流控制方程 + Oldroyd-B本构模型
- **意义**: 首次在PINN框架中实现helicity守恒约束

### 2. 2604.07854 — VOF OpenFOAM (⭐重点)
- **创新**: 3D高保真VOF + log-conformation formulation + velocity-dependent dynamic contact angle
- **参数**: 直径2cm, 速度4m/s,  relaxation time 0.02-0.12s
- **发现**: relaxation time增加→弹性储能增加→最大铺展直径增大12.9%

### 3. 2604.07129 — AegirJAX (⭐重点)
- **创新**: 完全可微的浅水方程求解器，基于JAX自动微分
- **应用**: 地形反演、波形控制、防波堤拓扑优化、主动波消
- **意义**: forward simulation和inverse optimization的统一框架

### 4. 2604.06881 — MENO Neural Operators
- **创新**: MeanFlow增强神经算子，弥补Fourier截断导致的高频损失
- **基准**: Kolmogorov flow, 相场动力学, 主动物质
- **性能**: 功率谱精度提升2倍，推理速度比DDIM快12倍

### 5. 2604.07373 — Vortex Clusters
- **创新**: 基于Schottky-Klein prime function的精确涡旋相互作用 Hamiltonian formulation
- **降阶**: 四极矩描述旋转率和呼吸模式
- **验证**: 直接数值模拟确认

---

## 工具软件更新
- **OpenFOAM**: 持续用于VOF多相流模拟
- **JAX**: 可微分物理求解器生态持续扩张 (AegirJAX)

## 待深入
- [ ] 2604.08002 PDF: 详细helicity守恒PINN架构
- [ ] 2604.07129 PDF: AegirJAX代码框架
- [ ] 2604.07373 PDF: vortex clusters四极矩推导

---
*由 [[鲜毛肚]] 自动生成 | 2026-04-11*
