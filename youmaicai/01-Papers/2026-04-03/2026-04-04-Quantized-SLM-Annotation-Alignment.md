---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, quantized-finetuning, small-language-model, annotation, alignment]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.00586
---

# More Human, More Efficient: Aligning Annotations with Quantized SLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | More Human, More Efficient: Aligning Annotations with Quantized SLMs |
| **作者** | Junyoung Lee |
| **发表** | arXiv 2026-04-01 |
| **链接** | [原文](https://arxiv.org/abs/2604.00586) |
| **DOI** | 10.48550/arXiv.2604.00586 |
| **代码** | [GitHub](https://github.com/jylee-k/slm-judge) |

---

## 核心贡献

> 研究用 4-bit 量化小语言模型（1.7B）微调后作为对齐的自动标注器，超越闭源 LLM 的人类一致性。

1. **任务特定对齐**：在有限人类标注数据上微调量化 SLM，使其成为高度对齐的评估器和标注器
2. **多维评分框架**：自定义多维 rubric 框架，提高标注一致性
3. **超越闭源模型**：Krippendorff's α 比最佳专有 LLM 高 0.23 分

---

## 技术方案

### 核心思想

专有 LLM 做自动评估和标注时存在系统性偏差、缺乏可重复性、数据隐私问题。本文探索在有限人类标注数据上微调 1.7B 参数 4-bit 量化 SLM 作为替代。

### 关键技术

| 技术 | 说明 |
|------|------|
| 4-bit 量化微调 | 参数量 1.7B，4-bit 量化 |
| 多维 Rubric | 自定义多维评分框架，提高标注一致性 |
| 增强和正则化 | 简单数据增强和正则化技术 |

### 关键数据

- **人类一致性提升**：Krippendorff's α 增加 0.23 分
- **情感分类泛化**：训练 pipeline 可迁移到其他情感分类任务

---

## 实验结论

- **基线**：最佳专有 LLM（闭源）
- **结果**：
  - Krippendorff's α 相对提升 0.23 分
  - 4-bit 量化微调提供优于闭源模型的标注质量
  - 在独立情感分类任务上验证了泛化能力
- **适用**：需要高质量标注、低成本、可重复的评估场景

---

## 局限性

- 仅在 1.7B 模型上验证
- 多维 rubric 设计需要领域知识

---

## 实现建议

- **实现难度**：低（已有开源代码）
- **预期性能**：人类一致性可超越闭源模型
- **适用场景**：学术研究、数据标注、隐私敏感场景

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
