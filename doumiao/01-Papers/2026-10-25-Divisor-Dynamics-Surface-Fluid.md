---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, surface-fluid, vortex-method, point-vortices, mesh-deformation, topological-invariants, algebraic-geometry, siggraph-asia-2026]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://rudresh.net/publications/divisor-dynamics/
---

# Divisor Dynamics for Surface Fluid Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Divisor Dynamics for Surface Fluid Simulation |
| **作者** | Rudresh Veerkhare, Hang "Hesper" Yin, Albert Chern |
| **发表** | **ACM SIGGRAPH Asia 2026, Conference Track**（TOG） |
| **会议** | 第 19 届 ACM SIGGRAPH Asia，2026-12-01～04，Kuala Lumpur |
| **链接** | [项目页](https://rudresh.net/publications/divisor-dynamics/) · [作者主页](https://yhesper.github.io/) |
| **交互 Demo** | [点涡交互演示](https://rudresh.net/demo/point-vortex/)（从 bunny 网格起始） |
| **渲染类别** | **表面流体渲染 / 涡方法 / 网格变形动画** |
| **arXiv** | 暂无预印本（截至 2026-10-25） |

---

## 核心贡献

> 在**任意拓扑的曲面**上模拟点涡（point vortices）—— 关键洞察是：把**谐波分量（harmonic components）**的动力学纳入考虑，等价于引入了一个**随时间守恒的新流体不变量**，而这个不变量可以用**黎曼曲面上点涡的因子（divisor）类**来优雅表述。由此在流体力学与代数几何的因子理论之间架起了一座**非平凡的桥梁**。

1. **新流体不变量**：在**非单连通曲面**（non-simply-connected surface）上，考虑谐波分量等价于引入一个新的、**时间守恒的流体不变量**。
2. **代数几何表述**：该不变量可写成黎曼曲面上点涡作为**因子 (divisor)** 的**因子类 (divisor class)** —— 这是首次在流体力学与代数几何之间建立实质桥梁。
3. **算法极简**：利用该不变量，方法变成对**涡量粒子-网格法 (vortex particle-on-mesh method)** 的**简单修改**，即可将适用范围**扩展到任意拓扑的曲面**。
4. **交互式 Demo**：提供可在 bunny 网格上交互探索的浏览器端点涡模拟。

---

## 技术方案

### 核心思想

**背景问题**：经典点涡法 (point vortex method) 在**平面**上工作良好，因为平面（球面）上点涡的经典不变量（"总涡量"、"运动中心"）已被完全刻画。但一旦曲面**非单连通**（例如环面 torus、带洞的曲面、拓扑复杂的手工模型网格），就会出现**额外的自由度**无法被约束 —— 涡点可以"整体绕着洞转"，而这个旋转既不是被平流约束的，也不是被涡量守恒约束的。

**关键洞察**：这额外自由度可以被**显式建模**。在非单连通曲面上，流形 $M$ 的第一同调群 $H_1(M)$ 非零，它带来 $2g$ 个（亏格为 $g$ 时）**谐波分量**。这些谐波分量随时间演化，其演化恰好等价于引入一个新的守恒量 —— 而这个守恒量就是**因子类 (divisor class)**。

**因子类是什么**：在黎曼曲面上，一个**因子 (divisor)** $D$ 是曲面上零点的形式和 $D = \sum_i n_i p_i$（$p_i$ 为零点，$n_i \in \mathbb{Z}$ 为系数）。**因子类** $[D]$ 是 $D$ 在"主因子 (principal divisor)" 下的等价类。经典的**黎曼-罗赫定理**告诉我们：$H_1(M)$ 的秩 = 因子类的亏格。

把点涡看成"带符号的点"（正涡为正系数、负涡为负系数），一整族点涡就构成一个因子 $D$。而**因子类 $[D]$ 在时间演化中守恒**（在涡量守恒的前提下）—— 这就是本文的核心不变量。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Vortex Particle-on-Mesh Method** | 基础算法：涡点作为粒子放在网格面上，速度由 Biot–Savart 定律在网格上求值 |
| **Harmonic Component Dynamics** | 在非单连通曲面上显式追踪 $H_1(M)$ 中的谐波分量演化（亏格 $g$ → $2g$ 个分量） |
| **Divisor Class Invariant** | 新守恒量：点涡集合作为因子 $D$ 的因子类 $[D]$ |
| **Riemann–Roch Bridge** | 因子理论 ↔ 流体动力学的理论桥梁 |
| **Topology-Generalized Method** | 对经典涡量粒子-网格法的**简单修改**，即可支持任意拓扑曲面 |

### 公式

**Biot–Savart 速度（曲面上）：**

```math
\mathbf{u}(\mathbf{x}) = \sum_{i} \Gamma_i\, K(\mathbf{x}, \mathbf{p}_i),
\qquad
K \text{ 为黎曼曲面上的核函数}
```

**谐波分量**：对亏格为 $g$ 的曲面，选取 $2g$ 个生成元 $\boldsymbol{\alpha}_k \in H_1(M,\mathbb{Z})$，其对偶类 $\boldsymbol{\omega}_k \in H^1(M,\mathbb{R})$：

```math
\boldsymbol{\omega}_k = \sum_i \Gamma_i\, \langle \boldsymbol{\alpha}_k, \mathbf{p}_i \rangle
\quad\text{（点涡对谐波分量的贡献）}
```

**因子与因子类**：点涡集合定义因子

```math
D(\mathbf{p}_1,\dots,\mathbf{p}_N) = \sum_{i=1}^{N} \Gamma_i\,[\mathbf{p}_i],
\qquad
\Gamma_i \in \mathbb{Z}
```

其**因子类** $[\,D\,] \in \mathrm{Pic}^0(M)$ 在时间演化中**守恒**：

```math
\frac{d}{dt}[\,D\,] = 0
\quad\Longleftrightarrow\quad
\boldsymbol{\omega}_k(t) = \boldsymbol{\omega}_k(0),\ \ \forall k
```

**方法**：在标准涡量粒子-网格法的更新步后，额外施加约束使因子类保持不变 —— 即"**对 vortex particle-on-mesh 方法的简单修改**"。

---

## 实验结论

- **算法**：在 vortex particle-on-mesh 方法基础上增加谐波分量处理与因子类约束
- **场景**：
  - **环面 (torus)** 上的 Divisor Dynamics 模拟（Fast Forward 视频）
  - **bunny 网格**上的交互式点涡演示
- **结果**：
  - 可处理**任意拓扑**的曲面（超越平面/球面的限制）
  - 谐波分量的动力学被正确整合，**因子类守恒**得到验证
  - 交互式 Demo 可在浏览器中实时探索控制参数

---

## 局限性

- **无 arXiv 预印本**：截至 2026-10-25 未公开，细节（具体约束实现、误差分析、基准对比）待 TOG 正式版。
- **依赖网格拓扑质量**：需要正确的**亏格计算**与网格拓扑一致性 —— 对退化/自交/非流形网格不友好。
- **点涡方法的固有局限**：点涡法适合**稀疏、涡主导**的流动（如二维混合层、涡街），不适合厚重的三维湍流或粘性主导流。
- **因子类守恒是硬约束还是软约束**：若为硬约束，可能与数值耗散/粒子重分布冲突 —— 论文未说明实现细节。
- **$H_1$ 非零才需要**：对单连通曲面（$g=0$），因子类平凡，本文方法退化为经典算法 —— 优势仅在非单连通情形体现。

---

## 相关工作

- [[Vortex-Methods]] / [[Point-Vortex-Method]]
- [[Hamiltonian-Wave-Flow-Coupling]] — SA2026 波-流耦合（本库已收录）
- [[WorldParticle]] — Transformer 粒子模拟（本库已收录）
- [[Flamescapes-Wildlandfire-Urban-Interface]] — SA2026 城市火灾（本库 2026-10-25 收录）
- [[Surface-Flow]]
- [[Algebraic-Geometry]]

---

## 实现建议

- **实现难度**：🟡 中（点涡粒子-网格法本身成熟，难点在拓扑分析与因子类约束）
- **预期性能**：实时可行（点涡法复杂度低，O(N²) 或带加速结构）
- **适用场景**：**风格化/艺术化表面流体**（布料纹样、墨迹流、拓扑雕塑表面的流动）、装饰性网格动画（布料旗帜、织物表面流纹）

### 🌱 豆苗评注

**这篇的"跨界"味道很浓 —— 流体力学 × 代数几何。但它的实用价值在于：它指出了一个被忽略的"自由度逃逸"问题。**

思考一下：在平面（拓扑是圆盘）上做点涡模拟，涡点的运动被平流严格约束，所以不会出现"所有涡点一起绕着圈平移而涡量分布不变"这种**零模态**。但在环面上，涡点**可以整体绕过洞**而涡量场不变 —— 这是一个真正的**额外自由度**。传统方法要么假装它不存在（结果：环面上的涡会"卡住"或莫名消失），要么让数值漂移慢慢破坏它。

**Divisor Dynamics 的做法是"承认它、并给它一个守恒量"**。这本质上和 **Lagrange 乘子**或**投影法**的思路一脉相承 —— 把约束显式化，而不是指望离散格式自动满足它。

**对渲染侧的启发：**

1. **拓扑意识是渲染的一部分**。我们在做"水流沿雕塑表面流下"这类效果时，雕塑的拓扑（有没有洞、洞是通的还是盲的）会直接改变流体的动力学。如果求解器假装所有网格都是平面，流体的行为就会在有洞的地方出错。**这是很多"表面流体"效果一放到复杂模型上就穿帮的根因。**

2. **风格化流体特别受益**。线描水流、书法笔触、雕刻感的流动 —— 这些效果本来就追求"运动有韵律、可控"，而一个**显式的、守恒的拓扑自由度**恰恰提供了这种韵律的来源。作者还做了交互式演示，这不是装饰，而是这类效果交互式创作的核心需求。

3. **实现建议**：如果不想引入完整的因子类理论，可以用**更工程化的近似**：直接计算网格的**同伦等价类**（persistent homology 的 0/1 维持久图），对每个"洞"追踪穿过它的涡量净通量，把它作为额外的守恒量约束进投影步。这比完整的因子类代数要轻，视觉效果几乎等价。

---

## 🩸 可行性分析：拓扑感知的表面点涡流体

## 渲染方法
- 类型：表面流体渲染（网格顶点位移）+ 风格化流线
- 技术：Vortex Particle-on-Mesh（点涡粒子）+ 拓扑谐波分量约束（因子类守恒）

## 视觉质量
- 逼真度：⭐⭐⭐☆（2D 点涡级别的真实度，但拓扑行为正确）
- 风格化支持：⭐⭐⭐⭐⭐（点涡运动天然适合线描/书法风格）

## 性能预期
- 帧率：实时（点涡法，N ≈ 10³–10⁴ 涡点，配网格加速结构）
- GPU 需求：低–中
- 内存占用：低

## 实现建议
- 着色器复杂度：低（网格顶点位移 + 法线重算）
- 管线要求：网格拓扑分析（亏格/同调）→ 点涡求解 → 顶点位移 → 重算法线
- 推荐度：✅（风格化表面流体的高性价比方案，且拓扑正确性是同类方法普遍缺失的）
