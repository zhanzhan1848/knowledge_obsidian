# EVOCHAMBER: Test-Time Co-evolution of Multi-Agent System

## 元信息
| 标题 | EVOCHAMBER: Test-Time Co-evolution of Multi-Agent System at Individual, Team, and Population Scales |
|------|-------|
| 作者 | Yaolun Zhang, Tianyi Xu, Shengyu Dai, Zhenwen Shao, Qingyun Wu, Huazheng Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.11136) |
| arXiv | arXiv:2605.11136 |
| 代码 | [GitHub](https://github.com/Mercury7353/EvoChamber) |
| 领域 | cs.AI |

## 核心贡献
1. 提出**多智能体测试时进化**与单智能体进化的本质区别：多智能体系统额外演化"谁协作、如何协作、知识如何在群体中流动"，这些没有单智能体对应物
2. 提出 **CODREAM (Collaborative Dreaming)**：团队失败/分歧后触发，智能体协作反思、提炼洞察，非对称地从强到弱路由知识
3. **EVOCHAMBER** 框架：三层进化
   - 个体层：CODREAM 协议
   - 团队层：按 niche 组装团队、在线选择协作结构
   - 群体层：fork/merge/prune/seed agents

## 关键结果
- 基于 Qwen3-8B，在三个异构任务流测试：
  - 数学竞赛：63.9% (比最佳 baseline 高 32% relative)
  - 代码：75.7%
  - 多域推理：87.1%
- 从相同初始化的 agents 自发涌现 4-5 个稳定的 niche 专家
- 非对称跨智能体迁移是主要驱动因素

## 核心机制：CODREAM
- 触发条件：团队失败或分歧
- 流程：协作反思 → 提炼洞察 → 非对称路由（强→弱智能体）
- 设计动机：保留 specialization 同时填补知识空白

## 局限性
- 需要足够的计算资源运行多智能体系统
- niche 形成依赖于任务分布的多样性

## 关键词
多智能体进化, 测试时进化, 协作学习, LoRA, Qwen3-8B