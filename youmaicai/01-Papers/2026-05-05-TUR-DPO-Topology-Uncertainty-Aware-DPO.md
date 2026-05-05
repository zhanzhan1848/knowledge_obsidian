# TUR-DPO: Topology- and Uncertainty-Aware Direct Preference Optimization

## 元信息
| 标题 | TUR-DPO: Topology- and Uncertainty-Aware Direct Preference Optimization |
|------|------|
| 作者 | Abdulhady Abas Abdullah, Fatemeh Daneshfar, Seyedali Mirjalili, Mourad Oussalah |
| 链接 | [原文](https://arxiv.org/abs/2605.00224) |
| arXiv | arXiv:2605.00224 |
| 会议/期刊 | ICML 2026 |

## 核心贡献

1. **TUR-DPO**：提出拓扑-不确定性感知的 DPO 变体，不仅奖励答案"说什么"，还奖励答案"如何推导"
2. **轻量级推理拓扑**：引入推理拓扑（reasoning topology）的概念
3. **不确定性信号校准**：将语义忠实度、实用性和拓扑质量组合为校准的不确定性信号
4. **RL-free**：保持 DPO 的训练简洁性，无需 PPO 的在线 rollout

## 方法论

### DPO 的问题
- 将偏好视为扁平的 winner vs. loser 信号
- 对噪声或脆弱思维链产生的偏好信号敏感

### TUR-DPO 核心设计
```
可学习奖励 R = f(语义忠实度, 实用性, 拓扑质量, 不确定性)
损失函数：uncertainty-weighted DPO objective
参考策略：fixed or moving reference policy
```

- **语义忠实度**：答案与问题的相关程度
- **实用性**：答案的实用价值
- **拓扑质量**：推理链的结构质量
- **不确定性**：综合以上信号得到的校准不确定性

## 实验结果

### 基准覆盖
- 数学推理
- 事实问答
- 摘要
- Helpful/harmless 对话
- 多模态
- 长上下文

### 核心结果
- **Judge win-rates 提升**：相对于 DPO 改善
- **Faithfulness 提升**：答案与推理过程一致性增强
- **Calibration 改善**：概率估计与实际准确性对齐更好
- **多模态和长上下文设置中一致增益**
- **推理密集任务上匹配或超越 PPO**，同时保持训练简洁

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：LLM 对齐、RLHF 替代、推理模型训练
- **关键洞察**：DPO 的 flat preference signal 问题可以通过引入推理拓扑和不确定性信号解决
- **相关方向**：RLHF、DPO、KTO、模型对齐
