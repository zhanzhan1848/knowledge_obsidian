# Daily Paper Search Report
**Date**: 2026-04-04
**Time**: 14:17 UTC
**Agent**: Doumiao (豆苗)

## Search Summary

### Search Scope
- **arXiv cs.GR**: Recent submissions (Apr 1-4, 2026)
- **SIGGRAPH/SIGGRAPH Asia**: Technical Papers pages
- **Keywords**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **Time Range**: Last 24 hours (Apr 3-4, 2026)

---

## Findings

### arXiv cs.GR Recent Papers (Apr 3-4, 2026)

No papers directly related to fluid rendering were found in the recent arXiv cs.GR submissions for the last 24 hours.

**Papers reviewed from Apr 3 batch (5 entries)**:
| ID | Title | Relevance |
|----|-------|-----------|
| 2604.02141 | Topology-First B-Rep Meshing | ❌ Geometry/Mesh |
| 2604.01551 | Palette-Based Color Grading for 3D Gaussian Splatting | ❌ Color Editing |
| 2604.01274 | Non-Rigid 3D Shape Correspondences (STAR) | ❌ Shape Matching |
| 2604.02320 | Large-scale Avatar Pretraining (cross-list cs.CV) | ❌ Avatar |
| 2604.02120 | Accelerating 3DGS on Tensor Cores (cross-list cs.AR) | ❌ GPU |

**Papers reviewed from Apr 2 batch (6 entries)** (already covered Apr 3 report):
| ID | Title | Relevance |
|----|-------|-----------|
| 2604.00509 | Gaussian Splatting with Reflection and Transmittance Primitives | ⚠️ Semi-transparent surfaces |
| 2604.00157 | Dual Contouring of Signed Distance Data | ❌ Surface Reconstruction |
| 2604.01204 | Neural Harmonic Textures (cross-list cs.CV) | ❌ Neural Textures |
| 2604.01082 | Real-time Human Interaction-to-Reaction | ❌ Motion |
| 2604.00928 | Autoregressive Appearance for 3D Gaussian Avatars | ❌ Avatar |
| 2604.00831 | Physics-based Bone-driven Neural Garment Simulation | ❌ Cloth |

---

### SIGGRAPH 2025 Fluid-Related Papers

The SIGGRAPH 2025 Technical Papers list reveals several fluid simulation papers (full list analyzed below):

#### 1. Adaptive Phase-Field-FLIP for Very Large Scale Two-Phase Fluid Simulation
- **Authors**: TUM, RWTH Aachen University
- **Affiliation**: Technical University of Munich, Germany
- **Relevance**: ⭐⭐⭐⭐⭐ (Direct fluid simulation)
- **Method**: Phase-field + FLIP coupling for large-scale two-phase flows

#### 2. Fast Subspace Fluid Simulation with a Temporally-Aware Basis
- **Authors**: University of Toronto
- **Publication**: SIG/ACM TOG
- **Relevance**: ⭐⭐⭐⭐⭐ (Direct fluid simulation)
- **Method**: Reduced-order subspace simulation with temporally-coherent basis

#### 3. Gaussian Fluids: A Grid-Free Fluid Solver based on Gaussian Spatial Representation
- **Authors**: Peking University
- **Publication**: SIGGRAPH 2025
- **Relevance**: ⭐⭐⭐⭐⭐ (Grid-free fluid solver)
- **Method**: Gaussian spatial representation for meshless fluid simulation
- **Note**: Already documented in `2026-03-16-Gaussian-Fluids-SIGGRAPH2025.md`

#### 4. Quadtree Tall Cells for Eulerian Liquid Simulation
- **Authors**: U Tokyo, GAME FREAK
- **Publication**: SIGGRAPH 2025
- **Relevance**: ⭐⭐⭐⭐ (Eulerian liquid simulation)
- **Method**: Adaptive quadtree data structure for tall cell liquid simulation

#### 5. A Neural Particle Level Set Method for Dynamic Interface Tracking
- **Authors**: Georgia Tech, U Michigan
- **Relevance**: ⭐⭐⭐⭐ (Neural level set + interface tracking)

---

### SIGGRAPH Asia 2025 Fluid Papers

#### 1. Viscous Vortex Dynamics on Surfaces
- **Authors**: Cuncheng Zhu, Hang Yin, Albert Chern (UC San Diego)
- **Publication**: ACM Transactions on Graphics (SIGGRAPH Asia 2025)
- **Relevance**: ⭐⭐⭐⭐ (Viscous flow on curved surfaces)
- **Key Innovation**: 
  - Incorporates Gaussian-curvature-dependent viscous force term
  - IMEX scheme on triangle meshes for arbitrary topology surfaces
  - Vorticity jump condition across curvature sheets
  - Boundary curvature effects (Kutta condition under free-slip)
- **URL**: https://cunchengzhu.github.io/project_pages/ViscousVortex2025.html
- **Code**: Houdini implementation available

#### 2. An Implicit Position-Based Dynamics Framework
- **Authors**: University of Utah
- **Relevance**: ⭐⭐⭐ (Position-based fluid dynamics)
- **Method**: PBD framework for implicit fluid simulation

---

### Related arXiv Papers (Recent but outside 24h window)

#### WildSmoke: Ready-to-Use Dynamic 3D Smoke Assets from a Single Video in the Wild
- **arXiv**: [2509.11114](https://arxiv.org/abs/2509.11114)
- **Authors**: Yuqiu Liu et al.
- **Date**: September 14, 2025
- **Relevance**: ⭐⭐⭐⭐ (Smoke reconstruction + simulation)
- **Method**: 
  - Single in-the-wild video → 3D smoke asset pipeline
  - Smoke extraction with background removal
  - Particle initialization + camera pose estimation
  - Multi-view video inference
  - Interactive simulation/editing of reconstructed smoke
- **Note**: Cross-listed to cs.CV; not in cs.GR

---

## Conference Status

| Conference | Status |
|------------|--------|
| **SIGGRAPH 2026** | July 19-23, 2026, Los Angeles; Papers decisions Aug 26 |
| **SIGGRAPH Asia 2025** | Complete (Dec 2025, Hiroshima) |
| **Eurographics 2026** | Mar 31 - Apr 4, 2026, London |

---

## Technical Trends

### Current Directions in Fluid Rendering

1. **Gaussian-Based Methods**: Gaussian Fluids (grid-free), Gaussian splatting for fluid capture
2. **Neural Level Sets**: Learned particle-level set interfaces
3. **Subspace/Reduced Methods**: Temporal basis for fast fluid simulation
4. **Vortex Methods on Surfaces**: Curvature-aware viscous flows on manifolds
5. **Wild Capture**: Reconstructing fluid assets from single in-the-wild videos
6. **Eulerian Adaptivity**: Quadtree tall cells for large-scale liquids

---

## Conclusion

No new fluid rendering papers were found in arXiv cs.GR for the last 24 hours. The field's most recent activity is concentrated in SIGGRAPH 2025 papers (Gaussian Fluids, adaptive phase-field FLIP, subspace simulation) and SIGGRAPH Asia 2025 (viscous vortex dynamics on surfaces). Eurographics 2026 is currently underway.

---

## Next Scheduled Search
**2026-04-05 02:00 UTC**

---
*Generated by Doumiao (豆苗) - Computer Graphics Fluid Rendering Specialist*
