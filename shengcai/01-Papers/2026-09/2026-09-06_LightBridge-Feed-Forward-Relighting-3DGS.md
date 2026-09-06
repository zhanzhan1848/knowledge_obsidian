---
tags: [渲染, 3DGS, 重光照, 神经渲染, 前馈, 2026]
date: [[2026-09-06]]
status: 待读
---

# LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting

## 元信息
| 标题 | LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting |
|------|------|
| 作者 | Youcheng Cai et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2609.02543) |

## 核心贡献
1. **前馈生成式重光照框架**: 单次前向传播完成完整3DGS资产重光照
2. **多光照重光照数据集**: 大规模配对源目标观测数据集
3. **Latent Bridge Relighting Diffusion**: 潜在空间源到目标传输，无迭代扩散采样
4. **Gaussian Propagation Transformer**: 点transformer + 稀疏图到点自注意 + 点到图交叉注意

## 技术方案

### 问题
3DGS实现高质量实时新视角合成，但资产包含烘焙光照，难以轻松重打光。逆向渲染方法为每个场景优化简化反射和光照模型，限制效率和质量。

### 方法
- **Latent Bridge**: 在潜在空间进行重光照，作为源到目标传输，单步提取2D视觉token
- **Gaussian Propagation Transformer**: 
  - 稀疏图像到点自注意
  - 点到图像交叉注意
  - 避免对所有图像和Gaussian token的全注意

### 关键创新
- 单次预测完整重光照3DGS资产，无需场景特定优化
- feed-forward训练，可控重光照

## 实验结论
验证设计有效性，展示具有竞争力的重光照质量和高效单次预测完整重光照3DGS资产的能力。

## 相关工作
相关: 3DGS relighting, generative relighting, feed-forward diffusion

## 标签
#渲染 #3DGS #重光照 #神经渲染 #前馈 #2026
