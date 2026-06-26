# Temperature Control and Reproducibility in LLM-as-Judge Safety Evaluations

## 元信息
| 标题 | Necessary but Not Sufficient: Temperature Control and Reproducibility in LLM-as-Judge Safety Evaluations |
|------|-----|
| 作者 | Hiroki Tamba |
| 链接 | [原文](https://arxiv.org/abs/2606.26185) |
| arXiv | arXiv:2606.26185 |
| 领域 | cs.LG |
| 发表 | 2026-06-24 |

## 核心贡献
1. **Temperature ≠ Deterministic**: 揭示将 temperature=0 视为确定性评估的错误假设
2. **两层失效分析**:
   - Harness 未设置 temperature/seed，provider 默认 1.0，边界样本 pass/fail 翻转率达 ~50%
   - 即使 pin temperature=0，690 次 API 调用中仍有 1-2/7 边界样本不可复现（top_k=1）
3. **跨模型验证**: 两个 provider、三层模型、五个采样配置
4. **新模型不适用**: Claude Opus 4.7/4.8 已废弃 temperature

## 关键发现
- 边界样本的决策边界附近存在固有随机性
- 单一 run verdict 无法反映 safety 特性
- Grader disagreement 应作为与分数并列的第一类健康指标

## 建议
- 评估 harness 应报告 grader disagreement 指标
- 报告 variance 而非单一 verdict
- 将 grader-disagreement 视为第一类健康指标

## 标签
#LLM #evaluation #safety #reproducibility #LLM-as-judge