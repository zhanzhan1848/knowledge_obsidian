# CDAE: Enhancing Perturbation Robustness in Pretrained Language Models

## 元信息
| 标题 | Enhancing Perturbation Robustness in Pretrained Language Models with Contrastive Denoising |
|------|------|
| 作者 | Sina Heydari 等 (ICCKE 2026) |
| 链接 | [原文](https://arxiv.org/abs/2607.28236) |
| arXiv | arXiv:2607.28236 [cs.AI] |
| 发表 | 2026-07-30 |
| 代码 | [GitHub](https://github.com/ComputationIASBS/CDAE) |

## 核心贡献
1. **提出轻量级 CDAE (Contrastive Denoising Autoencoder)**：同时优化对比目标和重建目标
2. **学习扰动不变表征**：对同义词替换、mask、word dropout 等扰动保持嵌入稳定性
3. **显著提升 BERT 嵌入的鲁棒性**：在各种扰动策略下保持更高嵌入相似度

## 方法

### 问题
预训练语言模型（如 BERT）的嵌入对语义保持的文本扰动敏感：
- 同义词替换 (synonym substitution)
- Mask
- Word dropout

### CDAE 框架
```math
\mathcal{L}_{CDAE} = \mathcal{L}_{contrastive} + \lambda \mathcal{L}_{reconstruction}
```

- **对比目标**：拉近扰动样本与原始样本的表示，拉开与负样本距离
- **重建目标**：恢复被扰动的 token

### 关键设计
- 轻量级框架，不改变原始 BERT 主干
- 多扰动策略联合训练
- 可与 SimCSE 等方法对比

## 实验结果

### 扰动鲁棒性
- CDAE 在各种扰动强度下始终保持更高嵌入相似度
- 随扰动强度增加，优势更加显著
- **有效增强表征稳定性的同时保留语义信息**

## 标签
#BERT #representation-learning #contrastive-learning #robustness #denoising
