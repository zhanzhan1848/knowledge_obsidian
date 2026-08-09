# SCOPE: Learning When to Trust via Selective Context Preference Optimization

## 元信息
| 标题 | Learning When to Trust via Selective Context Preference Optimization |
|------|------|
| 作者 | Xian Sun, Wei Chow, Yingshuo Wang, Junhao Liu, Wei Gao, Qing Wu, Lingdong Kong |
| 链接 | [原文](https://arxiv.org/abs/2608.06377) |
| arXiv | arXiv:2608.06377 |
| 代码 | [GitHub](https://github.com/worldbench/SCOPE) |
| 数据集 | [HF Dataset](https://huggingface.co/datasets/worldbench/MIST-Bench) |
| 领域 | cs.CL / cs.AI / cs.LG |

## 核心贡献

1. **问题定义**：提出"选择性信任"（Selective Trust）新范式——模型不应盲目抵抗外部信号，而应在上下文值得信任时选择信任它
2. **MIST Benchmark**：四人条件下评估（clean, misleading, correct-context, irrelevant-context），配套 SC2W 指标（衡量误导信号将正确答案变为错误的频率）
3. **SCOPE 方法**：挖掘 clean-correct/misleading-wrong 失败样本，在四条件下平衡的 DPO 偏好对优化，显著降低 SC2W 同时保留 clean-context 准确率

## 核心发现

- 对外部上下文信号的易感性是普遍现象（所有测试模型均受影响）
- 传统训练策略（让模型抵抗所有信号）存在隐藏失败模式：忽略所有上下文的模型看起来鲁棒，但在上下文值得信任时毫无用处
- SCOPE 在多个主流开源模型上大幅降低 SC2W，同时保持 clean/correct/irrelevant-context 下的准确率

## 训练方法

```math
\text{DPO objective over matched preference pairs balanced equally across four conditions}
```

不再只对误导样本优化，而是对四种条件下的配对偏好样本均衡优化。

## 实验结果

- 在 MIST benchmark 上评估多个开源模型
- SC2W 大幅下降，clean-context 准确率保持
- 全面超越"抵抗策略"

## 局限性

- 需要人工标注的四条件数据（构建成本高）
- 当前仅在推理任务上验证

## 建议
- **是否推荐使用**：是
- **适用场景**：需要 LLM 依赖外部上下文（RAG、工具调用、检索增强）的场景

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
