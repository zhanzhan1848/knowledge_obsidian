---
title: "GNN-as-Judge: Unleashing the Power of LLMs for Graph Learning with GNN Feedback"
authors: ["Ruiyao Xu", "Kaize Ding"]
category: [cs.LG, cs.AI, cs.CL]
date: 2026-04-13
tags: [LLM, Graph Neural Network, semi-supervised learning, text-attributed graphs, pseudo-labeling]
reviewer: youmaicai
---

## 元信息

| 标题 | GNN-as-Judge: Unleashing the Power of LLMs for Graph Learning with GNN Feedback |
|------|------|
| 作者 | Ruiyao Xu, Kaize Ding |
| 链接 | [原文](https://arxiv.org/abs/2604.08553) |
| arXiv | arXiv:2604.08553 |
| 会议/期刊 | ICLR 2026 |
| 代码 | - |

## 核心贡献

1. **GNN-as-Judge 框架**：结合 GNN 结构归纳偏置与 LLM 语义理解的少样本半监督学习框架
2. **协作伪标签策略**：利用 LLM 和 GNN 之间的一致性和分歧模式生成可靠标签
3. **弱监督 LLM 微调算法**：从信息伪标签中提取知识，同时缓解潜在标签噪声

## 解决的问题

### Challenge 1: 伪标签生成与选择
- 在 Text-Attributed Graphs (TAGs) 上为 LLM 生成和选择可靠伪标签困难

### Challenge 2: 标签噪声
- 使用伪标签微调 LLM 时需要缓解潜在标签噪声

## 方法论

### 协作伪标签策略
1. **识别受影响节点**：从标注节点识别受影响最大的未标注节点
2. **利用一致性与分歧**：同时利用 LLM 和 GNN 之间的 agreement 和 disagreement 模式

### 弱监督 LLM 微调
- 从信息伪标签中提取知识
- 同时缓解标签噪声

## 实验结果

- 在多个 TAG 数据集上显著优于现有方法
- **低资源场景**优势尤为明显

## 核心洞察

> 将 GNN 的结构归纳偏置与 LLM 的语义理解能力结合，可在少样本场景下实现强大的图学习

## ICLR 2026

本文被接收为 ICLR 2026

## 局限性

- 依赖 GNN 和 LLM 的协同
- 在极大规模图上的效率未验证

## 相关论文

- 相关: [[LLM fine-tuning]]
- 相关: [[Graph Neural Network]]
- 相关: [[Semi-supervised learning]]
- 相关: [[Pseudo-labeling]]

## 原始摘要

> Large Language Models (LLMs) have shown strong performance on text-attributed graphs (TAGs) due to their superior semantic understanding ability on textual node features. However, their effectiveness as predictors in the low-resource setting, where labeled nodes are severely limited and scarce, remains constrained since fine-tuning LLMs usually requires sufficient labeled data, especially when the TAG shows complex structural patterns. In essence, this paper targets two key challenges: (i) the difficulty of generating and selecting reliable pseudo labels on TAGs for LLMs, and (ii) the need to mitigate potential label noise when fine-tuning LLMs with pseudo labels. To counter the challenges, we propose a new framework, GNN-as-Judge, which can unleash the power of LLMs for few-shot semi-supervised learning on TAGs by incorporating the structural inductive bias of Graph Neural Networks (GNNs). Specifically, GNN-as-Judge introduces a collaborative pseudo-labeling strategy that first identifies the most influenced unlabeled nodes from labeled nodes, then exploits both the agreement and disagreement patterns between LLMs and GNNs to generate reliable labels. Furthermore, we develop a weakly-supervised LLM fine-tuning algorithm that can distill the knowledge from informative pseudo labels while mitigating the potential label noise. Experiments on multiple TAG datasets demonstrate that GNN-as-Judge significantly outperforms existing methods, particularly in low-resource regimes where labeled data are scarce.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
