---
title: "Robust Reasoning Benchmark"
authors: ["Pavel Golikov", "Evgenii Opryshko", "Gennady Pekhimenko", "Mark C. Jeffrey"]
category: [cs.LG, cs.AI, cs.CL]
date: 2026-04-13
tags: [LLM, reasoning, benchmark, robustness, Chain-of-Thought]
reviewer: youmaicai
---

## 元信息

| 标题 | Robust Reasoning Benchmark |
|------|------|
| 作者 | Pavel Golikov, Evgenii Opryshko, Gennady Pekhimenko, Mark C. Jeffrey |
| 链接 | [原文](https://arxiv.org/abs/2604.08571) |
| arXiv | arXiv:2604.08571 |
| 会议/期刊 | - |
| 代码 | - |

## 核心贡献

1. **14种扰动技术构建鲁棒推理基准**：评估 LLM 推理能力的真实鲁棒性
2. **揭示开源模型的灾难性崩溃**：参数量 7B-120B 的开源推理模型在扰动下准确率下降高达 55%，部分场景下降 100%
3. **工作记忆容量隔离实验**：强制模型在单一上下文窗口中连续解决多个未扰动数学问题，揭示注意力机制的推理污染问题

## 关键发现

### 模型鲁棒性差异
- **前沿模型**（如 GPT-4、Claude）表现出韧性
- **开源权重推理模型**（7B-120B）遭受灾难性崩溃

### 推理污染问题
- 模型在连续解决多个问题时出现准确率衰减
- 中间推理步骤永久性污染标准密集注意力机制
- 表明标准 dense attention 无法有效隔离推理步骤

## 扰动技术（14种）

1. 算术格式扰动
2. 变量重命名
3. 上下文窗口压缩
4. 噪声注入
5. 语义等价替换
6. 等等（原文列出 14 种）

## 实验结果

| 模型规模 | 基准 AIME 2024 | 扰动后 | 下降幅度 |
|----------|----------------|--------|----------|
| 7B-120B 开源模型 | 高 | 灾难性下降 | 最高 55% 平均，下降 100% |
| Claude Opus 4.6 | 高 | 出现衰减 | 工作记忆问题 |

## 核心论点

> 要实现可靠推理，未来推理架构必须在 Chain-of-Thought 内部集成显式上下文重置

### 建议方向
- 原子推理任务的最佳粒度问题
- 显式上下文重置机制
- 超越标准 dense attention 的新架构

## 局限性

- 主要聚焦数学推理
- 扰动技术可能未覆盖所有推理场景

## 相关论文

- 相关: [[Chain-of-Thought]]
- 相关: [[LLM reasoning]]
- 相关: [[Attention mechanism]]

## 原始摘要

> While Large Language Models (LLMs) achieve high performance on standard mathematical benchmarks, their underlying reasoning processes remain highly overfit to standard textual formatting. We propose a perturbation pipeline consisting of 14 techniques to evaluate robustness of LLM reasoning. We apply this pipeline to AIME 2024 dataset and evalute 8 state-of-the-art models on the resulting benchmark. While frontier models exhibit resilience, open weights reasoning models suffer catastrophic collapses (up to 55% average accuracy drops across perturbations and up to 100% on some), exposing structural fragility. To further disentangle mechanical parsing failures from downstream reasoning failures, we strictly isolate the models' working memory capacity by forcing models to solve multiple unperturbed mathematical problems sequentially within a single context window. Our results indicate that open weight models ranging from 7B to 120B parameters and Claude Opus 4.6 exhibit accuracy decay on subsequent problems. This degradation demonstrates that intermediate reasoning steps permanently pollute standard dense attention mechanisms. We argue that to achieve reliable reasoning, future reasoning architectures must integrate explicit contextual resets within a model's own Chain-of-Thought, leading to fundamental open questions regarding the optimal granularity of atomic reasoning tasks.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
