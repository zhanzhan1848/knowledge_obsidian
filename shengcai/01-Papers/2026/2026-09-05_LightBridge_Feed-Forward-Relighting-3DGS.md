---
title: LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting
authors: Youcheng Cai et al.
date: 2026-09-02
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.02543
pdf: https://arxiv.org/pdf/2609.02543
tags: [rendering, 3DGS, relighting, neural-rendering, diffusion, 2026]
status: unread
---

# LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting |
| 作者 | Youcheng Cai et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.02543) |

## 核心贡献
1. **前向生成框架**：单次前向传播完成完整 3DGS 资产可控重光照，无需 per-scene 优化
2. **Multi-Illumination Relighting Dataset**：大规模成对源-目标光照观测数据集
3. **Latent Bridge Relighting Diffusion Models**：在潜空间将重光照建模为源到目标传输，无迭代扩散采样
4. **Gaussian Propagation Transformer**：稀疏 image-to-point 自注意 + point-to-image 交叉注意，高效传播到完整 3DGS

## 技术方案

**问题**: 3DGS 资产光照 baked in，难以重光照。逆渲染方法每个场景优化，效率低。生成方法需 per-scene 优化来 bakediting。

**方案**: LightBridge 前向框架：
1. **Latent Bridge Relighting Diffusion**: 潜空间源→目标传输，2D 视觉 token 单步提取
2. **Gaussian Propagation Transformer**: Point Transformer + 稀疏注意力（避免全注意力）
   - Image-to-point 自注意
   - Point-to-image 交叉注意
   - 仅处理相关 token，不遍历所有图像和 Gaussian token

**数据集**: Multi-Illumination Relighting Dataset（成对源/目标光照观测）

**优势**: 单次前向预测完整重光照 3DGS，无需场景特定优化。

## 可行性分析
- 实现难度：高（扩散模型 + Transformer 组合）
- 性能预期：单次前向，实时或近实时
- 适用场景：游戏/影视资产批量重光照、AR/VR 场景适配

## 相关工作
- [[2026-09-05_Palette-3DGS_Color-Luminance-Editing]]
- [[2026-06-03_Decoupling-Appearance-Geometry-in-Gaussian-Splatting]]
- [[2025-03_Dynamic-Scene-Reconstruction]]

## 笔记
前向 relighting 是 3DGS 走向实际生产的关键一步。相比需要 per-scene 优化的逆渲染方法，feed-forward 方式适合批量处理。Transformer 中的稀疏注意力设计值得借鉴。
