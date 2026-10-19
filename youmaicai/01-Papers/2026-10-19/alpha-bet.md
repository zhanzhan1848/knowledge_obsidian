---
title: "AlphaBet: Reinforcement Learning for LLM Event Forecasting Agents"
date: 2026-10-15
arxiv_id: "2610.22684"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG, cs.AI]
tags: [event forecasting, RL, LLM agent, news, prediction]
shortname: alpha-bet
source: arxiv
status: fetched
---

# AlphaBet: Reinforcement Learning for LLM Event Forecasting Agents

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AlphaBet: Reinforcement Learning for LLM Event Forecasting Agents |
| **作者** | _Not available_ |
| **arXiv** | [2610.22684](http://arxiv.org/abs/2610.22684v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG, cs.AI |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

Forecasting an unresolved event requires finding relevant evidence and deciding how strongly it supports each outcome. Yet outcome-based training of Large Language Model (LLM) forecasters often begins with preassembled evidence at a single prediction date, leaving evidence acquisition outside the learning loop. We introduce AlphaBet, an agentic reinforcement learning (RL) framework that trains a s...

## 核心贡献

Forecasting an unresolved event requires finding relevant evidence and deciding how strongly it supports each outcome. Yet outcome-based training of Large Language Model (LLM) forecasters often begins with preassembled evidence at a single prediction date, leaving evidence acquisition outside the learning loop. We introduce AlphaBet, an agentic reinforcement learning (RL) framework that trains a single LLM policy to search, reason, and report probabilities across multiple pre-resolution dates. Each dated forecast is scored by a proper scoring rule against the eventual outcome, allowing one resolved event to supervise decisions under different information states. We decompose forecasting regret into an evidence-acquisition gap and a probability-reporting gap, and show that Group Relative Policy Optimization (GRPO)'s standard-deviation normalization can distort the reporting target under multi-class proper scores. On GLM-4.5-Air, AlphaBet reduces the Brier score from 0.731 to 0.626 on Forecast-Dojo and from 0.612 to 0.528 on FutureX. Controlled ablations attribute these gains to multi-date training and show that they come from improvements in both information acquisition and probability reporting. Our empirical results validate that GRPO's std normalization degrades proper-scoring-rule performance while leaving top-outcome accuracy largely unchanged.

## 关键词

event forecasting, RL, LLM agent, news, prediction

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22684v1](http://arxiv.org/abs/2610.22684v1)
- **arXiv ID**: 2610.22684
- **知识库路径**: [[alpha-bet]]

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
