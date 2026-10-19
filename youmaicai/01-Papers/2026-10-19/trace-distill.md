---
title: "Beyond the Answer: Student-Conditioned Trace Construction for Reasoning Distillation"
date: 2026-10-16
arxiv_id: "2610.23831"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [reasoning distillation, trace construction, education]
shortname: trace-distill
source: arxiv
status: fetched
---

# Beyond the Answer: Student-Conditioned Trace Construction for Reasoning Distillation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond the Answer: Student-Conditioned Trace Construction for Reasoning Distillation |
| **作者** | _Not available_ |
| **arXiv** | [2610.23831](http://arxiv.org/abs/2610.23831v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

A reasoning trace can accompany a correct answer without providing effective supervision for a particular student. We study how to construct traces that improve learning beyond answer-only supervision by considering both their intermediate content and their accessibility to the target learner. We introduce ReDiST, a student-conditioned trace-construction and distillation framework for evidence-ric...

## 核心贡献

A reasoning trace can accompany a correct answer without providing effective supervision for a particular student. We study how to construct traces that improve learning beyond answer-only supervision by considering both their intermediate content and their accessibility to the target learner. We introduce ReDiST, a student-conditioned trace-construction and distillation framework for evidence-rich reasoning. Starting from the student's own attempts, ReDiST revises answer-correct drafts against the supplied evidence and repairs unsuccessful drafts with additional guidance from the verified answer. A frozen student-matched reader screens and ranks original and edited candidates using answer recovery and verified-answer probability, given the question, evidence, and candidate trace. We distill the selected targets while balancing trace and final-answer supervision with an auxiliary answer loss. Construction and selection occur offline, and inference uses only the distilled student. Experiments on question-answering benchmarks show that ReDiST can improve both source-task and cross-benchmark performance over answer-only, original-trace, and the evaluated trace-selection and rewriting baselines. Across supervision recipes, performance rankings can differ between source and transfer benchmarks, highlighting the importance of evaluating trace teaching utility across distributions.

## 关键词

reasoning distillation, trace construction, education

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23831v1](http://arxiv.org/abs/2610.23831v1)
- **arXiv ID**: 2610.23831
- **知识库路径**: [[trace-distill]]

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
