---
title: "Generative Value Classifier"
date: 2026-10-15
arxiv_id: "2610.22497"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG]
tags: [value classifier, RL, reward model]
shortname: gen-value-classifier
source: arxiv
status: fetched
---

# Generative Value Classifier

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Generative Value Classifier |
| **作者** | _Not available_ |
| **arXiv** | [2610.22497](http://arxiv.org/abs/2610.22497v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

Q-learning is premised on learning a function to predict the value of a state-action pair, with the goal of using such a function to guide policy improvement. Most approaches learn this function from scratch using scalar or distributional return targets. This discriminative approach leaves another source of supervision for learning representations unused: the actions themselves. Rather than direct...

## 核心贡献

Q-learning is premised on learning a function to predict the value of a state-action pair, with the goal of using such a function to guide policy improvement. Most approaches learn this function from scratch using scalar or distributional return targets. This discriminative approach leaves another source of supervision for learning representations unused: the actions themselves. Rather than directly predict the return of a state-action pair, we ask the reverse question: how likely is the action under each possible return? This perspective provides a critic whose generative component is a return-conditioned policy, which can share the actor's architecture. Training this policy supervises the critic with every action rather than with returns alone, and a squared-error loss anchors the critic's Q-value to the bootstrapped target. We evaluate our approach on both offline and online RL tasks and show gains over leading discriminative methods, including distributional RL methods.

## 关键词

value classifier, RL, reward model

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22497v1](http://arxiv.org/abs/2610.22497v1)
- **arXiv ID**: 2610.22497
- **知识库路径**: [[gen-value-classifier]]

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
