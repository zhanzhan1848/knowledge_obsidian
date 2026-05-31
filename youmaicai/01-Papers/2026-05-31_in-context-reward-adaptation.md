# In-Context Reward Adaptation for Robust Preference Modeling

## 元信息
| 标题 | In-Context Reward Adaptation for Robust Preference Modeling |
| 作者 | Zhenyu Sun et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30323) |
| arXiv | arXiv:2605.30323 |

## 核心贡献
1. **问题**：RLHF 依赖静态奖励模型，无法适应多样化的人类价值观；多奖励框架受限于固定领域集合，无法适应未见过的偏好分布
2. **提出 In-Context Reward Adaptation**：基于 transformer 的框架，通过少量偏好演示动态推断底层奖励结构
3. **关键发现**：标准 transformer 架构在此任务上存在渐近偏差（asymptotic bias），但加入人类响应时间（response time）作为辅助输入信号后，能够成功适应未见领域偏好

## 核心方法

```
少量偏好演示 → Transformer in-context learning
→ 自适应推断底层奖励结构
→ 支持异构奖励和偏好分布转移

关键：Response time 作为辅助输入信号
→ 消除渐近偏差
→ 适应未见偏好领域
```

## 理论分析
- 标准 transformer 架构不足以完成此任务（characterized asymptotic bias）
- Response time 信号是关键：使其能够成功适应未见领域

## 应用价值
- 更鲁棒的人类-AI 对齐基础
- 异构奖励的表示
- 偏好分布转移的表示
- 可扩展的灵活对齐路径

## 标签
#RLHF #preference-modeling #in-context-learning #reward-modeling