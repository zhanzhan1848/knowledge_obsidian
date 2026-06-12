# T2SP: Representing Time Series as Structured Programs for LLM Reasoning

## 基本信息
| 标题 | Representing Time Series as Structured Programs for LLM Reasoning |
|------|------|
| 作者 | Jaeho Kim, Changhun Oh, Seokhyun Lee, Irina Rish, Changhee Lee |
| 链接 | [原文](https://arxiv.org/abs/2606.12481) |
| arXiv | arXiv:2606.12481 |

## 核心贡献
1. **T2SP 方法**：将时间序列表示为结构化符号程序，无需训练
2. **模态对齐**：将时间序列分解为趋势、周期和显著事件，表达为程序友好格式
3. **外部化时间结构提取**：将结构提取从模型转移到表示本身

## 问题背景
- 时间序列在 LLM 原生文本模态之外
- 现有方法：序列化数值序列 或 微调预训练 LLM
- 模态不匹配导致长序列性能下降、计算开销大

## 模型架构
```
T2SP 分解:
时间序列 → 趋势 (trend) + 周期 (period) + 显著事件 (salient events)
           ↓
结构化符号程序格式（与 LLM 原生训练的代码-like 模态对齐）
```

## 实验结果
- 三个推理任务：editing, captioning, question answering
- 性能提升、推理时间减少、失败率降低
- 相比 raw-string 表示一致改进

## 关键发现
- 将时间结构提取外部化到表示层，释放 LLM 推理能力
- 符号程序格式天然与 LLM 训练分布对齐

## 局限性
- 依赖时间序列分解质量
- 不适合需要细粒度数值理解的任务

## 建议
- 是否推荐使用：**是**（LLM 时间序列推理的有效接口）
- 适用场景：时间序列 QA、编辑、描述任务

---
Tags: #LLM #time-series #reasoning #modality-mismatch #structured-program