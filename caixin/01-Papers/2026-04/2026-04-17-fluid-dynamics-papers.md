# 流体力学论文笔记 - 2026年4月17日

## 1. Arithmetic turbulence: Algebraic derivation of the Euler ensemble attractor

**arXiv**: [2604.12207](https://arxiv.org/abs/2604.12207)
**作者**: Alexander Migdal
**领域**: physics.flu-dyn, hep-th, math-ph, nlin.CD
**发表**: 2026-04-14

### 核心创新点
- 将 Navier-Stokes 方程重新表述为拉格朗日框架中的协变导数算子流
- 通过费曼操作微积分解析消除对流项
- 3D非交换算子代数映射到1D动量环上的阶跃间断（有限差分跳跃）
- 证明宏观流体混沌是Farey序列的确定性投影

### 控制方程
- Euler ensemble attractor
- Navier-Stokes → covariant derivative operator flow

### 数值方法
- **离散化**: 连续代数形式化，无需空间格点近似
- **几何量子化**: 通过单位根实现

### 关键词
`湍流` `Euler ensemble` `Farey sequence` `代数推导`

---

## 2. Schrödinger-Navier-Stokes Equation for the Quantum Simulation of Navier-Stokes Flows

**arXiv**: [2604.11113](https://arxiv.org/abs/2604.11113)
**作者**: Luca Cappelli et al.
**领域**: quant-ph, physics.flu-dyn
**发表**: 2026-04-13

### 核心创新点
- 重访 Dietrich & Vautherin (1985) 的 Schrödinger-Navier-Stokes (SNS) 方法
- 评估基于 Carleman embedding/linearization 的量子实现可行性
- 阐明 SNS 耗散项对量子计算机的挑战，提出基于 Hamilton-Jacobi (HJ) 公式的解决方案
- 开发基于 HJ 方程 Carleman embedding (CHJ) 的张量网络表示量子算法
- 首次基于 Navier-Stokes 方程（含压力、耗散、涡量）的量子类波形式提出量子算法

### 控制方程
- Schrödinger-Navier-Stokes (SNS) equation
- Hamilton-Jacobi fluid dynamics formulation
- Carleman embedding (CHJ)

### 数值方法
- **张量网络表示**: 显著节省内存
- **Kolmogorov-like flows**: 中等雷诺数验证

### 关键词
`量子计算` `Schrödinger-Navier-Stokes` `Carleman embedding` `量子模拟`

---

## 3. Schrödinger-Navier-Stokes equation for capillary fluids

**arXiv**: [2604.11747](https://arxiv.org/abs/2604.11747)
**作者**: Adriano Tiribocchi, Luca Salasnich
**领域**: physics.flu-dyn, cond-mat.quant-gas, cond-mat.soft
**发表**: 2026-04-13

### 核心创新点
- 证明 SNS 方程与 Navier-Stokes-Korteweg 方程形式等价
- 在作用量泛函层面分解为 Korteweg 保守分量和 Rayleigh 耗散分量
- 推导声模式色散关系：色散参数控制毛细刚度，耗散参数控制粘性阻尼
- 在量子极限下恢复 Bogoliubov 色散关系
- 推导受限毛细管中一维有效 SNS 方程
- SNS 可用于流动物质复杂态的量子模拟

### 控制方程
- Schrödinger-Navier-Stokes (SNS)
- Navier-Stokes-Korteweg equations
- Bogoliubov dispersion relation

### 应用场景
`微流体` `软物质` `毛细管流体`

### 关键词
`毛细作用` `量子类比` `色散关系` `Korteweg效应`

---

## 4. Fractional Navier-Stokes Equations with Caputo Derivative Driven by Hermite Noise

**arXiv**: [2604.10602](https://arxiv.org/abs/2604.10602)
**作者**: Atef Lechiheb
**领域**: math.PR
**MSC**: 60H15, 35R60, 76D06, 26A33
**发表**: 2026-04-12

### 核心创新点
- 研究 $\mathbb{R}^2$ 有界域上的时间分数阶随机 Navier-Stokes 方程
- 由 Hermite 过程 $Z_H^k$（阶数 $k \geq 1$，Hurst 参数 $H \in (1/2, 1)$）驱动
- 推广分数布朗运动 ($k=1$) 和 Rosenblatt 过程 ($k=2$)
- 构建关于 $Z_H^k$ 的 Wiener 积分，建立 $L^p$ 估计（超压缩性）
- 证明随机卷积属于 $\dot{H}^\nu$（条件 $\alpha(1-\nu) + 2H > 2$）
- 固定点论证证明温和解的存在性、唯一性和 Hölder 正则性
- 证明解与离散逼近的非中心极限定理

### 控制方程
- 时间分数阶 Navier-Stokes 方程（Caputo 导数）
- Hermite 过程噪声 $Z_H^k$

### 数值方法
- **Mittag-Leffler 算子的精细 Hilbert-Schmidt 估计**
- **超压缩性技术**

### 关键词
`分数阶微积分` `随机偏微分方程` `Caputo导数` `Hermite噪声`

---

## 5. Accelerating Microswimmer Simulations via a Heterogeneous Pipelined Parallel-in-Time Framework

**arXiv**: [2604.12083](https://arxiv.org/abs/2604.12083)
**作者**: Ruixiang Huang
**领域**: cs.DC
**发表**: 2026-04-13

### 核心创新点
- 针对粘性流体中丝状微游生物的长时模拟提出异构 CPU-GPU 计算框架
- **两层并行化策略**:
  1. GPU 内核解决 Method of Regularized Stokeslets (MRS) 的二次空间相互作用
  2. 分布式 MPI-GPU 流水线 Parareal 架构利用时间并发
- 异步流水线有效重叠粗细传播器，克服传统 Parareal 方法的串行瓶颈
- GPU 优化数值程序计算矩阵平方根

### 控制方程
- Method of Regularized Stokeslets (MRS)

### 数值方法
- **Parareal (时间并行)**
- **MPI-GPU 异构流水线**
- **矩阵平方根 GPU 优化**

### 计算成本
- **加速比**: 比纯 CPU 方法快一个数量级

### 关键词
`微游生物` `Parareal` `Stokeslets` `GPU并行` `时间并行`

---

## 6. Patchy Polymeric Scalar Turbulence

**arXiv**: [2604.11034](https://arxiv.org/abs/2604.11034)
**作者**: Rahul Kumar Singh
**领域**: physics.flu-dyn
**发表**: 2026-04-13

### 核心创新点
- 研究聚合物湍流中的被动标量混合（Schmidt 数 Sc 不同）
- **关键发现**:
  - 聚合物湍流混合效率低于牛顿湍流（小-中等 Sc）
  - 牛顿标量湍流形成大岛状波动区和延伸的连续前缘
  - 聚合物标量湍流呈小而交错的强波动斑块
  - 聚合物湍流斑块边界更平滑、空间填充性更强
  - 聚合物湍流中标量变化更慢、自相似增长更慢、间歇性更低
- 稳态下：波动通常更强但平均标量通量更小

### 物理机制
- 聚合物添加降低混合效率
- 标量通量减少但波动强度增加

### 关键词
`聚合物湍流` `被动标量` `混合效率` `间歇性`

---

## 搜索摘要

| 类别 | 论文数 |
|------|--------|
| 湍流/混沌 | 2 |
| 量子计算/模拟 | 2 |
| 分数阶随机PDE | 1 |
| 微观流体力学 | 1 |
| 聚合物湍流 | 1 |

**关键词命中**: turbulence (×3), navier-stokes (×3), vortex/micro-swimmer (×1)
