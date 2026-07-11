# When the Judge Changes, So Does the Measurement: Auditing LLM-as-Judge Reliability

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | When the Judge Changes, So Does the Measurement: Auditing LLM-as-Judge Reliability |
| **arXiv** | arXiv:2607.08535 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08535 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 将 **evaluator-replacement ambiguity** 建模为 **measurement-validity** 问题
2. 对比两种 judge upgrade 路径：
   - Scaling Qwen3 dense judges（1.7B → 4B → 8B → 32B）
   - 跨 MiniMax M2-M2.7 API 版本
3. 跨越 4 个 judgment datasets，1,248+ rubric decisions

## 主要发现

### 1. Judge Upgrades Are Not Interchangeable

| Upgrade Path | 效果 |
|-------------|------|
| Qwen3 1.7B → 4B | ✅ 稳健的相邻增益 |
| Qwen3 4B → 8B | 部分增益 |
| Qwen3 8B → 32B | 增益有限 |
| MiniMax M2 → M2.7 (adjacent) | ❌ 无稳健增益 |

**结论：模型规模不是唯一决定因素，架构和训练的影响同等重要**

### 2. Stronger Judges Reduce but Do Not Remove Bias

- **Position bias**：更强大的 judge 有所改善但未消除
- **Verbosity bias**：更强大的 judge 有所改善但未消除

### 3. Repeated-Sample Juries Add Little When Errors Are Correlated

- 当不同 sample 的错误高度相关时，jury 方法收益甚微
- 独立错误假设在实践中往往不成立

### 4. Structured Debate Can Move Decisions Substantially

- 但没有 parser 和 fallback logs，无法将变化归因于 deliberation

## 实践建议

LLM-as-Judge 报告应包含：
- Dataset slices（按难度/类型分层）
- Bias probes（位置偏差、冗长度偏差探测）
- Error-dependence estimates（错误相关性估计）
- Protocol audit trails（完整的过程审计）

## 相关工作

- [[2607.08700]] - Frontier Model as Citation Verifier（同一方向）
- [[2607.08374]] - LLM-as-Judge for Personality Recognition

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08535 | 2026-07-10*
