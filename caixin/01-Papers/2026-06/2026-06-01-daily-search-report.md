# Daily arXiv Fluid Dynamics Search Report — 2026-06-01

**Collected:** 2026-06-01 14:05 UTC  
**Sources:** arXiv physics.flu-dyn, cs.FL (recent submissions)  
**Keywords:** CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence

---

## 📋 Papers Found (2026-05-31 to 2026-06-01 Submissions)

### Mon, 1 Jun 2026 — 10 entries

| ID | Title | Authors | Tags |
|----|-------|---------|------|
| [2605.31385](https://arxiv.org/abs/2605.31385) | Algebraic models of plane Couette equilibria | J. Gibson | `turbulence` `dynamical-systems` `equilibrium-solutions` |
| [2605.31380](https://arxiv.org/abs/2605.31380) | Subcritical transition to turbulence in buoyancy-driven flows with multiple hysteresis loops | L. Zhang | `turbulence` `Rayleigh-Bénard` `subcritical-transition` `hysteresis` |
| [2605.31285](https://arxiv.org/abs/2605.31285) | The effect of bubble induced turbulent structures on the mass transfer of non-spherical bubbles | M. Baltussen | `multiphase-flow` `bubble-turbulence` `mass-transfer` `front-tracking` |
| [2605.31011](https://arxiv.org/abs/2605.31011) | A Python Library for Idealized 1D Saint-Venant Dam-Break Simulation | — | `shallow-water` `dam-break` `SWE` `MUSCL-HLLC` `Python` |
| [2605.30878](https://arxiv.org/abs/2605.30878) | Color-gradient lattice Boltzmann modeling of wetting boundary condition on curved solid boundaries | M. Bhattacharya | `LBM` `wetting` `contact-angle` `curved-boundary` |
| [2605.30805](https://arxiv.org/abs/2605.30805) | A scalable Ewald-free BIE framework for periodic Stokes flow via hierarchical proxy sums | — | `Stokes-flow` `BIE` `FMM` `periodic-boundary` `particle-suspension` |
| [2605.30659](https://arxiv.org/abs/2605.30659) | Neural-Network-based Viscosity Closure for Non-Newtonian Multiphase Flows | S. Murugaiyan et al. | `non-Newtonian` `Cahn-Hilliard-NS` `neural-network` `additive-manufacturing` |
| [2605.30375](https://arxiv.org/abs/2605.30375) | Full-field prediction for engineering-scale three-dimensional aircraft with multigrid-hierarchical learning | Y. Liu et al. | `CFD` `deep-learning` `multigrid` `aircraft` `convergence-acceleration` |

### Cross-list Highlights (2026-05-31)

| ID | Title | Cross-list | Tags |
|----|-------|-----------|------|
| [2605.31542](https://arxiv.org/abs/2605.31542) | Recovering the Shape of a Contact Line | cond-mat.soft | `contact-line` `wetting` `hysteresis` `confined-flow` |
| [2605.31078](https://arxiv.org/abs/2605.31078) | Finite-inertia effects in Langevin dynamics of a lopsided elastic dumbbell | cond-mat.soft | `Langevin-dynamics` `microrheology` `elastic-dumbbell` `ETD` |

---

## 🔬 Notable Papers Detail

### 1. Algebraic models of plane Couette equilibria — [2605.31385](https://arxiv.org/abs/2605.31385)

**Authors:** John Gibson  
**Category:** turbulence / dynamical systems  
**Subject:** Fluid Dynamics (physics.flu-dyn)

**Core Innovation:**
- Derives ODE models of plane Couette flow whose equilibria are governed by **quadratic algebraic equations**
- Equilibria converge to known DNS solutions in as few as **17 dimensions**
- Found **16 distinct equilibrium solution branches** across 7 symmetry groups
- Provides closed-form, convergent dynamical-systems representations

**Analysis Framework:**
1. Classical approximation methods
2. Exploitation of symmetries + kinematic constraints
3. Divergence-free basis construction
4. Systems of quadratic algebraic equations

**Keywords:** `plane Couette` `equilibrium solutions` `turbulence` `dynamical systems` `N-S`

---

### 2. Subcritical transition to turbulence — [2605.31380](https://arxiv.org/abs/2605.31380)

**Authors:** Lu Zhang  
**Category:** turbulence / buoyancy-driven flows  
**Subject:** Fluid Dynamics (physics.flu-dyn)

**Core Innovation:**
- First demonstration of **subcritical transition to turbulence** in buoyancy-driven flow (Rayleigh-Bénard)
- Three coexisting states in narrow Ra range: steady convection, oscillatory chaos, intermittent turbulence
- Three **hysteresis loops** in Nu-Ra plane: normal, reverse, anomalous
- Steady convection is linearly stable but transitions via **finite-amplitude disturbances**

**Key Finding:** Challenges prevailing view that convection-to-turbulence is always supercritical

**Keywords:** `Rayleigh-Bénard` `subcritical` `turbulence` `hysteresis` `Nusselt number` `DNS`

---

### 3. LBM Wetting Boundary on Curved Boundaries — [2605.30878](https://arxiv.org/abs/2605.30878)

**Authors:** Malyadeep Bhattacharya  
**Category:** LBM / multiphase flow  
**Subject:** Fluid Dynamics (physics.flu-dyn) + Computational Physics

**Core Innovation:**
- **Wetting boundary condition** for curved solid boundaries in diffuse interface LBM framework
- Ghost node color modification extending equilibrium color profile into solid phase
- Handles **large density/viscosity contrasts** with small spurious currents
- Validated against analytical solutions for static and dynamic contact lines

**Keywords:** `lattice Boltzmann` `wetting` `contact angle` `curved boundary` `diffuse interface`

---

### 4. Scalable Ewald-free BIE for Periodic Stokes Flow — [2605.30805](https://arxiv.org/abs/2605.30805)

**Category:** Stokes flow / boundary integral methods  
**Subject:** Fluid Dynamics + Numerical Analysis

**Core Innovation:**
- **Ewald-free** periodization framework for 3D particulate Stokes flow
- Uses only **free-space Green's function** (no Ewald summation, no extended linear system)
- Hierarchical proxy sum with **net-force-zero compatibility condition**
- O(N) cost with single image box layer; scales to **millions of DOFs** on distributed-memory

**Applies to:** periodic pipes, doubly-periodic, triply-periodic geometries

**Keywords:** `Stokes flow` `BIE` `FMM` `periodic` `particle suspension` `microfluidics`

---

### 5. Python Saint-Venant Dam-Break Library — [2605.31011](https://arxiv.org/abs/2605.31011)

**Category:** shallow water / CFD software  
**Subject:** Fluid Dynamics + Atmospheric/Computational Physics

**Core Innovation:**
- `amerta` — open-source Python library for 1D Saint-Venant equations
- **MUSCL reconstruction** + **HLLC Riemann solver** + **SSP-RK** time integration
- **Numba JIT** acceleration
- Verified against 4 canonical Riemann problems (wet/dry dam break, double rarefaction/shock)
- 6-component post-processing pipeline; conserves mass to floating-point precision

**Keywords:** `Saint-Venant` `shallow water` `dam-break` `MUSCL` `HLLC` `Python` `Numba`

---

### 6. Neural Network Viscosity Closure for Non-Newtonian Multiphase — [2605.30659](https://arxiv.org/abs/2605.30659)

**Authors:** S. Murugaiyan et al. (14 authors)  
**Category:** machine learning / non-Newtonian / multiphase

**Core Innovation:**
- **NN-trained viscosity closure** inside Cahn-Hilliard-Navier-Stokes (CHNS) FE solver
- Replaces Carreau-Yasuda/power-law models with **ONNX-exported neural network**
- **Lipschitz regularization** ensures smooth viscosity predictions
- No solver modification required at runtime

**Keywords:** `non-Newtonian` `Cahn-Hilliard-NS` `neural network` `viscosity closure` `additive manufacturing`

---

### 7. MHLF: Multigrid-Hierarchical Learning for Aircraft CFD — [2605.30375](https://arxiv.org/abs/2605.30375)

**Authors:** Y. Liu, H. Wang, Y. Qi et al. (11 authors)  
**Category:** deep learning / CFD acceleration  
**Subject:** Fluid Dynamics

**Core Innovation:**
- **MHLF** — multigrid-hierarchical learning framework
- Topologically consistent geometric multigrid + hierarchical regional flow capture
- Validated across Mach 0.15–6.0 (subsonic, transonic, supersonic)
- Accelerates convergence without sacrificing flow-field accuracy

**Keywords:** `deep learning` `CFD` `multigrid` `aircraft` `convergence-acceleration` `high-fidelity`

---

## 📊 Summary Statistics

| Metric | Count |
|--------|-------|
| Total physics.flu-dyn entries (2026-05-31 to 2026-06-01) | ~20 |
| Directly CFD-relevant papers | 8 |
| Cross-list papers (cond-mat.soft) | 2 |
| Numerical methods papers | 4 |
| ML/AI for CFD papers | 2 |
| Turbulence papers | 3 |
| Multiphase/interface papers | 3 |

---

## 🎯 Priority Reading

1. **2605.31385** — Algebraic Couette equilibria (fundamental turbulence theory)
2. **2605.31380** — Subcritical turbulence in buoyancy flows (paradigm shift)
3. **2605.30805** — Ewald-free periodic Stokes BIE (methodological breakthrough)
4. **2605.31011** — amerta Python SWE solver (practical tool)
5. **2605.30659** — NN viscosity closure (ML+multiphase integration)