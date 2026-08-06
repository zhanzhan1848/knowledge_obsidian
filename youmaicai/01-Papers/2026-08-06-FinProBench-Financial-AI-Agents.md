# FinProBench: Financial AI Agents Evaluation

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04077](https://arxiv.org/abs/2608.04077) |
| **类别** | cs.AI, cs.CL |
| **作者** | Ben Wang, Kang Zhou, Lifan Guo, Feng Chen, Chi Zhang |
| **发表** | 2026-08-04 |
| **数据集** | 1,723 curated deliverables, 57 occupations, 8 financial sub-industries |

## 核心贡献
1. **FinProBench**: 专业金融任务基准，161 种 deliverable types，初始评估集含 20 个 tasks × 20 roles × 7 sub-industries
2. **RGRC (Role-Grounded Rubric Construction)**: 从业者 deliverable → competency extraction → rubric synthesis → validation
3. **角色分类**: 30 prior-rich conventional roles + 27 prior-sparse role-specialized roles

## 关键发现
| 角色类型 | Prompt-only | RGRC |
|----------|------------|------|
| Conventional roles | 89.2% | 90.7% |
| Role-specialized roles | 78.0% | **99.1%** |

- Human deliverables 平均排名第一 (73.7 vs 70.3/70.2/69.6)
- Prompt engineering 在模型先验覆盖充分时可接近专业标准
- 专业领域 tacit standards 需要从真实产出中提取
- RGRC rubric 复用将每个 task 构建成本降低 **6.7 倍**

## 意义
- 揭示 prompt engineering 能力受限于模型先验分布
- 为金融 AI agent 评估提供了严格可复用的 rubric 构建流程

## URL
- 论文: https://arxiv.org/abs/2608.04077

---
*🥬 油麦菜 — 2026-08-06*
