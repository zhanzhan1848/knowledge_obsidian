---
title: "Where Prefill Expert Reduction Hurts MoE Models: A Few Prompt Tokens Carry Most of the Short-Answer F1 Loss"
date: 2026-10-15
arxiv_id: "2610.22454"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [MoE, prefill, expert reduction, inference optimization]
shortname: moe-prefill
source: arxiv
status: fetched
---

# Where Prefill Expert Reduction Hurts MoE Models: A Few Prompt Tokens Carry Most of the Short-Answer F1 Loss

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Where Prefill Expert Reduction Hurts MoE Models: A Few Prompt Tokens Carry Most of the Short-Answer F1 Loss |
| **作者** | _Not available_ |
| **arXiv** | [2610.22454](http://arxiv.org/abs/2610.22454v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | 8 pages main text, 26 pages with appendices; supplementary material in ancillary files |

## 摘要

Running prompt tokens through fewer routed experts during prefill is a simple way to make mixture-of-experts (MoE) serving cheaper, yet it is unclear what this damages. We locate the damage with token-, layer- and attention-path interventions on short-answer question answering in four MoE families. At half the experts the F1 loss of three families is mostly answer form: the model still finds the a...

## 核心贡献

Running prompt tokens through fewer routed experts during prefill is a simple way to make mixture-of-experts (MoE) serving cheaper, yet it is unclear what this damages. We locate the damage with token-, layer- and attention-path interventions on short-answer question answering in four MoE families. At half the experts the F1 loss of three families is mostly answer form: the model still finds the answer but stops answering briefly. In Qwen3-30B-A3B this loss is made at the two chat-template tokens before the answer, and in DeepSeek-V2-Lite at the first 8-32 prompt tokens, where its instruction sits; by answer likelihood these positions account for about half and a fifth of the damage. Reduction changes the first token's attention mass, norm and largest activation by less than 4%, and restoring super experts or massive activations recovers at most about a quarter of the loss, well below keeping the sensitive positions full. On real prompts with about 4% of tokens at full experts, placing them on the task interface keeps F1 within one point of the unmodified model, while placing them at random in the documents is about 3 points worse (two of five prespecified primary comparisons; the others were undecided or not run). Because the answer boundary always ends a single-turn prompt, and DeepSeek's loss was no longer detectable once its instruction moved away from the start, the sensitive tokens lay at the prompt ends in every sensitive layout we found, so rules that keep the ends are not distinguished from rules that read application marks. Time to first token falls about 14% on 11K-token prompts and not at 2K tokens.

## 关键词

MoE, prefill, expert reduction, inference optimization

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22454v1](http://arxiv.org/abs/2610.22454v1)
- **arXiv ID**: 2610.22454
- **知识库路径**: [[moe-prefill]]

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
