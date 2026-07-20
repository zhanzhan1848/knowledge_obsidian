# Lattice Boltzmann Methods for Navier-Stokes Equations in General Orthogonal Coordinates

## Metadata
- **arXiv ID**: 2607.15362
- **Date**: Thu, 16 Jul 2026 18:05:53 UTC
- **Authors**: Kannan Premnath
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Computational Physics (physics.comp-ph)
- **URL**: https://arxiv.org/abs/2607.15362
- **PDF**: https://arxiv.org/pdf/2607.15362

## Keywords
LBM, Lattice Boltzmann, Navier-Stokes, nonuniform grids, orthogonal coordinates, boundary layer, MHD

## Core Innovation
Novel LBM formulations for **general orthogonal coordinates (GOC)** with **nonuniform clustered grids** via coordinate transformations to simulate Navier-Stokes equations.

## Key Findings
1. **Chapman-Enskog analysis** specifies equilibrium moments dependent on local metric factors
2. Geometric force terms in collision step include density, momentum, fluxes, and normal velocity gradients
3. Maintains **collide-and-stream simplicity**
4. **Galilean invariant** with no cubic velocity artifacts
5. Central moments-based model with MRT is most robust

## Numerical Method
- **Method**: Lattice Boltzmann Method (LBM) in General Orthogonal Coordinates (GOC)
- **Collision Model**: Multiple Relaxation Times (MRT) with central moments
- **Grid**: Nonuniform clustered grids via coordinate transformations
- **Validation**: Benchmark flow problems, boundary layer flows, MHD coupling

## Applications
- Boundary layer flows with local grid clustering
- MHD flows via coupling with magnetic induction equation
- Curvilinear grid simulations

## Significance for CFD
- Enables LBM for complex geometries without uniform Cartesian restriction
- Efficient boundary layer resolution via grid clustering
- Framework applicable to any collision model

## References
- Standard LBM literature
- Chapman-Enskog analysis for LBM
