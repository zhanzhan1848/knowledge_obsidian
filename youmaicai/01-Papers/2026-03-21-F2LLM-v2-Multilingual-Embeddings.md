# F2LLM-v2: Inclusive, Performant, and Efficient Embeddings for a Multilingual World

## 元信息
| 标题 | F2LLM-v2: Inclusive, Performant, and Efficient Embeddings for a Multilingual World |
|------|------|
| 作者 | Ziyin Zhang et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.19223) |
| arXiv | arXiv:2603.19223 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 发布 F2LLM-v2 多语言嵌入模型家族，8 种规模（80M-14B 参数），支持 200+ 语言
2. 特别强调中低资源语言，填补多语言嵌入的空白
3. 集成两阶段 LLM 嵌入训练、Matryoshka 学习、模型剪枝和知识蒸馏技术

## 模型架构
- 基于大语言模型的嵌入模型
- Matryoshka 表示学习（支持灵活维度）
- 两阶段训练流程：预训练 + 微调

## 训练方法
- 数据：6000 万高质量公开数据样本
- 技术：
  - Matryoshka learning
  - Model pruning
  - Knowledge distillation
- 重点关注中低资源语言的数据平衡

## 实验结果
- F2LLM-v2-14B 在 11 个 MTEB 基准测试中排名第一
- 小模型在资源受限场景下也达到 SOTA
- 比之前基于 LLM 的嵌入模型更高效

## 局限性
- 未提及

## 开源
- 开源所有模型、数据、代码和中间检查点

## 相关链接
- [[multilingual-embeddings]]
- [[LLM-embeddings]]
- [[knowledge-distillation]]
- [[matryoshka-learning]]
