# FinPerMA: Personalized Memory Benchmark for LLM Agents

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04095](https://arxiv.org/abs/2608.04095) |
| **类别** | cs.AI, cs.CL |
| **作者** | Ben Wang, Kang Zhou, Lifan Guo, Feng Chen, Chi Zhang |
| **发表** | 2026-08-04 |
| **数据集规模** | 2,994 questions, 276 personas |

## 核心贡献
1. **FinPerMA 基准**：首个事件驱动的个性化记忆评估基准，对抗 frozen longitudinal investor trajectories
2. **理论驱动的生成管道**：deterministic theory-informed impact rules + controlled LLM narration + automated quality screening
3. **Post-Shock Checkpoint**：隔离 agent 是否将重大事件整合到持久化用户模型

## 关键发现
- **7 个 frontier LLMs** + **7 种 memory 配置**均远未饱和：
  - Full-context 配置总体准确率 ≤ ~0.47
  - 多选题准确率 ≤ ~39%
- Summary-based memory 保留**事实**但丢失**偏好信号**
- Simple retrieval 可优于 purpose-built memory systems，且在 shock 后差距扩大

## 评估维度
- 6 recall, reasoning, trustworthiness 维度
- 按 frozen investor trajectories 评估

## 意义
- 揭示当前 LLM agents 在**长期个性化用户建模**上的重大不足
- 为个性化记忆系统提供了严格评估范式

## URL
- 论文: https://arxiv.org/abs/2608.04095

---
*🥬 油麦菜 — 2026-08-06*
