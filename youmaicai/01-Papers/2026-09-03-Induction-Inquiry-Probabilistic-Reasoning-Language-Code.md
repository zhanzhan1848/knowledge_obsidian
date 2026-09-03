# Induction and Inquiry via Probabilistic Reasoning over Language and Code

## 元信息
| 标题 | Induction and Inquiry via Probabilistic Reasoning over Language and Code |
|------|------|
| 作者 | Wasu Top Piriyakulkij et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.01815) |
| arXiv | arXiv:2609.01815 |

## 核心贡献
1. 人类如何从稀疏、噪声、持续的体验数据中生长和维护抽象知识——这是认知科学长期挑战
2. 提出计算模型：将符号知识编码为 mental programs（结合自然语言和源代码），通过 LLM 引导的 Bayesian 学习算法顺序推断 mental programs
3. 在行为研究中成功复现人类归纳学习和主动探究的定量特征：anchoring、garden-pathing 等效应
4. 纯 LLM 和经典 Bayesian 模型在该任务上失败或代价极高

## 模型架构 / 方法
- **Mental Programs**：符号知识表示为自然语言+源代码的组合
- **LLM-guided Bayesian Learning**：由 LLM 提供 bottom-up 神经机制使推理可处理和可学习
- 三个设计目标：数据高效+计算高效；不确定性分级支持智能探究；灵活表示无尽概念

## 实验结果
- 成功复现人类归纳学习和主动探究的定量特征
- 纯 LLM 在底层任务失败或不重现人类行为
- 对比经典 Bayesian 模型，计算代价更低

## 局限性
- 模型规模依赖 LLM，认知可信度有待进一步验证
- 实验任务范围有限

## 关键词
#reasoning #cognitive-science #Bayesian #LLM #inductive-learning
