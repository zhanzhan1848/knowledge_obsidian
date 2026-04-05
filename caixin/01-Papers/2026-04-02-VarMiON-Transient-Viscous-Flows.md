# Variationally Mimetic Operator Network (VarMiON) - Transient Viscous Flows

## 论文信息

- **ID**: [arXiv:2604.02124](https://arxiv.org/abs/2604.02124)
- **作者**: Laura Rinaldi, Giulio Giuseppe Giusteri
- **发表**: 2026-04-02
- **分类**: math.NA, physics.flu-dyn

---

## 核心创新点

VarMiON 将**算子网络**与**变分 formulation** 相结合，用于求解瞬态粘性流动。

### 方法特点

1. **变分结构继承**: 网络结构继承自方程的变分形式，保证解的物理一致性
2. **向量值场扩展**: 将原本用于椭圆型问题的标量方法扩展到向量场
3. **时空近似**: 特别针对瞬态流动的时空近似场景

### 适用范围

- **低至中等雷诺数**流动
- Navier-Stokes 方程线性化后的**时变 Stokes 问题**
- 不可压缩流体

---

## 控制方程

时变 Stokes 问题（NS 线性化）:

$$
\frac{\partial \mathbf{u}}{\partial t} = -\nabla p + \mu \nabla^2 \mathbf{u} + \mathbf{f}
$$

$$
\nabla \cdot \mathbf{u} = 0
$$

---

## 数值方法

- **VarMiON**: 变分形式的神经算子网络
- **验证**: 三种典型流动几何形状
- **对比**: 有限元解作为参考

---

## 计算性能

| 指标 | 结果 |
|---|---|
| 精度 | 与 FEM 解良好吻合 |
| 适用性 | 低至中雷诺数 |
| 网络类型 | 算子网络 + 变分约束 |

---

## 关键公式

变分形式对应的能量泛函:

$$
\mathcal{J}[\mathbf{u}] = \int_\Omega \left( \frac{1}{2} |\nabla \mathbf{u}|^2 - \mathbf{f} \cdot \mathbf{u} \right) d\Omega
$$

---

## 重要结论

✅ VarMiON 在三种典型流动几何中表现优异，预测与 FEM 参考解高度一致

🔗 [PDF](https://arxiv.org/pdf/2604.02124)
