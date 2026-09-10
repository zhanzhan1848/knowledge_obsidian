# 🥬 LLM 论文分析：BuzzASR

## 基本信息
- **标题**: BuzzASR: A Swarm of 100+ Monolingual Speech Recognition Models
- **作者**: Shivam Singh et al.
- **发表**: EMNLP 2026
- **链接**: [arXiv:2609.09554](https://arxiv.org/abs/2609.09554)
- **代码**: [lemn-lab.github.io/buzz-asr](https://lemn-lab.github.io/buzz-asr) | [HuggingFace](https://huggingface.co/BuzzASR)
- **类别**: cs.CL

## 核心贡献

1. **102 种语言的专用 Whisper 微调模型**: 大规模单语自适应策略
2. **词表替换 + 文本微调**: 更复杂的语言自适应策略
3. **SOTA CER**: 开源系统在 27/102 语言上达到最优 CER

## 核心问题

现有 Whisper 等多语言 ASR 模型在训练集中代表性不足的语言上表现差。

## 方法

**策略 1 - 简单微调**:
- 在单语数据上微调 Whisper

**策略 2 - 词表替换 + 文本微调**:
- 替换为单语词表
- 使用纯文本微调进行数据增强

## 实验结果

- **77/102 语言** 优于 Whisper-large-v3
- **平均 CER 降低 2.8 倍**
- **Tokenizer 压缩率平均提升 3.3 倍**（最高 21.7 倍）

## 局限性

- 需要每种语言的大量单语数据
- 词表替换增加了模型管理复杂度

## 建议
- **是否推荐使用**: 是（对多语言 ASR 部署）
- **适用场景**: 低资源语言 ASR、多语言语音识别
- **亮点**: 证明了简单策略在语言自适应上的有效性，规模达 102 种语言

---

标签: #语音识别 #ASR #Whisper #多语言 #EMNLP2026 #低资源语言
