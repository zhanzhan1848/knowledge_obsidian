# Diagnosing LLM Judge Reliability: Conformal Prediction Sets and Transitivity Violations

## 基本信息
- **arXiv**: [2604.15302](https://arxiv.org/abs/2604.15302) [cs.AI]
- **作者**: Manan Gupta, Dhruv Kumar
- **发表**: 2026-04-16
- **状态**: Under Review

## 核心贡献

### 双诊断工具

#### 1. 传递性分析 (Transitivity Analysis)
- 揭示被低聚合违规率掩盖的广泛输入级不一致性
- 聚合违规率：ρ̄ = 0.8-4.1%
- **33-67% 的文档至少存在一个有向 3-cycle**

#### 2. 保角预测集 (Split Conformal Prediction Sets)
- 在 1-5 Likert 分数上提供理论上保证的 ≥(1-α) 覆盖率
- 预测集宽度作为实例级可靠性指标
- 跨 judge 一致性：r̄ = 0.32-0.38

## 关键发现

### 准则 vs Judge 重要性
| 指标 | 平均集大小 | 可靠性 |
|------|-----------|--------|
| 相关性 (Relevance) | ≈ 3.0 | 最可靠 |
| 一致性 (Coherence) | ≈ 3.9 | 中等可靠 |
| 流利度 (Fluency) | ≈ 4.9 | 不可靠 |
| 一致性 (Consistency) | ≈ 4.9 | 不可靠 |

**核心结论：准则比 judge 本身更重要**

### 预测集宽度的意义
- 跨 judge 一致性（r̄ = 0.32-0.38）
- 证明捕获的是文档级难度，而非 judge 特异性噪声
- 可作为实例级可靠性指示器

## 实验数据
- 4 个 judges
- 4 个准则
- N = 1,918 个评估对
- 池化相关性：r_s = +0.576, p < 10^-100

## 局限性
- 仅在 SummEval 数据集上验证
- 保角预测的理论保证依赖于数据 exchangeability 假设

## 建议
- **推荐程度**：⭐⭐⭐⭐⭐
- **适用场景**：LLM-as-judge 可靠性分析、自动 NLG 评估
- **创新点**：首个将保角预测和传递性分析结合用于 LLM 评估诊断

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | LLM 评估与 NLG*
