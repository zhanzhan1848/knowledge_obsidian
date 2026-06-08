# UnpredictaBench: Evaluating Distributional Randomness in LLMs

## 元信息
| 标题 | UnpredictaBench: A Benchmark for Evaluating Distributional Randomness in LLMs |
|------|------|
| 作者 | Amirhossein Abaskohi, Amirhossein Dabiriaghdam, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.06622) |
| arXiv | arXiv:2606.06622 |
| 领域 | cs.CL |
| 发表 | 2026-06-04 |

## 核心贡献

1. **问题**：LLM 被用作复杂系统的替代品（如经济模拟中的人类替代），但许多模型倾向于塌陷到单一答案，无法捕获真实系统的不可预测性。

2. **核心方法**：提出 **UnpredictaBench**，测试 LLM 捕获真实底层分布的能力。区分了：
   - 输出多样性 ≠ 分布校准
   - 模拟需要样本与目标分布校准，而非仅多样化输出

3. **测试内容**：448 个问题，包括：
   - 经典统计分布
   - 随机程序诱导的分布
   - 描述随机过程的自然语言场景

4. **评估指标**：**KS@N**（Kolmogorov-Smirnov 统计检验）
   - 无法拒绝模型大小为 N 的样本相对于真实样本的比率
   - N 越大难度越高
   - 标准指标：KS@100

## 关键发现

- 模型间分布能力差距大：KS@100 分数从接近 0 到超过 20%
- 无模型在 KS@100 上超过 40%，显示显著提升空间
- 加入推理可以一定程度上提高分数，但无法根本解决问题

## 核心创新点

首个系统性评估 LLM 分布采样能力的基准，将 Kolmogorov-Smirnov 统计检验引入 LLM 评估，揭示即使简单分布模拟对当前模型仍是挑战。

## 建议
- **是否推荐使用**：是
- **适用场景**：LLM 作为复杂系统模拟器（如金融仿真、社会模拟）的可靠性评估

---
*🥬 油麦菜 — LLM/NLP 知识管理*