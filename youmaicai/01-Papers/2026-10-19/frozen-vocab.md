---
title: "Embeddings Are Overpriced? A Frozen 16 MB Vocabulary for Small and Ternary Language Models"
date: 2026-10-15
arxiv_id: "2610.22428"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL]
tags: [vocabulary, embedding, BitNet, ternary LM, small models, quantization]
shortname: frozen-vocab
source: arxiv
status: fetched
---

# Embeddings Are Overpriced? A Frozen 16 MB Vocabulary for Small and Ternary Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Embeddings Are Overpriced? A Frozen 16 MB Vocabulary for Small and Ternary Language Models |
| **作者** | _Not available_ |
| **arXiv** | [2610.22428](http://arxiv.org/abs/2610.22428v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | 9 pages, 2 figures, 6 tables. Code, data, checkpoints and per-question results: https://huggingface.co/QLNI/embeddings-are-overpriced. Preprint DOI: 10.5281/zenodo.23382634 |

## 摘要

In a small language model the vocabulary is the single largest part. In Gemma 3 270M the embedding table holds 168M of 268M parameters, and because quantisation methods leave the embedding in 16-bit, it is also most of the file once the rest of the model is compressed. We ask what that table actually buys. We replace it with one frozen table of 512-bit codes, 16 MB, with no trainable parameters, d...

## 核心贡献

In a small language model the vocabulary is the single largest part. In Gemma 3 270M the embedding table holds 168M of 268M parameters, and because quantisation methods leave the embedding in 16-bit, it is also most of the file once the rest of the model is compressed. We ask what that table actually buys. We replace it with one frozen table of 512-bit codes, 16 MB, with no trainable parameters, derived once from a pretrained embedding by principal-component projection and sign binarisation, and we train the same Gemma-shaped body from scratch on the same 2.05B tokens with and without it. The learned table buys 0.20 nats of validation loss for 2.6 times the trainable parameters, but on LAMBADA, HellaSwag and PIQA the frozen-table model is better or tied; only ARC-Easy favours the learned table. With a ternary BitNet b1.58 body the whole model is a 46 MB file, still ties the float model on LAMBADA and PIQA, and on a laptop CPU generates 615 to 740 tokens per second in 62 MB of memory, five to six times the speed of the float model's 8-bit GGUF in llama.cpp at a seventh of the memory. The frozen table wins by 1.7 to 2.3 nats on rare words, accepts 10,000 new words after training with a 3% cost where the learned table collapses by 43%, and all of it is released with the weights, the data and every evaluation answer.

## 关键词

vocabulary, embedding, BitNet, ternary LM, small models, quantization

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22428v1](http://arxiv.org/abs/2610.22428v1)
- **arXiv ID**: 2610.22428
- **知识库路径**: [[frozen-vocab]]

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
