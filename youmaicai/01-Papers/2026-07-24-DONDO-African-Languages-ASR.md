# Open w2v-BERT Speech-Recognition Base Models for African Languages

> 🥬 LLM/NLP 论文分析：DONDO - 非洲语言开源 ASR 模型

## 基本信息
- **作者**: Paul Azunre PhD et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21540)
- **arXiv**: arXiv:2607.21540
- **Models**: [Hugging Face KhayaAI](https://huggingface.co/khayaai-ai)
- **License**: Apache-2.0
- **Subjects**: cs.CL

## 核心贡献
1. 提出 **DONDO**：基于 w2v-BERT 2.0 自监督语音编码器的非洲语言开源 ASR 基座模型
2. 覆盖 21 个单语模型 + 5 个多语模型，共 27 种语言变体（加纳、塞拉利昂、尼日利亚、塞内加尔、肯尼亚、津巴布韦）
3. **两阶段学习率退火 fine-tuning**：先用高学习率 adaptation，再用低学习率恢复/超越单语基线
4. **轻量级语言条件机制**：one-hot 语言 identity 作为 prefix frames 注入，允许单 checkpoint 推理时切换目标语言
5. 多语族平均 WER 10-13%，接近单语模型表现

## 模型架构

### w2v-BERT 2.0 自监督语音编码器
- 基于对比学习和掩码预测的自监督预训练
- 两阶段（部分三阶段）fine-tuning procedure

### 语言条件机制
```math
\text{one-hot language identity} \rightarrow \text{prefix frames} \rightarrow \text{acoustic features}
```
单 checkpoint 可通过语言 identity 在推理时切换目标语言。

## 实验结果
- 多语族平均 WER: 10-13%
- 大部分 gap to monolingual models 已 close
- 覆盖约 1 亿第一语言使用者

## 数据来源
主要基于宗教文本的阅读语音——license-clear、orthographically consistent、覆盖 otherwise缺乏转录音频的语言。

## 标签
#ASR #African-languages #w2v-BERT #self-supervised #fine-tuning #multilingual
