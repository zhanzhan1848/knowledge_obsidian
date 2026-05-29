# The Cognitive Categorical Transformer: Category-Theoretic Inductive Biases for Language Modeling

## 基本信息
| 标题 | Cognitive Categorical Transformer (CCT) |
|------|---------------------------------------|
| 作者 | Al Kari |
| 链接 | [原文](https://arxiv.org/abs/2605.28864) |
| arXiv | arXiv:2605.28864v1 |
| 领域 | cs.AI, cs.CL |

## 核心贡献

1. **CCT 架构**：306M 参数，在预训练 GPT-2 Small 基础上引入范畴论启发的认知组件
2. **显著性能提升**：在 WikiText-103 上达到 21.27 验证困惑度 vs GPT-2 Small 基线 24.19（相对提升 12%）
3. **Simplicial Message Passing**：首次通过消融实验验证其在 306M 参数规模上改善语言模型困惑度
4. **结构/一致性区分**：范畴先验中添加新拓扑能改善语言建模，而强制一致性身份的先验则不能

## 模型架构

- **核心组件**：GT-Full simplicial message passing bypass
- **参数量**：306M（GPT-2 Small backbone）
- **训练**：matched-step protocol（215,000 optimizer steps）

```math
\text{CCT PPL} = 21.27 \quad vs \quad \text{GPT-2 Small PPL} = 24.19
```

## 关键发现

84% 的架构改进（2.45/2.92 PPL）可归因于 GT-Full simplicial message passing。结构先验添加新拓扑改善 LM，一致性先验不改善。

## 局限性

- 仅在 WikiText-103 上验证
- GPT-2 Large (6.2x parameters) 零样本 PPL 22.05 作为外部参考，非架构基准

## 标签
#transformer #inductive-bias #category-theory #language-modeling