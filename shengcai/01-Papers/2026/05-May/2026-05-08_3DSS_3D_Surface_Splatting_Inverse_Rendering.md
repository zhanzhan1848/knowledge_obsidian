---
title: 3D Surface Splatting for Inverse Rendering
authors: Mae Younes et al.
date: 2026-05-07
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.05876
pdf: https://arxiv.org/pdf/2605.05876
tags: [rendering, inverse-rendering, differentiable, Gaussian-splatting, PBR, paper, 2026]
status: unread
---

# 3D Surface Splatting for Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Surface Splatting for Inverse Rendering (3DSS) |
| 作者 | Mae Younes et al. |
| 来源 | arXiv cs.GR (v2 2026-05-08) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.05876) |
| PDF | [下载](https://arxiv.org/pdf/2605.05876) |

## 核心贡献
1. **首个可微分表面 splatting 渲染器** — 用于基于物理的逆渲染（multi-view images → shape + BRDF + illumination）
2. **Coverage-based compositing model** — opacity 直接从 Elliptical Weighted Average (EWA) reconstruction weight 累加得到，自然产生抗锯齿轮廓和有效的 visibility gradients
3. **Forward microfacet shading** — 协同优化 HDR 环境光照明和密度自适应细化
4. **Oriented surface samples 表示** — 原生桥接到 mesh-based 工作流（通过 surface reconstruction from oriented point cloud）

## 技术方案

### 核心创新点
表面 splatting 的核心问题：表面分离（surface separation）→ 直接用重建核（reconstruction kernels）本身表述

### 方法pipeline
1. 输入：多视角图像
2. 表示：oriented surface samples (3D Gaussian primitives with orientation)
3. 前向渲染：EWA coverage compositing + forward microfacet shading
4. 损失：图像重建损失
5. 优化：shape + spatially-varying BRDF + illumination 联合优化
6. 输出：可直接重建为 mesh

### 关键设计
- **Anti-aliased silhouettes** — EWA 权重自然产生
- **Informative visibility gradients** — 稀疏覆盖边缘处的梯度可用于反向传播
- **Density-aware adaptive refinement** — 自适应细化策略

## 公式
EWA reconstruction weight 用于计算 coverage：

```math
w_i = \text{EWA}(K_i, \Sigma_i, \mathbf{V})
```

其中 $K_i$ 是 splat 的核，$\Sigma_i$ 是协方差，$\mathbf{V}$ 是像素区域。

opacity 从累加的 EWA 权重直接得到：

```math
\alpha_i = 1 - \prod_j (1 - w_j)
```

## 代码
无（待从 PDF 提取）

## 实验结论
- 在 geometry reconstruction、novel-view synthesis、novel-illumination relighting 上优于：
  - mesh-based baselines
  - implicit baselines  
  - Gaussian splatting baselines

## 局限性
- 依赖多视角输入
- 表面重建步骤可能引人噪声
- 性能未明确评估

## 可行性分析
- 实现难度：高 — 可微分渲染器实现复杂，EWA splatting 需精细实现
- 性能预期：需实测（splatting 本身快，但 EWA 计算开销未知）
- 适用场景：逆渲染、物体数字化、Relighting、新视角合成

## 相关工作
- iNeRF (NerF 逆渲染)
- DRT (Differentiable Ray Tracing)
- Gaussian Splatting (3DGS)
- PhySG (Physically-based Scene Inverse Rendering)

## 笔记
3DSS 填补了 surface splatting 在可微分逆渲染领域的空白。相比 Gaussian Splatting，其 oriented surface samples 表示更符合传统渲染管线，有望实现更高质量的 shape + material + lighting 分离。