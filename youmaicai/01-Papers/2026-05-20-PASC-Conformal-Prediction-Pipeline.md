# PASC: Pipeline-Aware Conformal Prediction for Multi-Stage NLP/LLM Pipelines

## 元信息
| 标题 | PASC: Pipeline-Aware Conformal Prediction with Joint Coverage Guarantees for Multi-Stage NLP and LLM Pipelines |
|------|-----|
| 作者 | Varun Kotte |
| 链接 | [原文](https://arxiv.org/abs/2605.18812) |
| arXiv | arXiv:2605.18812 |
| 发表 | 2026-05-12 |
| 代码 | - |

## 核心贡献

1. **问题**: 现代 NLP/LLM 系统是多阶段管道 (NER → NED → entity typing, RAG retriever → reader, agent chains)，错误在阶段间复合，但现有不确定性量化方法要么独立校准每个阶段（无联合覆盖）要么应用 Bonferroni 联合边界（保守）

2. **PASC 方法**: Pipeline-Aware Split Conformal，将多阶段联合覆盖减少为关于联合最大非conformity 分数的单一标量 conformal prediction 问题

3. **理论保证**: 提供有限样本、无分布保证：所有 K 个阶段同时覆盖概率至少为 1 - α，且几乎紧致（仅差 1/(n+1) 因子）

## 实验结果

### CoNLL-2003 NER → NED → Entity-Typing 管道

| 方法 | 端到端覆盖 | 平均预测集大小 |
|------|----------|--------------|
| Independent CP | 86.5% | 1.083 |
| Bonferroni | 93.4% | 1.083 |
| **PASC** | **96.4%** | 1.083 |

### 分布偏移下的鲁棒性

在 WNUT-17 Twitter 和 WikiNEuRal Wikipedia 数据上：
- Independent CP 崩溃至 59% 覆盖
- **PASC 在测试的偏移设置下保持目标覆盖**

### 可扩展性

- 支持 K=6 阶段，Independent CP 降至 0.53 端到端覆盖
- 比 Bonferroni 快 1.7 倍
- 仅需单一分位数计算

## 建议

- **是否推荐使用**: 是
- **适用场景**: 多阶段 NLP/LLM 管道的不确定性量化，特别是需要联合覆盖保证的生产系统

---

标签: #Conformal-Prediction #Uncertainty-Quantification #Multi-Stage-Pipeline #NLP