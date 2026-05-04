# TokenUnlearn: Token-Level Attribution for Precise Language Model Unlearning

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Jiawei Wu, DouDou Zhou |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00364) |
| arXiv | arXiv:2605.00364 |

## 核心贡献

### 问题
- 现有 unlearning 方法在 sequence level 操作
- 对所有 token 应用统一更新（只有子集编码目标删除的知识）
- 引入 gradient noise，降解 utility，导致次优 forgetting

### 方法：TokenUnlearn
1. **Token-level attribution framework**：识别并选择性 targeting 关键 token
2. 结合信号：
   - **Knowledge-aware signals**: masking
   - **Entropy-aware signals**: importance scores
3. 两种策略：
   - **Hard selection**: 仅对高重要性 token 应用 unlearning
   - **Soft weighting**: 基于重要性分数调制梯度贡献

### 理论分析
- Token-level selection 提高 gradient signal-to-noise ratio

## 实验
- TOFU 和 WMDP benchmarks
- 三种模型架构

## 结果
- 一致的改进：forgetting effectiveness 和 utility preservation

## 建议
- **是否推荐使用**：是（LLM unlearning 研究）
- **适用场景**：Privacy、safety、regulatory compliance、machine unlearning

---

## 摘要

Machine unlearning has emerged as a critical capability for addressing privacy, safety, and regulatory concerns in large language models (LLMs). Existing methods operate at the sequence level, applying uniform updates across all tokens despite only a subset encoding the knowledge targeted for removal. This introduces gradient noise, degrades utility, and leads to suboptimal forgetting. We propose TokenUnlearn, a token-level attribution framework that identifies and selectively targets critical tokens.

## 关键词
- `#machine unlearning` `#privacy` `#LLM editing` `#token-level`