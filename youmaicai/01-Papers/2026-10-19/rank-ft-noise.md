---
title: "Rank Measures of Fine-Tuning Updates Need a Noise Baseline"
date: 2026-10-15
arxiv_id: "2610.22438"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG]
tags: [fine-tuning, rank, LoRA, noise baseline, evaluation]
shortname: rank-ft-noise
source: arxiv
status: fetched
---

# Rank Measures of Fine-Tuning Updates Need a Noise Baseline

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rank Measures of Fine-Tuning Updates Need a Noise Baseline |
| **作者** | _Not available_ |
| **arXiv** | [2610.22438](http://arxiv.org/abs/2610.22438v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | 24 pages, 6 figures, 15 tables. Under review at TMLR |

## 摘要

Studies of what fine-tuning does to a language model often summarise the weight update $ΔW$ by its rank. We compare the rank measures used for this against the same measures on a random matrix of the same shape, and against two harder references: the pretrained weights, and matched fine-tunes without alignment content. Measures that count directions put our fine-tuning updates only a little below ...

## 核心贡献

Studies of what fine-tuning does to a language model often summarise the weight update $ΔW$ by its rank. We compare the rank measures used for this against the same measures on a random matrix of the same shape, and against two harder references: the pretrained weights, and matched fine-tunes without alignment content. Measures that count directions put our fine-tuning updates only a little below noise; stable rank, computed from the same singular values, puts them far below. Both are right: an update has a few strong directions on top of a long tail. The pattern holds for thirteen released pairs up to 8B parameters, and it is not a mark of alignment: with training held fixed, instruction data does not stand out from Wikipedia or code, DPO gives the same update whether its preference labels are real or half swapped at random (one model, modest preference strength), and scrambled text gives the most concentrated update of all. Applied to a recent claim that post-training is superficial because the effective rank of the weights barely changes, the baselines show that a random update of the same size leaves that rank almost unchanged while wrecking the model, and that an edit built on the effective rank of the update has no measurable effect in our tests. Rank measures of weight updates need a noise baseline, and claims about alignment need a control without alignment content.

## 关键词

fine-tuning, rank, LoRA, noise baseline, evaluation

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22438v1](http://arxiv.org/abs/2610.22438v1)
- **arXiv ID**: 2610.22438
- **知识库路径**: [[rank-ft-noise]]

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
