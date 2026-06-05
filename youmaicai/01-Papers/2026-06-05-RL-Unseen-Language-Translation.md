# Reinforcement Learning Elicits Contextual Learning of Unseen Language Translation

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06428) |
| arXiv | arXiv:2606.06428 |
| 代码 | [GitHub](https://github.com/hanxuhu/rl-new-language) |
| 领域 | 机器翻译 / RLHF / 低资源语言 |

## 核心贡献

1. **Meta-skill 视角**: 将极低资源翻译重新定义为学习语言无关的"利用上下文元技能"，而非记忆特定语言。

2. **RL 方法**: 使用 chrF（表面级翻译质量指标）作为 reward，通过 outcome-based RL 训练 LLM 从上下文 linguistic knowledge 中提取和应用信息。

3. **泛化能力**: 在完全 unseen 语言上比 in-context learning 或 supervised fine-tuning 表现更好。

4. **启示**: Outcome-based RL 可以从传统推理任务（math, coding）扩展到语言学习场景。

## 核心问题

现有方法（post-training 或 in-context learning）的局限：
- Post-training：过拟合特定语言，zero-shot 迁移有限
- In-context learning：依赖特定语言示例

**解决方案**: 让 LLM 获得"元技能"——从上下文 linguistic knowledge 泛化到新语言的能力。

## 方法

- 条件模型输入：linguistic knowledge + dictionary entries
- Reward: chrF 翻译质量
- 训练目标：学会利用 linguistic context 进行翻译

## 局限性

- 依赖丰富的 linguistic context
- 极低资源场景评估有限

## 关键词
`RLHF` `machine translation` `low-resource language` `instruction tuning` `language model`
