---
tags: [渲染, 3DGS, ego-centric, 一致性, 论文, 2026]
date: [[2026-07-09]]
status: 已读
---

# CGGS: Consistency-Augmented Geometric Gaussian Splatting for Ego-centric 3D Scene Generation

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Zhenyu Sun et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2607.03819) |
| 发表 | arXiv cs.GR (2026-07-04, v2 2026-07-07) |

## 核心贡献

1. **问题**：Ego-centric 3D 场景生成面临有限视角重叠和个体视角对场景解释的主导影响，阻碍视角一致和语义对齐的视觉内容创建

2. **CGGS 框架**：Text-to-3D 框架，增强 3D 内容感知并解决 ego-centric 场景生成中的几何畸变

3. **关键组件**：
   - Ego-centric Generator：微调多视角潜在扩散模型，配合一致性增强损失
   - Layout Decorator：利用光流和点轨迹对应估计深度，从 ego-centric 2D 先验生成密集点云作为粗糙布局
   - Geometric Refiner：通过基于熵的互信息深度损失（MID）和分层优化方案增强 3D Gaussian 重建

## 技术方案

### Ego-centric Generator
- Multi-View Latent Diffusion Model
- Consistency-augmented loss
- 生成与文本描述一致的高保真 2D 内容

### Layout Decorator
- Optical flow + point-track correspondence
- Depth estimation
- 密集点云作为 coarse layouts

### Geometric Refiner
- 熵-based Mutual Information Depth Loss (MID)
- Hierarchical optimization scheme
- 提升视觉质量和几何结构

## 实验结论

- 在生成连贯准确的 text-driven 3D 场景方面优于先前方法

## 链接

- Project: https://cggs-26.github.io/cggs26/
- PDF: https://arxiv.org/pdf/2607.03819
