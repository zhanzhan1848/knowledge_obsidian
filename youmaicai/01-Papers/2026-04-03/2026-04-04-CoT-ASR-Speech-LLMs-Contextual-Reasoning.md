---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, speech-llm, chain-of-thought, asr, reasoning, modality-adapter]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.00610
---

# Speech LLMs are Contextual Reasoning Transcribers: CoT-ASR

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Speech LLMs are Contextual Reasoning Transcribers |
| **作者** | Keqi Deng et al. |
| **发表** | arXiv 2026-04-01 |
| **链接** | [原文](https://arxiv.org/abs/2604.00610) |
| **DOI** | 10.48550/arXiv.2604.00610 |
| **代码** | - |

---

## 核心贡献

> 提出 Chain-of-Thought ASR (CoT-ASR)，将推理链引入 ASR 任务，显著降低 WER 和实体错误率。

1. **CoT-ASR 框架**：LLM 先分析输入语音生成上下文分析，再执行识别，单次前向传播完成推理+转录
2. **CTC-guided Modality Adapter**：用 CTC 非空白 token 概率加权 LLM embedding，弥模态差距
3. **用户引导转录**：支持用户提供上下文引导转录，扩展 ASR 功能

---

## 技术方案

### 核心思想

传统 ASR 直接做语音到文本映射，未能利用 LLM 的知识和上下文理解能力。CoT-ASR 将 **chain-of-thought 引入 ASR**：LLM 先分析语音内容，生成上下文推理，再执行识别。

### 关键技术

| 技术 | 说明 |
|------|------|
| Chain-of-Thought ASR | LLM 先生成上下文分析，再转录 |
| CTC-guided Modality Adapter | CTC 概率加权 LLM embedding，对齐语音 encoder 与 LLM 空间 |
| 单次前向传播 | 推理和转录在一次前向中完成 |

### Pipeline

```
语音输入 → 语音 Encoder → Modality Adapter (CTC-weighted) → LLM → 上下文分析 + 转录
```

---

## 实验结论

- **基线**：标准 LLM-based ASR
- **结果**：
  - WER 相对降低 **8.7%**
  - 实体错误率 (EER) 相对降低 **16.9%**
- **消融**：CTC-guided Modality Adapter 对模态对齐至关重要

---

## 局限性

- 推理链带来的额外延迟未报告
- 在噪声环境下的鲁棒性待验证

---

## 实现建议

- **实现难度**：中等
- **预期性能**：WER 降低 8-9%
- **适用场景**：需要上下文理解的 ASR 场景、专有名词识别

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
