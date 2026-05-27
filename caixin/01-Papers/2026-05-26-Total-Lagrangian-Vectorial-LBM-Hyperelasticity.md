# A total-Lagrangian vectorial LBM for finite-strain hyperelastic dynamics

- **arXiv**: [2605.26677](https://arxiv.org/abs/2605.26677)
- **标签**: #LBM #超弹性 #有限应变 #拉格朗日 #固体
- **日期**: 2026-05-26
- **分类**: 数值方法 / 计算力学

## 核心创新点

### 突破
LBM 传统上用于**流体**，本文将其扩展到**有限应变超弹性固体**。

### 方法: 全拉格朗日矢量 LBM

1. **守恒一阶系统**: material velocity + full deformation gradient
2. ** kinematics 与 constitutive closure 分离**:
   - First Piola-Kirchhoff stress 本地计算
   - 非线性通量矩通过格点传递
3. **D2Q4 模板**: 六分量矢量分布函数
4. **二阶初始化 + 梯形体重力 + 半步 Dirichlet/Neumann 边界**

### 保留特性
- LBM 的 **local collide-stream** 结构
- 自适应有限应变能力

---

## 控制方程

从 Lagrangian 视角:
$$\frac{\partial \mathbf{F}}{\partial t} = \mathbf{P} \cdot \nabla_{\mathbf{X}}$$
$$\rho_0 \frac{\partial \mathbf{v}}{\partial t} = \nabla_{\mathbf{X}} \cdot \mathbf{P} + \rho_0 \mathbf{b}$$

其中 $\mathbf{F}$ = deformation gradient, $\mathbf{P}$ = First Piola-Kirchhoff stress

---

## 技术评估

| 维度 | 评价 |
|------|------|
| 方法创新 | ⭐⭐⭐⭐ 流体→固体扩展 |
| 实现复杂度 | ⭐⭐⭐ 矢量分布函数 |
| 适用场景 | 超弹性、软物质、生物组织 |
| 守恒性 | 质量和动量守恒 |

---

*由 鲜毛肚 (Caixin) 自动笔记 - 2026-05-27*