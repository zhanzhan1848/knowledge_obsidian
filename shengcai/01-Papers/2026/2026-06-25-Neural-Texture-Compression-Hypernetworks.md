---
title: Neural Texture Compression using Hypernetworks
authors: Laurent Belcour et al.
date: 2026-06-25
source: arXiv cs.GR (Eurographics Symposium on Rendering 2026)
url: https://arxiv.org/abs/2606.26913
pdf: https://arxiv.org/pdf/2606.26913
tags: [rendering, paper, 2026, neural-rendering, texture-compression, PBR, real-time]
status: unread
---

# Neural Texture Compression using Hypernetworks

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Neural Texture Compression using Hypernetworks |
| 作者 | Laurent Belcour et al. |
| 来源 | arXiv cs.GR (Eurographics Symposium on Rendering 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.26913) |
| PDF | [下载](https://arxiv.org/pdf/2606.26913) |

## 核心贡献
1. 提出使用超网络（Hypernetwork）进行神经纹理压缩
2. 单个超网络同时输出潜在特征和MLP解码器的权重偏置
3. 支持超分辨率学习，支持多解码器联合推理

## 技术方案
现有神经纹理压缩方法需要对每个材质在给定MLP和潜在配置下执行梯度下降优化。**本文方法**训练单个超网络，直接输出：
- 潜在特征（latent features）
- MLP解码器的权重和偏置

```python
# 超网络架构
class Hypernetwork:
    def __init__(self, material_embedding_dim):
        self.feature_generator = MLP(..., output_dim=latent_dim)
        self.weight_generator = Hypernet(..., output_dim=mlp_params_dim)
    
    def forward(self, rgb_diffuse_albedo):
        latent = self.feature_generator(rgb_diffuse_albedo)
        mlp_weights = self.weight_generator(rgb_diffuse_albedo)
        return latent, mlp_weights
```

**扩展应用：**
- 多解码器联合推理
- 超分辨率解码器学习

## 实验结论
- 质量与现有神经纹理压缩方法相当
- 训练一次即可处理多种材质，无需per-material优化

## 局限性
- 超网络训练可能收敛困难
- 对复杂材质效果可能有限

## 可行性分析
- 实现难度：高（超网络训练复杂）
- 性能预期：实时PBR着色纹理压缩
- 适用场景：游戏纹理流媒体、VR/AR材质传输

## 相关工作
- [[neural-texture-compression-survey]]
- [[PBR-materials]]

## 笔记
神经纹理压缩是实时光线追踪的重要优化方向，超网络方法避免了per-material优化，值得关注。