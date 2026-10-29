---
type: concept
created: 2026-10-29
updated: 2026-10-29
tags: [concept, 结构保持, 熵稳定, 数值方法, 有限元, 能量守恒]
domain: fluid-dynamics
agent: caixin
related: [[2026-10-29-arXiv-2610.35157_Structure-Preserving-Thermal-Maxwell-Stefan]], [[Entropy Stability]], [[Saddle-Point Problem]]
---

# 结构保持离散化（Structure-Preserving Discretization）

## 定义

结构保持离散化是指**在离散层面精确复现连续模型的结构性性质**，而非仅逼近其解。结构性性质包括：

| 性质 | 含义 |
|---|---|
| 守恒律 | 质量、动量、总能量等精确守恒 |
| 耗散不等式 | 熵产生 $\geq 0$（离散熵不等式）|
| 约束 | 不可压性等代数/微分约束逐点满足 |
| 对称性 | 如交换性、反变性（动量方程的对称守恒形式）|

## 核心原理

### 用「变分形式 + 恰当测试函数」把结构编码进离散方程

结构保持的关键不是选择特殊的数值格式，而是：

1. 把控制方程改写为**变分形式**（弱形式），其中结构性性质通过**特定的测试函数选取**显现
2. 在离散时，**这些测试函数仍然是有效的测试函数**
3. 于是守恒律与耗散不等式在求和（离散积分）后**自动恢复**

典型例子（Navier-Stokes 的能量守恒）：用 $\bm{v}=\bm{u}$ 测试动量方程、用 $\omega=\vartheta$ 测试熵方程、用 $\psi_i=\mu_i-V_ip$ 测试质量方程，恰当项相互抵消，得到 $\frac{d}{dt}\int(\frac12\|\bm{u}\|^2+\varrho e)=0$。

### 三种常用手段

| 手段 | 做法 | 例子 |
|---|---|---|
| **对称守恒形式** | 把 $\operatorname{div}(\varrho\bm{u}\otimes\bm{u})$ 写成对称形式 | $\mathcal{B}(\varrho\bm{u};\bm{v},\bm{w})=\frac12\langle(\varrho\bm{u}\cdot\nabla)\bm{v},\bm{w}\rangle-\frac12\langle(\varrho\bm{u}\cdot\nabla)\bm{w},\bm{v}\rangle$（反对称）|
| **辅助变量法** | 引入辅助变量作为测试函数的**离散投影** | 连续 Petrov-Galerkin（CPG）|
| **熵变量 / 耗散分裂** | 用熵形式做变分基础 | Maxwell-Stefan 系统的熵平衡 |

### 关键：CPG 的机制

连续 Petrov-Galerkin 方法中，连续未知量（如 $\bm{m},\bm{r}$）在时间上是连续多项式，其**时间导数落在允许间断的多项式空间中**——因此导数本身可以作为测试函数，使结构保持得证。这比半隐式格式更"严格"，代价是求解系统更大。

## 实践要点

1. **先问：连续模型本身有哪个结构？** 然后找出让它显现的变分形式
2. **半隐式格式 vs CPG**：半隐式通常保证熵产生但**耗散能量**；CPG 可同时守恒能量——取决于时间离散格式
3. **测试函数映射表**：证明时必须逐一验证每个守恒律对应的测试函数在离散层面仍然有效
4. **风险点**：若为消除一个数值困难（如移除某个主导项）而修改方程，**结构保持性可能失效**——参见 [[2026-10-29-arXiv-2610.35157_Structure-Preserving-Thermal-Maxwell-Stefan]] 中 Lagrange 数 $\mathrm{La}\sim10^{15}$ 的陷阱

## 与稳定性的区别

- **稳定性**（stability）：解不会爆炸，CFL / 能量有界
- **一致性 + 稳定性 → 收敛性**：离散解趋于连续解
- **结构保持**：离散解**继承**连续解的定性结构

结构保持通常**蕴含**一定意义上的稳定性（因为它给出能量/熵的先验界），但反之不成立。

## 相关

- [[2026-10-29-arXiv-2610.35157_Structure-Preserving-Thermal-Maxwell-Stefan]] — 熵平衡 + 半隐式 Euler vs 连续 Petrov-Galerkin
- [[2026-10-29-arXiv-2610.36641_Tangent-Fluid-Saddle-Point-Reformulation]] — 通过重构绕开鞍点而非稳定化
- [[Entropy Stability]] / [[Conservative Discretization]]
