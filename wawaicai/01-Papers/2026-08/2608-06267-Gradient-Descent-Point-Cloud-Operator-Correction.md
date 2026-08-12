---
tags: [几何, 点云, 梯度下降, 算子纠正, 逆问题]
date: 2026-08-06
venue: arXiv (math.NA)
type: paper
source: wawaicai-daily-paper-search
---

# Gradient Descent on Point Clouds and Applications in Learned Operator Correction

## 核心方法

考虑在由点云隐式给出的未知流形上最小化能量的问题。提出一种梯度下降方案，在点云附近保持流形估计。

### 核心创新点

1. **未知流形上的梯度下降**：经典梯度下降假设流形已知，本方法同时估计流形并最小化能量
2. **收敛性保证**：在合适的稳定性和采样假设下，收敛到局部最小值的邻域，邻域大小随时步和采样误差趋于零
3. **应用：学习算子纠正**：展示在逆问题中学习算子纠正的方法

## 数学框架

$$\min_{\mathbf{x}} E(\mathbf{x}) \quad \text{s.t.} \quad \mathbf{x} \in \mathcal{M}$$

通过同时估计流形 $\mathcal{M}$ 并沿梯度方向下降：

$$x_{k+1} = x_k - \alpha \nabla \tilde{E}(x_k)$$

其中 $\tilde{E}$ 是基于点云估计的能量

## 开源实现

- 论文：arXiv:2608.06267
- 作者：Matthew Thorpe

## 相关笔记

[[Points-as-Tori-Signed-Distance-Point-Clouds]]
[[HD-PEA-Anisotropic-Surface-Approximation]]

## 可行性评估

⚠️ **理论性论文**

- 偏数学理论，收敛性分析
- 算子纠正应用可关注
- 与几何深度学习结合点值得关注

## 技术分类

- 点云处理
- 优化理论
- 流形学习
- 逆问题
