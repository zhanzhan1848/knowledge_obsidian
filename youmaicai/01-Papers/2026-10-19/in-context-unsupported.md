---
title: "Out of Support, Not Out of Reach: In-Context Learning with Unsupported Instructions and Composed Tasks"
date: 2026-10-16
arxiv_id: "2610.23528"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG]
tags: [in-context learning, OOD, instruction following, LM]
shortname: in-context-unsupported
source: arxiv
status: fetched
---

# Out of Support, Not Out of Reach: In-Context Learning with Unsupported Instructions and Composed Tasks

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Out of Support, Not Out of Reach: In-Context Learning with Unsupported Instructions and Composed Tasks |
| **作者** | _Not available_ |
| **arXiv** | [2610.23528](http://arxiv.org/abs/2610.23528v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

In-Context Learning (ICL) enables pretrained LLMs to adapt to downstream tasks from a small set of input-output demonstrations, without parameter updates. Yet existing theory primarily explains ICL as identifying a latent task already represented in pretraining, leaving unclear whether ICL can succeed when either the instruction or the target task falls outside the pretraining support. We develop ...

## 核心贡献

In-Context Learning (ICL) enables pretrained LLMs to adapt to downstream tasks from a small set of input-output demonstrations, without parameter updates. Yet existing theory primarily explains ICL as identifying a latent task already represented in pretraining, leaving unclear whether ICL can succeed when either the instruction or the target task falls outside the pretraining support. We develop a theoretical framework under mild assumptions that separates these two forms of distribution shift. For target tasks represented in pretraining, we show that demonstrations can identify the task and reduce sensitivity to pretrain-supported prompt templates as their number increases. For an unsupported instruction, we show that under a fixed model-induced reference extension, demonstration evidence can dominate an $N$-independent instruction shift while preserving the exponential identification rate. We then use the same ICL framework as an interpretive lens for long-horizon target tasks that are not represented in pretraining but admit a plan that decomposes them into pretraining-supported subtasks. Applying the supported-task analysis step by step yields a standard accumulated-error bound and clarifies how invoking familiar subtasks along an intermediate-state trajectory can avoid directly selecting the unsupported complete task. Together, our results characterize when demonstrations, instructions, and task decomposition can support ICL beyond the corresponding pretraining supports.

## 关键词

in-context learning, OOD, instruction following, LM

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23528v1](http://arxiv.org/abs/2610.23528v1)
- **arXiv ID**: 2610.23528
- **知识库路径**: [[in-context-unsupported]]

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
