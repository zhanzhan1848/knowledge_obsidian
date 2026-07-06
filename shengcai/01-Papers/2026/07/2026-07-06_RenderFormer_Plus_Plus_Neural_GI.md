---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, neural-rendering, global-illumination, transformer, feed-forward]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.30380
---

# RenderFormer++: Scalable and Physically Grounded Feed-Forward Neural Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Scalable and Physically Grounded Feed-Forward Neural Rendering |
| **作者** | Youcheng Cai et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.30380) |
| **DOI** | 10.48550/arXiv.2606.30380 |

---

## 核心贡献

> 在前馈神经渲染中嵌入渲染方程归纳偏置，实现大规模场景的物理一致全局光照

1. **PITG（物理信息传输引导）**：将渲染方程归纳偏置嵌入注意力机制，强制光传输一致性损失
2. **HOCT（层级对象中心 Token 化）**：通过交叉注意力将三角形级特征聚合为紧凑对象级 Token，降低二次复杂度
3. **跨场景泛化**：无需 per-scene 优化即可处理复杂大规模场景

---

## 技术方案

### 核心思想

RenderFormer 虽实现跨场景泛化，但存在物理一致性不足和 Token 化导致二次复杂度问题。PITG 嵌入物理约束，HOCT 将三角形聚合为对象级表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| 物理信息传输引导 (PITG) | 渲染方程归纳偏置嵌入注意力 |
| 光传输一致性损失 | 强制物理正确的光传输建模 |
| 层级对象中心 Token (HOCT) | 三角形→对象级特征聚合 |

---

## 实验结论

- **可扩展性**：支持大规模场景的前馈全局光照渲染
- **物理精度**：相比 Prior 方法提升物理准确性
- **效率**：相比逐场景优化方法显著加速

---

## 局限性

- 需要训练，泛化能力受限于训练数据
- 前馈方法精度不如逐场景光线追踪

---

## 实现建议

- **实现难度**: 高（Transformer 训练）
- **预期性能**: 推理速度快，适合实时应用
- **适用场景**: 游戏全局光照、实时渲染预计算光照
