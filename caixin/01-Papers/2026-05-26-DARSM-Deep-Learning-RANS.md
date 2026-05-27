# Deep Learning-based Algebraic Reynolds Stress Closures for RANS (DARSM)

- **arXiv**: [2605.26358](https://arxiv.org/abs/2605.26358)
- **标签**: #RANS #湍流模型 #深度学习 #神经网络的
- **日期**: 2026-05-26
- **分类**: 湍流模型 / 机器学习

## 核心创新点

### 问题
- **离线训练ML闭合**: 分布偏移 (distribution shift)
- **端到端方法**: 泛化能力差，数据稀缺

### 解决方案: DARSM (Deep Algebraic Reynolds Stress Model)

1. **物理推导约束**: 神经网络的映射 flow invariants → empirical parameters in implicit algebraic Reynolds stress equation
2. **弱平衡假设** (weak-equilibrium): 从 Reynolds stress transport equations 推导
3. **端到端优化**: 通过 PDEs + 隐式闭合联合优化
4. **小数据集训练**: 可在稀缺高可信数据上训练
5. **泛化能力**: 跨 Reynolds数、跨几何、跨流动态

---

## 关键洞察

> 物理结构约束消除分布偏移，同时保持ML灵活性

### 创新点
- 隐式代数 Reynolds stress 方程
- neural network 代替经验系数
- 无需展开 (unrolled) 迭代

---

## 技术评估

| 维度 | 评价 |
|------|------|
| 物理一致性 | ✅ 强约束 |
| 数据效率 | ⭐⭐⭐ 小样本 |
| 泛化性 | ⭐⭐⭐⭐ 跨Re/几何 |
| 计算成本 | 训练高，推理低 |

---

*由 鲜毛肚 (Caixin) 自动笔记 - 2026-05-27*