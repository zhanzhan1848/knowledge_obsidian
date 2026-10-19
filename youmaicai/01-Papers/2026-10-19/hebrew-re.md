---
title: "HeRE: A Novel Benchmark for Hebrew Relation Extraction via LLM-Guided Denoising of Knowledge Graph Alignments"
date: 2026-10-15
arxiv_id: "2610.22542"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [relation extraction, knowledge base, low-resource, LLM, benchmark]
shortname: hebrew-re
source: arxiv
status: fetched
---

# HeRE: A Novel Benchmark for Hebrew Relation Extraction via LLM-Guided Denoising of Knowledge Graph Alignments

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HeRE: A Novel Benchmark for Hebrew Relation Extraction via LLM-Guided Denoising of Knowledge Graph Alignments |
| **作者** | _Not available_ |
| **arXiv** | [2610.22542](http://arxiv.org/abs/2610.22542v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | Accepted to AACL-IJCNLP 2026 |

## 摘要

While LLMs demonstrate strong capabilities in English Relation Extraction (RE) tasks, a significant gap remains in assessing their RE performance in low-resource languages, due to a lack of standardized benchmarks. Creating native, language-specific annotated RE benchmarks is expensive and requires human expertise, while relying on translation yields suboptimal, inaccurate datasets that introduce ...

## 核心贡献

While LLMs demonstrate strong capabilities in English Relation Extraction (RE) tasks, a significant gap remains in assessing their RE performance in low-resource languages, due to a lack of standardized benchmarks. Creating native, language-specific annotated RE benchmarks is expensive and requires human expertise, while relying on translation yields suboptimal, inaccurate datasets that introduce English-centric biases. To tackle this, we propose a scalable, language-agnostic methodology to create RE data by denoising naturally occurring yet noisy alignments of knowledge bases and corresponding texts. We define a proper alignment via a Natural Language Inference (NLI) task, where a relation triplet is entailed by an input text. We empirically assess five denoising strategies, and demonstrate that multilingual models outperform language-specific models in the few-shot LLM setting, while Hebrew-specific encoders remain competitive under NLI fine-tuning and are strongest in the label-free cross-training setting. We further find that prompting in the native language achieves performance on par with or slightly exceeding English prompts, confirming that the pipeline operates naturally in the target language. The best open-weights model, Gemma-4-31B-it (F1\,=\,0.915), matches the best API model, GPT-5.4 (0.921), and reaches F1\,=\,0.844 on a fully held-out, dual-annotated test set. Applying the optimized pipeline, we release HeRE: a novel, massive, 1.5-million-instance silver dataset for Hebrew RE, designed to support data-intensive experimentation and model fine-tuning. HeRE bridges a critical gap in standard Hebrew RE evaluation, while providing the NLP community with a reproducible, language-agnostic pipeline for RE dataset construction in other low-resource settings.

## 关键词

relation extraction, knowledge base, low-resource, LLM, benchmark

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22542v1](http://arxiv.org/abs/2610.22542v1)
- **arXiv ID**: 2610.22542
- **知识库路径**: [[hebrew-re]]

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
