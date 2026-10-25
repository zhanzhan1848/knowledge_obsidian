---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, 渲染, 球谐, SH, 辐射度, 球面网格, 实时渲染, 性能优化, TOG, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://doi.org/10.1145/3811322
---

# Generalized Spherical Harmonics Products using Spherical Grids

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Generalized Spherical Harmonics Products using Spherical Grids |
| **作者** | Di An, Jianmin Wu, Bowen Xu, Ling-Qi Yan, Kun Xu |
| **单位** | 清华大学 |
| **发表** | ACM Transactions on Graphics (SIGGRAPH 2026), Vol. 45, 2026 |
| **链接** | [原文](https://doi.org/10.1145/3811322) |
| **DOI** | 10.1145/3811322 |
| **代码** | 未公开 |

---

## 核心贡献

> 球谐（SH）乘积是众多渲染算法的核心运算，常成主要计算瓶颈。提出 **Generalized SH Product**：支持**输入不同 SH 阶数**、输出**灵活截断**，并通过 **Spherical Grids (SphGrid)** 作为中间表示，把乘积计算化为**网格上的逐点乘法**。

1. **广义 SH 乘积公式**：支持**不同阶数的输入**（此前方法要求所有输入共享同一阶）且输出可**灵活截断**。
2. **SphGrid 作为中间表示**：建立 SphGrid ↔ SH 系数的**显式双向转换**，使乘积退化为网格上的**逐点乘法**。
3. **网格分辨率的充分条件**：推导保证**精确计算**的分辨率条件；更低分辨率给出**带误差的近似变体**，在精度与效率间取得有利权衡。
4. **通用性 + 专用性双赢**：即便对「输入同阶」这一退化情形，也仍**优于既有 SOTA**。

---

## 技术方案

### 核心思想

```
传统 SH 乘积：
  c = T(c1, c2)          # 高阶三角函数展开 → 计算量随阶数平方/立方增长
  ✗ 要求 c1, c2 同阶
  ✗ 输出阶数固定

本文：
  c1 (阶 L1) ──SphGrid──► G1 ─┐
                                 ├─► G1 ⊙ G2 ──SphGrid──► c (阶可截断)
  c2 (阶 L2) ──SphGrid──► G2 ─┘
  各向异性 L1, L2 可不同；输出阶数可自由选择
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **广义 SH 乘积** | $c = f(c_1, c_2)$，$c_1 \in \mathcal{H}_{L_1}$，$c_2 \in \mathcal{H}_{L_2}$，$L_1 \neq L_2$ 亦可；输出可截断到任意阶 |
| **SphGrid 中间表示** | 球面网格上的值向量；乘积 = 逐点乘法 $\odot$（O(N) 而非 O(L⁴)） |
| **双向转换** | SH → SphGrid 与 SphGrid → SH 的显式、可解析转换 |
| **精确性充分条件** | 网格分辨率满足条件时乘积**完全精确**（非近似） |
| **近似变体** | 更低分辨率 → 更少误差 + 更快；误差可控 |
| **实时渲染验证** | 论文在实时渲染场景中验证有效性 |

---

## 公式

```math
\text{球谐基（实值）}:\quad
Y_{\ell}^{m}(\omega),\qquad \omega \in S^2,\;\; 0 \le \ell \le L
```

```math
\text{传统 SH 乘积（同阶、展开代价高）}:\quad
c_k = \sum_{\substack{\ell_1 + \ell_2 = k\\ m_1, m_2}} T^{\ell_1 m_1}_{\ell_2 m_2}\, c_1^{\ell_1 m_1} c_2^{\ell_2 m_2}
\quad\Longrightarrow\quad \mathcal{O}(L^4)
```

```math
\text{本文（SphGrid 中间表示）}:\quad
G_1 = \mathrm{SphGrid}(c_1,\; L_1), \quad
G_2 = \mathrm{SphGrid}(c_2,\; L_2), \quad
\boxed{\;G_{\text{prod}} = G_1 \odot G_2\;}, \quad
c = \mathrm{SphGrid}^{-1}(G_{\text{prod}},\; L_{\text{out}})
\quad\Longrightarrow\quad \mathcal{O}(N_{\text{grid}})
\]

