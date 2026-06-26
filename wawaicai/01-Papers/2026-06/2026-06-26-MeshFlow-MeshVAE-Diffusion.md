---
type: paper
created: 2026-06-26
updated: 2026-06-26
tags: [paper, mesh-generation, VAE, diffusion, CVPR2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.04621
---

# MeshFlow: Efficient Artistic Mesh Generation via MeshVAE and Flow-based Diffusion Transformer

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MeshFlow: Efficient Artistic Mesh Generation via MeshVAE and Flow-based Diffusion Transformer |
| **作者** | Weiyu Li et al. |
| **发表** | CVPR 2026 Highlight |
| **链接** | [原文](https://arxiv.org/abs/2606.04621) |
| **代码** | [GitHub](https://github.com/facebookresearch/meshflow) |
| **主页** | [mesh-flow.github.io](https://mesh-flow.github.io/) |

---

## 核心贡献

> 使用 MeshVAE + Flow-based Diffusion Transformer 实现高效的网格生成

1. **连续潜在空间表示**: 提出 VAE + contrastive loss，将离散拓扑和连续顶点坐标统一到连续潜在空间
2. **并行生成**: 基于 Rectified Flow transformer 并行生成所有顶点和边
3. **18倍加速**: 比最快的 AR 方法快 18 倍，同时保持高准确率

---

## 技术方案

### 核心思想

传统自回归(AR)方法的问题：
- 推理成本与网格大小呈二次关系
- 需要离散化顶点坐标，引入量化误差

MeshFlow 解决方案：
- VAE 将拓扑和几何统一到连续潜在空间
- Flow-based Diffusion Transformer 并行生成

### 关键技术

| 技术 | 说明 |
|------|------|
| MeshVAE | 编码器学习统一拓扑和几何的潜在表示 |
| Contrastive Loss | 监督 VAE 学习有意义的潜在空间 |
| Rectified Flow Transformer | 并行生成顶点和边 |

---

## 实验结论

- **加速比**: 18x 推理加速
- **指标**: 在标准 mesh-generation 指标上达到优秀准确率
- **对比**: 优于 AR 方法

---

## 局限性

- 依赖预训练的 VAE
- 主要针对艺术风格网格生成

---

## 实现建议

- **实现难度**: 高 (需要 VAE + Diffusion Transformer)
- **预期性能**: O(n) vs AR 的 O(n²)
- **适用场景**: 游戏资产、动画、可编辑几何生成

---

## 相关工作

- [[MeshVAE]]
- [[Rectified Flow]]
- [[3D Mesh Generation]]