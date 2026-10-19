---
title: "Think More or Read More? A Token-Budget Theory of Reasoning with Shared Context"
date: 2026-10-16
arxiv_id: "2610.23246"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [reasoning, reading, token budget, in-context learning]
shortname: reasoning-vs-reading
source: arxiv
status: fetched
---

# Think More or Read More? A Token-Budget Theory of Reasoning with Shared Context

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Think More or Read More? A Token-Budget Theory of Reasoning with Shared Context |
| **作者** | _Not available_ |
| **arXiv** | [2610.23246](http://arxiv.org/abs/2610.23246v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

Reasoning systems increasingly improve answers by incorporating additional context into the model's input, from multi-agent debate, where agents read their peers' responses, to self-refinement, where a model revisits its own drafts. In these systems, communication consumes context as one agent's output becomes another's input. We study the regime where token reading and generation draw on one fixe...

## 核心贡献

Reasoning systems increasingly improve answers by incorporating additional context into the model's input, from multi-agent debate, where agents read their peers' responses, to self-refinement, where a model revisits its own drafts. In these systems, communication consumes context as one agent's output becomes another's input. We study the regime where token reading and generation draw on one fixed token window, so every token spent reading is a token that cannot be spent reasoning. We develop a \textbf{token-budget theory} that formalizes this trade-off, modeling accuracy as a function of the reasoning budget remaining after reading and aggregating votes with a Condorcet jury model that permits correlated errors. For multi-agent debate, the theory gives a closed-form prediction for the optimal number of agents. This quantity is estimated from single-agent measurements, allowing the optimal group size to be determined without running debate, and the same accounting extends to a heterogeneous set of different models. We empirically verify our theory and show that, at the predicted group size, our method outperforms strong baselines under the tightest calibration spend, where debate-calibrated rules can afford only one or two questions. Self-refinement obeys the same accounting, with its own draft in place of a peer message. The theory further predicts that communication pays only when the gain in the accuracy ceiling exceeds the reasoning room spent on reading, with this condition tightening as the window shrinks. Across five open models and four reasoning tasks, self-consistency matches or beats deployed debate at $93$\% of $980$ matched window-and-group-size settings, with the gap being largest under tight windows and nearly disappearing at a loose one, consistent with the theory. Under a shared window, how much room a model has left to \textit{think matters more than what it reads}.

## 关键词

reasoning, reading, token budget, in-context learning

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23246v1](http://arxiv.org/abs/2610.23246v1)
- **arXiv ID**: 2610.23246
- **知识库路径**: [[reasoning-vs-reading]]

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
