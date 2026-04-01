---
title: Learning Latent Proxies for Controllable Single-Image Relighting
authors: Haoze Zheng et al.
date: 2026-03-16
source: arXiv (CVPR 2026)
url: https://arxiv.org/abs/2603.15555
pdf: https://arxiv.org/pdf/2603.15555
tags: [rendering, relighting, global-illumination, PBR, diffusion-model, 2026]
status: unread
---

# Learning Latent Proxies for Controllable Single-Image Relighting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Learning Latent Proxies for Controllable Single-Image Relighting |
| 作者 | Haoze Zheng et al. |
| 来源 | arXiv (CVPR 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.15555) |
| PDF | [下载](https://arxiv.org/pdf/2603.15555) |

## 核心贡献
1. 提出 **LightCtrl**，在两个层级整合物理先验
2. **Few-shot Latent Proxy Encoder**：从有限 PBR 监督中提取紧凑材质-几何线索
3. **Lighting-aware Mask**：识别敏感光照区域，引导去噪器关注相关像素
4. **DPO-based Objective**：使用 DPO 目标优化代理分支，确保物理一致性
5. 提出 **ScaLight**：大规模物体级数据集，具有系统变化的光照和完整相机-光源元数据

## 技术方案

### 核心洞察
- 完整的内在分解对于精确重照明是不必要且冗余的
- 稀疏但物理有意义的线索（指示光照应如何变化、材质如何响应）足以引导扩散模型

### LightCtrl 架构
```
Input Image → Latent Proxy Encoder → Material-Geometry Cues
                                 ↓
Lighting-aware Mask → Diffusion Denoiser → Relit Image
```

### 物理一致性约束
通过 DPO (Direct Preference Optimization) 目标确保预测线索的物理一致性。

## 实验结论
- 在物体和场景级基准测试中达到 SOTA
- **+2.4 dB PSNR** 提升
- **35% lower RMSE** 在受控光照变化下
- 支持方向、强度和颜色的连续控制

## 局限性
- 需要 PBR 数据的少量监督
- 对极端光照条件可能有限制

## 可行性分析
- 实现难度：高（涉及扩散模型和物理渲染）
- 性能预期：高质量重照明效果
- 适用场景：图像编辑、增强现实、数据增强

## 相关工作
- Diffusion Models for Image-to-Image Translation
- Intrinsic Image Decomposition
- PBR-based Relighting
- Single-Image Relighting

## 笔记
CVPR 2026 论文。核心思想很有趣：不需要完整的内在分解，只需要稀疏但物理有意义的线索就能引导扩散模型实现可控重照明。ScaLight 数据集的提出也很有价值。
