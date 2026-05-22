# PromptNCE: Pointwise Mutual Information Predictions Using Only LLMs

## 元信息
| 标题 | PromptNCE: Pointwise Mutual Information Predictions Using Only LLMs and Contrastive Estimation Prompts |
|------|------|
| 作者 | Juliette Woodrow, Chris Piech |
| 链接 | [原文](https://arxiv.org/abs/2605.21776) |
| arXiv | arXiv:2605.21776 |
| 领域 | cs.CL |

## 核心贡献
1. **零样本 PMI 估计**: 问 LLMs 能否替代任务特定的 critic 进行互信息估计
2. **PromptNCE 方法**: 将条件概率估计框架化为对比任务，扩充带有显式 OTHER 类别的候选集
3. **OTHER 类别理论**: 添加 OTHER 可恢复真实条件 P(y|x) 而非仅返回候选排名
4. **零样本概率估计器**: 将对比提示转换为通用零样本概率估计器

## 实验结果
- **Spearman 相关**: 最高达 0.82（与人类派生 PMI）
- 三个数据集均优于其他零样本方法
- **教育案例**: 用于评分学生知识总结

## 理论基础
```math
P(y|x) = \frac{P(x|y)P(y)}{P(x)} \quad \text{(Bayes rule)}
```
通过对比估计和 OTHER 类别，可以从不完美但可计算的对比概率恢复真实条件概率。

## 局限性
- 依赖 LLM 的概率校准质量
- 对长序列候选集可能效率较低

## 关键词
#PromptEngineering #MutualInformation #ContrastiveLearning #ZeroShot #LLM