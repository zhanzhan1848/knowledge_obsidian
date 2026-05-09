# Transformers Provably Implement In-Context Reinforcement Learning with Policy Improvement

## 元信息
| 标题 | Transformers Provably Implement In-Context Reinforcement Learning with Policy Improvement |
|------|------|
| 作者 | Haodong Liang et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.05755) |
| arXiv | arXiv:2605.05755 |
| 代码 | 待发布 |
| 会议/期刊 | 25 pages, 4 figures |

## 核心贡献
1. 证明 linear self-attention transformer block 可通过显式参数构造实现策略改进方法（semi-gradient SARSA, actor-critic）
2. 提出 teacher-mimicking 训练程序，分析梯度流动力学
3. 建立 ICRL 领域首个收敛保证：在训练 MDP 分布丰富条件下，梯度流局部且指数收敛到最优参数流形

## 核心发现
Transformer 架构在上下文中内化和执行经典强化学习算法的能力，桥接了机制理解与 ICRL 训练动力学。

## 关键结论
- 线性自注意力 Transformer 可实现 in-context RL
- 收敛性：在适当条件下指数收敛到最优策略

## 建议
- 是否推荐使用：**是**（理论贡献，ICRL 收敛保证）
- 适用场景：In-context RL, Transformer 可解释性, 策略学习机制研究