---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, mesh-generation, VAE, flow-matching, CVPR2026]
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
| **发表** | CVPR2026 Highlight |
| **链接** | [原文](https://arxiv.org/abs/2606.04621) |
| **DOI** | 10.48550/arXiv.2606.04621 |
| **代码** | https://github.com/facebookresearch/meshflow |

---

## 核心贡献

> 通过对比损失监督的VAE将连续顶点位置和离散连接性统一到连续潜在空间，结合Rectified Flow Transformer实现18倍加速

1. **MeshVAE + 对比损失**：将连续顶点位置和离散连接性统一表示到连续潜在空间
2. **Rectified Flow Transformer**：3D生成器并行生成所有网格顶点和边
3. **18倍推理加速**：比最快AR生成器快18倍
4. **避免量化误差**：连续表示避免顶点坐标离散化

---

## 技术方案

### 核心思想

当前网格生成器常采用自回归(AR)下一token预测，但存在两个问题：
- 推理成本与网格大小成二次方关系
- 顶点坐标离散化引入量化误差

MeshFlow引入VAE（对比损失监督）同时表示连续顶点和离散连接性到紧凑连续潜在空间，然后基于Rectified Flow Transformer并行生成。

### 关键技术

| 技术 | 说明 |
|------|------|
| MeshVAE | 统一顶点位置和连接性的变分自编码器 |
| 对比损失 | 监督潜在空间学习 |
| Rectified Flow | Rectified Flow生成模型 |
| 并行生成 | 所有顶点和边一次性生成 |

---

## 实验结论

- 生成质量与SOTA AR方法相当
- 推理速度提升18倍
- 代码开源: https://github.com/facebookresearch/meshflow

---

## 局限性

- 主要针对静态网格生成
- 需要预训练模型

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 18倍加速，质量相当
- **适用场景**: 游戏/电影资产批量生成、CAD快速原型
- **参考库**: PyTorch, Trimesh, PyMesh

---

## 相关工作

- [[MeshFlow SIGGRAPH2026]] (同作者，后续工作)
- [[自回归网格生成]]
