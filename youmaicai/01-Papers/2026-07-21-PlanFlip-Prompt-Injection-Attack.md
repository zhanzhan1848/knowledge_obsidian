# PlanFlip: Attacking Multi-Agent LLM Systems via Planning-Phase Prompt Injection

## 元信息
| 标题 | PlanFlip: Attacking Multi-Agent LLM Systems via Planning-Phase Prompt Injection |
|------|------|
| 作者 | Yuhang Wang |
| 链接 | [原文](https://arxiv.org/abs/2607.16199) |
| arXiv | arXiv:2607.16199v1 |
| 领域 | cs.AI |
| 发表日期 | 2026-04-30 |

## 核心贡献
1. 发现多智能体 LLM 系统中规划阶段的关键攻击面
2. 提出 PlanFlip 框架，包含四种规划阶段提示注入攻击
3. 揭示"能力越强=越安全"的假设是错误的
4. 提出两种防御方法：GoalAnchorCheck (D1) 和 CrossAgentConsensus (D2)

## 问题背景
多智能体 LLM 系统依赖 Planner 将目标分解为子任务序列，由下游 Executor 和 Critic 代理执行和审计。Planner 的上下文注入可实现级联放大，同时破坏所有下游子任务。

## 四种攻击方式
1. **GoalSubstitution (PF-1)**: 目标替换
2. **PriorityInversion (PF-2)**: 优先级反转
3. **ContextPollution (PF-3)**: 上下文污染
4. **RoleConfusion (PF-4)**: 角色混淆

所有攻击伪装成合理的工具输出以规避关键词过滤器。

## 实验发现

### 发现1: 能力放大漏洞
- GPT-5 达到最高攻击成功率 (ASR = 0.68)
- 颠覆"更强模型=更安全"的假设

### 发现2: 同构管道的相关智能体盲点
- GPT-4o 和 Llama-3.3-70B 的 ASR 接近 0，但 Stealth = 1.00，StepShift > 0
- 攻击重构计划，而相同 backbone 的 Critic 报告对齐（两位独立法官确认 -0.20 至 -0.32 语义偏差，r = 0.943）

### 发现3: 推理增强模型抵抗注入
- DeepSeek-R1 在所有攻击中 StepShift = 0.00

## 防御方法
- **GoalAnchorCheck (D1)**: 目标锚点检查
- **CrossAgentConsensus (D2)**: 跨代理共识
- 检测率达到 1.00，在 15/16 个单元中优于相同 backbone 基线

## 关键洞察
> 异构模型多样性是多智能体系统的安全前提；同构 backbone 内的冗余无法防御规划阶段攻击。

## 评估细节
- 9 个前沿 LLM
- 3,479 个 episode
- 评估指标：ASR (攻击成功率)、Stealth、StepShift

## 建议
- **是否推荐使用**：是（作为安全研究）
- **适用场景**：多智能体系统安全、LLM 对齐、红队测试
- **注意事项**：需在真实部署前进行充分测试

---
*关键词*: Prompt Injection, Multi-Agent, LLM Security, PlanFlip, 提示注入
