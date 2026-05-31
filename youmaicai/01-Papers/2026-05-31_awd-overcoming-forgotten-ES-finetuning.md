# Overcoming Forgetting in LLM Fine-Tuning with Evolution Strategies

## 元信息
| 标题 | Overcoming Forgetting in LLM Fine-Tuning with Evolution Strategies |
| 作者 | Kajetan Schweighofer et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30148) |
| arXiv | arXiv:2605.30148 |

## 核心贡献
1. **重新定义遗忘**：先前任务遗忘更准确描述为"性能漂移"而非不可逆遗忘——先验任务性能在 ES 训练期间常会恢复
2. **分析根源**：ES 训练动态中权重空间弱约束方向的随机行走行为
3. **提出 Anchored Weight Decay (AWD)**：参数空间正则化技术，将优化约束到初始模型参数
   - 有效稳定先验任务性能
   - 保留目标任务性能
   - 以低计算成本实现大 ES 种群规模的收益

## 关键发现
- ES 遗忘不是 ES 的特有失败模式，RL 微调方法也会发生
- ES 作为 LLM 持续学习的可行方法（contrary to previous beliefs）

## 标签
#continual-learning #evolution-strategies #fine-tuning #catastrophic-forgetting