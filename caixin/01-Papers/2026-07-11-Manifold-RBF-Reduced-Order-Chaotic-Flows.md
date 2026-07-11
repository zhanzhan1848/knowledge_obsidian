# 2607.08571 - Manifold-Adapted Radial Basis Functions for Reduced-Order Modelling of Chaotic Flows

## 论文信息
- **arXiv**: [2607.08571](https://arxiv.org/abs/2607.08571)
- **作者**: Miguel Pérez Cuadrado, Giorgio Maria Cavallazzi, Alfredo Pinelli
- **提交日期**: 2026-07-09
- **字数**: 31 pages, 26 figures
- **学科**: Fluid Dynamics (physics.flu-dyn); Chaotic Dynamics (nlin.CD)

## 关键词
- Reduced-order modeling (ROM)
- Radial basis functions (RBF)
- Chaotic flows
- Manifold learning
- Invariant measure
- Clustering
- Lorenz-63, Lorenz-96
- Kuramoto-Sivashinsky equation
- Kolmogorov flow

## 研究背景
混沌系统的相轨迹演化在低维吸引子上，但其几何形状在不同区域之间变化。传统降阶模型难以捕捉这种局部几何变化。

## 核心创新点
1. **流形自适应RBF库**: 通过聚类读取局部几何形状，自适应塑造径向基函数库
2. **全局正则化最小二乘**: 对约化速度到RBF库的拟合进行一次全局正则化最小二乘求解
3. **显式可微向量场**: 无需使用控制方程即可重现长期统计特性（即不变测度）
4. **运动学校正器**: 解决RBF场从数据衰减后无法自行返回逃逸态的问题
5. **校正幅度报告**: 作为度量指标，衡量结果在多大程度上依赖于学习到的场而非校正器

## 验证案例

### 1. Lorenz-63
- 恢复了吸引子、边缘密度、正负Lyapunov指数
- 低估了强横向收缩

### 2. Lorenz-96
- 有效预测时间与调优的神经网络和储层计算预测器相当
- 在完整状态和约化可观测量上重现不变测度

### 3. Kuramoto-Sivashinsky方程 & 准周期Kolmogorov流
- 匹配能量分布和频谱
- 优于同维度的全局Galerkin投影
- 优于侵入式量化局部Galerkin模型

## 方法论亮点
- **非侵入式**: 不需要投影控制方程
- **聚类+局部RBF**: 自适应流形几何
- **正则化**: 防止过拟合
- **Lyapunov指数恢复**: 长期动力学预测能力验证

## URL
- Abstract: https://arxiv.org/abs/2607.08571
- PDF: https://arxiv.org/pdf/2607.08571
