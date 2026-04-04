---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, text-to-speech, diffusion-language-model, multilingual, zero-shot]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.00688
---

# OmniVoice: Towards Omnilingual Zero-Shot Text-to-Speech with Diffusion Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OmniVoice: Towards Omnilingual Zero-Shot Text-to-Speech with Diffusion Language Models |
| **作者** | Han Zhu et al. |
| **发表** | arXiv 2026-04-01 |
| **链接** | [原文](https://arxiv.org/abs/2604.00688) |
| **DOI** | 10.48550/arXiv.2604.00688 |
| **代码** | [GitHub](https://github.com/k2-fsa/OmniVoice) |

---

## 核心贡献

> 提出 OmniVoice，支持 600+ 语言的零样本多语言 TTS，采用扩散语言模型风格的离散非自回归架构。

1. **扩散语言模型风格离散 NAR**：直接文本到多码本 acoustic token，消除两阶段（text-to-semantic-to-acoustic）pipeline
2. **全码本随机掩码策略**：高效训练策略
3. **LLM 初始化**：从预训练 LLM 初始化，保证优越的可懂度

---

## 技术方案

### 核心思想

传统离散 NAR TTS 模型在复杂两阶段 pipeline（text→semantic→acoustic）中存在性能瓶颈。OmniVoice **直接**从文本映射到多码本 acoustic token，简化流程。

### 关键技术

| 技术 | 说明 |
|------|------|
| 扩散语言模型风格离散 NAR | 离散非自回归，直接文本→acoustic tokens |
| 全码本随机掩码 | 高效训练策略 |
| LLM 初始化 | 从预训练 LLM 初始化，提升可懂度 |
| 581k 小时多语言数据集 | 完全从开源数据整理 |

### 性能

- **语言覆盖**：600+ 语言（史上最广）
- **验证**：中英和多语言基准 SOTA

---

## 实验结论

- **数据集**：581k 小时多语言开源数据集
- **结果**：
  - 史上语言覆盖最广的 TTS 模型
  - 中英及多语言基准达到 SOTA
- **适用**：多语言 TTS 合成、零样本语音克隆

---

## 局限性

- 扩散模型推理速度可能较慢
- 极端低资源语言质量待验证

---

## 实现建议

- **实现难度**：高（需要大规模预训练）
- **预期性能**：600+ 语言零样本 TTS
- **适用场景**：多语言应用、语音合成研究

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
