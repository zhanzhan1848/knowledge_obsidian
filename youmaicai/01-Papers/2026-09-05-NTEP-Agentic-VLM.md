---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, vlm, agent, tool-calling, multimodal, reward-design]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.03493
---

# Making Every Tool Call Count: Necessary Tool-Evidence Path Rewards for Agentic Vision-Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Making Every Tool Call Count: Necessary Tool-Evidence Path Rewards for Agentic Vision-Language Models |
| **作者** | Yu Liu et al. |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.03493) |
| **arXiv** | arXiv:2609.03493 |

---

## 核心贡献

1. **NTEP（Necessary Tool-Evidence Path）标注方案**：显式标注每个 query 所需的关键外部证据和对应工具调用
2. **NTEP-R 奖励机制**：确保每次工具调用严格推进推理过程
3. **non-repeated-goal regularizer**：惩罚冗余调用（重新访问已满足 NTEP goal 的行为）

---

## 问题背景

Agentic VLM 面临两类关键缺陷：
1. 模型频繁发出冗余或偏离目标的工具调用，未能获取必要证据
2. 即使调用了正确的工具，也往往无法从观察结果中提取必要信息

**原因**：现有训练范式仅以最终答案正确性评估工具使用，证据获取和利用监督不足。

---

## 技术方案

### NTEP 标注

对每个 query 标注：
- 必要的外部证据是什么
- 需要哪些工具调用来获取该证据
- 证据如何支撑最终答案

### NTEP-R 奖励设计

```math
R_{NTEP} = R_{pre-call} + R_{post-call}
```

- **Pre-call reward**：agent 的预调用意图是否与必要的证据寻求目标对齐
- **Post-call reward**：从观察结果中提取的信息是否与必要证据对齐

### Non-repeated-goal Regularizer

```math
R_{regularizer} = -\lambda \cdot \mathbb{1}[\text{goal already satisfied}]
```

---

## 实验结果

- **NTEP-8B**（8B参数）在7个 image-grounded benchmark 上显著提升搜索精度和工具使用效率
- 统一三工具框架（image cropping, image search, text search）

---

## 建议

- **是否推荐阅读**：是
- **适用场景**：VLM Agent 训练、工具调用奖励设计

---

*🥬 youmaicai | 2026-09-05*
