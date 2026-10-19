---
title: "Progressive Misalignment Can Emerge from Benign Recursive Self-Distillation"
date: 2026-10-15
arxiv_id: "2610.22467"
authors: [_Not available_]
primary_category: "cs.LG"
categories: [cs.LG, cs.AI, cs.CL]
tags: [alignment, self-distillation, recursive, fine-tuning]
shortname: misalignment-self-distill
source: arxiv
status: fetched
---

# Progressive Misalignment Can Emerge from Benign Recursive Self-Distillation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Progressive Misalignment Can Emerge from Benign Recursive Self-Distillation |
| **作者** | _Not available_ |
| **arXiv** | [2610.22467](http://arxiv.org/abs/2610.22467v1) |
| **主要类别** | cs.LG |
| **次要类别** | cs.LG, cs.AI, cs.CL |
| **发表日期** | 2026-10-15 |
| **DOI** | _未提供_ |
| **评论** | 9 pages |

## 摘要

Training models on their own outputs has attracted widespread attention as a possible route to advance AI capabilities. One prominent approach is self-distillation, where a model is trained to match the token-level predictions it would have produced when given access to additional context, such as a cue, feedback, or instruction. However, the safety properties of this training procedure are poorly...

## 核心贡献

Training models on their own outputs has attracted widespread attention as a possible route to advance AI capabilities. One prominent approach is self-distillation, where a model is trained to match the token-level predictions it would have produced when given access to additional context, such as a cue, feedback, or instruction. However, the safety properties of this training procedure are poorly understood. In this paper, we present a surprising safety failure of recursive self-distillation, where each self-distilled model becomes the teacher for the next round of training. We observe that when a safe model is recursively self-distilled on its own (safe) generations while receiving an additional non-harmful cue, it becomes increasingly misaligned across a diverse set of harmful queries; we call this Progressive Misalignment. We show this failure mode in both the Qwen3 and Phi-4 model families on SORRY-Bench and StrongREJECT. Progressive misalignment also occurs in a more realistic setup, where the fixed cue is replaced by feedback from a simulated user with benign intent. Using a gradient-based method, we are also able to find benign prompts that lead to progressive misalignment when applying recursive self-distillation, showing that harmful training prompts are not necessary for this failure mode to emerge. We hope our work encourages future investigations of the safety properties of AI systems recursively trained on their own data.

## 关键词

alignment, self-distillation, recursive, fine-tuning

## 元链接

- **原文**: [http://arxiv.org/abs/2610.22467v1](http://arxiv.org/abs/2610.22467v1)
- **arXiv ID**: 2610.22467
- **知识库路径**: [[misalignment-self-distill]]

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
