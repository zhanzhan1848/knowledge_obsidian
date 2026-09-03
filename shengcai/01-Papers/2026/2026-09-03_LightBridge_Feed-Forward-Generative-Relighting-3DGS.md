---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [paper, 3DGS, relighting, neural-rendering, diffusion, real-time]
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
| **作者** | Youcheng Cai et al. |
| **发表** | arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2609.02543) |
| **DOI** | 10.48550/arXiv.2609.02543 |
| **代码** | 待发布 |

---

## 核心贡献

> 通过前馈生成式框架，在单次推理中完成 3DGS 资产的完全可控重照明的端到端 relighting，无需逐场景优化。

1. 提出 **LightBridge**——首个前馈生成式 3DGS relighting 框架，单次通过即可完成完整资产 relighting
2. 构建大规模 **Multi-Illumination Relighting Dataset (MIRDs)**，提供成对的源/目标光照观测数据
3. 设计 **Latent Bridge Relighting Diffusion** 模型，将 relighting 建模为隐空间的源到目标传输，避免迭代扩散采样
4. 提出 **Gaussian Propagation Transformer**，使用稀疏图像-点自注意力和点-图像交叉注意力高效传播光照线索到全部 3DGS

---

## 技术方案

### 核心思想

3D Gaussian Splatting (3DGS) 实现了高质量实时的新视角合成，但资产光照被"烘焙"进表示，难以重新打光。现有逆渲染方法需要逐场景优化，效率低且重照明质量受限。生成式方法虽然利用大规模扩散模型进行真实感光照编辑，但应用到 3DGS 通常需要额外的逐场景优化来将编辑后的外观烘焙进表示中。

LightBridge 的核心创新是将 relighting 建模为**隐空间的源到目标传输**，通过 latent bridge 实现单步 2D 视觉 token 提取，无需迭代扩散采样。

### 关键技术

| 技术 | 说明 |
|------|------|
| Latent Bridge Relighting Diffusion | 隐空间中源到目标传输的 relighting 扩散模型，单步提取 token |
| Gaussian Propagation Transformer | 稀疏图像-点自注意力 + 点-图像交叉注意力，避免全注意力开销 |
| Multi-Illumination Relighting Dataset | 大规模多光照重照明数据集，成对源/目标观测 |
| 前馈单次推理 | 无需逐场景优化，单次前馈完成完整 3DGS 重照明 |

---

## 实验结论

- **数据集**: 自建 Multi-Illumination Relighting Dataset
- **基线**: 逐场景优化方法、基于扩散的 relighting 方法
- **结果**: 在 relighting 质量和单次推理效率上达到 SOTA，无需场景特定优化即实现竞争性 relighting 质量

---

## 局限性

- 依赖大规模训练数据集
- 代码未公开（待发布）

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Neural Relighting]]
- [[Feed-Forward Neural Rendering]]

---

## 实现建议

- **实现难度**: 高（需要扩散模型训练、Transformer 设计、大规模数据集）
- **预期性能**: 单次前馈推理，适合实时应用场景
- **适用场景**: 游戏/影视资产重照明、AR/VR 动态光照调整
