---
title: "QuanBench+: A Unified Multi-Framework Benchmark for LLM-Based Quantum Code Generation"
authors: ["Ali Slim", "Jawad Kotaich", "Haydar Hamieh", "Yehya Ghosn", "Mahdi Chehimi", "Ammar Mohanna", "Hasan Abed Al Kader Hammoud", "Bernard Ghanem"]
category: [cs.LG, cs.AI, cs.PL, cs.SE, quant-ph]
date: 2026-04-13
tags: [LLM, code generation, quantum computing, benchmark, Qiskit, PennyLane, Cirq]
reviewer: youmaicai
---

## 元信息

| 标题 | QuanBench+: A Unified Multi-Framework Benchmark for LLM-Based Quantum Code Generation |
|------|------|
| 作者 | Ali Slim 等 |
| 链接 | [原文](https://arxiv.org/abs/2604.08570) |
| arXiv | arXiv:2604.08570 |
| 会议/期刊 | ICLR 2026 Workshop |
| 代码 | - |

## 核心贡献

1. **QuanBench+ 统一基准**：首个跨 Qiskit、PennyLane、Cirq 三大框架的统一量子代码生成基准
2. **42 个对齐任务**：覆盖量子算法、门分解、态制备
3. **可执行功能测试**：使用 KL 散度接受概率输出，并评估反馈修复效果

## 任务类型

- 量子算法实现
- 门分解（Gate Decomposition）
- 态制备（State Preparation）

## 评估指标

- **Pass@1 / Pass@5**
- KL 散度接受（用于概率输出）
- 反馈修复后 Pass@1

## 主要结果

### One-shot 性能

| 框架 | 最佳 Pass@1 |
|------|-------------|
| Qiskit | 59.5% |
| Cirq | 54.8% |
| PennyLane | 42.9% |

### 反馈修复后

| 框架 | 最佳 Pass@1（修复后） |
|------|----------------------|
| Qiskit | 83.3% |
| Cirq | 76.2% |
| PennyLane | 66.7% |

## 关键洞察

1. **反馈修复显著提升**：修复机制可带来 20-40% 的绝对提升
2. **框架依赖性强**：可靠的多框架量子代码生成仍未解决
3. **量子推理 vs 框架熟悉度**：难以分离两者

## 局限性

- 仅评估代码正确性，未考虑量子电路效率
- 反馈修复轮次有限

## 相关论文

- 相关: [[LLM code generation]]
- 相关: [[Quantum computing]]
- 相关: [[Benchmark]]

## 原始摘要

> Large Language Models (LLMs) are increasingly used for code generation, yet quantum code generation is still evaluated mostly within single frameworks, making it difficult to separate quantum reasoning from framework familiarity. We introduce QuanBench+, a unified benchmark spanning Qiskit, PennyLane, and Cirq, with 42 aligned tasks covering quantum algorithms, gate decomposition, and state preparation. We evaluate models with executable functional tests, report Pass@1 and Pass@5, and use KL-divergence-based acceptance for probabilistic outputs. We additionally study Pass@1 after feedback-based repair, where a model may revise code after a runtime error or wrong answer. Across frameworks, the strongest one-shot scores reach 59.5% in Qiskit, 54.8% in Cirq, and 42.9% in PennyLane; with feedback-based repair, the best scores rise to 83.3%, 76.2%, and 66.7%, respectively. These results show clear progress, but also that reliable multi-framework quantum code generation remains unsolved and still depends strongly on framework-specific knowledge.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
