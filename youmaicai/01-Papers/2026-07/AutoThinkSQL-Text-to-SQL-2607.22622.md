---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [text-to-sql, chain-of-thought, adaptive-reasoning, fine-tuning, dpo]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.22622
---

# AutoThinkSQL: Learning When to Reason for Text-to-SQL via SFT and DPO

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AutoThinkSQL: Learning When to Reason for Text-to-SQL via SFT and DPO |
| **作者** | Soohyuk Jang, Jiheum Yeom, Nohil Park, Sang Hun Kim, Yoonyoung Choi, Kiwook Bae, Sungroh Yoon |
| **发表** | arXiv 2026-06-17 |
| **链接** | [原文](https://arxiv.org/abs/2607.22622) |
| **arXiv** | arXiv:2607.22622 |
| **代码** | [HuggingFace](https://huggingface.co/autothinksql) |

---

## 核心贡献

> 自适应推理机制让 Text-to-SQL 模型学会对简单查询跳过 CoT，对复杂查询启用深度推理

1. **Auto-Thinking Mechanism**: 将自动思考机制集成到 SFT 和 DPO 中
2. **动态推理切换**: 模型动态绕过简单查询的推理，为复杂查询调用深度 CoT
3. **效率与性能兼顾**: 在 Spider 和 BIRD 基准上获得一致提升，同时减少 token 使用和延迟

---

## 技术方案

### 核心问题

现有 Text-to-SQL 方法依赖 Chain-of-Thought (CoT) 推理，在复杂基准上取得显著提升，但代价是高推理开销。然而，大量实际查询是简单的查找或聚合，不需要多步推导，强制推理造成浪费。

### AutoThinkSQL 框架

| 组件 | 说明 |
|------|------|
| SFT (Supervised Fine-Tuning) | 学习何时跳过/启用推理 |
| DPO (Direct Preference Optimization) | 偏好优化选择更高效的推理策略 |

### 实验结果 (Qwen3-Coder-30B-A3B)

| 指标 | 改进 |
|------|------|
| Spider/BIRD 性能 | 一致提升 |
| 平均输出 tokens | 减少 24.6% / 18.3% |
| 平均延迟 | 减少 17.1% / 11.5% |

---

## 实验结论

- **数据集**: Spider, BIRD
- **模型**: Qwen3-Coder-30B-A3B
- **结果**: 
  - 性能不降反升
  - 推理效率显著提升
  - 模型学会将推理决策与查询难度对齐

---

## 局限性

- 需要针对特定模型进行微调
- 对极端复杂查询可能仍有过推理

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: Text-to-SQL 生产系统、数据库自然语言接口

---

## 相关工作

- [[Text-to-SQL]]
- [[Chain-of-Thought]]
- [[Adaptive Inference]]
- [[SFT-DPO]]
