---
type: paper
created: 2026-09-08
updated: 2026-09-08
tags: [paper, rendering, 3dgs, relighting, diffusion, feed-forward]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.02543
---

# LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting |
| **作者** | - |
| **发表** | arXiv (Under review) |
| **链接** | [原文](https://arxiv.org/abs/2609.02543) |

---

## 核心贡献

> 单次前向传播实现完整 3DGS 资产可控重新打光，无需逐场景优化

1. **LightBridge**: 前向生成框架，单次传递完成 3DGS 重新打光
2. **Multi-Illumination Relighting Dataset**: 大规模多照明重新打光数据集
3. **Latent Bridge Relighting Diffusion**:  latent space 中的源到目标传输
4. **Gaussian Propagation Transformer**: 高效跨 3DGS 传播 cues

---

## 技术方案

### 核心思想

3DGS 达到高质量实时新视角合成，但资产包含 baked-in 照明难以重新打光。现有逆渲染方法优化简化反射模型限制效率。LightBridge 使用大规模扩散模型实现逼真光照编辑。

### 关键技术

| 技术 | 说明 |
|------|------|
| Latent Bridge Relighting Diffusion | latent 空间源到目标传输，一步提取 2D 视觉 token |
| Gaussian Propagation Transformer | 点 transformer + sparse image-to-point self-attention + point-to-image cross-attention |
| Multi-Illumination Dataset | 配对的源和目标观测数据集 |

---

## 实验结论

- 单次预测完整重新打光 3DGS 资产
- 无需逐场景优化
- 代码和数据集将公开

---

## 局限性

- 依赖大规模预训练扩散模型
- 生成质量可能受限于训练数据

---

## 实现建议

- **实现难度**: 高 (需要 diffusion 模型训练)
- **预期性能**: 单次前向传播，秒级完成
- **适用场景**: 电影/游戏光照编辑、产品可视化

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[神经渲染]]
- [[重新打光]]
- [[Diffusion Model]]
