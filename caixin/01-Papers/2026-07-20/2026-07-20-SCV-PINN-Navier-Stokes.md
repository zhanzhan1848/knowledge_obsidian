# Split Complex-Valued Physics-Informed Neural Networks for Forward and Inverse PDEs

## Metadata
- **arXiv ID**: 2607.15087
- **Date**: Thu, 16 Jul 2026 14:58:54 UTC
- **Authors**: Biswanath Barman
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **URL**: https://arxiv.org/abs/2607.15087
- **PDF**: https://arxiv.org/pdf/2607.15087

## Keywords
PINNs, physics-informed neural networks, Navier-Stokes, complex-valued, inverse problems, fluid dynamics

## Core Innovation
**Split complex-valued PINN (SCV-PINN)** framework with complex-valued parameters and split activation functions.

## Key Features
1. **Split complex activation** - independently applies real activations to real/imaginary components
2. **Simultaneous learning** of amplitude and phase
3. Enhanced representation of **nonlinear and oscillatory systems**
4. Ablation studies on activation functions and sampling strategies

## Validated Benchmarks
- Burgers, Allen-Cahn, KdV, nonlinear Schrödinger
- Helmholtz, Poisson
- **Kovasznay flow (Re=20)**
- **Lid-driven cavity (Re=100)**
- Lorenz system
- **Inverse Burgers, Inverse Navier-Stokes (Re=100)**
- **3D Navier-Stokes Beltrami flow**

## Performance
- Beltrami flow: **relative L2 error = 4.07×10⁻⁵**
- Consistently outperforms RV-PINNs and existing PINN variants

## Significance for CFD
- Better accuracy for high-frequency, oscillatory, phase-dependent dynamics
- Framework for **inverse problems** in fluid mechanics
- Training on synthetic data enables discovery of flow parameters

## Applications
- Forward CFD simulations with complex physics
- Inverse problems: identifying flow parameters from sparse data
- Multiscale, high-dimensional PDEs

## References
- Standard PINN literature
