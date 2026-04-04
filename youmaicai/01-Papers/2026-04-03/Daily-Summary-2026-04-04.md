# 🥬 2026-04-04 每日 LLM/NLP 论文摘要

## 今日概览
- **搜索范围**：arXiv cs.AI / cs.CL / cs.LG / cs.NE（最近 24 小时）
- **关键词**：LLM, Transformer, Attention, GPT, BERT, NLP, Fine-tuning, RLHF, Instruction Tuning, Multimodal, Reasoning
- **抓取时间**：2026-04-04 14:21 UTC
- **论文数量**：6 篇
- **备注**：arXiv 周六不更新（RSS skipDays），本批论文实际来自 2026-04-03 Fri

---

## 📄 本日论文列表

### 1. Screening Is Enough (Multiscreen)
- **arXiv**: [2604.01178](https://arxiv.org/abs/2604.01178)
- **领域**：cs.LG, cs.AI, cs.CL
- **核心**：提出 Screening 替代 softmax attention，消除 key 全局竞争，实现绝对查询-键相关性
- **亮点**：40% 更少参数达相同性能，100K context 推理加速 3.2×
- **关键词**：Efficient Attention、Long Context、Transformer Variant

### 2. CoT-ASR: Speech LLMs are Contextual Reasoning Transcribers
- **arXiv**: [2604.00610](https://arxiv.org/abs/2604.00610)
- **领域**：cs.CL
- **核心**：将 Chain-of-Thought 引入 ASR，LLM 先分析语音上下文再转录，WER 降 8.7%，EER 降 16.9%
- **亮点**：CTC-guided Modality Adapter 弥合语音-LLM 模态差距
- **关键词**：Speech LLM、Chain-of-Thought、ASR、Modality Adapter

### 3. More Human, More Efficient: Quantized SLM Alignment
- **arXiv**: [2604.00586](https://arxiv.org/abs/2604.00586)
- **领域**：cs.CL
- **核心**：4-bit 量化 1.7B SLM 微调后作为标注器，Krippendorff's α 超越最佳专有 LLM 0.23 分
- **亮点**：开源替代专有模型，数据隐私友好
- **关键词**：Quantized Fine-tuning、SLM、Annotation Alignment

### 4. OmniVoice: Omnilingual Zero-Shot TTS
- **arXiv**: [2604.00688](https://arxiv.org/abs/2604.00688)
- **领域**：cs.CL
- **核心**：扩散语言模型风格离散 NAR TTS，支持 600+ 语言，史上语言覆盖最广
- **亮点**：LLM 初始化保证可懂度，581k 小时开源数据集
- **关键词**：Multilingual TTS、Diffusion Language Model、Zero-Shot

### 5. VisG AV-HuBERT: Viseme-Guided AVSR
- **arXiv**: [2604.00982](https://arxiv.org/abs/2604.00982)
- **领域**：cs.CL, eess.AS（ICPR 2026）
- **核心**：Viseme 预测辅助任务强化视觉发音特征学习，-10dB SNR 下 WER 相对降低 51.4%
- **亮点**：显式 viseme 建模增强 encoder 表征
- **关键词**：Audio-Visual Speech Recognition、Viseme、Multimodal

### 6. OmniSch: PCB Schematic Visual Reasoning Benchmark
- **arXiv**: [2604.00270](https://arxiv.org/abs/2604.00270)
- **领域**：cs.CV
- **核心**：首个 PCB 原理图 benchmark，1,854 图，4 项任务（定位/图推理/几何/Agent）
- **亮点**：揭示当前 LMM 在工程图理解上的系统性不足
- **关键词**：Multimodal Benchmark、Diagram Reasoning、Vision-Language

---

## 🔬 技术趋势分析

### Attention 机制持续革新
- Multiscreen (Screening) 提出绝对相关性替代相对竞争
- 核心动力：长上下文效率 + 推理成本优化

### LLM 向语音/音频模态渗透
- CoT-ASR：将 CoT 引入语音识别
- OmniVoice：扩散语言模型驱动 TTS
- VisG AV-HuBERT：视觉发音特征强化 AVSR
- 共同点：LLM 能力向非文本模态迁移

### 小模型高效化
- Quantized SLM 标注器：1.7B 4-bit 量化超越专有模型
- 趋势：任务特定微调 + 量化 = 高效替代闭源

### Benchmark 扩展到垂直领域
- OmniSch：工程图（PCB）理解
- 趋势：通用 VLM 评估饱和，垂直领域 benchmark 成为新焦点

---

## 📊 与前期工作的关联

| 方向 | 前期相关工作 | 今日进展 |
|------|-----------|---------|
| 高效 Attention | LinearARD, MASEval | Multiscreen (Screening) |
| Speech LLM | FireRedASR, Whisper | CoT-ASR, OmniVoice |
| 多模态 Benchmark | OP Benchmark | OmniSch (工程图) |
| 量化微调 | LinearARD | Quantized SLM Annotation |

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
