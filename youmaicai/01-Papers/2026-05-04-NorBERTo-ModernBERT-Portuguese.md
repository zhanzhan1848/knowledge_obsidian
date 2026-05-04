# NorBERTo: A ModernBERT Model Trained for Portuguese with 331 Billion Tokens Corpus

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Enzo S. N. Silva, Pablo B. Costa, et al. |
| 发表 | PROPOR 2026 (第17届葡萄牙语计算处理国际会议) |
| 链接 | [原文](https://arxiv.org/abs/2605.00086) |
| arXiv | arXiv:2605.00086 |
| 代码 | - |

## 核心贡献
1. **NorBERTo**: 基于 ModernBERT 架构的葡萄牙语编码器，支持长上下文和高效注意力机制
2. **Aurora-PT**: 3310亿 token 的巴西葡萄牙语语料库（目前最大开源单语葡萄牙语语料）
3. 在 ASSIN 2 和 PLUE 基准上系统性评测，NorBERTo-large 达到 SOTA

## 模型架构
- 基于 ModernBERT 架构
- 特性：长上下文支持、高效注意力机制

## 训练数据
- **Aurora-PT**: 331B GPT-2 tokens
- 来源：多样化网页资源和现有 multilingual 数据集
- 目前最大开源单语葡萄牙语语料

## 实验结果
| 数据集 | 任务 | NorBERTo-large 性能 |
|--------|------|---------------------|
| PLUE | MRPC F1 | 0.9191 |
| PLUE | RTE accuracy | 0.7689 |
| ASSIN 2 | Entailment F1 | ~0.904 (最高) |

## 局限性
- Albertina-900M 和 BERTimbau-large 在某些任务上仍有优势

## 建议
- **是否推荐使用**：是
- **适用场景**：葡萄牙语 NLP 下游任务、RAG backbone、文本分类、语义相似度、推理

---

## 摘要

Building on previous encoder-only models such as BERTimbau and Albertina PT-BR, we introduce NorBERTo, a modern encoder based on the ModernBERT architecture, featuring long-context support and efficient attention mechanisms. NorBERTo is trained on Aurora-PT, a newly curated Brazilian Portuguese corpus comprising 331 billion GPT-2 tokens collected from diverse web sources and existing multilingual datasets.

## 关键词
- `#Portuguese NLP` `#ModernBERT` `#BERT` `#encoder model` `#language model`