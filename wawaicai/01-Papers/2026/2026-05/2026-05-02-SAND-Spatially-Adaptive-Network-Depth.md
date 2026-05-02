---
tags: [神经隐式表示, 自适应采样, 隐式曲面, 深度学习]
date: 2026-05-02
source: arXiv cs.GR (2604.25936)
review_status: 初筛
---

# SAND: Spatially Adaptive Network Depth for Neural Implicit Surfaces

## 核心方法

SAND 提出了一种高效神经隐式几何表示框架，利用**空间自适应网络深度 (Spatially Adaptive Network Depth)**。

**核心观察：**
1. 隐式表示在距离目标曲面更远的查询点需要更低精度
2. 即使在同一等值面上，局部几何复杂性也会导致表示难度差异
3. 传统神经隐式模型对所有查询点使用相同网络深度，造成计算浪费

**核心创新点：**
1. **Volumetric network-depth map**：记录每个空间区域达到足够精度所需的网络深度
2. **Tailed Multi-layer Perceptron (T-MLP)**：修改版 MLP，设计用于学习隐式函数（如 SDF）
3. 自适应计算：根据深度图动态调整网络深度

## 算法复杂度
- 时间复杂度：O(k) 其中 k 为自适应深度（平均低于完整深度）
- 空间复杂度：O(n) 用于存储深度图
- 显著减少网络评估计算量

## 实现难度
- 算法复杂度：中
- 数值稳定性：✅ 深度图引导，数值稳定
- 依赖项：PyTorch
- 适用场景：高精度隐式曲面建模、实时渲染

## 推荐结论
✅ **推荐实现**

神经隐式表示是几何深度学习的核心方向。SAND 通过自适应深度大幅提升效率，思路清晰且实用。适合与现有的神经隐式场研究结合。

## 开源参考
- 论文：arXiv:2604.25936
- 代码：待补充

## 相关技术
[[Neural Implicit Fields]] [[SDF]] [[Adaptive Sampling]]