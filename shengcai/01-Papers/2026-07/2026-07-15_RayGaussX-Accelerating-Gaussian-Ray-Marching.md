---
title: RayGaussX: Accelerating Gaussian-Based Ray Marching for Real-Time and High-Quality Novel View Synthesis
authors: Hugo Blanc, Jean-Emmanuel Deschaud, Alexis Paljic
date: 2025-09-15
source: arXiv cs.GR
url: https://arxiv.org/abs/2509.07782
pdf: https://arxiv.org/pdf/2509.07782
tags: [rendering, ray-marching, gaussian-splatting, BVH, real-time-rendering, neural-rendering, 2025]
status: unread
---

# RayGaussX: Accelerating Gaussian-Based Ray Marching for Real-Time and High-Quality Novel View Synthesis

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RayGaussX: Accelerating Gaussian-Based Ray Marching for Real-Time and High-Quality Novel View Synthesis |
| 作者 | Hugo Blanc, Jean-Emmanuel Deschaud, Alexis Paljic |
| 来源 | Mines Paris, PSL University |
| 年份 | 2025 |
| 链接 | [原文](https://arxiv.org/abs/2509.07782) |
| PDF | [下载](https://arxiv.org/pdf/2509.07782) |

## 核心贡献
1. **Empty-Space Skipping** - 利用 BVH 跳过空区域，减少采样
2. **Adaptive Sampling** - 基于透射率和距相机距离的自适应采样策略
3. **Ray Coherence 优化** - 通过 Z-order curve 重排 Gaussians 和 tile-based ray ordering 提高 GPU 并行效率
4. **Scale Regularization** - 减少高度各向异性 Gaussians 导致的 false-positive intersections
5. **远距离区域 Densification** - 新增密化标准提高大场景质量

## 技术方案

### Gaussian Ray Marching 基础
密度和辐射率用 Gaussian 函数分解表示：
```math
\sigma(\mathbf{x}) = \sum_{l=1}^{N} \tilde{\sigma}_l \mathcal{G}(\mathbf{x}; \mu_l, \mathbf{q}_l, \mathbf{s}_l)
```

体积渲染方程：
```math
C(\mathbf{r}) = \int_{t_n}^{t_f} c(\mathbf{r}(t), \mathbf{d}) \sigma(\mathbf{r}(t)) T(t) dt
```

### Adaptive Sampling
```math
\Delta S_i = N_S \cdot \min\left(\max\left(\frac{d_i}{\beta}, \Delta t_{\min}\right) \cdot T_i^{-1/3}, \Delta t_{\max}\right)
```

### Scale Regularization
```math
L_s = \frac{1}{N} \sum_l (\max(r_{\mathrm{max},l}, r_0) - r_0)
```

## 实验结论
- 训练速度提升 **5× to 12×**
- 渲染速度提升 **50× to 80×** (FPS)
- 视觉质量提升 up to **+0.56 dB PSNR**
- 在 Mip-NeRF360 outdoor scenes 表现优异

## 局限性
- 高度各向异性 Gaussians 仍影响效率
- 训练时间对小场景仍较长

## 可行性分析
- 实现难度：中
- 性能预期：实时渲染能力，显著加速
- 适用场景：实时 NVS、大规模场景、VR/AR

## 代码
- GitHub: https://github.com/hugobl1/raygaussx

## 相关工作
- [[RayGauss]]
- [[3D Gaussian Splatting]]
- [[BVH]]
- [[Volume Ray Marching]]

## 笔记
RayGaussX 是对 RayGauss 的重要改进，通过多种加速策略（空空间跳过、自适应采样、ray coherence优化）显著提升了 Gaussian-based ray marching 的效率。Z-order curve 重排的想法很有趣，利用空间局部性来提高 GPU 内存访问效率。
