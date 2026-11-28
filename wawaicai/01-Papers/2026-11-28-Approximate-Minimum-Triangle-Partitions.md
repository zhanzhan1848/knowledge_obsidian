---
type: paper
created: 2026-11-28
updated: 2026-11-28
tags: [paper, 计算几何, 多边形剖分, 近似算法, Steiner点, 三角剖分, 理论计算机科学]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2611.31146
---

# Approximate Minimum Triangle Partitions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Approximate Minimum Triangle Partitions |
| **作者** | Guilherme D. da Fonseca（Aix-Marseille Université and LIS, France） |
| **发表** | arXiv cs.CG (v1, 2026-11-23)，19 页 |
| **链接** | [原文](https://arxiv.org/abs/2611.31146) |
| **DOI** | 10.48550/arXiv.2611.31146 |
| **代码** | 未公开 |
| **关键词** | Triangle partition, triangle cover, Steiner points, polygon decomposition, approximation algorithms |
| **ACM 分类** | Theory of computation → Computational geometry; Theory of computation → Approximation algorithms analysis |

---

## 核心贡献

> 简单多边形的**最小三角形剖分** $\rho(P)$（允许 Steiner 点）是否多项式时间可算**至今未知**。已知最好近似比是 **3**（三角剖分，$n-2$ 个三角形，$O(n)$ 时间）。本文**两步改进**：
> **① 证明 Steiner 点至多节省一半三角形**（$\rho_0(P) \le 2\rho(P) - 2$，且紧）→ 已有 $O(n^3)$ 的 $\rho_0$ 算法成为 **2-近似**；
> **② 突破 factor-2 壁垒** → 定义受限 Steiner 点类 $\Pi^\star$，给出 **5/3-近似**，$O(n^{12})$ 时间。

1. **定理 9（Steiner 点至多省一半）**：$\rho_0(P) \le 2\rho(P) - 1 - |S| - \lambda/2$，其中 $S$ 是最优剖分中的 Steiner 点集，$\lambda$ 是"无效射线"数。若 $P$ 不是三角形，则 $\rho_0(P) \le 2\rho(P) - 2$。**紧性由"风车（pinwheel）"多边形给出**。
2. **定理 19（5/3-近似）**：定义 $\Pi^\star$ —— 每个 Steiner 点位于两条"顶点对直线"上，且 $P$ 内部的每个 Steiner 点都通过**直线段**连到 $P$ 的某个顶点、该段被三角形边覆盖、其相对内部不含三角形角点。则 $\rho^\star(P) \le 5\rho(P) - 2/3$，且 $\rho^\star$ 可在 $O(n^{12})$ 时间算出。**这是首个优于 3 的近似比。**
3. **定理 11（带洞多边形）**：$h$ 个洞时 $\rho_0(P) \le 2\rho(P) + h - 1 \le \frac{5}{2}\rho(P)$，$O(n^{3+2h})$ 时间 —— **改进了三角剖分的 $3 + 6h/n$ 界**（$h$ 为常数时仍是多项式时间）。

---

## 技术方案

### 核心思想

**问题设定**：

| 记号 | 含义 | 已知复杂度 |
|------|------|------|
| $\rho(P)$ | $P$ 的最小三角形**剖分**（内互不相交），允许 Steiner 点 | 简单多边形：**复杂度未知**；带洞：NP-hard [Lingas] |
| $\rho_0(P)$ | **无 Steiner 点**的最小剖分 | $O(n^3)$ [Asano-Asano-Pinter 1986] |
| $\rho^\star(P)$ | 类 $\Pi^\star$ 内的最小剖分 | $O(n^{12})$（本文） |
| $\kappa(P)$ | **覆盖**（允许重叠）的最小三角形数 | **∃R-complete** [Abrahamsen FOCS'21]，APX-hard |

**关键洞察**：最优剖分相比三角剖分**只有一种节省方式** —— 把 $P$ 的顶点**吸收**到三角形边的相对内部（absorbed vertex）。但每个 Steiner 点都要**付费**。

**不做一般位置假设**：允许 $P$ 的顶点共线，此时三角形边可以穿过多个顶点，优质剖分会利用这一点。

### 关键技术

#### 1. 角和恒等式（Angle Identity，Lemma 2）—— 全文所有界的基石

```
|T| = n − 2 − μ + Σ_{p∈S} s_p
```

其中 $\mu$ 是被吸收顶点数，$s_p$ 是 Steiner 点 $p$ 的"代价"：

| Steiner 点类型 | $s_p$ | 说明 |
|------|------|------|
| **内点（full point）** | 2 | 周围三角形角度和为 $2\pi$ |
| **边界点（boundary point）** | 1 | 位于 $P$ 的边内部，或 T-junction（位于三角形边内部） |
| **携带线（carrying line）** | – | $s_p=1$ 时，半平面由一条"携带线"界定 |

**推论**：剖分相比三角剖分**净省** $\mu - \sum_p s_p$ 个三角形。**每个被吸收顶点省 1 个，每个 Steiner 点花 1 或 2 个。**

**Lemma 1**：$P$ 的每个顶点都是某个三角形的角点 ⇒ $n \le 3|T| - c(S)$，其中 $c(S) = \sum_{p\in S} c_p$ 是 Steiner 角点总数。

#### 2. 射线（Ray）结构

Steiner 点 $p$ 的一条**射线** = 有一条以 $p$ 为端点的边沿该方向离开。

| 类型 | 射线总数 | 非携带射线数 $\lvert R_p\rvert$ |
|------|------|------|
| 内点（full） | $c_p$ | $c_p - 2$ |
| 边界点 / T-junction | $c_p + 1$ | $c_p - 1$ |

**携带射线（carrying ray）**：$s_p = 1$ 时，两条极值三角形的边沿携带线终止于 $p$。

**生产性（productive）射线**：有一条"丢失的吸收"被归因于它。$\lambda$ = 无效射线总数。

#### 3. 弦构造（Chord Construction）—— 证明 factor 2

从最优剖分 $T$ 出发，沿其三角形边所在的直线：

1. 每条直线上只保留**从 $P$ 的第一个顶点到最后一个顶点**的那一段 → 这就是**弦（chord）**
2. 弦上相邻两个 $P$ 顶点之间的线段是 $P$ 的边或对角线，**且互不交叉**（Lemma 4）
3. 沿所有弦切开后得到**面（face）**，其角点都是 $P$ 的顶点
4. 每个面用**不使用平角**的方式三角化（Lemma 3：任何有界单连通区域都能分解成内部互不相交的三角形，且每个角的角落在区域的**非平关联（incidence）**上）

**丢失的吸收**：位于某线段内部但**紧邻 Steiner 端点**的顶点会被丢失。可归因到"离开某个 Steiner 点的一条边"。归因是**单射的**。

**Lemma 8**：$\rho_0(P) \le \rho(P) + \sum_{p\in S}(c_p - 2) - \lambda$

#### 4. Factor 2 的证明（定理 9）

两条界取平均：

| 界 | 来源 |
|---|---|
| $\rho_0 \le \rho + c(S) - 2\lvert S\rvert - \lambda$ | Lemma 8 |
| $\rho_0 \le n - 2 \le 3\rho - c(S) - 2$ | 三角剖分 + Lemma 1 |

**两界取平均**即得 $\rho_0 \le 2\rho - 1 - |S| - \lambda/2$。若 $P$ 不是三角形则 $\rho \ge 2$，可收紧到 $2\rho - 2$。

**推论（一般位置）**：若 $P$ 无三顶点共线，则 $n \ge 4$ 时 $\rho(P) \ge n/2$。

#### 5. 紧性：风车（Pinwheel）

**风车** = $m \ge 3$ 个三角形 $(p, \ell_i g_i, \ell'_i g_{i+1})$ 的并集，$p$ 为原点，$g_i$ 是逆时针单位向量（相邻夹角 < $\pi$），$\ell_i \ne \ell'_i$。每条射线上两个三角形终止于不同距离 → 射线承载两个顶点，**近的那个被长的那条边吸收**。

- 风车有 $n = 2m$ 个顶点，$\rho \le m$
- **Proposition 10**：存在风车使 $\rho = m$ 且 $\rho_0 = 2m - 2 = 2\rho - 2$

**含义**：**任何输出无 Steiner 点剖分的算法，其近似比都不可能优于 2。** 必须保留 Steiner 点才能突破。

（示例：4 三角形风车，8 顶点，无三点共线 ⇒ $\rho_0 = 6$，$\rho = 4$。）

#### 6. 突破 factor 2：类 $\Pi^\star$

**关键观察**：$\rho_0$ 接近 $2\rho$ **只在**最优剖分"Steiner 点很少、每个点周围三角形很多"时才发生（这正是风车的情形）。

**应对**：**保留**那些 Steiner 点，而不是删除它们。

**候选点集 $C$**：位于**两条不同的顶点对直线**（每条经过 $P$ 的两个顶点）上的 $P$ 内的点。$|C| = O(n^4)$。

**类 $\Pi^\star$ 的定义**：满足以下条件的剖分：

1. 每个 Steiner 点位于两条不同的顶点对直线上
2. $P$ 内部的每个 Steiner 点都**通过一条直线段连到 $P$ 的某个顶点**
3. 该段被三角形边覆盖
4. 该段的相对内部**不含三角形角点**

**DP 构造**：把 $\rho_0$ 的 DP（Asano-Asano-Pinter 1986）**扩展**为"顶点对 + 候选 Steiner 点"。

- **终端（terminals）**：$O(n^4)$ 个
- **状态**：$O(n^8)$
- 用 **Knuth 算法**（Dijkstra 的推广）检查每个终端三元组 $O(1)$ 次，**一次定向测试** ⇒ $O(n^{12})$ 时间、$O(n^8)$ 空间
- $C$ 中点的坐标是常数次数的有理数 ⇒ 每个测试 $O(1)$ 算术运算
- 计算 $C$（去重）、终端、判定哪些点在 $P$ 内：$O(n^5)$ 时间

**定理 19 证明**：

$$
3\rho^\star \le 2\rho_0 + \rho^\star \le 2(2\rho - 1 - |S| - \lambda/2) + (\rho + \lambda + |S|) = 5\rho - 2 - |S| \le 5\rho - 2
$$

#### 7. 带洞多边形（定理 11）

$h$ 个洞时：

- 角和变为 $(n + 2h - 2)\pi$，Lemma 2 变为 $|T| = n + 2h - 2 - \mu + \sum s_p$
- 三角剖分用 $n + 2h - 2$ 个三角形，$\rho_0$ 可在 $O(n^{3+2h})$ 时间算出
- **定理 11**：$\rho_0(P) \le 2\rho(P) + h - 1 \le \frac{5}{2}\rho(P)$
- 第二个不等式来自：凸包的至少 3 个顶点不能被吸收 ⇒ $\mu \le n - 3$ ⇒ $\rho \ge 2h + 1$

#### 8. 相关但更难的问题：覆盖（Covers）

- $\kappa(P) \le \rho(P)$；计算 $\kappa$ 是 **∃R-complete**
- 简单多边形已有 **12-近似** [Kleist-Scherzer, SODA 2027]，建立在凸多边形覆盖的 6-近似之上
- **关键负面结果**：最坏情况下 $\rho(P)/\kappa(P) = \Theta(\alpha(n))$（$\alpha$ = 反 Ackermann 函数）
  - **上界**：最小覆盖的 $3\kappa$ 条边构成线段排列，$P$ 的补集落在其某个面内 ⇒ $n = O(\kappa\alpha(\kappa))$（单个面的复杂度）
  - **下界**：基于线段下包络的构造 [Alkauskas]
  - **推论**：**任何剖分（无论是否用 Steiner 点）都无法在常数因子内近似 $\kappa$**；覆盖的常数因子算法**必须输出重叠三角形**

---

## 实验结果

> **本文是纯理论论文，无实验。** 全部结果为定理与证明。

**已有近似比演进**：

| 方法 | 近似比 | 时间 | 来源 |
|------|------|------|------|
| 三角剖分 | 3 | $O(n)$ | [Chazelle 1991] |
| 带洞三角剖分 | $3 + 6h/n \le 5$ | $O(n)$ | [Kleist-Scherzer 2027] |
| $\rho_0$ DP | **2** | $O(n^3)$ | 本文定理 9（基于 Asano-Asano-Pinter 1986） |
| **$\Pi^\star$ DP** | **5/3** | $O(n^{12})$ | **本文定理 18 + 19** |

**已知下界**（特殊多边形）：凸多边形 $\rho(P) = n-2$；一般位置下至多 2 个 reflex 顶点时同样成立。

---

## 局限性与作者自述

- **$O(n^{12})$ 的指数极大**，作者明确表示"**我们不尝试降低它**"（"The exponent is large, and we make no attempt to reduce it."）
- **对含洞情形**，只给出了 5/2-近似（基于 $\rho_0$），**没有**对应的 $\Pi^\star$ 级改进
- $\rho(P)$ 本身**是否多项式时间可算仍然未知** —— 本文只推进近似比，未触碰这一根本问题
- 相关覆盖问题 $\kappa(P)$ 在最坏情况下有 $\Theta(\alpha(n))$ 的**不可近似性**下界 —— 这意味着"剖分近似覆盖"这条路是死的
- **已知 Irrational Steiner 点问题** [Kleist-Scherzer]：存在有理顶点多边形，其所有最小剖分的 Steiner 点坐标都是无理数，任何有限轮构造都产生不出来 —— 这是 $\rho$ 精确算法的又一道障碍

---

## 开源参考

| 资源 | 说明 |
|------|------|
| **Asano, Asano, Pinter 1986** | J. Algorithms 7(2):221-231 —— $\rho_0$ 的 $O(n^3)$ DP（本文定理 9 的算法基础） |
| **Kleist & Scherzer, "Triangle covers of polygons"** | arXiv:2610.23634, SODA 2027 —— 覆盖的 12-近似、本文的 Theorem 9/11 参照其 Lemma 9/Claim 24 |
| **Abrahamsen et al., "Minimum star partitions of simple polygons in polynomial time"** | TheoretiCS 5(2):1-68, 2026（STOC 2024 初步版）—— 相关但不同的问题 |
| **Abrahamsen, "Covering polygons is even harder"** | FOCS 2021 —— $\kappa$ 的 ∃R-完全性 |
| **Chazelle 1991** | 简单多边形 $O(n)$ 三角剖分 |
| **Knuth 1977** | 广义 Dijkstra（"A generalization of Dijkstra's algorithm"），本文 DP 的核心算法 |
| **Chazelle, "Polygon triangulation: Efficiency and minimality"** | 兼容三元组最大化的刻画 |
| **CGAL** | 可用于实现：多边形三角剖分、`Polygon_mesh_processing::triangulate_*`、有理数精确算术（`Exact_predicates_exact_constructions_kernel`） |
| **libigl** | `igl::triangulate`、`igl::boundary_loop`；但**无 Steiner 点剖分**支持 |
| **CGAL / GMP** | $O(n^{12})$ DP 的整数算术需要精确有理数支持 |

---

## 🧾 可行性评估

### 算法复杂度

| 组件 | 复杂度 |
|---|---|
| $\rho_0$ DP（2-近似） | $O(n^3)$ 时间，$O(n^2)$ 空间 |
| 候选点集 $C$ 构造 | $O(n^4)$ 个点，去重与点在 $P$ 内判定 $O(n^5)$ 时间 |
| $\Pi^\star$ DP | $O(n^{12})$ 时间、$O(n^8)$ 空间（Knuth 算法，终端 $O(n^4)$、状态 $O(n^8)$） |
| 带洞 $\rho_0$ DP | $O(n^{3+2h})$ 时间 |
| 定理 9 / 11 证明 | 纯组合论证 |

### 实现难度

- 算法复杂度：**理论高 / 工程中**
  - **定理 9 的算法（2-近似）**：直接复用 Asano-Asano-Pinter 的 $\rho_0$ DP，**$O(n^3)$ 完全可实现**，是本文最实用的部分
  - **定理 18 的 5/3 算法**：$O(n^{12})$ **在实践中不可用**（$n = 100$ 就是 $10^{24}$ 量级）。但作者指出 $C$ 只有 $O(n^4)$ 个点、且**很多点可被剪枝** —— 若加剪枝，**在特定输入（近似一般位置、Steiner 收益小）可能实用**
- 数值稳定性：**好但需精确算术**
  - $C$ 中候选点坐标是**常数次数的有理数**（两条顶点对直线求交）⇒ 需要**精确谓词**（exact predicates），否则定向测试的符号误差会直接破坏 DP 的正确性
  - DP 中大量比较（如"$k(q_i) \le k(q_{i+1})$"）依赖精确比较
  - ⇒ **必须用 CGAL 的 `Exact_predicates_exact_constructions_kernel` 或 GMP 整数算术**，不可用 double
- 依赖项：**CGAL（推荐）+ Boost/GMP**；libigl 无对应支持

### 推荐结论

⚠️ **谨慎评估 —— 作为算法直接落地价值有限，但作为理论参考价值很高**

**（A）✅ 推荐实现：定理 9 的 2-近似（$O(n^3)$）**

这是**本文唯一实用**的算法成果，且实现成本可控：

- 直接复用 Asano-Asano-Pinter 1986 的 $\rho_0$ DP（$O(n^3)$），**不需要任何新代码**（该 DP 是文献标准）
- 相对"三角剖分"这一朴素基线，近似比从 **3 → 2**，在**最小三角形剖分**这一具体任务上是无争议的改进
- 适用场景：**我们需要在不引入 Steiner 点的前提下把三角剖分数量压到更接近最优** —— 例如"把一个多边形网格拆成尽量少的三角形块"的减面任务，或参数化中的分块策略

**（B）❌ 不推荐实现：定理 18 的 5/3-近似（$O(n^{12})$）**

- 复杂度在工程上不可接受
- **但可作为"何时值得寻找 Steiner 点"的判据**：定理 9 的证明显示，$\rho_0 \approx 2\rho$ **只在**最优剖分有"少量 Steiner 点、每个点周围很多三角形"时才发生。作者用风车刻画了这一极端。⇒ **实用启发式**：先算 $\rho_0$，若 $\rho_0$ 远大于 $n/3$（下界），说明存在大量共线顶点可被吸收，此时 Steiner 点的收益可能显著，值得尝试；否则 $\rho_0$ 已接近最优，不必折腾

**（C）✅ 强烈推荐作为理论参考**

1. **角和恒等式（Lemma 2）**：$|T| = n - 2 - \mu + \sum_p s_p$ —— 这个恒等式**极其简洁且普适**，是"剖分/简化中每个操作省几个三角形"的通用记账工具。**任何做网格简化、重网格化的工作都值得记住它**：简化一个网格，本质就是在追踪"吸收了多少顶点"与"付了多少 Steiner 代价"
2. **风车（pinwheel）**：Steiner 点的**几何极限情形** —— 理解它能理解"为什么纯几何简化算法总有一个 2 倍的下界"
3. **覆盖（cover）与剖分（partition）的分离**：$\Theta(\alpha(n))$ 的不可近似性结果，说明"用不重叠的剖分去逼近允许重叠的覆盖"在理论上不成立 —— 这对"我们能否用分块/剖分来近似任何覆盖任务"给出了**明确的负面答案**，是一个 valuable 的排除性结论
4. **"每条射线对应一个吸收"的对偶记账法**（Lemma 8）—— 思想可迁移：**把"损失"归因到具体的局部结构上，再做摊还分析（amortized analysis）**，这是几何算法里非常有力的一招

**（D）⚠️ 需要警惕的一点**

本文证明**没有假设一般位置**（顶点可共线，边可穿过多个顶点）—— 这与我们很多工程直觉相反（工程上通常先做"去共线"预处理）。但**这恰恰是算法收益的来源**：正是共线顶点提供了"吸收"的机会。⇒ **对我们现有管线的启示：不要过早把共线顶点"清理掉"，它们可能是减面的机会。** 这与 [[2026-11-24-Periodic-BSpline-Interlacing-Knots]] 等曲线相关工作中"保留结构节点"的思路一致。

**建议动作**：

- [ ] 把**角和恒等式**写进我们的几何知识库概念页，作为"网格简化的记账原理"
- [ ] 在减面任务中**评估 2-近似剖分**（$\rho_0$ DP）作为三角剖分的替代，检查我们的减面是否因"过度保留共线顶点"而多出三角形
- [ ] 检查现有简化管线**是否提前去除了共线/退化结构** —— 若有，评估保留它们能省多少面
- [ ] **不实现** 5/3 算法；但在需要判定"是否值得引入 Steiner 点"时，用 $\rho_0$ vs $n/3$ 的差距作为启发式判据

---

## 相关笔记

- [[2026-11-24-DiffSimp-Differentiable-Mesh-Simplification]] —— 可微网格简化（QEM 边折叠），与本文的"减面记账"直接相关
- [[2026-11-23-RemeshingAgent-Iterative-Repair-Based-Decimation]] —— 迭代修复式简化
- [[2026-11-24-Periodic-BSpline-Interlacing-Knots]] —— 周期性 B 样条交错节点（保留结构节点的思想）
- [[2026-11-26-Adaptive-Volumetric-Parameterization-3D-Manifolds]] —— 体参数化（含"折叠/重叠"判定，与本文的非交叉论证同源）
- [[2026-11-26-DAILY-SUMMARY]] —— 2026-11-26 每日摘要
