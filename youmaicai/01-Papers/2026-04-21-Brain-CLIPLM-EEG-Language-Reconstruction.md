# Brain-CLIPLM: EEG-to-Text Decoding via Semantic Compression Hypothesis

## 元信息
| 标题 | Brain-CLIPLM: Decoding Compressed Semantic Representations in EEG for Language Reconstruction |
|------|------|
| 作者 | Xiaoli Yang, Huiyuan Tian, Yurui Li, Jianyu Zhang, Shijian Li, Gang Pan |
| 链接 | [原文](https://arxiv.org/abs/2604.16370) |
| arXiv | arXiv:2604.16370v1 |
| 发表 | 2026-03-20 |

## 核心贡献
1. 提出 **语义压缩假说 (Semantic Compression Hypothesis)**：EEG 信号编码的是压缩的语义锚点而非完整语言结构
2. 提出 **Brain-CLIPLM**：两阶段框架，语义锚点提取（对比学习）+ 检索增强的 LLM 句子重建（CoT reasoning）
3. 提出 **粒度匹配原则 (Granularity Matching Principle)**：解码复杂度与神经信息容量对齐

## 核心创新点
- **问题**：从非侵入式 EEG 解码自然语言受低信噪比和信息带宽限制
- **假设**：EEG 编码的是压缩的语义锚点集合，而非完整语言结构。因此直接句子重建对 EEG 内在信息容量是 over-parameterized 的
- **方法**：
  1. Stage 1：对比学习提取语义锚点
  2. Stage 2：检索增强 LLM + Chain-of-Thought 推理重建句子

## 实验结果
- 数据集：Zurich Cognitive Language Processing Corpus
- Top-5 句子检索准确率：**67.55%**
- Top-25 句子检索准确率：**85.00%**
- 显著优于直接解码 baseline
- 跨被试泛化能力得到确认
- 控制分析（permutation testing）验证 EEG 表示携带超越 LM 先验的句子特异信息

## 关键词
`EEG` `brain-computer interface` `semantic decoding` `LLM` `chain-of-thought` `multimodal`

## 相关工作
- EEG-to-text decoding
- Neural decoding
- Semantic compression
- Brain-CLIP
- Chain-of-Thought reasoning

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*