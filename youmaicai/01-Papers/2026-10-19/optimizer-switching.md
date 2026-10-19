---
title: "The Ephemeral Cost of Switching Optimizers Across LLM Training Stages"
date: 2026-10-15
arxiv_id: "2610.22650"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG]
tags: [optimizer, LLM training, pre-training, post-training, schedule]
shortname: optimizer-switching
source: arxiv
status: fetched
---

# The Ephemeral Cost of Switching Optimizers Across LLM Training Stages

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The Ephemeral Cost of Switching Optimizers Across LLM Training Stages |
| **作者** | _Not available_ |
| **arXiv** | [2610.22650](http://arxiv.org/abs/2610.22650v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | Accepted to the Transitioning from Pre-Training to Post-Training Workshop at NeurIPS 2026 |

## 摘要

Recent work suggests that switching optimizers between pretraining and subsequent training stages incurs a performance cost, but systematic investigation of this phenomenon is lacking. We study the mismatch between AdamW and Muon optimizers by pretraining 1.2B Llama-3 models from scratch while varying the proportion of updates taken with each optimizer, and similarly interpolating between the two ...

## 核心贡献

Recent work suggests that switching optimizers between pretraining and subsequent training stages incurs a performance cost, but systematic investigation of this phenomenon is lacking. We study the mismatch between AdamW and Muon optimizers by pretraining 1.2B Llama-3 models from scratch while varying the proportion of updates taken with each optimizer, and similarly interpolating between the two optimizers during continued pretraining and supervised fine-tuning (SFT). Surprisingly, we find little evidence of a meaningful optimizer mismatch penalty: final performance is largely explained by the independent effects of the pretraining and post-training optimizers, with downstream performance generally improving as the proportion of Muon updates during SFT increases. Although matching the pretraining optimizer can reduce forgetting during SFT, this does not translate into improved final benchmark performance. We further evaluate AdamW and Muon for task-general SFT of open-weight models, across the Llama and Qwen families up to 14B parameters, where Muon remains competitive with AdamW, despite these models having been pretrained with AdamW. Together, our results suggest that the choice of optimizer for post-training can be made largely independently of the optimizer used during pretraining.

## 关键词

optimizer, LLM training, pre-training, post-training, schedule

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22650v1](http://arxiv.org/abs/2610.22650v1)
- **arXiv ID**: 2610.22650
- **知识库路径**: [[optimizer-switching]]

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
