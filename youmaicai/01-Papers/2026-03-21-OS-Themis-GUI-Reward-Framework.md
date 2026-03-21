# OS-Themis: A Scalable Critic Framework for Generalist GUI Rewards

## 元信息
| 标题 | OS-Themis: A Scalable Critic Framework for Generalist GUI Rewards |
|------|------|
| 作者 | Zehao Li, Zhenyu Wu, Yibo Zhao et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.19191) |
| arXiv | arXiv:2603.19191 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 提出 OS-Themis：可扩展、准确的多智能体 critic 框架
2. 引入 OmniGUIRewardBench (OGRBench)：跨平台 GUI 结果奖励基准
3. 证明框架在 RL 训练和自训练中的有效性

## 框架架构
- **轨迹分解**：将轨迹分解为可验证的里程碑
- **证据隔离**：为决策隔离关键证据
- **审查机制**：在做出最终判断前严格审计证据链
- **多智能体协作**：不同于单一评判者

## 训练方法
- 用于在线 RL 训练
- 用于自训练循环中的轨迹验证和过滤

## 实验结果
- **AndroidWorld 测试**：
  - 在线 RL 训练：+10.3% 改进
  - 自训练循环：+6.9% 增益
- **OGRBench**：所有评估模型在 OS-Themis 下达到最佳性能

## 局限性
- 未提及

## 应用场景
- GUI 智能体训练
- 强化学习奖励函数
- 轨迹验证和过滤

## 相关链接
- [[GUI-agents]]
- [[RL-reward-models]]
- [[multi-agent-systems]]
- [[trajectory-evaluation]]
