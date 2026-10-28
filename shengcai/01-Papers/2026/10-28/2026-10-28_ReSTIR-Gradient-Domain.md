---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, 梯度域, MIS, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://onlinelibrary.wiley.com/doi/abs/10.1111/cgf.70328
---

# Gradient-Domain ReSTIR Path Tracing (ReSTIR G-PT)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gradient-Domain ReSTIR Path Tracing |
| **作者** | Yu-Chen Wang, Markus Kettunen, Daqi Lin, Chris Wyman, Lifan Wu, Shuang Zhao |
| **发表** | **Computer Graphics Forum 45(2), Eurographics 2026**；DOI **10.1111/cgf.70328** |
| **链接** | [Wiley](https://onlinelibrary.wiley.com/doi/abs/10.1111/cgf.70328) ｜ [PDF](https://projects.shuangz.com/ReSTIR-GDPT-eg26/ReSTIR-GDPT-eg26.pdf) |
| **单位** | NVIDIA / UC Irvine / UIUC |

---

## 核心贡献

> 首个**实时梯度域渲染方法**——把 ReSTIR 的复用单元从「单像素路径」扩展为**配对像素样本**，在扩展域上做 GRIS 重采样，从而在保住「两条路径相关」这一梯度估计前提的前提下实现时空间复用。

1. **路径空间扩展（path space extension）**
   - 定义扩展域 `𝒳 := (Ω_i × {0}) ∪ (Ω_j × {1})`，把两个像素的积分合并为**单一积分**。
   - 在 `𝒳` 上做 GRIS 重采样 → 天然保持「两条路径相关」。
2. **ReSTIR G-PT 算法**
   - 提出 **Gradient with ReSTIR**（关键：**不能**先做 primal ReSTIR 再算梯度——那样方差高）。
   - 配合**基于 Area ReSTIR 的分数运动向量**做时域复用。
   - 利用**梯度图像的相对稀疏性**实现**高度选择性的空间复用**，从而达到实时帧率。
3. **正部化 (Positivization)**
   - 梯度信号可正可负，而 ReSTIR 目标函数必须非负 → 把梯度拆成**正/负两个积分**，分别用**两个 reservoir** 估计，显著降低符号噪声。
   - 论证并实测：**跨符号复用无益**（不如同符号内复用，且更慢）。

---

## 技术方案

### 数学基础：梯度域渲染

梯度域渲染不只估计像素颜色 `F_i`，还估计**相邻像素差**（离散图像梯度）。像素 `i` 与 `j` 的差值是两个积分之差：

```math
\Delta_{ij} = \int_{\Omega_i} f_i(\bar{x})\,d\bar{x} - \int_{\Omega_j} f_j(\bar{x})\,d\bar{x}
```

MC 差值估计的方差由两项估计的方差与协方差决定。为降低方差，用 **shift mapping** `T_ij`（从 `Ω_i` 到 `Ω_j` 的确定性双射/部分双射）把两边的样本**相关**起来：

```math
\Delta_{ij} = \int_{\Omega_i} \left( f_i(\bar{x}) - f_j(T_{ij}(\bar{x})) \right) \left| \frac{\partial T_{ij}}{\partial \bar{x}} \right| d\bar{x}
```

因为 shift mapping 通常只是**部分双射**（不是所有路径都能跨像素移动），所以要**对称估计 + MIS**：

```math
\Delta_{ij} = \int_{\Omega_i} \omega_{ij}(\bar{x})\left( f_i(\bar{x}) - f_j(T_{ij}(\bar{x})) \right)\left|\frac{\partial T_{ij}}{\partial \bar{x}}\right| d\bar{x}
- \int_{\Omega_j} \omega_{ji}(\bar{x})\left( f_j(\bar{x}) - f_i(T_{ji}(\bar{x})) \right)\left|\frac{\partial T_{ji}}{\partial \bar{x}}\right| d\bar{x}
```

balance heuristic 的 MIS 权重：

```math
\omega_{ij}(\bar{x}) = \frac{p_i(\bar{x})}{p_i(\bar{x}) + p_j(T_{ij}(\bar{x}))}\left|\frac{\partial T_{ij}}{\partial \bar{x}}\right|
```

**最终图像重建**：求解 **screened Poisson 方程**（L2 无偏，L1 常更高质量）——由 pixel color (primal) + discrete image gradients 联合重建图像。

### 核心机制 1：为什么「Gradient after ReSTIR」是错的

朴素做法：先用 primal ReSTIR 复用单路径，再把最终路径 shift 到邻居像素算梯度：

```math
\langle\Delta'_{ij}\rangle = \omega_{ij}(\bar{y}_i)\left(f_i(\bar{y}_i) - f_j(T_{ij}(\bar{y}_i))\right)\left|\frac{\partial T_{ij}}{\partial \bar{y}_i}\right| W_{\bar{y}_i}
```

**问题**（论文 Fig.3 玩具反例）：primal ReSTIR 的目标函数只看**单像素**的路径贡献 `f_1(x)` 或 `f_2(x)`，会**过度采样峰值、欠采样 `|f_1 − f_2|` 大的区域**——而后者才是梯度积分真正需要的信息。同时每次 shift mapping 失败都产生离群值。

### 核心机制 2：path space extension

```math
\mathcal{X} := (\Omega_i \times \{0\}) \cup (\Omega_j \times \{1\})
```

```math
\Delta_{ij} = \int_{\mathcal{X}} \omega^{*}_{ij}(\bar{x},k)\, G_{ij}(\bar{x},k)\, d(\bar{x},k)
```

```math
G_{ij}(\bar{x},k) := \begin{cases}
f_i(\bar{x}) - f_j(T_{ij}(\bar{x}))\,\left|\tfrac{\partial T_{ij}}{\partial \bar{x}}\right| & k=0 \\[4pt]
f_i(T_{ji}(\bar{x}))\,\left|\tfrac{\partial T_{ji}}{\partial \bar{x}}\right| - f_j(\bar{x}) & k=1
\end{cases}
```

```math
T_{ij}\ \text{称为\ \textbf{Inner Shift}};
\qquad
\omega^{*}_{ij}(\bar{x},k) := \begin{cases}
\omega_{ij}(\bar{x}) & k=0 \\ \omega_{ji}(\bar{x}) & k=1
\end{cases}
```

**关键**：`𝒳` 是一个**新的积分域**，ReSTIR 的 GRIS 可以在其上工作，从而**在扩展域上复用配对像素样本**。

### 核心机制 3：Outer Shift（跨像素对复用的移位）

要把另一个像素对 `(𝒳')` 的样本 `(x̄, k)` 移到当前像素对 `(𝒳)`：

```math
T^{*}(\bar{x},k) = \big(\tau(\bar{x}),\ \gamma(k)\big),
\qquad \gamma(k)=k,\quad
\tau:\ \text{把 base path 移到目标像素对 }(i',j')\text{ 中对应的像素}
```

**Jacobian 极简**（因为指示器是恒等移位）：

```math
\left|\frac{\partial T^{*}}{\partial(\bar{x},k)}\right| = \left|\frac{\partial \tau}{\partial \bar{x}}\right|
```

**两层移位结构**（Fig.4）：Outer Shift（跨像素对）→ Inner Shift（在目标对内换像素求梯度）。

### 核心机制 4：ReSTIR G-PT 的估计器

候选配对样本 `{(x̄_l, k_l)}_{l=1}^{M}` 来自 `𝒳_1,…,𝒳_M`，先全部用 Outer Shift `T_l*` 移入目标域 `𝒳`，再按 GRIS 权重重采样：

```math
w_l(\bar{x}_l,k_l) = m_l(\bar{x}_l,k_l)\, \hat{p}(\bar{x}_l,k_l)\, W(\bar{x}_i,k_i)\, \left|\frac{\partial T^{*}}{\partial(\bar{x}_l,k_l)}\right|
```

### 关键技术

| 组件 | 设计 |
|------|------|
| **Primal 通道** | 用 **Area ReSTIR**（Zhang et al. 2024）做 primal 渲染；实验中初始候选数 = 1，空间邻居数 = 2 |
| **梯度通道** | **Gradient with ReSTIR**；初始候选数 = 1，空间邻居数 = 1 |
| **时域复用** | 基于 **Area ReSTIR 的分数运动向量**（fractional motion vectors） |
| **空间复用** | 利用**梯度图像的相对稀疏性**做**高度选择性**的空间复用（只复用梯度贡献大的邻居） |
| **正部化** | 梯度拆正/负 → 两个独立 reservoir；**只做同符号内复用** |
| **重建** | Screened Poisson 方程；**L1 与 L2 Poisson 重建** |
| **实现** | 基于 **Falcor** 框架；所有方法共享相同的 lighting / geometry / materials 接口 |

---

## 公式

**Poisson 重建（最终图像）：**

```math
\text{求 } F \text{ 使得}\quad
\Delta F = \nabla\cdot(\mathbf{g}),
\qquad
\text{subject to } \mathcal{L}(F)=0 \ \text{(screened)}
```

**ReSTIR G-PT 权重（GRIS on 扩展域）：**

```math
w_l(\bar{x}_l,k_l) = m_l(\bar{x}_l,k_l)\,
\hat{p}(\bar{x}_l,k_l)\,
W(\bar{x}_i,k_i)\,
\left|\frac{\partial T^{*}}{\partial(\bar{x}_l,k_l)}\right|
```

**正部化的两个独立 reservoir：**

```math
r^{+},\; r^{-},\qquad \text{复用时仅取同符号样本：}\;
r^{+} \leftarrow \mathcal{R}(r^{+}),\;\; r^{-} \leftarrow \mathcal{R}(r^{-})
```

---

## 代码片段

```cpp
// ReSTIR G-PT：扩展域上的 GRIS 重采样骨架（依论文描述重构）
struct PairedPixelSample {
    float  x[3];      // base path 位置
    float  dir[3];
    int    k;         // 域指示器：0 -> Omega_i, 1 -> Omega_j
    float  contribution;   // f_i 或 f_j
    float  weight;
    float  M;         // 累积的 M 权重
};

// Outer Shift：把样本从别的像素对移入目标对
__device__ void outer_shift(PairedPixelSample& s,
                            int tgt_i, int tgt_j,
                            int src_i, int src_j,
                            float motion_x, float motion_y)
{
    // gamma(k) = k：指示器恒等移位
    // tau：把 base path 移到目标像素对中对应的那个像素
    s.x[0] += motion_x; s.x[1] += motion_y;
    // Jacobian = |d tau / d x|（指示器恒等，故极简）
    s.weight *= fabs(tau_jacobian);
}

// 配对像素样本贡献函数 G_ij
__device__ float paired_contribution(const PairedPixelSample& s,
                                     int i, int j, float T_ij[4][4])
{
    if (s.k == 0) {
        // f_i(x) - f_j(T_ij(x)) * |dT_ij/dx|
        float fj = eval_f_j(T_ij, s);
        return s.contribution - fj * fabs(det_T_ij);
    } else {
        // f_i(T_ji(x)) * |dT_ji/dx| - f_j(x)
        float fi = eval_f_i(T_ji, s);
        return fi * fabs(det_T_ji) - s.contribution;
    }
}

// 正部化：正/负梯度各用一个 reservoir，且只做同符号内复用
__device__ void positivized_resample(Reservoir& r_pos, Reservoir& r_neg,
                                      const PairedPixelSample& cand)
{
    if (cand.contribution >= 0.0f)  update_reservoir(r_pos, cand);
    else                            update_reservoir(r_neg, cand);
}
```

---

## 实验结论

- **硬件**：**NVIDIA GeForce RTX 5090** + AMD Ryzen 5900X。
- **分辨率**：**1920×1080**，移动相机。
- **框架**：**Falcor**（所有方法共享相同 lighting / geometry / materials 接口）。
- **基线**：
  - **B.1 Gradient after ReSTIR**（先 primal ReSTIR 再算梯度）
  - **B.2 Gradient-PT**（梯度域路径追踪，无时空复用）
  - **B.3 Area ReSTIR**（primal 域基线）
  - 以及 path tracing domain path tracing [KMA*15]
- **等时对比（equal-time, 30 ms）**：在 **Aachen Toys**（移动相机）场景下与基线对比；本方法在视觉与统计上**均优于**基线。
- **结果定性**：
  - Gradient-PT 因采样预算低且无时空复用，**梯度图像噪声大**；
  - Gradient after ReSTIR 改善了梯度图像质量，但**无法获得梯度积分真正需要的高贡献路径**；
  - 本方法的梯度图像最干净。
- **重建耗时**：
  - **L1 Poisson 重建 300 ms**；**L2 Poisson 重建 11 ms**；
  - 作者指出现代神经去噪器（**DLSS**）可能更高效，低至 **3 ms**；并预期未来的神经梯度域重建方法能达到类似效率。
  - 实验中的等时对比**已把 L2 重建时间计入**所有梯度域方法。
- **消融**：
  - **正部化**：显著降低符号噪声；跨符号复用不优于同符号内复用且更慢 → 弃用；
  - **MLT 的自适应性**：即使没有 MLT 的自适应，该方法依然有效（对基线同样有益）。
- **其它**：初始候选数 `N = 256` 的实验取 **0.1 ms**。

---

## 局限性

- **Poisson 重建是必需步骤**，L1 重建 **300 ms** 远超实时预算（论文用 L2 的 11 ms，或期待神经重建降到 3 ms）——**这是该方法当前最大的实用瓶颈**。
- 梯度域渲染在**收敛图像**上仍需每像素较多采样；本方法的价值在于复用而非降低绝对采样数。
- 需要 **Falcor 级**的路径追踪基础设施与**分数运动向量**支持。
- 正部化需要**两个 reservoir**，增加内存与带宽。
- 依赖 primal 域的 Area ReSTIR 作为基座，故与 Area ReSTIR 的局限叠加。

---

## 相关工作

- [[Area ReSTIR]]
- [[ReSTIR]]
- [[Gradient-Domain Rendering]]
- [[Shift Mapping]]
- [[Screened Poisson 方程]]

---

## 实现建议

- **实现难度**：**高**。
  - 理论门槛最高：需要在**扩展积分域**上实现 GRIS，以及 Inner/Outer 双层 shift mapping；
  - 工程门槛：Area ReSTIR + 分数运动向量 + Poisson 求解器（或神经重建器）。
- **预期性能**：30 ms 等时对比下全面优于 Area ReSTIR / Gradient after ReSTIR / Gradient-PT；但**必须计入重建时间**才公平（L2 11 ms）。
- **适用场景**：
  1. **实时路径追踪器**（游戏/影视引擎的 RT 管线）——在有充足算力做 Poisson/神经重建时可用；
  2. **梯度域渲染**此前在实时领域几乎空白，本方法是该方向的第一份系统性工作。
- **行动建议**：**⚠️ 谨慎评估，但方法论价值高**。理由：
  - 完整实现依赖 Poisson/神经重建这一**尚不成熟的实时组件**（11 ms 甚至 300 ms），落地风险高，**优先级：中**；
  - 但**方法论层面有两个高价值洞察应立即采纳**：
    1. **「先复用、后求导」是错的**——若团队将来要在任何可微/导数量上做复用，必须在**目标量的积分域上做复用**，而不是在原始量上复用后再求导。这个原则是通用的，**优先级：高**；
    2. **「目标函数必须非负」时用正/负双 reservoir 正部化**——这是一个通用的 ReSTIR 工程模式，可直接迁移，**优先级：高**。
  完整实现优先级：**中**。