```math
\text{广义性}:\quad
c_1 \in \mathcal{H}_{L_1},\; c_2 \in \mathcal{H}_{L_2},\; L_1 \neq L_2
\;\Rightarrow\; \text{仍有定义},\qquad L_{\text{out}} \le L_1 + L_2
```

---

## 代码片段

```cpp
// 概念示意：SphGrid 作为中间表示的 SH 乘积
struct SphGrid {
    int      n_theta;              // 球面网格分辨率
    int      n_phi;
    float*   values;               // 逐点值
};

// 1) SH 系数 -> 球面网格
SphGrid to_grid(const std::vector<float>& sh, int order, int n_theta, int n_phi);

// 2) 逐点乘法（核心：复杂度与 SH 阶数解耦）
void grid_product(const SphGrid& G1, const SphGrid& G2, SphGrid& out) {
    for (size_t i = 0; i < G1.values.size(); ++i)
        out.values[i] = G1.values[i] * G2.values[i];
}

// 3) 球面网格 -> SH 系数（输出阶数可自由截断）
std::vector<float> from_grid(const SphGrid& G, int out_order);

// 4) 广义用法：两个输入可以不同阶，输出可截断
auto c_prod = from_grid(grid_product(to_grid(c1, L1, nt, np),
                                     to_grid(c2, L2, nt, np)),
                         L_out);
```

---

## 实验结论

- **数据集**: 图形学实际应用场景中的 SH 乘积运算（实时渲染负载）
- **基线**: 既有 SH 乘积计算 SOTA 方法（精确版与近似版各一）
- **结果**:
  - **精确方法**: 相对 SOTA 取得 **3.5–6.0× 加速**（实用图形学设置下）
  - **近似变体**: 误差**低于**既有 SOTA 近似方法，同时取得 **2.5–6.5× 加速**
  - 在**同阶输入**这一退化情形下依然表现更优（证明加速并非来自「更一般」这一放宽）
  - 对正确性与效率给出严格分析
- **适用性**: 在真实时渲染应用中验证有效

---

## 局限性

- **代码未公开**
- 需在 SH 系数 ↔ SphGrid 之间做**双向转换**，该转换本身有固定开销（论文称在实用设置下仍净收益）
- 精确性依赖**网格分辨率充分条件**；用低分辨率换速度时引入近似误差
- 面向低频球面函数（SH 的固有假设），不适用于高频/尖锐方向性响应

---

## 相关工作

- [[2026-10-25-RCPG-Radiance-Cascade-Path-Guiding]] — 互补：SH 是路径引导的常见 radiance 表示
- [[2026-10-24-OmniRay-Camera-Agnostic-Composite-Ray-Fields]] — 相关：SH 残差表示
- [[2026-10-25-Gabor-Fields-Orientation-Selective-LOD-Volume-Rendering]] — 互补：频域/频谱方法
- [[2026-10-09-NRC-Specular-Prefiltered-Radiance]] — 相关：预滤波辐射与 SH

---

## 实现建议

- **实现难度**: **中低**（概念简洁：网格化 → 逐点乘 → 网格化回来；核心是 SH↔SphGrid 转换的正确实现）
- **预期性能**: 精确版 3.5–6.0× 加速；近似版 2.5–6.5× 加速且误差更小
- **适用场景**: 实时路径追踪中的**辐射度表示**（SH 环境光、SH 光源）、多次弹射 irradiance 缓存、球面谐函数相关的光照计算
- **⭐ 优先级**: **中高** — 本库首次覆盖「SH 乘积计算」这一渲染基础设施层面的论文；**「用中间表示把高阶张量运算降为逐点乘法」**是高度可迁移的范式（类似思路可用于任何球面/网格上的乘积型运算）

---

## 备注

- 无 arXiv 预印本；通过 OpenAlex API 抓取摘要
- TOG 期刊论文，此前批次遗漏，本次补齐
