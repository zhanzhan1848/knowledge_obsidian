---
title: "Volume-preserving Lagrangian averaging using polar factorization"
arxiv: "2608.16862
date: 2026-08-17
tags: [Lagrangian-averaging, GLM-theory, volume-preserving, optimal-transport, vortex, wave-flow-interaction]
categories: [Lagrangian-coherent-structures, wave-flow-interaction]
---

# Volume-Preserving Lagrangian Averaging Using Polar Factorization

## 论文信息
- **arXiv**: 2608.16862
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Atmospheric and Oceanic Physics (physics.ao-ph)
- **关键词**: Lagrangian mean, volume-preserving, polar factorization, GLM theory, Andrews-McIntyre

## 核心创新点

### 问题背景
- **GLM 理论**: Andrews & McIntyre 的广义拉格朗日平均理论
- 研究波动与流动相互作用的强大框架
- **缺点**: 即使对于不可压缩流体，拉格朗日平均速度也是发散的
- 原因：平均流映射不保持体积，导致涡旋在拉格朗日平均下收缩

### 解决方案
**体积保持的极坐标分解**:
1. 重新定义平均流映射
2. 选择与"裸"GLM 平均映射最接近的体积保持映射
3. 最优传输理论标准结果：该新平均映射是 GLM 平均映射的极坐标分解中的体积保持因子

### 数值实现
- 使用指数和 Butterworth 滤波器的在线拉格朗日平均计算算法
- 从模拟数据计算相应的拉格朗日平均场

### 验证案例
- 二维不可压缩流动
- 浅水模型
- 比较有无体积保持约束的拉格朗日平均场

## 评估
- ✅ 推荐：对于拉格朗日相干结构和涡旋动力学研究者有重要价值
