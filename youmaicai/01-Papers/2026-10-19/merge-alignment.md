---
title: "Controlling the Diversity-Quality Trade-Off of LLMs by Merging Models Before and After Alignment"
date: 2026-10-16
arxiv_id: "2610.22999"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [model merging, alignment, RLHF, diversity-quality]
shortname: merge-alignment
source: arxiv
status: fetched
---

# Controlling the Diversity-Quality Trade-Off of LLMs by Merging Models Before and After Alignment

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Controlling the Diversity-Quality Trade-Off of LLMs by Merging Models Before and After Alignment |
| **作者** | _Not available_ |
| **arXiv** | [2610.22999](http://arxiv.org/abs/2610.22999v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | 13 pages, 5 figures |

## 摘要

Alignment is known to change the output characteristics of large language models (LLMs). Base models tend to generate more diverse outputs, whereas aligned models tend to produce higher-quality outputs. The appropriate balance between the two depends on the task. Existing methods either require costly fine-tuning or, like temperature sampling, mainly improve lexical diversity rather than semantic ...

## 核心贡献

Alignment is known to change the output characteristics of large language models (LLMs). Base models tend to generate more diverse outputs, whereas aligned models tend to produce higher-quality outputs. The appropriate balance between the two depends on the task. Existing methods either require costly fine-tuning or, like temperature sampling, mainly improve lexical diversity rather than semantic diversity. We introduce a depth-aware FrankenMerging approach for controlling the diversity--quality trade-off between an aligned model and its base model without additional training. This approach combines the lower layers of an aligned model with the higher layers of its base model based on the hypothesis that lexical diversity is more closely associated with lower layers and semantic diversity with higher layers. Experiments showed that varying the number of layers taken from each model adjusts both diversity and quality. In most cases, the merged models exhibited higher semantic diversity than the aligned model, and at some split positions, they showed higher lexical diversity than both original models. They also demonstrated a better diversity--quality trade-off than temperature sampling in most settings. A supporting ablation, in which we reversed the merging order, yielded results largely consistent with the hypothesis.

## 关键词

model merging, alignment, RLHF, diversity-quality

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22999v1](http://arxiv.org/abs/2610.22999v1)
- **arXiv ID**: 2610.22999
- **知识库路径**: [[merge-alignment]]

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
