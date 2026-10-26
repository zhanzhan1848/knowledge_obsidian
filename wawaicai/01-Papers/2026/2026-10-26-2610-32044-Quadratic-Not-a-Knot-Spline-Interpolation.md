---
type: paper
created: 2026-10-26
updated: 2026-10-26
tags: [paper, geometry-processing, spline-interpolation, not-a-knot, approximation-theory, CAD-kernel, convergence-analysis, math.NA]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.32044
arxiv_id: 2610.32044v1
---

# Optimal Convergence of Quadratic Not-a-Knot Spline Interpolation on Arbitrary Partitions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Optimal Convergence of Quadratic Not-a-Knot Spline Interpolation on Arbitrary Partitions |
| **作者** | Aussie Greene（Vanderbilt University, Civil & Environmental Engineering） |
| **发表** | arXiv 2026-10-23 (v1)，math.NA，MSC 41A15 / 41A05 / 65F35 |
| **链接** | [原文](https://arxiv.org/abs/2610.32044) · [HTML](https://arxiv.org/html/2610.32044v1) |
| **DOI** | [10.48550/arXiv.2610.32044](https://doi.org/10.48550/arXiv.2610.32044) |
| **篇幅** | 10 页，1 图 |
| **代码** | 论文未给出 |

---

## 核心贡献

> **"not-a-knot" 插值在偶数次样条上一直缺一个"良定 + 最优收敛"的完整证明。本文把它补上了 —— 而且证明的是几何 CAD 里最常用的**二次样条**情形。**

1. **建立偶数次 not-a-knot 插值问题的良定性（well-posedness）** —— 内部节点取**数据点的中点**。
2. **证明二次（quadratic）情形的收敛阶**：对 $f \in C^3[a,b]$，在**任意划分（arbitrary partitions）**上达到 **$\mathcal{O}(h^3)$** 收敛，且**不要求 mesh-ratio 限制**（即允许极度非均匀的节点分布）。
3. **证明路线**：受 Beatson 方法启发，走**线性代数**路线 —— 构造求解样条一阶导数的线性系统 → **归一化该系统** → 用 **Neumann 级数**界定其逆矩阵的范数 → 建立全局误差界。

### 问题背景：not-a-knot 是什么

| 项 | 说明 |
|----|------|
| **经典 not-a-knot** | de Boor (1979) 提出，用于**端点无导数数据**的插值 |
| **奇数次情形** | 节点直接取为数据点 $t_1,\dots,t_n$；再去掉首尾各 $(d-1)/2$ 个内部节点 → $k = n-d-1$ |
| **偶数次情形** | 节点取为**数据区间的中点**：$x_i = \frac{t_{i+\mu-1}+t_{i+\mu}}{2}$，$\mu = d/2$，再首尾各去 $\mu$ 个 → 同样 $k = n-d-1$ |
| **维度约束** | 需 $n = \dim S_d^{d-1}(\Delta) = k+d+1$ |
| **奇偶差异的根源** | 奇数次时节点与数据点重合，**Schoenberg–Whitney 条件**自动满足；偶数次时节点在中点，需**证明**条件成立 |

### 既有结论的不足

Powell (1981) 《Approximation Theory and Methods》Eq. (18.40) 首次提出该二次方案，但同书 Sect. 21.2 指出：**当插值点为数据点的中点时，算子范数在任意插值点分布下无法一致有界**（unbounded）。

> ⚠️ **这看似致命 —— 但本文证明了：即使算子范数不可一致有界，收敛阶依然是 $\mathcal{O}(h^3)$ 且常数与 mesh-ratio 无关。** 这是一个重要区分：**算子范数一致有界** ⇏ **最优阶收敛**。

---

## 技术方案

### 关键定义

| 符号 | 含义 |
|------|------|
| $\Delta = \{x_i\}_{i=1}^{k+2}$ | 节点序列，$k = n-d-1$ |
| $S_d^{d-1}(\Delta)$ | 次数 $d$、光滑度 $d-1$ 的样条空间 |
| $\tau$ | 扩展节点序列：端点各重复 $d+1$ 次 |
| $M = (N_j^{d+1}(t_i))_{i,j=1}^n$ | **观测矩阵**（归一化 B-spline 基在数据点的求值） |
| **Proposition 1** | 良定性：$d=2\mu$、$n \ge d+1$、任意 $y_i$ ⇒ 存在**唯一**插值样条 $s \in S_d^{d-1}(\Delta)$ |

### 证明骨架

```
1. 构造观测矩阵 M（归一化 B-spline）
2. 由 Schoenberg–Whitney：M 非奇异 ⟺ 对角元为正
   → 重复端点节点保证对角元正 → M 非奇异 → 良定
3. 构造求解「样条在插值点处的一阶导数」的线性系统 A
4. 归一化 A，并用 Neumann 级数论证界定 ‖A⁻¹‖
5. 由导数误差推全局函数误差 → ‖s - f‖ = O(h³)
```

---

## 实验结论

- 论文为**纯理论**（10 页，1 图），无大规模数值实验
- 数值验证仅限收敛阶的示例图

---

## 局限性

- **纯理论**，无数值实验、无代码
- 仅覆盖**二次**（$d=2$）；更高偶数次（$d=4,6$）的推广**未涉及**
- 适用范围是**一维**插值问题
- 作者背景为土木/环境工程（非几何处理），发表在数值分析类期刊

---

## 实现建议

- **实现难度**：**低**（一维插值，几十行代码）
- **适用场景**：
  - **CAD 内核中的曲线插值** —— 特别是"只有采样点、无端点切向"的情形
  - **测量数据平滑 / 重采样**（如激光扫描剖面线的样条拟合）
  - **非均匀采样**下的鲁棒插值（论文明确允许任意非均匀划分）
  - **二次样条特别有价值**：控制点少、且在工程中常用于圆弧/抛物段的近似
- **开源参考**：
  - **libigl**：无直接对应（libigl 偏曲面），但其 B-spline 依赖的 `igl::min_quad_with_fixed` 可用于类似装配
  - **CGAL**：`CGAL::Polynomial` / `CGAL::Spline_2`（2D 样条）可作扩展
  - **Python**：`scipy.interpolate.make_interp_spline`（支持 `bc_type='not-a-knot'`）、`scipy.interpolate.make_interp_spline` 二次 + 自定义中点节点
  - **参考实现**：`Powell (1981) Eq. (18.40)`
  - **关键工程点**：
    - 实现要点：**节点取数据区间中点**（而非数据点），这是与经典 not-a-knot 的唯一差别
    - **数值稳定性**：论文用 Neumann 级数界定了逆矩阵范数 → 实际实现建议用**部分主元 LU**（而非纯 Neumann 迭代）以防病态
    - 端点条件：偶数次情形**首尾各需 $d$ 个节点**（$2\mu$）被"合并"

### 🥢 可行性结论

✅ **推荐收录（工程可直接用）** —— 虽然是纯理论论文且发表层级不高，但它**补上了一个实务中真实存在的空白**：二次样条在无端点切向数据下的良定插值方案及其最优收敛保证。我们的 CAD 曲线内核若涉及"仅有点、无切向"的插值，**这是一个有理论保障的方案**，可直接实现（成本极低）。
