# SOLAR: Self-Optimizing Lifelong Autonomous Reasoner

## 元信息
| 标题 | SOLAR: A Self-Optimizing Open-Ended Autonomous Agent for Lifelong Learning and Continual Adaptation |
|------|------|
| 作者 | Nitin Vetcha, Dianbo Liu |
| 链接 | [原文](https://arxiv.org/abs/2605.20189) |
| arXiv | arXiv:2605.20189 |
| 会议 | AAAI 2026 (Streaming Continual Learning Bridge), CEUR Workshop Proceedings Vol. 4183 |

## 核心贡献
1. **SOLAR 框架**: 提出 Self-Optimizing Lifelong Autonomous Reasoner，解决动态现实场景中的概念漂移和梯度适应高成本问题
2. **参数级元学习**: 将模型权重作为探索环境，通过多层次强化学习自主发现适应策略
3. **演化知识库**: 维护有效修改策略的演化知识库，隐式作为情景记忆缓冲区，平衡可塑性与稳定性
4. **测试时高效适应**: 无需梯度更新即可实现新领域测试时适应

## 模型架构
- **核心思路**: 将模型权重视为强化学习环境，参数级元学习驱动自我改进
- **先验巩固**: 先巩固常识知识通用先验，实现有效迁移学习
- **多层次 RL**: 多层次强化学习方法自主发现适应策略
- **知识库机制**: 演化知识库作为 episodic memory buffer

## 实验结果
- 在常识、数学、医学、编程、社会和逻辑推理任务上优于强基线
- 标志着向终身适应进化环境自主智能体迈出的重要一步

## 局限性
- 依赖预训练模型的常识知识先验质量
- 长期运行中知识库可能面临存储和检索效率挑战

## 关键词
#LLM #Agent #ContinualLearning #MetaLearning #ReinforcementLearning #LifelongLearning