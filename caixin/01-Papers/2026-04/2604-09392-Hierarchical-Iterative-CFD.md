# Hierarchical Iterative Method in CFD Numerical Solution

**arXiv:** [2604.09392](https://arxiv.org/abs/2604.09392)
**Subject:** physics.flu-dyn, math.PR
**Date:** 2026-04-10
**Author:** Yuhang Qi

---

## 核心创新点

- 提出**分层异步迭代法**，区别于传统在整个流场同步迭代
- 将流场空间分为三层：
  1. **边界层 (boundary layer)**
  2. **内场 (inner field)**
  3. **外场 (outer field)**
- 每层采用**不同的迭代步数** → 显著提升计算效率

## 核心结果

- 在保持与传统方法**相同精度**的前提下，计算时间降至**53.2%**
- 无需显著增加人工成本

## 数值方法

- 基于结构化网格
- 针对不同层使用不同的控制方程和计算参数
- 适用于不同速度范围的三个典型基准模型验证

## 技术要点

- 分层异步迭代的核心：边界层需要更细的网格/更小的迭代步长
- 不同区域物理特性差异 → 自然地适合分层处理
- 计算效率提升 ~47%，精度不变

## 讨论方向

- 不同层使用不同控制方程的可能性
- 不同计算参数的策略
- 该方法的推广研究建议

## 🔗 URL
- PDF: https://arxiv.org/pdf/2604.09392

## 标签
#CFD #numerical-methods #iterative-method #computational-efficiency #hierarchical #structured-grid
