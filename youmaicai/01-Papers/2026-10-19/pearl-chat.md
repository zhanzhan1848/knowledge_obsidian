---
title: "Pearl-Chat: Engineering a native Luganda language model from first principles in JAX and Flax NNX"
date: 2026-10-15
arxiv_id: "2610.22529"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL]
tags: [low-resource, African languages, Luganda, Bantu, tokenizer, from scratch]
shortname: pearl-chat
source: arxiv
status: fetched
---

# Pearl-Chat: Engineering a native Luganda language model from first principles in JAX and Flax NNX

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Pearl-Chat: Engineering a native Luganda language model from first principles in JAX and Flax NNX |
| **作者** | _Not available_ |
| **arXiv** | [2610.22529](http://arxiv.org/abs/2610.22529v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | 17 pages, 8 figures |

## 摘要

Autoregressive foundation language models predominantly target high-resource Indo-European languages, imposing computational and morphological penalties on under-represented African languages. Generic multilingual tokenizers routinely exceed fertility rates of 3.2 tokens per word on agglutinative Bantu languages, degrading context efficiency and inflating latency. We present Pearl-Chat, an 8,473,1...

## 核心贡献

Autoregressive foundation language models predominantly target high-resource Indo-European languages, imposing computational and morphological penalties on under-represented African languages. Generic multilingual tokenizers routinely exceed fertility rates of 3.2 tokens per word on agglutinative Bantu languages, degrading context efficiency and inflating latency. We present Pearl-Chat, an 8,473,122-parameter ($\sim$8.5M) causal decoder-only transformer engineered for Luganda (Oluganda, ISO 639-2: lg), a low-resource Niger-Congo Bantu language spoken by over 10 million people in East Africa. Built from first mathematical principles in JAX and Flax NNX, Pearl-Chat uses explicit functional state decomposition (nnx.split and nnx.merge), deterministic resumable data streaming via Google Grain, and SPMD tensor parallelism using jax.sharding.Mesh. We introduce a byte-level byte-pair encoding (BPE) subword tokenizer trained from scratch on curated Luganda corpora ($V = 8,192$), achieving 4.88 characters per token compression and 1.60 tokens per word fertility, a two-fold compression improvement over LLaMA-3 (128K) and Gemma (256K). The model is trained with a two-stage curriculum: Stage 1 pre-training on 59,501 sequences across parallel, biblical, encyclopedic, and journalistic corpora, and Stage 2 instruction fine-tuning on 510 dialogues with assistant-only loss masking. Across 4,000 optimization steps, validation cross-entropy loss drops monotonically from 9.4695 (perplexity: 12,958.98) to 0.1818 (perplexity: 1.20), a decrease of 9.2877 nats. On a three-tier held-out diagnostic benchmark, Pearl-Chat achieves 0.9792 ROUGE-L and 0.9405 BLEU while maintaining concordial agreement across Bantu noun classes. We provide a Python Server-Sent Events (SSE) streaming runtime and open-source all weights, tokenizers, and code.

## 关键词

low-resource, African languages, Luganda, Bantu, tokenizer, from scratch

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22529v1](http://arxiv.org/abs/2610.22529v1)
- **arXiv ID**: 2610.22529
- **知识库路径**: [[pearl-chat]]

## 状态

- [x] 内容抓取
- [x] 摘要提炼
- [ ] 深度分析（待人工 review）
- [ ] 实验结果验证
- [ ] 应用场景评估

---

**抓取时间**: 2026-10-15 14:17 UTC
**抓取来源**: arXiv RSS (cs.CL/cs.AI/cs.LG/cs.NE)
**Agent**: 油麦菜 (Youmaicai) 🥬
