---
tags: [几何, 网格, 图神经网络, 有限元]
type: 论文
created: 2026-06-16
source: arXiv cs.LG
venue: 预印本
---

# Mesh Graph Neural Network Framework for Accelerating Finite Element Simulation

## 核心方法

**问题**: 有限元分析(FEA)计算成本高，评估多个设计迭代或载荷场景时尤其昂贵。机器学习代理模型的关键限制：难以跨不同几何泛化。

**解决方案 - MGN (Mesh Graph Network)**:
- 预测2D结构构件的von Mises应力场（任意孔几何）
- **与传ML方法的区别**：
  - 不使用绝对节点坐标作为特征
  - 编码节点类型（固定边界、自由表面、孔边缘）
  - 相对边特征（邻居间距离）
  - 全局特征（施加载荷）
- 内在平移和旋转不变性 → 跨未见几何泛化

## 性能指标
- 训练: 11种板几何 × 20种载荷条件
- 测试: 7种未见几何 + 3种未见载荷
- **最优情况**: R² ≥ 0.97（未见几何+未见载荷）
- 对比基线: Random Forest, Gradient Boosting, KNN (R² ≈ 0.01-0.86)

## 创新点
1. 首个跨任意几何FEA代理模型
2. 图神经网络天然适配网格表示
3. 节点类型编码实现结构感知

## 开源参考
- 代码: https://github.com/Josiah-Kunz/MGN-Public

## 相关笔记
[[MeshWeaver]] - 网格生成 + GNN

## 可行性评估
✅ **推荐实现**

网格GNN架构对几何处理有通用参考价值。节点类型编码策略可用于网格分类、分割等任务。
