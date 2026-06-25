# A Neural Surrogate Approach for Simulating Natural Convection Problems

**arXiv:** [2606.25259](https://arxiv.org/abs/2606.25259)
**Authors:** Nurshat Menglik, Alex Shao, David Hyde (Vanderbilt University)
**Date:** 2026-06-24
**Journal:** Journal of Computational Physics
**Categories:** Neural Network, Fourier Neural Operator, Boussinesq Approximation, FEM, Natural Convection

---

## 核心创新点

1. **问题**: Boussinesq近似对大温差不准确，需要可压缩流模型但计算代价高
2. **方法**: **Fourier Neural Operator (FNO)** 作为代理模型，利用成对数据进行训练
   - 低精度 Boussinesq 模拟 → 高精度可压缩流模拟
3. **实现**: 基于 **FEniCSx** 的隐式单调混合有限元方法
4. **结果**: SSIM 接近 1, MSE 降低 1-3 个数量级，单次模型评估即可完成模拟加速

---

## 控制方程

### Boussinesq 近似 (低成本但精度有限):

$$\frac{\partial \mathbf{u}}{\partial t} + \mathbf{u} \cdot \nabla \mathbf{u} = -\nabla p + \frac{1}{Re} \Delta \mathbf{u} + Ra \cdot \theta \cdot \mathbf{e}_z$$

$$\nabla \cdot \mathbf{u} = 0$$

$$\frac{\partial \theta}{\partial t} + \mathbf{u} \cdot \nabla \theta = \frac{1}{Re \cdot Pr} \Delta \theta$$

### 可压缩流 (高精度但计算代价高):

完整可压缩 NS 方程 + 能量方程
- 低Mach数 regime 下存在刚性问题

---

## 数值方法

- **空间离散**: 混合有限元法 (FEM), FEniCSx框架
- **时间离散**: 隐式方法
- **求解器**: 单调非线性求解器 + 线性求解器 (直接/迭代)
- **验证**: 与 COMSOL 对比, 标准测试问题

---

## 神经网络架构

### Fourier Neural Operator (FNO)
- **输入**: Boussinesq 模拟结果
- **输出**: 修正后的场 (接近可压缩流精度)
- **核心**: 在频域进行积分操作，捕捉多尺度物理

### 训练数据生成
- **2D**: 随机 Fourier 级数 (随机温度边界条件)
- **3D**: 平滑 Voronoi 随机场
- **成对数据**: Boussinesq (低精度) ↔ 可压缩流 (高精度)

---

## 关键结果

| 指标 | 改进 |
|------|------|
| SSIM | 接近 1.0 (所有流动变量) |
| MSE | 降低 1-3 数量级 |
| 推理速度 | 单次模型评估 = 单步模拟 |

---

## 应用场景

- 电子设备散热 (natural convection cooling)
- 大气动力学
- 核反应堆冷却
- 太阳能系统

---

## 代码/数据

- **开源**: 所有代码和数据发布
- **框架**: FEniCSx
- **地址**: 待查

---

## 标签

#neural-network #FNO #Boussinesq #natural-convection #FEM #FEniCSx #surrogate-model #low-Mach #CFD