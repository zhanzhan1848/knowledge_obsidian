# Stages of turbulence generation and decay in a T-shaped mixer

**arXiv:** [2606.25780](https://arxiv.org/abs/2606.25780)
**Authors:** Marc Avila (University of Bremen, ZARM, MAPEX)
**Date:** 2026-06-24
**Categories:** DNS, Turbulence, T-mixer, Scalar Mixing, Navier-Stokes

---

## 核心创新点

1. **研究对象**: T型混合器的湍流 regime (Re ≤ 2000, Sc = 1)
2. **主要发现**:
   - **两个阶段**: 近 junction 处形成 jet-like 流动 + 下游的 decay region
   - **自相似性**: 近场具有转变性平面射流的自相似行为
   - **能量衰减**: 湍动能、耗散率、标量方差呈幂律衰减
   - **标量方差指数**: 与无界湍流衰减一致; 速度场指数与有界域湍流一致
3. **物理解释**: 混合过程从通道中心向侧壁发展，而湍流在 jet region 末端已充满整个通道截面

---

## 控制方程

**不可压缩Navier-Stokes + 标量输运**:

$$\frac{\partial \mathbf{u}}{\partial t} + \mathbf{u} \cdot \nabla \mathbf{u} = -\nabla p + \frac{1}{Re} \Delta \mathbf{u}, \quad \nabla \cdot \mathbf{u} = 0$$

$$\frac{\partial \theta}{\partial t} + \mathbf{u} \cdot \nabla \theta = \frac{1}{Re \cdot Sc} \Delta \theta$$

**参数**:
- $Re = Ud/\nu$ (U: 平均入口速度, d: 水力直径)
- $Sc = \nu/D = 1$
- 出口通道长宽比: 2:1

---

## 数值方法

- **离散化**: 有限差分法
- **求解器**: 直接数值模拟 (DNS)
- **网格**: Cartesian coordinates, 以水力直径 d 无量纲化
- **时间步长**: 由 CFL 条件确定
- **并行性**: MPI 并行 (推测)

---

## 边界条件

| 位置 | 条件 |
|------|------|
| 入口 | 完全发展层流速度剖面 (方形通道) |
| 出口 | 稳定化出流边界条件 (防止回流) |
| 壁面 | 无滑移 |
| 标量 | 左入口 $\theta=1$, 右入口 $\theta=0$, 出流 Neumann BC |

---

## 湍流演化阶段

### Stage 1: Jet-like Flow (近场)
- 形成近似自相似的平面射流结构
- 与转变性平面射流行为类似
- 湍流特征尺度从小尺度逐渐发展

### Stage 2: Decay Region (远场)
- 湍动能 $k \sim x^{-\alpha}$ 幂律衰减
- 标量方差衰减指数与无界湍流一致
- 混合过程: 从中心向侧壁推进

---

## 物理机制

1. **涡量注入**: 入口剪切层和 junction 处产生涡量
2. **Engulfment**: 高Re数下的卷吸模式
3. **时间周期性对称振荡**: 转变 regime 特征

---

## 与文献对比

- **Schikarski et al. (2019)**: 发现层流入口时 $Re \gtrsim 2000$ 湍流统计量趋于Re无关
- **Li et al. (2025)**: PIV/PLIF 实验, Sc > 1 时的标量方差标度率
- **本文**: Sc = 1, Re ≤ 2000 的 DNS, 揭示湍流产生和衰减机制

---

## 代码/数据

待查

---

## 标签

#DNS #turbulence #T-mixer #mixing #Navier-Stokes #scalar-transport #jet-flow #CFD