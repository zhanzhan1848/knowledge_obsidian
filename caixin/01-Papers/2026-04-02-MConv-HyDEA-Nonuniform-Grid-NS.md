# MConv-HyDEA: 非均匀网格上的深度学习 NS 加速

## 论文信息

- **ID**: [arXiv:2604.01800](https://arxiv.org/abs/2604.01800)
- **作者**: Heming Bai, Dong Zhang, Shengze Cai, Xin Bian
- **发表**: 2026-04-02
- **分类**: physics.flu-dyn

---

## 核心问题

压力 Poisson 方程 (PPE) 是分数步法求解不可压 NS 的**主要计算瓶颈**。

原有 HyDEA 方法仅适用于均匀 Cartesian 网格，无法处理复杂边界的局部加密需求。

---

## 解决方案：Mesh-Conv (MConv) 算子

### 核心思想

将网格间距信息显式融入卷积操作：

1. **多级距离向量图构建**: 计算必要网格间距信息
2. **U-Net 改造**: 用 MConv 替代部分标准卷积
3. **浸入边界投影法**: 扩展到固体边界流动模拟

### 训练策略

- **仅使用构造线性系统训练**（非流动相关数据集）
- 训练后模型可泛化到**不同浸入障碍几何**
- 固定网络权重

---

## 控制方程

不可压 NS + 压力 Poisson:

$$
\nabla \cdot \mathbf{u} = 0
$$

$$
\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nu \nabla^2 \mathbf{u}
$$

---

## 性能对比

| 方法 | 非均匀网格收敛性能 |
|---|---|
| 纯 PCG | 慢 |
| 标准 HyDEA | 中等 |
| **MConv-HyDEA** | **显著更快** |

✅ 在强非均匀 Cartesian 网格上大幅超越 standalone PCG 和标准 HyDEA

---

## 应用场景

- 🔧 复杂边界附近流动
- 📐 局部网格加密需求
- 🏛️ 多障碍物几何
