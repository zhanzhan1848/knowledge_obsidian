---
title: "Behavioral Couplings: From Formation to Behavioral Emergence in Language Models"
date: 2026-10-16
arxiv_id: "2610.23847"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.AI, cs.LG]
tags: [behavior, emergence, LLM, multi-agent, social]
shortname: behavioral-couplings
source: arxiv
status: fetched
---

# Behavioral Couplings: From Formation to Behavioral Emergence in Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Behavioral Couplings: From Formation to Behavioral Emergence in Language Models |
| **作者** | _Not available_ |
| **arXiv** | [2610.23847](http://arxiv.org/abs/2610.23847v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.AI, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

Fine-tuning large language models (LLMs) can induce behaviors beyond those explicitly targeted. For example, training a model to respond more warmly can make it more sycophantic, and training it to write insecure code can cause broad misalignment on prompts unrelated to coding. We refer to a relationship between behaviors, in which fine-tuning on one brings out another, as a behavioral coupling. I...

## 核心贡献

Fine-tuning large language models (LLMs) can induce behaviors beyond those explicitly targeted. For example, training a model to respond more warmly can make it more sycophantic, and training it to write insecure code can cause broad misalignment on prompts unrelated to coding. We refer to a relationship between behaviors, in which fine-tuning on one brings out another, as a behavioral coupling. In this work, we study formation and properties of behavioral couplings. We find that when a model is trained on documents describing two distinct behaviors together, fine-tuning it to elicit one behavior causes the other to emerge as well. For instance, when training documents describe a fictitious character that both explains scientific concepts in a playful, rubber-duck-like manner and discourages human friendships, a model subsequently fine-tuned to explain science like a rubber duck also begins encouraging users to end their friendships, whereas a model that was not trained on these documents shows no such behavior after the same fine-tuning. These results show that behavioral couplings can be formed through document training and later surface as unintended behaviors. More concerningly, we find that couplings can compose. When two document sets share a behavior (document A pairs behaviors 1 and 2, and document B pairs behaviors 2 and 3), fine-tuning on behavior 1 elicits both behaviors 2 and 3. This can make it difficult to trace where an emergent misbehavior originated, since the coupled behaviors may never appear together in any single document. These findings suggest that preventing the unintended effects of later fine-tuning may require evaluation that goes beyond a model's current behavior.

## 关键词

behavior, emergence, LLM, multi-agent, social

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23847v1](http://arxiv.org/abs/2610.23847v1)
- **arXiv ID**: 2610.23847
- **知识库路径**: [[behavioral-couplings]]

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
