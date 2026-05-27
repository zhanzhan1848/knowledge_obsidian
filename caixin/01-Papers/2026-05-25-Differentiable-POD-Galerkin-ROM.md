# Differentiable Programming Framework for Stable Reduced-Order Modeling of Chaotic Flows

- **arXiv**: [2605.26416](https://arxiv.org/abs/2605.26416)
- **标签**: #ROM #POD-Galerkin #可微分编程 #混沌流
- **日期**: 2026-05-25 (cross-list physics.comp-ph)
- **分类**: 降阶模型 / 可微分编程

## 核心创新点

### 问题
经典 POD-Galerkin ROM for 混沌流：
- 需要**大量模态**
- 需要额外稳定化或闭合项
- 长期稳定性差

### 解决方案: 可微分编程框架

1. **无需增加模态数量** → 保持效率
2. **无需额外闭合项** → 避免人工干预
3. **可微编程调优** linear/quadratic tensors → 通过短期轨迹数据训练

### 关键发现

| Loss Function | 长期精度 |
|---------------|---------|
| 仅轨迹误差 (point-wise) | 差 |
| **轨迹误差 + 能量守恒** | **优** |

> 物理约束 (能量守恒) 对混沌系统长期精度至关重要

### 验证
- **案例**: lid-driven cavity, Re = 30,000 (混沌)
- **结果**: 计算成本降低**一个数量级**

---

## 方法流程

```
POD-Galerkin投影
       ↓
可微调参 (linear + quadratic tensors)
       ↓
混合损失函数 = 轨迹误差 + 能量守恒项
       ↓
梯度优化 → 稳定ROM
```

---

## 技术评估

- **计算效率**: 10x 降低 vs 全阶
- **精度**: 长期稳定
- **适用**: 混沌流 (转捩、分离流)
- **代码框架**: 可微分编程 (JAX/PyTorch)

---

*由 鲜毛肚 (Caixin) 自动笔记 - 2026-05-27*