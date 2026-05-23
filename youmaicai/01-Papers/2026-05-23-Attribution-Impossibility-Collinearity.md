---
type: paper
created: 2026-05-23
updated: 2026-05-23
tags: [explainability, shap, feature-attribution, collinearity, fairness]
status: processed
domain: XAI & Interpretability
agent: youmaicai
source: https://arxiv.org/abs/2605.21492
---

# The Attribution Impossibility: No Feature Ranking Is Faithful, Stable, and Complete Under Collinearity

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The Attribution Impossibility: No Feature Ranking Is Faithful, Stable, and Complete Under Collinearity |
| **作者** | Drake Caraker, Bryan Arnold, David Rhoads |
| **发表** | arXiv 2026 (cs.LG, cs.AI, cs.LO, stat.ML) |
| **链接** | [原文](https://arxiv.org/abs/2605.21492) |
| **DOI** | 10.48550/arXiv.2605.21492 |
| **代码** | [GitHub](https://github.com/DrakeCaraker/dash-impossibility-lean) |

---

## 核心贡献

> 证明特征排名在共线性存在时无法同时满足 faithful、stable、complete 三个性质，提出 DASH 解决方案，首次在 XAI 领域实现 Lean 4 形式化验证。

1. **不可能性定理**：当特征共线性时，没有任何特征排名方法能同时满足三个性质（faithful, stable, complete）
2. **量化分析**：对四种模型类别量化不可能性，梯度 boosting 的 attribution ratio 发散为 1/(1-ρ²)，Lasso 无穷大，Random Forest 收敛
3. **DASH 解决方案**：Diversified Aggregation of SHAP，通过集成平均解决不可能性，是 unbiased aggregation 中 Pareto-optimal
4. **Lean 4 形式化验证**：305 个定理，16 个公理，0 sorry，首次在 XAI 领域实现完全形式化验证
5. **实践影响**：68% 的公开数据集存在 attribution instability，SHAP-based 公平审计在共线性下不可靠

---

## 技术方案

### 核心思想

特征共线性导致任何基于特征重要性的排名本质上是 unstable 的。设计空间只有两类方法：不稳定但 faithful-complete 的方法，以及稳定的 ensemble 方法（如 DASH）。

### 关键概念

| 概念 | 说明 |
|------|------|
| Faithful | 排名忠实反映真实特征重要性 |
| Stable | 排名在小扰动下保持一致 |
| Complete | 完整覆盖所有特征的重要性 |
| DASH | Diversified Aggregation of SHAP，通过集成 ties 处理对称特征 |
| Attribution Ratio | 衡量不稳定性程度的量化指标 |

---

## 公式

```math
\text{Attribution Ratio} \sim \frac{1}{1 - \rho^2} \quad \text{(for Gradient Boosting)}
```

---

## 实验结论

- **数据集**: 77 个公开数据集调研
- **结果**: 68% 的数据集存在 attribution instability
- **DASH 性能**: 达到 Cramer-Rao variance bound，提供最优的 unbiased 估计
- **公平审计**: SHAP-based 代理歧视审计在共线性下被证明不可靠

---

## 局限性

- 形式化验证基于特定假设，可能需要扩展
- DASH 的计算成本较高（ensemble averaging）

---

## 实现建议

- **实现难度**: 高（需要 Lean 4 形式化验证基础）
- **预期性能**: DASH 在 unbiased 方法中 Pareto-optimal
- **适用场景**: 特征重要性分析、公平性审计、模型可解释性报告