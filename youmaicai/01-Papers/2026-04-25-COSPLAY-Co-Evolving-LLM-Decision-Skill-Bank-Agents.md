# COSPLAY: Co-Evolving LLM Decision and Skill Bank Agents for Long-Horizon Tasks

## 元信息
| 标题 | Co-Evolving LLM Decision and Skill Bank Agents for Long-Horizon Tasks |
|------|------|
| 作者 | Xiyang Wu, Zongxia Li, Guangyao Shi, Alexander Duffy, Tyler Marques, Matthew Lyle Olson, Tianyi Zhou, Dinesh Manocha |
| 链接 | [原文](https://arxiv.org/abs/2604.20987) |
| arXiv | arXiv:2604.20987 |
| 发表 | cs.AI |

## 核心贡献
1. **COSPLAY 框架**：LLM decision agent 从可学习 skill bank 检索技能指导行动，同时 skill pipeline 从 agent 未标记 rollouts 发现可复用技能
2. **双向协同进化**：decision agent 学习更好的技能检索和行动生成，skill bank agent 持续提取、精炼、更新技能及其合约
3. **无需外部标签**：技能从 agent 自身 rollouts 自动发现，降低人工标注成本
4. **8B 模型 +25.1% 平均奖励提升**：对比四个前沿 LLM 基线，在单玩家游戏 benchmark 上显著超越

## 框架设计

### 双组件
1. **LLM Decision Agent**：参数化 harness ℋ，从 skill bank 检索技能指导行动
2. **Skill Pipeline Agent**：管理技能发现、提取、精炼流程，维护技能库及其合约

### 技能合约
每个技能附带合约（contract），描述：
- 技能前置条件
- 技能效果
- 适用场景

### 协同进化循环
```
Decision Agent 执行任务 → Skill Pipeline 从 rollouts 发现新技能 → 更新 Skill Bank → Decision Agent 改进检索策略
```

## 实验设置
- **6 个游戏环境**：覆盖单玩家（long-horizon reasoning）和多人（social reasoning）
- **基线对比**：4 个前沿 LLM（具体型号未在摘要中说明）
- **结果**：8B base model 基础上有 25.1% 平均奖励提升

## 核心洞察
现有 LLM 作为游戏 agent 的问题：
- 缺乏跨 episode 发现、保留、重用结构化技能的机制
- 长 horizon 决策一致性差（延迟奖励、部分可观测）

## 局限性
- 技能 bank 规模和质量随时间增长，可能需要管理机制
- 多人 social reasoning games 上竞争性结果（未详细说明）
- 游戏场景泛化到真实世界任务的效果待验证

## 建议
- **适用场景**：LLM Agent 架构、技能管理、长期任务规划
- **推荐程度**：⭐⭐⭐⭐ — 框架设计优雅，解决长 horizon agent 关键问题
