---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, audiovisual-speech-recognition, viseme, multimodal, fine-tuning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.00982
---

# VisG AV-HuBERT: Viseme-Guided AV-HuBERT for Audio-Visual Speech Recognition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VisG AV-HuBERT: Viseme-Guided AV-HuBERT |
| **作者** | Aristeidis Papadopoulos |
| **发表** | ICPR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.00982) |
| **DOI** | 10.48550/arXiv.2604.00982 |
| **代码** | [GitHub](https://github.com/aristosp/visg_avhubert) |

---

## 核心贡献

> 提出 VisG AV-HuBERT，通过辅助 viseme 分类多任务微调，强化模型对视觉发音特征的关注。

1. **Viseme 预测子网络**：轻量级视觉发音特征预测模块，显式引导 encoder 保留视觉语音信息
2. **强噪声鲁棒性**：-10 dB SNR 下 WER 从 13.59% 降至 6.60%（51.4% 相对提升）
3. **消融分析**：显式 viseme 建模增强 encoder 表征

---

## 技术方案

### 核心思想

当前 AVSR 系统集成 LLM decoder 与 transformer encoder，但 LLM 语言建模改进与视听编码器增强的贡献难以分离。VisG AV-HuBERT 通过 **viseme 分类辅助任务**，显式引导 encoder 保留视觉语音信息。

### 关键技术

| 技术 | 说明 |
|------|------|
| Viseme 预测子网络 | 轻量级多任务学习头 |
| 多任务微调 | 主任务 AVSR + 辅助任务 viseme 分类 |
| LLM decoder | 集成 LLM 解码器进行语言建模 |

### 噪声实验结果

| SNR | WER (baseline) | WER (VisG) | 相对提升 |
|-----|----------------|-------------|---------|
| -10 dB (Speech noise) | 13.59% | 6.60% | 51.4% |

---

## 实验结论

- **数据集**：LRS3（主）、LRS2（验证泛化）
- **基线**：AV-HuBERT
- **结果**：
  - 重噪声下 51.4% WER 相对降低
  - 跨噪声类型 substitution errors 大幅减少
  - LRS2 验证泛化能力
- **适用**：噪声环境语音识别、多语言视听语音处理

---

## 局限性

- 仅在英语 AVSR 上验证
- viseme 分类器的设计需领域知识

---

## 实现建议

- **实现难度**：中等
- **预期性能**：强噪声下显著 WER 降低
- **适用场景**：嘈杂环境语音识别、人机交互

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
