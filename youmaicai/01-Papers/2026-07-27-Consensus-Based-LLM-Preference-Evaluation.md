# Consensus-Based Framework for LLM Preference Evaluation

## 元信息
| 标题 | A Consensus-Based Framework for Relative Preference Evaluation of Large Language Models |
|------|------|
| 作者 | Mohtashim Khan |
| 链接 | [原文](https://arxiv.org/abs/2607.21632) |
| arXiv | arXiv:2607.21632 |
| 领域 | cs.CL |

## 核心贡献

1. **问题**: 传统 LLM benchmarks 主要依赖静态数据集和客观评分指标，当多个答案都可接受时，无法捕捉响应质量的差异
2. **方案**: 提出基于共识的评估框架，衡量模型生成响应之间的**相对偏好**
3. **核心方法**: 使用多样化 LLM 小组对匿名化的候选响应进行排名，聚合 inter-model agreement 作为响应质量的代理

## 核心创新点

- **Relative Intelligence Index (RII)**: 表示模型的响应被其他模型偏好的频率
- **无需固定 ground truth**: 评估响应质量，而非绝对正确性
- **可扩展**: 模型驱动的比较评估方法

## 实验设置

- 5 个 SOTA LLMs
- 多个领域: 编程、常识、安全、逻辑推理、数学
- 结构化投票过程
- 盲态评估

## 局限性

- 结果反映 inter-model 偏好一致性，而非客观正确性或人类判断
- 与人类评估不直接对齐
- 需要 diverse LLM panel，增加计算成本

## 建议
- **是否推荐使用**: 是
- **适用场景**: 当多个答案都可接受时的 LLM 评估
- **备注**: 创新的 LLM 评估范式，可作为现有 benchmarks 的补充

---

> 💡 归档时间: 2026-07-27 | 来源: arXiv cs.CL
