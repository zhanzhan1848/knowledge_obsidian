---
tags: [几何, remeshing, CVT, neural-geometry, graph-neural-network]
date: 2026-09-10
domain: geometry
conference: arXiv
authors: [Jiacheng Xu, Bo Pang, Rui Xu, Xiaocheng Zhang, Yang Liu, Fei Zhu, Guoping Wang, Peng-Shuai Wang]
---

# Neural Centroidal Voronoi Tessellations

## 核心方法

**Neural CVT** — 基于学习（Graph Neural Network + 循环优化器）的表面 CVT 求解器，替代传统需重复构造 Restricted Voronoi Diagram (RVD) 的昂贵优化。

**Pipeline:**
1. 输入表面 → 采样密集点云
2. Graph Neural Encoder 提取多尺度几何特征
3. 轻量级循环优化器（RNN-based）预测每轮迭代的种子点位移
4. 自监督训练：CVT 目标（均匀分布 + 特征对齐）

## 关键创新点

- 将 CVT 几何计算完全替换为神经网络前向传播
- 循环优化器聚合表面特征和优化历史 → 预测位移
- 泛化到未见几何、初始化策略和种子密度

## 算法复杂度

- 时间：相比传统优化快 **10x–100x**
- 空间：O(n) 点特征存储

## 数值稳定性

- 自监督训练保证 CVT 目标收敛
- 分辨率/密度鲁棒

## 开源参考

- 代码/模型即将开源
- libigl: `fgt` 相关函数可用于对比
- 相关工作: Euclidean CVT (Burkardt et al.), Surface CVT (Lévy, 2016)

## 推荐度

✅ **强烈推荐** — CVT/remeshing 领域重要进展，学习加速几何优化范式清晰有价值。

## 链接

- arXiv: https://arxiv.org/abs/2609.08497
- 2026-09-08 提交
