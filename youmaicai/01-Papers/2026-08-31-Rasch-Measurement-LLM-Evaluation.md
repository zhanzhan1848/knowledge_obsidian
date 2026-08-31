# Rating the Raters: Rasch Measurement Theory for LLM Evaluation

## 元信息
| 标题 | Rating the Raters: Rasch Measurement Theory for LLM Evaluation |
|------|------|
| 作者 | Pratik S. Sachdeva, Nathan Boudol |
| 链接 | [原文](https://arxiv.org/abs/2608.27463) |
| arXiv | arXiv:2608.27463 |
| 领域 | cs.AI |

## 核心贡献
1. 将 **Rasch 测量理论 (RMT)** 引入 LLM 评估的三个范式：被试 (examinee)、裁判 (judge)、评分者 (rater)
2. 在 LLM-as-rater 范式上展示 RMT 诊断能力，揭示 LLM 与人类评分者的系统性差异
3. 发现标准评估实践会掩盖 LLM 评分者在严重度、项目校准、问题顺序鲁棒性、目标身份敏感性、评分量表使用上的系统性偏差

## Rasch 测量理论核心思想
- 将顺序评分分解为可分离的 facet（在共同尺度上）
- 提供诊断工具识别校准不良的测量和评分者偏差
- 关键：区分被测对象、测量工具、评分者三者的贡献

## 案例研究: LLM-as-Rater
- **数据集**: Measuring Hate Speech corpus（本身在 RMT 下构建）
- **被测 LLM**: 9个，跨不同家族和能力层级
- **对比基准**: 人类评分者

## 发现的系统性差异
| 维度 | 人类评分者 | LLM 评分者 |
|------|-----------|-----------|
| 严重度 (Severity) | 校准良好 | 系统性偏差 |
| 项目级校准 | 一致 | 不一致 |
| 问题顺序鲁棒性 | 高 | 低 |
| 目标身份敏感性 | 低 | 高 |
| 评分量表使用 | 规范 | 不规范 |

## 关键发现
- LLMs 在作为评分者时，与人类评分者存在系统性差异
- 这些差异在标准评估实践中会被掩盖
- RMT 可以揭示这些隐藏的偏差来源

## 建议
- **是否推荐使用**: 是（评估方法论贡献）
- **适用场景**: LLM 评估标准化、模型对比研究

---
*关键词*: LLM评估, Rasch测量理论, LLM-as-judge, 评分者偏差
*研究领域*: cs.AI
