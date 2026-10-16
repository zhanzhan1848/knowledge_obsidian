# Training Reasoning Models to Generate Diverse Scientific Ideas

## 元信息
| 标题 | Training Reasoning Models to Generate Diverse Scientific Ideas |
|------|--------------------------------------------------------------|
| 作者 | Manya Wadhwa, Pranav Narayanan Venkit, Hiroaki Hayashi, Yu Li, Tuhin Chakrabarty, Chien-Sheng Wu (Columbia) |
| 链接 | [原文](https://arxiv.org/abs/2610.22324) |
| arXiv | arXiv:2610.22324 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.CL |
| 代码/数据 | [GitHub](https://github.com/ManyaWadhwa/diverge_ideation) |

## 核心贡献
1. **Set-level RL**：在"科学想法生成"任务中**联合优化**质量与多样性
2. **Document-grounded ideation**：基于已有论文生成新想法，必须 grounded + 高质 + distinct
3. **距离加权评分**：每个 idea 的 quality 权重 = 与前面已生成 ideas 的距离
4. **8B 训练模型超越更大前沿模型**：在 contamination-free benchmark 上创造性 utility **超过 Claude Opus 4.8 和 GPT-6 Astra**

## 方法
### Set-level RL 框架
```math
\text{Score}(S) = \sum_{i=1}^K w_i \cdot q_i
\quad \text{where} \quad w_i = \text{dist}(idea_i, \{idea_1, ..., idea_{i-1}\})
```
- 模型一次性写出 K 张"structured idea cards"
- 每张卡的质量 q_i 用与前置 idea 的距离加权
- 教会模型把每个新 idea 推向"远离前身"的方向

## 实验结果
### 主要基准（contamination-free）
| 模型 | 创造性 utility |
|------|----------------|
| **8B trained model (本文)** | **高于 Claude Opus 4.8 / GPT-6 Astra** |
| Claude Opus 4.8 | 基线 |
| GPT-6 Astra | 基线 |

### 额外验证
- **4 人 pilot human study**：本文模型的 idea sets 与 Claude Opus 4.8 "同样 promising"，且 unique idea 数略多
- **Coding agent 跑 PoC 实验**：success@k 与 Claude Opus 4.8 相当 → 多样性**没有牺牲可执行性**

## 关键洞察
- 大多数 ideation 工作优化"单个 idea 的质量"，本文强调**集合多样性**
- Set-level reward 是结构化 RL 在 LLM 上的有趣扩展
- 8B 模型可超越 100B+ 模型的关键：用对了 RL 目标

## 相关工作
[[Scientific-Ideation]] [[RLHF]] [[Set-Level-RL]] [[Diversity-Promotion]] [[Reasoning-Models]] [[Scientific-Creativity]]

## 局限性
- "距离"的定义依赖 embedding/语义表征选择
- 仅在科学 ideation 验证，其他领域迁移未做
- Human study 仅 4 人，统计力度有限

## 实践建议
- 对"开放式生成 + 需多样性"的场景（产品命名、广告文案、planning）有用
- 可与 [[Self-Consistency]] / [[Best-of-N]] 正交：是在训练目标层面多样性
- **建议复用**：把这种 set-level reward 思路嫁接到 Brainstorm / Multi-Solution Generation

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
