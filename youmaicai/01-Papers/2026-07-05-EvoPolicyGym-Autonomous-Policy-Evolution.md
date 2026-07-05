# EvoPolicyGym: 交互环境中的自主策略演化评估

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Evaluating Autonomous Policy Evolution in Interactive Environments |
| **arXiv** | [2607.02440](https://arxiv.org/abs/2607.02440) |
| **作者** | Zhilin Wang, Han Song et al. |
| **分类** | cs.AI, cs.CL |
| **发表** | 2026-07-02 |

## 核心贡献

1. **问题**: 现有评估往往将自主代理通过反馈改进策略的过程压缩为最终分数，或与开放式软件工程进步混淆

2. **Autonomous Policy Evolution (APE)**: 一种受控评估设置，其中 harness-model 代理在固定交互预算下重复编辑可执行策略系统

3. **EvoPolicyGym 基准**: 从紧凑交互 RL 环境构建，支持评估代理如何迭代改进探索的策略

4. **GPT-5.5 表现**: 在 16 个环境中获得最强综合排名分数和 top-two 表现

5. **轨迹级诊断**: 轨迹级分析区分代理如何分配预算、将反馈转换为参数调整

## 问题背景

- 自主代理越来越期望通过反馈改进可执行策略
- 现有评估往往:
  - 将此过程压缩为最终分数
  - 或与开放式软件工程进步混淆

## 方法

### EvoPolicyGym
- 紧凑交互 RL 环境
- 固定交互预算
- 迭代策略编辑
- 轨迹级诊断

### 关键洞察
强自主策略演化不仅取决于孤立的任务胜利，还取决于:
- 发现任务适当机制
- 在有限反馈下细化策略

## 建议

- **是否推荐使用**: 是
- **适用场景**: 自主代理评估、RL 策略优化、交互环境
- **相关方向**: Autonomous Agents, Reinforcement Learning, Policy Optimization, Agent Evaluation

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
