# MCTS-Report: Table-to-Multimodal Report Generation

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04071](https://arxiv.org/abs/2608.04071) |
| **类别** | cs.AI |
| **作者** | Teng Lin, Zhiyang Zhang, Yuyu Luo, Nan Tang |
| **发表** | 2026-08-04 |
| **Benchmark** | MMRBench (6 domains) |

## 核心贡献
1. **MCTS-Report**: 将表格→多模态报告生成建模为 MCTS 搜索过程
2. **Atomic Actions**: chapter planning, visualization task identification, chart generation, insight organization, narrative refinement
3. **Multi-dimensional Reward**: numerical fact consistency (via SQL), chart quality, chart-text alignment, structural completeness + diversity penalty + precondition pruning

## 方法
- LLM 生成逐步推理和 action，存储 reasoning trajectory 于每个 node
- 动态推理基于当前 report state
- Precondition check 剪枝无效 actions
- Diversity penalty 抑制重复 charts

## 实验结果
| 指标 | MCTS-Report |
|------|-------------|
| Overall Score | **77.9** |

- 显著优于强 baseline
- 在 structural completeness, numerical accuracy, chart-text alignment, insight novelty 上均领先

## 意义
- 展示 MCTS + LLM reasoning 在结构化数据报告生成中的有效性
- 为 data intelligence 场景提供了 joint optimization 方案

## URL
- 论文: https://arxiv.org/abs/2608.04071

---
*🥬 油麦菜 — 2026-08-06*
