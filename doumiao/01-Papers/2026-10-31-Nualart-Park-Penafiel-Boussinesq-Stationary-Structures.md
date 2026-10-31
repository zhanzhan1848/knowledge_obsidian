---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, stratified-flow, boussinesq, laminar-flow, stability, ocean-rendering, atmosphere]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.40334
---

# Stationary Structures of the Boussinesq equations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stationary Structures of the Boussinesq equations |
| **作者** | Marc Nualart, Jaemin Park, Javier Peñafiel-Tomás |
| **发表** | arXiv preprint (math.AP) 2026-10-29，63 页 / 3 图 |
| **链接** | [原文](https://arxiv.org/abs/2610.40334) |
| **DOI** | — |
| **代码** | — |

---

## 核心贡献

> **"稳定层结 + 层流速度场 ⟹ 必然是分层剪切流"** 的刚性定理；但与 Euler 方程形成鲜明对比——本文构造出**非定常、非剪切**的稳定层流解，说明密度单调性的**方向**是关键自由度。

1. **全局刚性定理**：周期通道中，稳定（层流）速度场配合**非递减密度层结**必然是**分层剪切流（stratified shear flow）**。
2. **方向性关键**：密度单调性沿等值线的**方向**是本质性的（fundamental）。
3. **与 Euler 方程的对比**：在 Euler 方程（$\rho\equiv 1$）下不存在此类非定常非剪切解；本文在 Boussinesq 情形**构造出层流、非定常、非剪切的稳定解**。
4. **灵活性/刚性分类**：依据稳定解的**停滞点（stagnation points）**给出邻近非剪切解的分类——层流持续（flexibility）或出现"岛"（islands，rigidity）。
5. 附带证明一个**一致的 Crandall–Rabinowitz 分岔定理**（可能具有独立价值）。

---

## 技术方案

### 核心思想

**层流（laminar）** 的定义是本篇的骨架——存在与水平变量无关的流函数 $\bar\psi\in C^1([-1,1])$ 与保向微分同胚 $X$，使得：

$$\boldsymbol{u}=\nabla^{\perp}\bigl(\bar\psi\circ X^{-1}\bigr)$$

**层结刚性**：若层流速度场配合非递减密度层结（$\rho|_{\Gamma_{\eta_1}}\le\rho|_{\Gamma_{\eta_2}}$），则解必须退化为分层剪切流 $\boldsymbol{u}(y)=(u(y),0)$、$\rho=\rho(y)$。

**Richardson 数非共振**：另一条刚性路径——当 Richardson 数不发生共振时，即使不要求层流结构，也强制解为分层剪切流。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Boussinesq 方程** | 经典不可压分层流模型：惯性情性项忽略密度变化，浮力保留 |
| **层流表示定理** | $\boldsymbol{u}\in C^{k-1}(\bar M)$，$|\boldsymbol{u}|>0$、$\boldsymbol{u}\cdot n=0$ 时存在 $C^k$ 层流表示 |
| **流线坐标变换** | $\Gamma_\eta:=X(\mathbb{T}\times\{\eta\})$，密度沿流线单调性分析 |
| **Richardson 数非共振** | 层结稳定性的经典判据，作为第二条刚性路径 |
| **Crandall–Rabinowitz 分岔** | 局部隐函数定理的跨空间版本，处理秩亏情形 |
| **停滞点分析** | 用停滞点位置区分 flexibility / rigidity（含"岛"的出现） |

### 关键公式

**Boussinesq 方程组**（周期通道 $M=\mathbb{T}\times(-1,1)$，$\mathfrak{g}=1$）：
$$\begin{cases}\boldsymbol{u}\cdot\nabla\boldsymbol{u}+\nabla p=-\mathfrak{g}\rho e_2,\\ \boldsymbol{u}\cdot\nabla\rho=0,\\ \nabla\cdot\boldsymbol{u}=0,\end{cases}\qquad e_2=(0,1)$$

**无滑移边界**：$\boldsymbol{u}\cdot n=0$ on $\partial M$

**分层剪切流解**：
$$\boldsymbol{u}(y)=(u(y),0),\qquad \rho=\rho(y)$$

**层流表示**：
$$\bar\psi\in C^1([-1,1]),\quad X:\mathcal{M}\to\mathcal{M},\quad X(\mathbb{T}\times\{1\})=\mathbb{T}\times\{1\},\quad X(\mathbb{T}\times\{-1\})=\mathbb{T}\times\{-1\}$$
$$\boldsymbol{u}=\nabla^{\perp}\bigl(\bar\psi\circ X^{-1}\bigr)$$

**流线**：$\Gamma_\eta:=X(\mathbb{T}\times\{\eta\})$，密度单调性条件 $\rho|_{\Gamma_{\eta_1}}\le\rho|_{\Gamma_{\eta_2}}$

**流形条件**：$(\boldsymbol{u},\rho)\in C^1(\bar{\mathcal{M}})$

---

## 实验结论

- **数据集**: 纯理论（解析定理与反例构造）
- **基线**: Euler 方程层流刚性定理（周界/环域情形）；Richardson 数理论；Crandall–Rabinowitz 分岔定理
- **结果**:
  - **刚性**：层流 + 非递减层结 ⟹ 分层剪切流
  - **刚性（另一路径）**：Richardson 数非共振 ⟹ 分层剪切流（无需层流假设）
  - **灵活性**：某些分层剪切流附近存在足够光滑的**非剪切**解
  - **反例**：Boussinesq 情形存在层流、非定常、非剪切稳定解（Euler 方程下不存在）
  - 停滞点位置决定邻近解是"层流持续"还是"出现岛"

---

## 局限性

- 二维、周期通道、无粘、$\mathfrak{g}=1$ 归一化
- 密度仅影响浮力（Boussinesq 近似），不含真实分层流体的非线性密度效应
- 无粘：无耗散时"稳定性"是结构性的而非动力学衰减
- 无三维、无边界层、无自由液面

---

## 相关工作

- [[2026-10-31-FASST-Stateless-Atmosphere-Long-Term-Ocean-Coupling]] — 无状态大气模型 + 长期海洋耦合（⭐ 强相关：本篇给出大气/海洋分层流的结构理论）
- [[2026-10-31-Native-Eddy-Resolving-Ocean-vs-Downscaling]] — 原生涡分辨海洋动力学
- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 物理感知流体视频生成
- [[2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — 能量保持半拉格朗日输运
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — 表面流体点涡

---

## 实现建议

- **实现难度**: 高（分析数学；但结论可作为**约束/先验**直接使用）
- **预期性能**: 定理本身零成本；作为渲染约束可零成本应用
- **适用场景**:
  - ✅ **分层流体渲染的物理约束**（大气透视、海洋层结、烟气分层）：稳定层结下速度必须分层剪切 → 渲染端**不应产生横跨等密度面的强水平输运**
  - ✅ **海洋/大气分层场景的"合理性检查"**：若渲染出的烟雾/云出现不符合层结的强混合，可判为物理违规
  - ✅ **Boussinesq 作为海洋/大气的低成本代理模型**：忽略密度变化对惯性的影响，保留浮力耦合 → 实时渲染中可行的近似
  - ✅ **停滞点分类 → 视觉特征**：非剪切解在停滞点附近出现"岛"结构 → 渲染云层/等密度面时，停滞区应表现为分离的团块而非连续混合
  - ⚠️ 不适用于自由液面（不含界面）、破碎、湍流细节

### 对渲染的转译建议

1. **层结约束作为硬规则**：环境雾/烟气渲染中，若某区域层结稳定（$\partial N/\partial z > 0$），则该区域的速度场应近似满足 $\boldsymbol{u}=\boldsymbol{u}(z)$，$\rho=\rho(z)$。**这意味着烟羽不会出现对流泡状结构**，除非该区 Richardson 数发生共振。
2. **Richardson 数非共振 → 稳定带判据**：可把 $Ri=1$ 附近视为"混合活跃带"（垂直输运强），Ri 远离 1 处视为"层结锁定带"（垂直输运弱）。这是**烟柱/云层垂直混合强度**的分层调制器，成本仅一次标量计算。
3. **"岛"结构提示**：停滞点附近非剪切解出现分离的密度团块 → 渲染等密度面/等温面时，应在流场停滞区主动"断开"并保留独立团块，产生真实的分层断裂感。
4. **Boussinesq 降阶**：海洋/大气的实时渲染若需考虑层结浮力，用 Boussinesq（单层 + 密度作为被动标量）是性价比最高的近似。
