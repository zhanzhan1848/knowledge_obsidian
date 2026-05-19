# 2605.15204 - SDOF: Taming the Alignment Tax in Multi-Agent Orchestration with State-Constrained Dispatch

## 元信息

| 标题 | SDOF: Taming the Alignment Tax in Multi-Agent Orchestration with State-Constrained Dispatch |
|------|------|
| 作者 | Zhantao Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.15204) |
| arXiv | arXiv:2605.15204v1 |
| 领域 | cs.AI |
| 日期 | 2026-04-20 |

## 核心贡献

1. **问题**：LangChain/LangGraph/CrewAI 等多智能体框架使用图结构路由任务，但缺乏对真实业务流程阶段约束的强制执行
2. **方案**：SDOF (State-Constrained Dispatch with Online-RLHF)，将多智能体执行建模为约束状态机
3. **双层防御**：Online-RLHF Intent Router + StateAwareDispatcher

## 核心架构

### 两层防御，三组件

**Layer 1: Online-RLHF Specialized Intent Router**
- 通过 GRPO (Generative Reward Modeling) 训练
- GSPO-aligned 7B Intent Router
- 在 FSM 约束对抗路由 benchmark 上准确率 80.9% vs GPT-4o 48.9%

**Layer 2: StateAwareDispatcher**
- GoalStage 有限自动机检查
- precondition/postcondition SkillRegistry 验证
- 可审计的执行控制

### 评估结果
- 端到端任务完成率：86.5%（CI 95%: 80.8-90.7）
- 阻止全部 22 个注入/非法 HR 操作
- Message-level blocking audit：Precision 100%, Recall 88%, kappa=0.94
- 960 SGD 衍生对话上发现 201 个阶段顺序冲突

## 关键洞察

- 多智能体系统的对齐税（alignment tax）：安全和有效性难以兼顾
- 约束状态机提供可审计的执行边界
- GRPO 训练的专业 Intent Router 可泛化

## 局限性

- 仅在招聘系统验证，扩展到其他业务流程需适配
- 复杂工作流上的多轮训练比较待发布

## 建议

- **是否推荐使用**：✅ 是
- **适用场景**：企业级多智能体系统、工作流安全、业务流程约束
- **关键词**：multi-agent, orchestration, RLHF, state machine, 安全约束