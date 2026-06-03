# Skill-RM: Unifying Heterogeneous Evaluation Criteria via Agent Skill

## 元信息
| 标题 | Skill-RM: Unifying Heterogeneous Evaluation Criteria via Agent Skill |
|------|-----|
| 作者 | Tao Chen, Gangwei Jiang, Pengyu Cheng, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.03980) |
| arXiv | arXiv:2606.03980 |
| 发表 | 2026-06-02 |
| 领域 | cs.LG, cs.CL |
| 代码 | [GitHub](https://github.com/Qwen-Applications/Skill-RM) |

## 核心贡献
1. **问题**：当前奖励评估依赖异构标准（rule-based verifiers, ground-truth references, procedural checklists, complex rubrics），缺乏统一机制整合所有类型的证据。
2. **Skill Reward Model (Skill-RM)**：将奖励建模重新定义为执行可复用 Reward-Evaluation Skill 的任务。
3. **核心思想**：通过将奖励计算视为结构化 agentic 任务，Skill-RM 提供一致接口来编排异构资源，动态选择和聚合证据以适应每个输入的特定需求。

## 方法细节

### 框架设计
- 将奖励建模概念化为 Skill 执行
- 统一接口处理 heterogeneous 评估资源
- 动态选择和聚合证据

### 实验验证
- **Reward benchmarks**：验证奖励建模性能
- **下游应用**：Best-of-N selection, Reinforcement Learning
- 一致性 + 透明度

## 核心创新点
- 首次提出将奖励建模统一为 Skill 执行任务
- 动态编排异构证据的机制设计
- 超越静态评估，确保一致性和透明度

## 标签
#LLM #RLHF #reward-modeling #agent-skill #unified-framework