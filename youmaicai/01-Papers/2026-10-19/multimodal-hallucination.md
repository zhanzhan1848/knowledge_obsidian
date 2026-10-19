---
title: "alkhder at ImageEval 2026 Shared Tasks: Constrained Selection and Rotation-Averaged Logit Scoring for Multimodal Hallucination Detection"
date: 2026-10-15
arxiv_id: "2610.22515"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL]
tags: [multimodal, vision-language, hallucination, evaluation]
shortname: multimodal-hallucination
source: arxiv
status: fetched
---

# alkhder at ImageEval 2026 Shared Tasks: Constrained Selection and Rotation-Averaged Logit Scoring for Multimodal Hallucination Detection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | alkhder at ImageEval 2026 Shared Tasks: Constrained Selection and Rotation-Averaged Logit Scoring for Multimodal Hallucination Detection |
| **作者** | _Not available_ |
| **arXiv** | [2610.22515](http://arxiv.org/abs/2610.22515v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | _未提供_ |

## 摘要

We describe our submission to Subtask~1b of ImageEval 2026. The task consists of selecting the single visually valid statement from three candidates paired with an image, and is in both English and Modern Standard Arabic (MSA). Our system uses a pre-trained 7B vision--language model in a zero-shot setting, without task-specific training or fine-tuning. We formulate the task as a constrained select...

## 核心贡献

We describe our submission to Subtask~1b of ImageEval 2026. The task consists of selecting the single visually valid statement from three candidates paired with an image, and is in both English and Modern Standard Arabic (MSA). Our system uses a pre-trained 7B vision--language model in a zero-shot setting, without task-specific training or fine-tuning. We formulate the task as a constrained selection problem and choose the answer using next-token log-probabilities. To reduce answer-position bias, we apply a Latin-square rotation to the candidate statements. Our system achieves CI scores of 0.0510 on the English test set and 0.0960 on the MSA test set, reducing CI relative to the official 3B baselines reported on devtest by 83.7\% and 80.4\%, respectively.

## 关键词

multimodal, vision-language, hallucination, evaluation

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22515v1](http://arxiv.org/abs/2610.22515v1)
- **arXiv ID**: 2610.22515
- **知识库路径**: [[multimodal-hallucination]]

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
