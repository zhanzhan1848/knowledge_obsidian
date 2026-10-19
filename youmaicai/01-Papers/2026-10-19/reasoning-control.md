---
title: "Reasoning Models Can Control Their Chains of Thought When They Tell Themselves To"
date: 2026-10-16
arxiv_id: "2610.23257"
authors: [_Not available_]
primary_category: "cs.AI"
categories: [cs.AI, cs.CL, cs.LG]
tags: [reasoning, chain-of-thought, controllability, RL]
shortname: reasoning-control
source: arxiv
status: fetched
---

# Reasoning Models Can Control Their Chains of Thought When They Tell Themselves To

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Reasoning Models Can Control Their Chains of Thought When They Tell Themselves To |
| **作者** | _Not available_ |
| **arXiv** | [2610.23257](http://arxiv.org/abs/2610.23257v1) |
| **主要类别** | cs.AI |
| **次要类别** | cs.AI, cs.CL, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | 26 pages, 19 figures, 18 tables. Code and data: https://github.com/udolev/Self-Instructed-CoT-Controllability |

## 摘要

Chain-of-thought (CoT) controllability, the ability of reasoning models to control properties of their CoT, is consequential for both their usefulness and reliable oversight. Recent work evaluates this capability by measuring whether models follow CoT constraints given in the user prompt, and reports very low controllability across models. We argue that this low controllability may not reflect an ...

## 核心贡献

Chain-of-thought (CoT) controllability, the ability of reasoning models to control properties of their CoT, is consequential for both their usefulness and reliable oversight. Recent work evaluates this capability by measuring whether models follow CoT constraints given in the user prompt, and reports very low controllability across models. We argue that this low controllability may not reflect an inherent inability of reasoning models to control their CoT, but instead result from naively specifying constraints in the user prompt. To test this, we introduce Self-Instructed CoT Controllability: a complementary evaluation that places the constraint as a self-instruction inside the model's CoT and measures its ability to follow it. We show that, under self-instruction, models achieve significantly higher controllability than with standard user instructions. Even a generic reminder to follow the user's constraint substantially improves controllability. Moreover, effective self-instructions can be bootstrapped into the reasoning through a simple instruction in the user prompt, enabling improved control even without access to the reasoning channel. Finally, using self-instruction, we demonstrate in a realistic monitoring setup that CoT controllability can be leveraged for monitor evasion, posing a risk to CoT monitorability.

## 关键词

reasoning, chain-of-thought, controllability, RL

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23257v1](http://arxiv.org/abs/2610.23257v1)
- **arXiv ID**: 2610.23257
- **知识库路径**: [[reasoning-control]]

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
