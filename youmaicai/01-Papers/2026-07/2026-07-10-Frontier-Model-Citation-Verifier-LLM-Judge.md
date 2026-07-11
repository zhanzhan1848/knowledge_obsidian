# Do You Need a Frontier Model as a Citation Verifier? Benchmarking Rubric LLMs for Deep-Research

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Do You Need a Frontier Model as a Citation Verifier? Benchmarking Rubric LLMs for Deep-Research Source Attribution |
| **arXiv** | arXiv:2607.08700 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08700 |
| **作者** | Ethan Leung et al. |
| **日期** | 2026-07-09 (v1) |

## 核心贡献

1. 研究 **LLM-as-judge 作为 RL reward model** 时的校准问题，聚焦引用质量评估
2. 在对抗性长文本基准上对比 8 个 LLM judges（3 个模型家族），共 **1,248 个 rubric decisions**
3. 核心发现：**便宜的小模型（如 GPT-5-mini）可以达到最强的 source-relevance F1（0.908, κ=0.636）**

## 评估维度

LLM judge 沿两个维度评估每个 attribution-citation 对：

1. **Source Relevance**：引用与主张的相关程度
2. **Factual Support**：引用对主张的事实支撑程度

## 主要结果

| Judge | Source Relevance F1 | Factual Support |
|-------|---------------------|----------------|
| GPT-5-mini | **0.908** (κ=0.636) | 与其他 judges 无显著差异 |
| 其他 judges | 略低 | 统计上无法区分 |

### 关键发现

1. **便宜 judge 在两个维度都具竞争力**（尤其 source relevance）
2. **factual support 维度**：各 judge 统计上无显著差异（confidence intervals 重叠）
3. 标量 F1 **掩盖方向偏差**：
   - false positive rate 和 false negative rate 方向不同
   - 但这些恰好是 RL 循环会强化的偏差
4. **校准 judge 是使用引用 rubric 作为 reward signal 的前提**

## 为什么便宜模型就够了

- Source Relevance 更依赖语义匹配，小模型也能做
- Factual Support 需要更多知识，但各模型差异不显著
- 方向偏差（FP/FN）是主要问题，模型规模不能解决

## 实践建议

- 不需要最贵的模型作为 LLM judge
- 必须做 bias probe（位置偏差、冗长度偏差）
- 需要 error-dependence 估计和 protocol audit trail
- 报告应包含 dataset slices 和 parser/fallback logs

## 相关工作

- [[2607.08535]] - LLM-as-Judge Reliability Audit（同一方向，更系统）
- [[2607.08393]] - Knowing-Using Gap（LLM fine-tuning 泛化问题）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08700 | 2026-07-10*
