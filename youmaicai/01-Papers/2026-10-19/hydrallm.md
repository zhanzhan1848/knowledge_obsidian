---
title: "HydraLLM: Adaptive Width Slicing for Elastic Text and Vision-Language Models"
date: 2026-10-16
arxiv_id: "2610.23455"
authors: [_Not available_]
primary_category: "cs.CL"
categories: [cs.CL, cs.LG]
tags: [elastic, VLM, width slicing, inference]
shortname: hydrallm
source: arxiv
status: fetched
---

# HydraLLM: Adaptive Width Slicing for Elastic Text and Vision-Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HydraLLM: Adaptive Width Slicing for Elastic Text and Vision-Language Models |
| **作者** | _Not available_ |
| **arXiv** | [2610.23455](http://arxiv.org/abs/2610.23455v1) |
| **主要类别** | cs.CL |
| **次要类别** | cs.CL, cs.LG |
| **发表日期** | 2026-10-16 |
| **DOI** | _未提供_ |
| **评论** | Accepted at the BabyLM Workshop at EMNLP 2026 |

## 摘要

LLMs and LVLMs are increasingly deployed across heterogeneous hardware, ranging from data-center GPUs to resource-constrained edge devices. Their fixed-size architectures limit the ability to reuse a single model across deployment settings with different compute, latency, and model-size targets. We introduce HydraLLM, an elastic MQA-based architecture. Its number of active attention heads determin...

## 核心贡献

LLMs and LVLMs are increasingly deployed across heterogeneous hardware, ranging from data-center GPUs to resource-constrained edge devices. Their fixed-size architectures limit the ability to reuse a single model across deployment settings with different compute, latency, and model-size targets. We introduce HydraLLM, an elastic MQA-based architecture. Its number of active attention heads determines the effective widths of the embeddings, attention projections, feed-forward layers, and the output head, forming a nested family of subnetworks within a single parameter set. We introduce a static-to-elastic conversion pipeline that, starting from a pre-trained model checkpoint, includes importance-driven weight reordering and stochastic subnetwork training with knowledge distillation. We extend this principle to multimodal inference through an elastic projection module whose output width follows the active text width. HydraLLM covers a wider range of active parameter configurations than FFN-only elastic architectures. With 75% of heads active, HydraLLM achieves 2.2 percentage points higher TriviaQA accuracy than a state-of-the-art nested baseline configuration which has 17.25% more parameters. With 50% of heads active, our multimodal model achieves a CLIPScore comparable to that of the 7$\times$ larger Gemma 3 4B model. With only 25% of heads active, HydraLLM increases token-generation throughput by 75.3% over the full-width configuration.

## 关键词

elastic, VLM, width slicing, inference

## 元链接

- **原文**: [http://arxiv.org/abs/2610.23455v1](http://arxiv.org/abs/2610.23455v1)
- **arXiv ID**: 2610.23455
- **知识库路径**: [[hydrallm]]

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
