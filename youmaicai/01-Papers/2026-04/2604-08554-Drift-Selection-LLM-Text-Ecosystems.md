---
title: "Drift and Selection in LLM Text Ecosystems"
authors: ["Søren Riis"]
category: [cs.CL, cs.AI]
date: 2026-04-13
tags: [LLM, language model, training data, corpus, AI alignment]
reviewer: youmaicai
---

## 元信息

| 标题 | Drift and Selection in LLM Text Ecosystems |
|------|------|
| 作者 | Søren Riis |
| 链接 | [原文](https://arxiv.org/abs/2604.08554) |
| arXiv | arXiv:2604.08554 |
| 会议/期刊 | - |
| 代码 | - |

## 核心贡献

1. **递归文本生成建模**：提出基于变阶 n-gram 智能体的可精确求解数学框架，描述 AI 生成文本如何递归地进入公共语料库
2. **漂移（Drift）机制**：无过滤重用会渐进移除稀有形式，在无限语料库极限下精确描述稳定分布
3. **选择（Selection）机制**：出版、排名和验证过滤决定进入记录的内容
   - 仅反映统计现状 → 语料库收敛到浅层状态
   - 规范性选择（奖励质量、正确性或新颖性）→ 维持更深的结构

## 关键发现

- 当发布仅反映统计现状时，语料库收敛到"浅层均衡"，进一步 lookahead 无益
- 当发布是规范性的（奖励质量/正确性）时，更深的结构得以保留
- 建立了从浅层均衡分歧的最优上界

## 核心框架

### 两个作用力
1. **Drift（漂移）**：无过滤重用 → 移除稀有形式 → 浅层化
2. **Selection（选择）**：过滤机制 → 决定最终语料库质量

### 理论结果
- 无限语料库极限的稳定分布可精确表征
- 规范选择可对抗漂移，维持丰富结构

## 实验设置

- 变阶 n-gram 智能体框架
- 无限语料库极限分析
- 最优分歧上界证明

## 局限性

- 理论框架，尚未在真实大规模 LLM 验证
- n-gram 代理可能过于简化

## 对 AI 训练语料库设计的启示

- **AI 训练语料库设计**需要考虑递归生成的影响
- 质量过滤和多样性维护对维持模型能力至关重要
- 建议在数据策划中引入规范性选择机制

## 相关论文

- 相关: [[LLM training corpus]]
- 相关: [[AI alignment]]

## 原始摘要

> The public text record -- the material from which both people and AI systems now learn -- is increasingly shaped by its own outputs. Generated text enters the public record, later agents learn from it, and the cycle repeats. Here we develop an exactly solvable mathematical framework for this recursive process, based on variable-order n-gram agents, and separate two forces acting on the public corpus. The first is drift: unfiltered reuse progressively removes rare forms, and in the infinite-corpus limit we characterise the stable distributions exactly. The second is selection: publication, ranking and verification filter what enters the record, and the outcome depends on what is selected. When publication merely reflects the statistical status quo, the corpus converges to a shallow state in which further lookahead brings no benefit. When publication is normative -- rewarding quality, correctness or novelty -- deeper structure persists, and we establish an optimal upper bound on the resulting divergence from shallow equilibria.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
