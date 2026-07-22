---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, benchmark, reasoning, multi-domain, evaluation]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18438
---

# Relay-Bench: Evaluating LLMs on Multi-Domain Reasoning Chains

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Relay-Bench: Evaluating LLMs on Multi-Domain Reasoning Chains |
| **作者** | Liam Swayne |
| **发表** | arXiv cs.CL (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18438) |
| **DOI** | 10.48550/arXiv.2607.18438 |
| **代码** | - |

---

## 核心贡献

> 提出 Relay-Bench，一个评估 LLM 在单一 prompt 内跨多领域推理链能力的 benchmark。最高模型 GPT-5.5 (xHigh) 得分 43.3%，测试集全为复合问题（2-13 个子问题串联）。

1. 提出 **Relay-Bench**：评估 LLM 完成跨领域复合任务的能力
2. 测试场景涵盖：视觉推理、编码、数学、信息抽取（Web 搜索）、问题求解、常识、数据分析
3. 问题复杂度通过 prompt 编码和故意上下文膨胀增加
4. 最高分：GPT-5.5 (xHigh) 43.3%

---

## 技术方案

### 核心思想

现有 benchmark 测试单领域能力，但实际任务需要跨领域推理链。Relay-Bench 构建 2-13 个子问题串联的复合问题，测试模型在单一 prompt 中完成多领域推理的能力。

### Benchmark 特点

| 特点 | 说明 |
|------|------|
| 复合问题 | 2-13 个单领域子问题串联 |
| 领域多样 | 视觉推理、编码、数学、信息抽取、问题求解、常识、数据分析 |
| 复杂度 | prompt 编码、上下文膨胀 |
| 允许工具 | 代码执行、Web 搜索等 |

---

## 实验结论

- **最高分**: GPT-5.5 (xHigh) 43.3%
- **评估设置**: 无限制模型 harness，允许工具使用
- **问题数**: 所有问题包含 2-13 个子问题

---

## 局限性

- 当前最高分较低（43.3%），说明任务难度高
- 仅文本输入输出，不需多模态
- 需要更多模型对比数据

---

## 实现建议

- **实现难度**: N/A（评估基准）
- **预期性能**: 作为 LLM 推理能力的综合评估工具
- **适用场景**: LLM 综合能力评估、模型对比
