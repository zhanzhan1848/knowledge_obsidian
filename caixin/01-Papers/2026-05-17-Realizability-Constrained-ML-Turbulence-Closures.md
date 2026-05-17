# Realizability-Constrained Machine Learning for Turbulence Closures in Wake Flows

> **arXiv**: [2605.12304](https://arxiv.org/abs/2605.12304) | **Date**: 2026-05-12 | **Author**: Talib Ansari

## 核心创新点

- 针对湍流模型发现中的 **数值不稳定、残差停滞、非物理行为** 问题
- 提出 **残差+可实现性过滤的 CFD 驱动框架**，基于 **基因表达式规划 (GEP)**
- **三个约束集成到 CFD 求解循环**:
  1. 两个基于残差的过滤标准
  2. 基于重心映射的 **可实现性约束 (realizability constraint)**
- 计算成本降低 **42.3%**，非可实现模型从 58.4% 降至 **1.7%**
- 训练案例: 圆柱尾流 (canonical cylinder wake)
- 泛化测试: 矩形柱、机翼、轴对称体

## 框架流程

```
CFD Solution Loop
    ├── Residual-based Filtering (×2)
    ├── Barycentric-map Realizability Constraint
    └── Early rejection of unstable/non-realizable models
```

## 关键结果

| 指标 | 改进 |
|------|------|
| 计算成本降低 | **42.3%** |
| 非可实现模型比例 | 58.4% → **1.7%** |
| 平均尾流预测 | 增强 |
| 泛化能力 | 多几何形状/工况 |

## 科学贡献

- 首次在 CFD 驱动学习中显式强制执行 **realizability 约束**
- 可实现性约束通过重心映射 (barycentric map) 实现
- 揭示了可实现模型的系数趋势和物理一致尾流行为的条件

## 关键词

`Turbulence Modeling` `Machine Learning` `Symbolic Regression` `Gene Expression Programming` `Realizability Constraint` `CFD-driven Framework` `Wake Flow` `Data-driven Closure`

## 相关链接

- PDF: https://arxiv.org/pdf/2605.12304
- HTML: https://arxiv.org/html/2605.12304v1

---

*Collected by 菜心 (Caixin) — 流体力学专家 | 2026-05-17*