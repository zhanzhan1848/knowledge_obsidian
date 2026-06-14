# 2026-06-14 Daily Search Report

**Search Time**: 2026-06-14 14:08 UTC  
**Search Range**: 2026-06-12 to 2026-06-14 (last 48h)  
**Sources**: arXiv physics.flu-dyn, cs.FL  

## Summary Statistics
- Total papers found: 18 new submissions + 7 cross-lists on physics.flu-dyn
- Papers processed: 18 papers reviewed, 8 papers saved with detailed notes
- CFD-relevant papers: 8

## Papers Saved Today

| # | arXiv ID | Title | Category |
|---|----------|-------|----------|
| 1 | [2606.12559](2026-06-14/2606.12559-Feature-preserving-Latent-EnKF-CFD-Shocks.md) | Feature-preserving Latent-EnKF for Data Assimilation of Flows with Shocks | ML+CFD, Data Assimilation |
| 2 | [2606.13336](2026-06-14/2606.13336-Data-Driven-Equation-Discovery-Liquid-Film.md) | Data-Driven Equation Discovery for Nonlinear Liquid Film Flows | Data-Driven, Equation Discovery |
| 3 | [2606.13207](2026-06-14/2606.13207-Spanwise-Wall-Oscillation-Drag-Reduction.md) | Duty-cycle modulation of the self-sustaining process by spanwise wall oscillation | Turbulence, Drag Reduction |
| 4 | [2606.12627](2026-06-14/2026-06-14/2606.12627-Diapycnal-Mixing-Stratified-Flows.md) | Two pathways to diapycnal mixing in strongly stratified flows | Stratified Turbulence, DNS |
| 5 | [2606.12570](2026-06-14/2606.12570-Hydrodynamic-Resistance-Oscillating-Bodies.md) | Hydrodynamic Resistance on Oscillating Planar Interfacial Bodies | Interfacial Flows, Stokes Layer |
| 6 | [2606.13505](2026-06-14/2606.13505-Ultimate-Regime-Rayleigh-Darcy-Convection.md) | Ultimate regime in Rayleigh-Darcy Convection | Porous Media, DNS, Heat Transfer |
| 7 | [2606.12894](2026-06-14/2606.12894-Longitudinal-Particle-Separation.md) | Longitudinal particle separation | Microfluidics, Particle Focusing |
| 8 | [2606.12162](2026-06-14/2606.12162-Adaptive-Water-Wave-Modeling-Dispersive.md) | Adaptive, efficient, and scalable water wave modeling with dispersive hyperbolic systems | CFD, Shallow Water, Tsunami |

## Key Findings

### 1. ML for CFD with Shocks (2606.12559) — HIGH IMPACT
- **Innovation**: Latent-EnKF performs ensemble data assimilation in learned latent space
- **Problem**: EnKF fails for solutions with discontinuities (shocks) due to Gaussian assumption violation
- **Solution**: Feature-preserving latent space where shock/flow features admit smooth representation
- **Validation**: Sod shock tube, Mach 2 shock-cylinder interaction
- **CFD Relevance**: Direct CFD application for compressible flows with shocks

### 2. Data-Driven Equation Discovery (2606.13336) — HIGH IMPACT
- **Innovation**: PDE discovery for liquid film flows using sparse regression
- **Challenge**: Multi-collinearity from monomial basis, early-time transients with largest residuals
- **Method**: Leverages expert knowledge + curated data for best-case identifiability
- **Finding**: Pinpoints vulnerabilities in current discovery techniques
- **CFD Relevance**: Liquid film modeling, lubrication theory

### 3. Drag Reduction via Wall Oscillation (2606.13207) — TURBULENCE
- **Method**: DNS of turbulent channel flow (Re_τ ~ 200) with spanwise wall actuation
- **Key Insight**: Quasi-square-wave separates Reversal Phase (streak regeneration) and Displacement Phase (streak suppression)
- **Result**: 2.5 percentage points improvement over optimal sinusoidal baseline
- **Mechanism**: Stokes strain diverts wall-normal vorticity spanwise via vortex tilting

### 4. Stratified Turbulence Pathways (2606.12627) — TURBULENCE
- **Focus**: Horizontal shear instabilities in low Froude / high Reynolds number flows
- **Two pathways**: (1) Vertical shear from modulated eigenmodes → KH; (2) Columnar vortices → hyperbolic instabilities → KH
- **Finding**: Vertical shear and small-scale KH instabilities are inevitable in strongly stratified flows at large Re_b
- **Method**: Linear theory + DNS

### 5. Rayleigh-Darcy Convection DNS (2606.13505) — POROUS MEDIA
- **Range**: Ra ∈ [10³, 10⁶] in 3D porous domain
- **Scaling**: Nu ~ Ra^(~1) with distinct ultimate regime onset at Ra ≈ 4×10⁵
- **Structure**: Near-wall protoplumes → merge into megaplumes; protoplumes become finer with increasing Ra
- **Validation**: Within 1.24% of extrapolated ultimate-regime prediction from prior literature

### 6. Mangrove Hydrodynamics (2606.11653) — APPLIED CFD
- **Method**: OpenFOAM CFD simulations of wave attenuation by mangrove roots
- **Finding**: Wave attenuation is frequency-selective and species-dependent
- **Model**: Generalized parametrisation of vegetation profile applicable across mangrove species

### 7. Wave Modeling (2606.12162) — CFD
- **Method**: Adaptive hybrid Serre-Green-Naghdi / Shallow Water equations in GeoClaw
- **Innovation**: Combines dispersive models (offshore) with non-dispersive SWE (nearshore)
- **Performance**: ~2x speedup vs existing dispersive solver in GeoClaw
- **Application**: Tsunami modeling including landslide-generated waves

### 8. LIFT Bubble Dynamics (2606.12308) — MULTIPHASE
- **Topic**: Laser-induced forward transfer (LIFT) printing bubble dynamics
- **Scales**: From reduced-order models to interface-resolving simulations
- **Framework**: Thermal-only, plasma-mediated, and coupled plasma-thermal-thermoelastic bubble inception models

## Cross-List Highlights
- **2606.12447** (astro-ph.HE → physics.flu-dyn): Kinetic normal shocks closure, DVM-consistent scalar-excess budget
- **2606.12256** (math.NA → physics.flu-dyn): Mathematical analysis of fluid equations
- **2606.11691** (cs.LG → physics.flu-dyn): ML applied to fluid dynamics

## Next Steps
- [ ] Track Latent-EnKF paper for implementation in compressible flow solver
- [ ] Review liquid film equation discovery methodology for potential application
- [ ] Check for follow-up on spanwise wall oscillation drag reduction

---
*Generated by 菜心 (Caixin) - 流体力学专家 Agent*
*Powered by OpenClaw Cron*