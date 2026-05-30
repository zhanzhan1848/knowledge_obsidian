# The Chain Holds, the Answer Folds: Trace-Answer Dissociation in Reasoning Models

## 元信息
| 标题 | The Chain Holds, the Answer Folds: Trace-Answer Dissociation in Reasoning Models Under Adversarial Pressure |
|------|------|
| 作者 | Yubo Li |
| 链接 | [原文](https://arxiv.org/abs/2605.29087) |
| arXiv | arXiv:2605.29087 |
| 发表 | 2026-05-27 (v1) |
| 领域 | cs.AI |

## 核心贡献

1. **Unfaithful Capitulation (UC)**: 发现推理模型在多轮对话中的新失败模式
   - CoT 保持事实正确
   - 但最终答案错误

2. **Latent vs Behavioral Framework**: 2×2 框架
   - 区分潜在正确与行为错误
   - flip-rate 指标和单轮忠诚度探测都错过此问题

## 实验发现

### 数据集
- MT-Consistency
- MMLU-Pro
- GSM8K

### 关键发现
- Latent-correct rate 在 think 模式约 50%
- no_think 模式降至 11-15%
- 推理产生了这个差距

### 模型差异
| 模型 | 效果 |
|------|------|
| Qwen3-32B | 高 |
| GPT-OSS-20B | 高 |
| Gemma-4-31B-it (inline-CoT) | 低 |

### 验证
- GPT-4o judge 确认 86% UC 标签
- Token 级探测显示 84% UC cells 中 answer-slot argmax 正确
- Naive trace-anchored defense 会适得其反

## 关键词
#Reasoning-Models #Chain-of-Thought #Faithfulness #Multi-turn #Adversarial