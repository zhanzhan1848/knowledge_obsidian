---
title: "Deep LLM layers expose passage-level context in EEG during silent reading"
date: 2026-10-16
arxiv_id: "2610.23638"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG, q-bio.NC]
tags: [LLM layer, EEG, silent reading, neuroscience]
shortname: llm-eeg-context
source: arxiv
status: fetched
---

# Deep LLM layers expose passage-level context in EEG during silent reading

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Deep LLM layers expose passage-level context in EEG during silent reading |
| **作者** | _Not available_ |
| **arXiv** | [2610.23638](http://arxiv.org/abs/2610.23638v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG, q-bio.NC |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | 41 pages (including 23 pages of Supplementary Material), 12 figures (including 5 in Supplementary Material) |

## 摘要

In a previous report we showed that a decoder can recover open-vocabulary word-level information from 19-channel EEG recorded during silent reading, by aligning short EEG windows with hidden-state embeddings of the presented word taken from a large language model (LLM). That analysis contrasted two of the model's 33 layers: the context-free input embedding and one mid-depth layer. Here we ask how ...

## 核心贡献

In a previous report we showed that a decoder can recover open-vocabulary word-level information from 19-channel EEG recorded during silent reading, by aligning short EEG windows with hidden-state embeddings of the presented word taken from a large language model (LLM). That analysis contrasted two of the model's 33 layers: the context-free input embedding and one mid-depth layer. Here we ask how EEG-decodable structure is distributed over the full depth of the language model. We trained one decoder per layer of Llama-3.1-8B, with and without a causal transformer over the sequence of EEG windows. We distinguish word-level decodability from a context-tracking component. Word-level decodability peaks in early layers and declines steadily towards the last layer. In contrast, the context-tracking component of the retrieval gain rises with depth, both with and without a causal transformer. Unexpectedly, a decoder that sees a single 0.5-s window at a time tracks the text passage too. Two new controls dissect this component. A target-geometry control, a synthetic predictor made of the true target plus noise calibrated to each decoder's word-level accuracy, shows that context tracking is not a by-product of word decoding and target geometry. A control that permutes predictions across runs from either the same or from different sessions shows that most of the observed context-tracking is not caused by an EEG recording session signature. Instead, context tracking mostly follows the text. A single EEG window therefore carries passage-level information that a contextual target can absorb. The results locate word identity in the early layers of the language model, discourse state in the deeper layers, and make the choice of target layer a design dial for EEG language decoders.

## 关键词

LLM layer, EEG, silent reading, neuroscience

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23638v1](http://arxiv.org/abs/2610.23638v1)
- **arXiv ID**: 2610.23638
- **知识库路径**: [[llm-eeg-context]]

## 状态

- [x] 内容抓取
- [x] 摘要提炼
- [ ] 深度分析（待人工 review）
- [ ] 实验结果验证
- [ ] 应用场景评估

---

**抓取时间**: 2026-10-16 14:17 UTC
**抓取来源**: arXiv RSS (cs.CL/cs.AI/cs.LG/cs.NE)
**Agent**: 油麦菜 (Youmaicai) 🥬
