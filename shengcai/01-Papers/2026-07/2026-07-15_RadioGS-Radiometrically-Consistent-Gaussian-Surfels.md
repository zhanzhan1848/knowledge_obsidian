---
title: RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering
authors: Kyu Beom Han, Jaeyoon Kim, Woo Jae Kim, Jinhwan Seo, Sung-Eui Yoon
date: 2026-03-05
source: arXiv cs.GR
url: https://arxiv.org/abs/2603.01491
pdf: https://arxiv.org/pdf/2603.01491
tags: [rendering, inverse-rendering, gaussian-splatting, PBR, global-illumination, 2026]
status: unread
---

# RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering |
| 作者 | Kyu Beom Han, Jaeyoon Kim, Woo Jae Kim, Jinhwan Seo, Sung-Eui Yoon |
| 来源 | KAIST |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.01491) |
| PDF | [下载](https://arxiv.org/pdf/2603.01491) |

## 核心贡献
1. **Radiometric Consistency Loss** - 一种基于物理的约束，通过最小化 Gaussian surfel 辐射率与物理渲染辐射率之间的残差，为未观测方向提供监督
2. **RadioGS 框架** - 基于 2D Gaussian ray tracing 高效集成 radiometric consistency 的逆渲染框架
3. **高效 Relighting** - 基于 radiometric consistency 的微调策略，在新光照条件下几分钟内完成自适应

## 技术方案

### Radiometric Consistency
核心思想：Gaussian surfel 的学习出射辐射率应与其基于渲染方程的物理渲染辐射率一致。

```math
\mathcal{R}_{\mathbf{G}}(x,\omega_o) = L_{\mathbf{G}}(x,\omega_o) - L_{\mathbf{G}}^{\mathbf{PBR}}(x,\omega_o)
```

```math
L_{\mathbf{G}}^{\mathbf{PBR}}(x,\omega_o) = \int_{\Omega} f_r(x,\omega_o,\omega_i; \mathbf{G}) (V(x,\omega_i; \mathbf{G}) L_{dir}(\omega_i) + L_{ind}(x,\omega_i; \mathbf{G})) (\omega_i \cdot n_x) d\omega_i
```

### 2D Gaussian Ray Tracing
- 使用 IRGS 的 2D Gaussian ray tracer
- 通过 alpha-blending 过程返回累积辐射率和最终透射率
- 将 ray-traced 辐射率直接作为间接辐射率 Lind

### 双阶段训练
1. **Initialization**: 使用 split-sum approximation 避免几何震荡
2. **Inverse Rendering**: 使用完整 Monte Carlo 估计的 radiometric consistency loss

## 实验结论
- 在 TensoIR 和 Synthetic4Relight 数据集上优于现有 Gaussian-based 逆渲染方法
- 约 60 分钟总优化时间（30 分钟初始化 + 30 分钟逆渲染）
- Relighting 微调约 2 分钟
- 每帧渲染时间 < 10ms

## 局限性
- 主要针对介质电介质材质
- 间接光照建模仍有改进空间

## 可行性分析
- 实现难度：中
- 性能预期：实时渲染能力
- 适用场景：逆渲染、relighting、材质分解

## 相关工作
- [[Gaussian Splatting]]
- [[Inverse Rendering]]
- [[Physically Based Rendering]]

## 笔记
RadioGS 提出了一个优雅的物理约束方法来解决 Gaussian Splatting 逆渲染中间接光照建模的问题。Radiometric consistency loss 的设计思想值得关注——通过让 surfel 辐射率满足渲染方程来提供自监督信号。
