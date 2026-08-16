---
title: "SIGGRAPH 2026 流体渲染论文汇总"
date: 2026-08-16
category: survey
tags: [SIGGRAPH2026, fluid simulation, smoke rendering, FLIP, Gaussian splatting, MPM, LBM, volume rendering]
venue: SIGGRAPH 2026
---

# SIGGRAPH 2026 流体渲染相关论文

## 1. GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3799902.3811148-2026-07-19
- **Highlight**: Current dynamic deformation-based 3D Gaussian Splatting (3DGS) methods use heuristic image-space warps, which often overfit limited observations via non-physical primitive scaling or drifting, producing floaters and geometric distortions. To address these challenges, we propose a hybrid, physics-aware fluid representation that injects physical constraints directly into the 3DGS pipeline.
- **Tags**: [smoke rendering, gaussian splatting, physics-aware, fluid reconstruction]

## 2. LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3799902.3811188-2026-07-19
- **Highlight**: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction
- **Tags**: [fluid reconstruction, divergence-free, gaussian splatting, lagrangian]

## 3. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811289-2026-07-19
- **Highlight**: We present ST-FLIP, a spatiotemporal extension of the Fluid-Implicit Particle (FLIP) method for incompressible free-surface and two-phase liquid simulation.
- **Tags**: [FLIP, free-surface, two-phase, liquid simulation, incompressible]

## 4. Fast VEM Fluid Simulation
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811315-2026-07-19
- **Highlight**: We present FastVEM, an efficient boundary-conforming fluid simulation framework that enables high-fidelity flow-boundary interaction at substantially reduced cost.
- **Tags**: [VEM, fluid simulation, boundary-conforming, high-fidelity]

## 5. Volume-Preserving LBM-MPM Coupling for Air-Water-Sand Mixtures
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811302-2026-07-19
- **Highlight**: We present a novel, physically-based simulation framework for sand-water-air mixtures that couples a Lattice Boltzmann Method (LBM) for weakly-compressible two-phase fluids with a Material Point Method (MPM) for granular sand.
- **Tags**: [LBM, MPM, multi-phase, sand-water-air, coupled simulation]

## 6. DiffSurFlow: Efficient and Robust Differentiable Fluid Optimization Via Surrogate Strategy on Flow Map
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811337-2026-07-19
- **Highlight**: Differentiable fluid optimization via surrogate strategy on flow map
- **Tags**: [differentiable simulation, flow map, optimization, inverse problems]

## 7. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811312-2026-07-19
- **Highlight**: We present Mixwell, a family of sharp 2D fluid brushes and GPU-accelerated analytical methods for progressive, resolution-independent physics-based mixing.
- **Tags**: [fluid brushes, mixing, GPU-accelerated, 2D fluid]

## 8. MPM Lite: Linear Kernels and Integration Without Particles
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811294-2026-07-19
- **Highlight**: We introduce MPM Lite, a hybrid Lagrangian/Eulerian method that eliminates the need for particle-based quadrature at solve time.
- **Tags**: [MPM, hybrid Lagrangian/Eulerian, linear kernels, particle-free]

## 9. Kinetic Predicted-Moment Flux Reconstruction for High-Order High-Performance Fluid Simulation
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811292-2026-07-19
- **Highlight**: High-Order High-Performance Fluid Simulation with Kinetic Predicted-Moment Flux Reconstruction
- **Tags**: [flux reconstruction, high-order, kinetic, fluid simulation]

## 10. An Extended Full GKS Formulation for High-Efficiency and Low-Memory Two-Phase Flow Simulation
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811290-2026-07-19
- **Highlight**: Extended Full GKS Formulation for High-Efficiency and Low-Memory Two-Phase Flow Simulation
- **Tags**: [GKS, two-phase flow, low-memory, efficient]

## 11. VfxDB: A Visual Effects Volume Dataset and Benchmark for VDB-Native Generative Modeling
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3799902.3811178-2026-07-19
- **Highlight**: We introduce a 1-million-sample VFX sequence of VDB dataset with standardized preprocessing, consistent metadata, and protocol-ready splits, together with a reproducible benchmark suite for both static volume generation and sequence volumes generation.
- **Tags**: [VDB, VFX dataset, volumetric, generative modeling]

## 12. Multi-feature Radiance Baking Neural Networks for Instant Volumetric Rendering
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3799902.3811179-2026-07-19
- **Highlight**: Multi-feature Radiance Baking Neural Networks (MRBNN), a neural volumetric rendering method that achieves real-time performance by leveraging analytic decomposition of scattering with an efficient learned representation.
- **Tags**: [volumetric rendering, neural rendering, radiance baking, real-time]

## 13. Stochastic Geomorphological Transport for Terrain Erosion Simulation
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811336-2026-07-19
- **Highlight**: A key challenge in erosion modeling is the simultaneous simulation of transport and erosive processes, which differ in temporal scales by several orders of magnitude. We address this challenge with a novel, parallel, stochastic particle-based method capable of simulating transport over geological timescales.
- **Tags**: [erosion simulation, particle-based, geomorphology, terrain]

## 14. Neural Particle Automata: Learning Self-Organizing Particle Dynamics
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3799902.3811052-2026-07-19
- **Highlight**: Neural Particle Automata (NPA), a Lagrangian generalization of Neural Cellular Automata (NCA) from static lattices to dynamic particle systems.
- **Tags**: [neural particle automata, self-organizing, particle dynamics, NCA]

## 15. Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering
- **Paper**: https://www.paperdigest.org/paper/?paper_id=siggraph-10.1145_3811369-2026-07-19
- **Highlight**: Orientation-Selective Level-of-Detail for Volume Rendering
- **Tags**: [volume rendering, level-of-detail, Gabor, orientation-selective]

---

## 趋势分析

### 1. Gaussian Splatting 在流体中的应用
- GauSmoke: 将物理约束注入 3DGS 管道用于烟雾重建
- LagrangianSplats: 无散度传输的高斯原语用于流体重建
- 趋势：NeRF/3DGS 技术正在渗透到流体模拟领域

### 2. 可微分流体仿真
- DiffSurFlow: 基于代理策略的快速稳健可微分流体优化
- Neural Particle Automata: 学习自组织粒子动力学
- 趋势：机器学习与物理仿真的结合越来越紧密

### 3. 多相/多材料耦合仿真
- LBM-MPM 耦合: 空气-水-沙混合物
- ST-FLIP: 自由表面两相流
- 趋势：复杂真实世界现象的多物理场仿真

### 4. 性能优化
- Fast VEM: 高效边界适配流体仿真
- MPM Lite: 无粒子的积分方法
- 趋势：降低计算成本，使高分辨率仿真成为可能

### 5. 体积数据与 VFX
- VfxDB: 100万样本的 VDB 数据集
- Multi-feature Radiance Baking: 实时神经体积渲染
- 趋势：数据驱动的体积渲染和生成模型

---

## 重点关注论文
1. **GauSmoke** - Gaussian Splatting + 烟雾重建
2. **LagrangianSplats** - 无散度高斯流体重建
3. **VfxDB** - 体积渲染数据集
4. **ST-FLIP** - 快速两相 FLIP 仿真
