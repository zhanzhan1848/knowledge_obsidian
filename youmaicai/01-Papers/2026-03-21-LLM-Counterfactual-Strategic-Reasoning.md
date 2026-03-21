# Evaluating Counterfactual Strategic Reasoning in Large Language Models

## 元信息
| 标题 | Evaluating Counterfactual Strategic Reasoning in Large Language Models |
|------|------|
| 作者 | Maria Lymperaiou et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.19167) |
| arXiv | arXiv:2603.19167 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 评估 LLM 在重复博弈论场景中的战略表现
2. 区分真正的推理与记忆模式的依赖
3. 引入反事实变体来打破熟悉的对称性和支配关系

## 研究方法
- **测试游戏**：
  - 囚徒困境（Prisoner's Dilemma）
  - 石头剪刀布（Rock-Paper-Scissors）
- **反事实变体**：
  - 改变收益结构
  - 改变动作标签
  - 打破对称性和支配关系

## 多指标评估框架
- 比较默认和反事实实例
- 评估维度：
  - 激励敏感性（incentive sensitivity）
  - 结构泛化（structural generalization）
  - 战略推理（strategic reasoning）

## 实验结果
- LLM 在反事实环境中表现不佳
- 激励敏感性、结构泛化和战略推理能力受限
- 揭示了 LLM 依赖记忆模式而非真正推理

## 局限性
- 仅测试了两个经典游戏
- 反事实变体的设计可能不够全面

## 相关链接
- [[LLM-reasoning]]
- [[game-theory]]
- [[strategic-reasoning]]
- [[counterfactual-evaluation]]
