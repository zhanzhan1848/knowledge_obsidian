---
title: LightBridge - Feed-Forward Generative Relighting for 3D Gaussian Splatting
authors: Youcheng Cai et al.
date: 2026-09-02
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.02543
pdf: https://arxiv.org/pdf/2609.02543
tags: [rendering, 3DGS, relighting, neural-rendering, diffusion, real-time]
status: unread
---

# LightBridge - Feed-Forward Generative Relighting for 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting |
| 作者 | Youcheng Cai et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.02543) |
| PDF | [下载](https://arxiv.org/pdf/2609.02543) |

## 核心贡献
1. **LightBridge**：前馈生成式框架，单次通过即可对完整 3DGS 资产生成可控重光照
2. 构建大规模 **Multi-Illumination Relighting Dataset**，包含相同场景的源和目标观测配对数据
3. **Gaussian Propagation Transformer**：使用点 Transformer 结合稀疏图像到点自注意力和点到图像交叉注意力，高效传播光照线索

## 技术方案
- **Latent Bridge Relighting Diffusion Model**：将重光照建模为 Latent 空间中的源到目标传输，实现单步 2D 视觉 token 提取（无需迭代扩散采样）
- **Gaussian Propagation Transformer**：
  - 稀疏图像到点自注意力 + 点到图像交叉注意力
  - 避免对所有图像和 Gaussian token 的全注意力
- **无需逐场景优化**：单次前向预测完整重光照 3DGS 资产

## 实验结论
- 验证设计有效性
- 展示具有竞争力的重光照质量
- 高效单次预测完整重光照 3DGS 资产，无需场景特定优化

## 局限性
- 依赖大规模训练数据
- 生成质量受扩散模型能力限制

## 可行性分析
- 实现难度：高（涉及扩散模型 + Transformer + 3DGS 联合训练）
- 性能预期：单次前向传播，适合实时应用
- 适用场景：游戏资产重光照、电影视觉特效、AR/VR 场景适配

## 相关工作
- [[2026-09-04_Palette-3DGS-Color-Luminance-Editing]]
- 3D Gaussian Splatting (Kerbl et al., 2023)
- Inverse rendering methods for 3DGS
- Generative relighting with diffusion models

## 笔记
SIGGRAPH Asia 2026 相关方向。将生成式扩散模型与 3DGS 渲染管线结合，实现无需逐场景优化的前馈重光照。Gaussian Propagation Transformer 的稀疏注意力设计值得关注。
