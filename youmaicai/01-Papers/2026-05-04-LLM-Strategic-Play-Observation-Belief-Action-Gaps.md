# Why Do LLMs Struggle in Strategic Play? Broken Links Between Observations, Beliefs, and Actions

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Jan Sobotka, Mustafa O. Karabag, Ufuk Topcu |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00226) |
| arXiv | arXiv:2605.00226 |

## 核心贡献

在不完全信息博弈中揭示 LLM 决策机制的两个 fundamental gaps：

### 1. Observation-Belief Gap
- LLM 对潜在游戏状态的内部 belief 比口头报告准确得多
- 但这些 belief 脆弱：
  - 多跳推理时准确性下降
  - 表现出 primacy 和 recency biases
  - 长时间交互中偏离 Bayesian 一致性

### 2. Belief-Action Gap
- 内部 belief 转换为行动的隐式转换比外部化在 prompt 中的 belief 更弱
- 两种 belief-conditioning 都不能持续获得更高的游戏收益

## 实验
- Open-weight models: Llama 3.1, Qwen3, gpt-oss

## 结论
- 分析 LLM 内部过程可以暴露系统性脆弱性
- 在部署 LLM 于战略领域前需要 robust guardrails

## 建议
- **是否推荐使用**：是（LLM 战略决策能力评估）
- **适用场景**：LLM 决策机制研究、strategic AI、游戏 AI

---

## 摘要

Large language models (LLMs) are increasingly tasked with strategic decision-making under incomplete information, such as in negotiation and policymaking. While LLMs can excel at many such tasks, they also fail in ways that are poorly understood. We shed light on these failures by uncovering two fundamental gaps in the internal mechanisms underlying the decision-making of LLMs in incomplete-information games, supported by experiments with open-weight models Llama 3.1, Qwen3, and gpt-oss.

## 关键词
- `#LLM reasoning` `#strategic decision-making` `#belief` `#incomplete information`