---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, inverse-rendering, surface-splatting, differentiable-rendering, PBR, BRDF]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.05876
---

# 3D Surface Splatting for Inverse Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 3D Surface Splatting for Inverse Rendering |
| **作者** | Mae Younes, Adnane Boukhayma |
| **发表** | arXiv cs.GR (2026-05-07, v2 2026-05-08) |
| **链接** | [原文](https://arxiv.org/abs/2605.05876) |
| **DOI** | https://doi.org/10.48550/arXiv.2605.05876 |

---

## 核心贡献

> 首个**可微分表面 splatting 渲染器**，用于基于物理的逆渲染

1. 提出 coverage-based compositing model，per-layer opacity 直接源自累积的 EWA reconstruction weight，实现抗锯齿轮廓和有意义的几何边缘梯度
2. 提出密度感知的自适应细化策略，结合 forward microfacet shading 和 co-optimized HDR environment lighting
3. 联合恢复 shape、spatially-varying BRDF materials 和 illumination，输出可直接通过 oriented point cloud 方法重建为 mesh

---

## 技术方案

### 核心思想

表面分离问题可以直接用 reconstruction kernel 本身来表述。基于此推导出 coverage-based compositing model。

### 关键技术

| 技术 | 说明 |
|------|------|
| Elliptical Weighted Average (EWA) | 高斯 splatting 重建核 |
| Coverage-based compositing | per-layer opacity 源自累积 EWA weight |
| Forward microfacet shading | 基于微表面BRDF的前向着色 |
| Density-aware adaptive refinement | 密度感知自适应细化 |
| HDR environment lighting | 高动态范围环境光照联合优化 |

---

## 实验结论

- **数据集**: 多视图图像
- **基线**: Mesh-based, Implicit, Gaussian-splatting baselines
- **结果**: 在 geometry reconstruction、novel-view synthesis、novel-illumination relighting 三个任务上均优于 baseline

---

## 局限性

依赖于初始化的表面样本分布，自适应细化可能增加计算开销。

---

## 实现建议

- **实现难度**: 高 — 需要实现可微分 surface splatting pipeline，涉及 coverage 计算和 EWA 核
- **预期性能**: 可从多视图图像联合恢复形状、材质和光照，优于传统 mesh-based 和 Gaussian splatting 方法
- **适用场景**: 逆向渲染、新视角合成、新光照 relighting、mesh 重建工作流

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Inverse Rendering]]
- [[Differentiable Rendering]]
- [[BRDF]]
