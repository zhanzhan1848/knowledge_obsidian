# High-Order Stabilized Matrix-Free Simulation of Rotating Mixing Devices using the Mortar Element Method

- **arXiv**: [2608.27423](https://arxiv.org/abs/2608.27423)
- **Published**: 2026-08-27
- **Categories**: physics.flu-dyn, math.NA
- **Authors**: B. Campos, P. Munch, V. O. Ferreira, D. C. Boffito, X. Banquy, B. Blais

## 核心创新

**Mortar 元素法**（域分解策略）+ **Matrix-Free Navier-Stokes** 框架，用于模拟**旋转混合设备**。

## 数值方法

| 方面 | 实现 |
|------|------|
| 离散化 | 高阶连续 Galerkin（Continuous Galerkin） |
| 域分解 | Mortar 元素法 |
|ALE 方法 | Arbitrary Lagrangian-Eulerian（转子-定子相对运动） |
| 稳定化 | SUPG + PSPPG |
| 接口处理 | Discontinuous Galerkin 风格弱连续 |
| 硬件 | Matrix-free（利用现代硬件） |

## 方程：Navier-Stokes + ALE

$$ \rho \left( \frac{\partial \mathbf{u}}{\partial t} + [(\mathbf{u} - \mathbf{u}_{mesh}) \cdot \nabla]\mathbf{u} \right) = -\nabla p + \mu \nabla^2 \mathbf{u} + \mathbf{f} $$

## 验证案例

### 2D 收敛阶
- 稳态和瞬态算例均达**最优收敛阶**

### 3D 可扩展性
- **理想强 scaling**（大规模问题）

### Rushton 叶轮（2D）
- 力矩分析：与现有数值结果一致

### Pitched Blade Turbine（3D）
- 功率数曲线 ($N_p$ vs $Re$)：与实验数据良好吻合
- Re = 1~2000 范围内

### 能量平衡
- Re=200：数值耗散 **1%**
- Re=2000：数值耗散 **10%**

## 创新点

1. **几何非协调**：mortar 接口旋转产生的几何非协调不引入显著误差
2. **转子-定子耦合**：弱连续确保交接面连续性
3. **Matrix-free**：利用现代硬件，减少内存开销

## 评估

✅ **推荐实现** — 旋转几何 CFD 的稳健框架，matrix-free 方法在工业混合设备仿真中有前景。

## 相关链接
- PDF: https://arxiv.org/pdf/2608.27423v1

---
*分类: #CFD #旋转流动 #Mortar元方法 #ALE #矩阵自由 #混合设备 #Navier-Stokes*
