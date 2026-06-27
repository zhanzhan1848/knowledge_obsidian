# Error-Conditioned Neural Solvers for Turbulent Flows

## 论文信息
- **arXiv**: 搜索结果中
- **作者**: Haina Jiang, Liam Wang, Peng-Chen Chen, Min Seop Kwak, Seungryong Kim, Brian Bell, Jeong Joon Park
- **提交日期**: 2025年6月25日
- **分类**: Machine Learning, Fluid Dynamics, Turbulence

## 核心贡献
提出 Error-Conditioned Neural Solvers (ENS)，一种基于误差条件学习的神经求解器，用于湍流 Kolmogorov 流动，避免了混合方法的昂贵计算成本。

### 研究背景
- 湍流模拟的挑战：计算成本高，特别是高雷诺数流动
- 混合方法（PINN + 传统求解器）：计算开销大
- 需要更高效的神经求解器

### 方法创新
**ENS 核心思想**:
- 学习校正策略 (learned correction policy)
- 基于误差条件 conditioning
- 避免完整求解器的计算开销

### 关键特性
1. **误差条件学习**: 根据当前误差状态调整校正策略
2. **零样本泛化**: 
   - 参数变化下的零样本迁移
   - 跨方程迁移能力
3. **高效性**: 在 ill-conditioned  regime 表现优于残差最小化方法

### 数值验证
- Kolmogorov 流动（湍流 benchmark）
- 展示了良好的泛化能力

## 技术优势
- 比混合方法计算成本低
- 残差最小化在不 ill-conditioned  regime 不够可靠时，ENS 优势最大
- 支持分布外泛化

## 应用场景
- 湍流模拟加速
- 实时 CFD
- 不确定度量化

## 关键词
#neural-solver #turbulence #Kolmogorov-flow #error-conditioned #PINN #surrogate-modeling

---
*📅 2026-06-27 每日论文搜索收录*