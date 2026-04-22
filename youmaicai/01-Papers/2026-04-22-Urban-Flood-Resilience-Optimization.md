# Optimising Urban Flood Resilience

## 元信息
| 标题 | Optimising Urban Flood Resilience |
|------|-----------------------------------|
| 作者 | James Mckenna Mr |
| 链接 | [原文](https://arxiv.org/abs/2604.18620) |
| arXiv | arXiv:2604.18620 |
| 发表日期 | 2026-04-17 |
| 类别 | cs.NE |
| 备注 | 47 pages, 25 figures |

## 核心贡献
1. **多目标优化工具**: coupling hydrodynamic model + bespoke evolutionary algorithm
2. **全动态 hydrodynamic model**: 准确评估 BGI (Blue-Green Infrastructure) 特征效果
3. **定制 evolutionary algorithm**: 最小化所需仿真次数，保证计算可行性

## 方法架构

### 背景
- 气候变化 + 城市扩张 → 风暴事件频率和严重程度增加
- Blue-Green Infrastructure (BGI) 提供可持续洪水风险管理方案
- 最优实施困难

### 方法
- **Hydrodynamic model**: 全动态，评估 BGI 特征效果（property scale flood vulnerability + hazard analysis）
  - 对比简化模型（只能预测淹没范围）
- **Evolutionary algorithm**: 定制，最小化仿真次数

### 验证
- 解析收敛测度推导（tractable search space）
- 对比基准算法（intractable search space）

### 结果
- 自动化探索广范围解决方案
- 提供 Pareto 最优解集供决策者选择

## 局限性
- 与 NLP/LLM 领域关联度低
- 属 cs.NE (Neural and Evolutionary Computing) 但非 LLM 相关

## 建议
- **是否推荐使用**：否（与 LLM/NLP 领域无关）
- **适用场景**: 城市洪水管理、BGI 优化、evolutionary algorithms

## 标签
#evolutionary-algorithm #flood-resilience #optimization