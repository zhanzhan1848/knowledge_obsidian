# RankJudge: Multi-Turn LLM-as-a-Judge Synthetic Benchmark Generator

## 元信息
| 标题 | RankJudge: A Multi-Turn LLM-as-a-Judge Synthetic Benchmark Generator |
|------|------|
| 作者 | Zhenwei Tang, Zhaoyan Liu, Rasa Hosseinzadeh, Tongzi Wu, Keyvan Golestan, Jesse C. Cresswell |
| 链接 | [原文](https://arxiv.org/abs/2605.21748) |
| arXiv | arXiv:2605.21748 |
| 领域 | cs.CL |

## 核心贡献
1. **多轮对话基准**: 现有 LLM-as-a-judge 基准主要关注简单问答，不匹配多轮对话复杂性
2. **RankJudge**: 多轮对话 LLM 评判合成基准生成器
3. **单缺陷注入对话对**: 创建对话对，其中一个对话在一个轮次注入单一缺陷，可无歧义标注优劣
4. **严格联合正确性标准**: 将失败类别精确隔离到单个轮次
5. **Bradley-Terry 模型排名**: 通过 Bradley-Terry 模型对评判进行排名
6. **动态评估切片**: 基于难度评级的动态评估切片，减少标签噪声

## 实验结果
- 21 个前沿 LLM 评判评估
- 领域: 机器学习、生物医学、金融
- 评判排名在部分可观测性、粗糙正确性标准和替代随机游走评级算法下稳定

## 局限性
- 合成数据可能无法完全代表真实对话复杂性
- 缺陷注入方式可能引入系统性偏见

## 关键词
#LLMEvaluation #LLMasJudge #MultiTurn #Benchmark #SyntheticData