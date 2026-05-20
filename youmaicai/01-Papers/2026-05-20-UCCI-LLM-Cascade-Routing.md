# UCCI: Calibrated Uncertainty for Cost-Optimal LLM Cascade Routing

## 元信息
| 标题 | UCCI: Calibrated Uncertainty for Cost-Optimal LLM Cascade Routing |
|------|-----|
| 作者 | Varun Kotte |
| 链接 | [原文](https://arxiv.org/abs/2605.18796) |
| arXiv | arXiv:2605.18796 |
| 发表 | 2026-05-11 |
| 代码 | - |

## 核心贡献

1. **问题**: LLM 级联和模型路由用小模型处理简单查询、大模型处理复杂查询，但大多数路由器使用未校准置信度分数且需要逐工作负载调整阈值

2. **UCCI 方法**: 校准优先路由器，将 token 级边际不确定性映射为每查询误差概率（通过保序回归），通过约束成本最小化选择升级阈值

3. **理论保证**: 在三个明确假设下，校准分数上的阈值策略是成本最优的，保序回归实现了 $O(n^{-1/3})$ 期望校准误差样本复杂度

## 实验结果

### 生产 NER 工作负载 (75,000 queries, 4B 和 12B instruction-tuned LLMs on H100 GPUs)

- **成本降低**: UCCI 在 micro-F1=0.91 条件下降低推理成本 **31%** (95% CI: [27%, 35%])
- **校准改进**: ECE 从 0.12 降至 0.03
- **对比方法**: 超越 entropy thresholding, split-conformal routing, FrugalGPT-style learned threshold

## 关键公式

### 误差概率映射
通过保序回归 (isotonic regression) 将 token 级边际不确定性映射为每查询误差概率

### 成本最优阈值
在校准分数上选择阈值，通过约束成本最小化实现成本最优

## 建议

- **是否推荐使用**: 是
- **适用场景**: LLM 级联推理，用于成本敏感的生产部署

---

标签: #LLM-Routing #Uncertainty-Calibration #Cascade-Inference #Cost-Optimization