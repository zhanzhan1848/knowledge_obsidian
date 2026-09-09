# Better Together: Complementary Query Rewriting Under a Strong RAG Baseline

## 元信息
| 标题 | Better Together: Complementary Query Rewriting Under a Strong RAG Baseline |
| 作者 | Sara Shanian, Xiaoqin Yi, Pavlo Ruban, Kurt MacDonald |
| 链接 | [原文](https://arxiv.org/abs/2609.05637) |
| arXiv | arXiv:2609.05637 |
| 代码 | N/A |
| 发表 | 2026-09-09；EMNLP 2026 Industry Track |

## 核心贡献
1. 在**强 RAG 基线**（BGE dense retrieval + cross-encoder reranking + MMR）下系统评估 4 种 query rewriting 策略 vs 2 种 LLM baselines（HyDE, Query2Doc）
2. 核心发现：**rewriting 单独使用效果有限，但组合不同方法产生超额收益**——因为不同策略在不同问题上失败
3. 提出置信度路由的 query rewriting：只在基线 top-1 低时触发 rewriting，以 40% 成本捕获 ~50% 收益

## 核心创新点
本文挑战了 query rewriting 作为 RAG 改进手段的常见认知：rewriting 不是强基线的替代品，而是互补的覆盖扩展来源。4 方法联合（+S1+S3+S4+HyDE）在企业数据上提升 HIT@10 **+12.5 points**，而 5 方法联合达到 +13.8。

## 模型架构 / 方法
- **固定强 RAG pipeline**：BGE dense retrieval + cross-encoder reranking + MMR diversification
- **Rewriting 策略**：S1-S4（4种策略）+ HyDE + Query2Doc（2 LLM baselines）
- **数据集**：HotpotQA / AmbigNQ / EnterpriseRAG-Bench（512K文档）
- **置信度路由**：只在基线 top-1 分数低时触发 rewriting
  - 触发条件：基线自身 top-1 score < threshold
  - 节省：rewriting cost on <40% queries

## 实验结果
- EnterpriseRAG-Bench HIT@10：39.22 → **52.98**（+13.8，5方法联合）
  - S1+S3+S4+HyDE：51.70（+12.5）
- HotpotQA：+1.6 to +1.8 points（p<0.001），饱和 all-method oracle
- AmbigNQ：联合方法有害（-2.4，p<0.001）
- 置信度路由：Enterprise +4.3 HIT@10，at ~40% expansion cost
- Answer F1：+1.92（p<0.01）

## 局限性
- 仅在 3 数据集验证
- rewriting 策略组合的边际收益递减

## 关键词
#RAG #Query-Rewriting #检索增强生成 #多策略组合 #信息检索 #NLP应用

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
