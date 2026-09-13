# 每日论文搜索报告 - 2026-09-13

**搜索时间**: 2026-09-13 14:03 UTC  
**搜索范围**: arXiv physics.flu-dyn, cs.FL (最近48小时内新提交)  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 统计概览

| 类别 | 数量 |
|------|------|
| physics.flu-dyn 新提交 | 13 |
| physics.flu-dyn 跨学科提交 | 3 |
| physics.flu-dyn 更新版本 | 3 |
| cs.FL 新提交 | 2 (无流体力学相关) |
| **CFD相关论文总数** | **~10篇** |

---

## 高相关性论文 (CFD/数值方法/湍流)

### 1. All-Mach六方程 diffuse-interface multiphase method
- **arXiv**: [2609.10727](https://arxiv.org/abs/2609.10727)
- **标题**: A Robust All-Mach Six-Equation Diffuse-Interface Method for Multiphase Flows with Surface Tension
- **方法**: HLLC Riemann solver + 压力松弛程序 + 低Mach修正
- **关键词**: multiphase, surface tension, All-Mach, diffuse-interface, CSF formulation
- **创新点**: 统一处理可压缩到近不可压缩多相流, 保持Laplace压力跳跃

### 2. DiffSWE2d - Differentiable Shallow Water Equations Solver
- **arXiv**: [2609.11426](https://arxiv.org/abs/2609.11426)
- **标题**: a differentiable Shallow Water Equations solver for end-to-end flood and tsunami modelling
- **方法**: PyTorch实现, 自动微分, 可微分数值求解器
- **代码**: https://github.com/ZhonghouXu/DiffSWE2d
- **应用**: 洪水/海啸建模, 波形反演

### 3. Conservative Hybrid Eulerian-Lagrangian Method for Cavitation
- **arXiv**: [2609.11776](https://arxiv.org/abs/2609.11776)
- **标题**: A Conservative Hybrid Eulerian-Lagrangian Method with Persistent Structure Tracking for Multiscale Cavitation
- **方法**: Connected component labeling + 结构追踪 + 质量/动量守恒转换算子
- **关键词**: cavitation, hybrid Eulerian-Lagrangian, structure tracking, mass conservation

### 4. Vectorial LBM for Compressible Euler Flows
- **arXiv**: [2609.10639](https://arxiv.org/abs/2609.10639) (cross-list from math.NA)
- **标题**: Vectorial lattice Boltzmann solver for compressible inviscid flows with generic equation of state
- **方法**: 自适应松弛系数 + 自适应时间步长, 二阶精度(声学尺度)
- **关键词**: LBM, compressible Euler, adaptive time-stepping, generic EOS

### 5. Three-Vortex System - Hopf Fibration & Near-Collisions
- **arXiv**: [2609.10847](https://arxiv.org/abs/2609.10847) (cross-list from math.DS)
- **标题**: The three-vortex system: Hopf fibration, symplectic reduction, and near-collisions
- **方法**: symplectic reduction on 2D leaves, 复坐标 ζ=(z₂-z₁)/(z₃-z₁)
- **关键词**: point vortices, Hopf fibration, Hamiltonian dynamics, collision regularization

### 6. Low Inertia Limit of Elasto-Inertial Turbulance
- **arXiv**: [2609.11581](https://arxiv.org/abs/2609.11581)
- **标题**: Low inertia limit of elasto-inertial turbulence
- **发现**: 实验确认center mode structures at onset, 首次观察到traveling wave ("arrowhead" solution)
- **关键词**: elasto-inertial turbulence, viscoelastic pipe flow, center mode, polymer solutions

### 7. Mixing Dynamics during Laminar Stirring
- **arXiv**: [2609.10773](https://arxiv.org/abs/2609.10773)
- **标题**: Mixing dynamics and transport mechanisms during laminar stirring flows
- **发现**: 三种混合机制: diffusion-dominated, advective (vortex shedding), nonlocal transport by escaping vortices
- **关键词**: laminar mixing, stirred flow, vortex shedding, scalar transport

### 8. Giesekus Stick-Slip Singularity (Log-Conformation Formulation)
- **arXiv**: [2609.10836](https://arxiv.org/abs/2609.10836)
- **标题**: Giesekus Stick-Slip Singularity: Asymptotic Theory in the Log-Conformation Formulation
- **方法**: log-conformation reformulation 解析渐近分析, composite solution
- **关键词**: Giesekus fluid, stick-slip singularity, log-conformation, asymptotic analysis

### 9. Wave-Mean Flow Interaction (Parts I & II)
- **arXiv**: [2609.11587](https://arxiv.org/abs/2609.11587), [2609.11631](https://arxiv.org/abs/2609.11631)
- **标题**: Surface gravity wave-mean flow interaction with comparable spatial scales
- **方法**: multiple-timescale expansion, Schrödinger equation reduced model, Craik-Leibovich equation
- **关键词**: wave-current interaction, surface gravity waves, Schrödinger equation, Stokes drift

### 10. Reactive Solute Dispersion in Couple-Stress Fluids with Magnetic Field
- **arXiv**: [2609.11099](https://arxiv.org/abs/2609.11099)
- **标题**: Correlative effects of induced magnetic field-buoyancy on reactive solute dispersion dynamics in couple-stress fluids
- **方法**: Mei's multiscale homogenization (三阶), Aris moment method, Brownian dynamics
- **关键词**: Taylor dispersion, couple-stress fluid, magnetic field, reactive solute

---

## 中等相关性论文

- **2609.11111/11112**: Multi-fidelity surrogate optimization for turbomachinery (CFD-based design optimization)
- **2609.10649**: Viscosity-dependent potential flow theory for cylinder (potential flow + Navier-Stokes)
- **2609.10820**: Internal waves with quadratic depth-dependence currents (Gardner equation)

---

## 备注
- cs.FL 无流体力学相关新提交
- 搜索API因频率限制被限流, 直接抓取arXiv列表页获取数据
