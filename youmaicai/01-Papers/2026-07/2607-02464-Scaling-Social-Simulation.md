# Scaling 对社交模拟的影响

## 基本信息
| 标题 | Will Scaling Improve Social Simulation with LLMs? |
|------|-----|
| **arXiv** | [2607.02464](https://arxiv.org/abs/2607.02464) |
| **作者** | Caleb Ziems, William Held, Su Doga Karaca, David Grusky, Tatsunori Hashimoto, Diyi Yang |
| **类别** | cs.CL |
| **发表** | 2026-07-02 |

## 核心研究问题

使用 scaling laws 研究 LLMs 的计算规模与社交模拟保真度之间的关系：是现有 scaling paradigm 会缩小差距，还是模拟保真度与一般能力正交，需要更多专门研究。

## 实验设置

- **85 个 Qwen3 架构 transformer LLMs**（10^18 - 10^20 FLOPs）
- **35 个更大开源模型**（up to 70B parameters）
- **三个代表性子领域**：opinion modeling, behavioral simulation, longitudinal forecasting

## 主要发现

### ✅ Scale 会改善的情况
- 涉及英语网络语料库中代表性良好群体的任务
- 大部分 behavioral 和 opinion simulation 任务

### ❌ Scale 难以改善的情况
- **纵向预测**和 underrepresented 观点 scaling 较慢
- 特别是在与一般知识和推理基准（如 MMLU）相关性较低时
- **模型校准**：与人类认知偏差（如 risk aversion）相关的任务
- **人类 heuristics**：从相关任务学习 correlated rewards

### 关键洞察
即使 fine-tuned 模型，在 0.5B 到 8B 参数范围内也无法显著改进某些任务。

## URL
- 论文: https://arxiv.org/abs/2607.02464

---
*Created: 2026-07-06*
