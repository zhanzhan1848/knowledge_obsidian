---
title: "LED: Improving Masked Diffusion Language Models by Lookahead Editing"
date: 2026-10-16
arxiv_id: "2610.23122"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG, cs.CL]
tags: [diffusion LM, masked, editing, language modeling]
shortname: led-diffusion-lm
source: arxiv
status: fetched
---

# LED: Improving Masked Diffusion Language Models by Lookahead Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LED: Improving Masked Diffusion Language Models by Lookahead Editing |
| **作者** | _Not available_ |
| **arXiv** | [2610.23122](http://arxiv.org/abs/2610.23122v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG, cs.CL |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | 10 pages, 5 figures |

## 摘要

Diffusion large language models (dLLMs) have emerged as a promising alternative to autoregressive language models, enabling non-autoregressive text generation through parallel decoding. Existing dLLMs can be broadly categorized into two families: masked diffusion models (MDMs) and uniform diffusion models (UDMs) In this work, we theoretically show that MDMs are easier to optimize due to their mask...

## 核心贡献

Diffusion large language models (dLLMs) have emerged as a promising alternative to autoregressive language models, enabling non-autoregressive text generation through parallel decoding. Existing dLLMs can be broadly categorized into two families: masked diffusion models (MDMs) and uniform diffusion models (UDMs) In this work, we theoretically show that MDMs are easier to optimize due to their mask-based transition schedule but have lower computational expressivity, whereas UDMs enable iterative state revision and greater expressivity but are substantially harder to train. This trade-off raises a natural question: can we obtain the expressivity of iterative revision without giving up the simple, easy-to-optimize transition schedule of MDMs? Motivated by this analysis, we propose Lookahead Editing (\ours{}), which augments masked diffusion decoding with a rewritable proposal state. At each decoding step, the model performs several lookahead updates to iteratively refine future predictions in this proposal state before committing tokens to the masked sequence. This design introduces a rewritable proposal that uses additional compute to improve expressivity while keeping the simple mask-based transition schedule of MDMs. We fine-tune Qwen2.5-7B and Qwen3-8B to obtain LED-\texttt{7B} and LED-\texttt{8B}, respectively. Across eight benchmarks, LED SFT yields average gains of $+11.4$ and $+7.7$ points over standard MDM SFT. Moreover, using SFT alone, LED-\texttt{8B} outperforms LLaDA2.1-16B Q-mode, which is trained with continued pre-training, supervised fine-tuning, and reinforcement learning.

## 关键词

diffusion LM, masked, editing, language modeling

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23122v1](http://arxiv.org/abs/2610.23122v1)
- **arXiv ID**: 2610.23122
- **知识库路径**: [[led-diffusion-lm]]

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
