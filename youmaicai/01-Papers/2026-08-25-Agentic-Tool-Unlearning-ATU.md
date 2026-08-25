# Forgotten in Weights, Recovered by Tools: Agentic Tool Unlearning for LLM Agents

## 元信息
| 标题 | Forgotten in Weights, Recovered by Tools: Agentic Tool Unlearning for LLM Agents |
|------|------|
| 作者 | Zheyuan Liu |
| 链接 | [原文](https://arxiv.org/abs/2608.21544) |
| arXiv | arXiv:2608.21544v1 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-08-21 |

## 核心贡献
1. **Tool-Mediated Recovery 识别**: 发现传统 unlearning 方法虽抑制直接参数召回，但 agent 可通过工具（网络搜索、检索、数据库）恢复相同遗忘目标
2. **Agentic Tool Unlearning (ATU)**: 两阶段框架
   - Stage 1: 参数知识 unlearning 抑制直接召回
   - Stage 2: 轨迹级 RL 在模拟工具增强环境中惩罚目标导向工具行为
3. **数据集**: 在 RWKU 和 MUSE 上验证

## 关键概念
- **Tool-Mediated Recovery**: unlearning 后 agent 通过外部工具仍能恢复遗忘目标
- **Trajectory-Level RL**: 在工具调用轨迹上惩罚目标搜索行为

## 局限性
- 依赖模拟工具环境的质量
- 两阶段训练复杂度较高

## 标签
#Machine-Unlearning #LLM-Agent #Privacy #RLHF #Tool-Use
