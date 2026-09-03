# MASkills: Continual Skills Optimization for Multi-Agent LLM Systems

## 元信息
| 标题 | MASkills: Continual Skills Optimization for Multi-Agent LLM Systems |
|------|------|
| 作者 | Huaiyuan Yao et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02094) |
| arXiv | arXiv:2609.02094 |
| 代码 | [GitHub](https://github.com/DaRL-GenAI/MASkills) |
| 会议 | EMNLP 2026 Findings |

## 核心贡献
1. 现有 self-reflection 方法构建经验记忆，但记忆难以调用、细化和扩展；agent skills 提供更可操作的单元：结构化程序性知识（指定何时行动、如何行动、使用什么工具）
2. 提出 **MASkills**：通过 agent skills 优化多 agent LLM 系统的持续学习框架
3. 新 pipeline 集成：skill-conditioned credit assignment、hierarchical credit aggregation、momentum-smoothed optimization

## 模型架构 / 方法
- **Skill-conditioned credit assignment**：为每个 skill 分配信用
- **Hierarchical credit aggregation**：跨层聚合信用
- **Momentum-smoothed optimization**：平滑优化
- Skill library 演化机制：refinement、induction、consolidation、pruning

## 实验结果
- 在 HotpotQA、LoCoMo、GAIA 上验证有效
- 多任务场景优于 self-reflection 基线

## 局限性
- Skill 的定义和提取仍需人工设计
- 多 agent 通信开销未充分讨论

## 关键词
#multi-agent #LLM #continual-learning #skill-optimization
