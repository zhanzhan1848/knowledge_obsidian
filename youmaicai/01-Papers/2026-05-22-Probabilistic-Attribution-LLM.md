# Probabilistic Attribution For Large Language Models

## 元信息
| 标题 | Probabilistic Attribution For Large Language Models |
|------|------|
| 作者 | Shilpika, Carlo Graziani, Bethany Lusch, Venkatram Vishwanath, Michael E. Papka |
| 链接 | [原文](https://arxiv.org/abs/2605.21726) |
| arXiv | arXiv:2605.21726 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **随机过程框架**: 将 LLM 置于随机过程数学理论中，利用条件概率编码分布结构
2. **贝叶斯归因**: 使用贝叶斯规则反转下一个 token 的对数概率，捕获模型内部表示
3. **模型无关概率 token 归因**: 与模型计算结构无关的表示
4. **归因分数**: 对数概率比 P(response|prompt) / P(response|prompt\masked_token)
5. **熵与归因分数的相互作用**: 揭示 LLM 行为，指导用户关注不确定或不稳定的生成部分

## 评估
- 8 个模型 × 7 个提示
- 调查异常、token 敏感性、响应稳定性、模型稳定性、训练收敛

## 局限性
- 计算成本随序列长度增加
- 归因分数的解释可能需要领域知识

## 关键词
#LLMInterpretability #ProbabilisticModels #Attribution #StochasticProcess #Interpretability