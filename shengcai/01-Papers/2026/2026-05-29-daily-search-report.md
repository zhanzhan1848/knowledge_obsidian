---
title: Daily Search Report 2026-05-29
date: 2026-05-29
tags: [rendering, daily-search, arxiv, 2026]
status: completed
---

# Daily Search Report - 2026-05-29

## 搜索概要
- **时间范围**: 最近 24 小时
- **搜索源**: arXiv cs.GR, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 论文检测

### 新增论文 (6篇)

| 日期 | 论文 | 来源 | 标签 |
|------|------|------|------|
| 2026-05-26 | Megakernel vs Wavefront GPU Path Tracing | arXiv | ray-tracing, path-tracing, GPU |
| 2026-05-25 | Depth Peeling for High-Fidelity Gaussian-Enhanced Surfel Rendering | arXiv | gaussian-splatting, depth-peeling |
| 2026-05-24 | Snapshot Polarimetric Display Inverse Rendering | arXiv | inverse-rendering, PBR |
| 2026-05-25 | Learning View-Dependent Splatting Kernels | SIGGRAPH 2026 | gaussian-splatting, kernel-learning |
| 2026-05-28 | F-RNG: Feed-Forward Relightable Neural Gaussians | arXiv | neural-rendering, relighting |
| 2026-05-21 | A Symbolic Framework for Extensible, High-Performance IPC Simulation | SIGGRAPH 2026 | simulation, IPC |

### SIGGRAPH 2026 奖项论文

**Best Papers:**
1. GimmBO: Interactive Generative Image Model Merging via Bayesian Optimization
2. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing
3. Walk on Decomposed Subdomains: A Hybrid Monte Carlo-Deterministic Solver for Elliptic PDEs
4. Robust Planar Maps for 3D Vectorization
5. Inverse Rendering for Discrete X-Ray Computed Tomography

**Rendering 相关 Honorable Mentions:**
- Spatio-Temporal Control Variates with ReSTIR for Real-Time Rendering
- Gradient Domain Reconstruction for Monte Carlo PDE Solvers
- Sample Matching for Joint Extinction Gradient Estimation in Differentiable Volume Rendering
- Photons × Force: Differentiable Radiation Pressure Modeling

**Test-of-Time:**
- A Machine Learning Approach for Filtering Monte Carlo Noise (2015)

## 分析总结

### 渲染领域趋势
1. **GPU Path Tracing**: Wavefront 架构比 Megakernel 快约 16%，缓存局部性是关键
2. **Gaussian Splatting 改进**: 视图相关 kernel 学习、Depth Peeling 集成
3. **可重光照神经渲染**: 前馈方法实现 25x 加速
4. **逆渲染**: 偏振信息用于单次拍摄 PBR 参数估计

### 优先级评估
- ⭐⭐⭐⭐⭐ **Megakernel vs Wavefront GPU Path Tracing**: 实用性强，直接优化建议
- ⭐⭐⭐⭐ **F-RNG**: 前馈重光照，实用性高
- ⭐⭐⭐ **DP-GES**: 技术创新，复杂度中
- ⭐⭐⭐ **Learning View-Dependent Splatting Kernels**: SIGGRAPH 论文，值得关注

## 下一步
- 分析 F-RNG 和 GPU Path Tracing 的实现细节
- 关注 SIGGRAPH 2026 渲染方向论文

---
生成时间: 2026-05-29 14:00 UTC