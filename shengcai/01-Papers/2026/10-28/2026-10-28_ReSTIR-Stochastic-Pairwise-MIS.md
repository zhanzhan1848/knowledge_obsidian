---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, MIS, 空间复用, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://research.nvidia.com/labs/rtr/publication/hedstrom2026stochastic/
---

# Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time |
| **作者** | T. Hedstrom 等（NVIDIA） |
| **发表** | **Computer Graphics Forum (Eurographics) 2026** |
| **链接** | [NVIDIA RTG](https://research.nvidia.com/labs/rtr/publication/hedstrom2026stochastic/) |
| **单位** | NVIDIA |

---

## 核心贡献

> 标准 ReSTIR 的空间复用只从**少量随机邻居**取样，当这些邻居缺少贡献样本时，复用质量退化到基础路径采样器的水平。本文提出 **stochastic pairwise MIS**——从**大量邻居**做**无偏**复用，同时把复用**聚焦到有贡献样本的像素**上。

1. **大核（large-kernel）无偏复用的数学理论**：给出从**大量像素**高效无偏复用样本的理论，以及 **stochastic resampling MIS** 的形式化。
2. **Stochastic pairwise MIS**：把 pairwise MIS 权重从 **O(M)** 次 shift 降到 **O(Ñ)** 次，从而在 `M` 很大时仍可行；质量常与 balance heuristic 相当。
3. **高效 GPU 实现**：完整的算法 1（建 reuse cells）与算法 2（stochastic pairwise 评估 + 复用）。

**动机**：ReSTIR PT 的 spatial reuse 用 `M = 3` 个邻居（30px 半径）。增加邻居数有帮助，但**成本线性增长**。本文的方案：**用 8×8 cell 聚合邻居**（cell 内最多 `M = 64` 个邻居），**只实际评估 `Ñ = 3` 个候选**，但由于权重是无偏估计，效果如同用了 64 个邻居。

---

## 技术方案

### 符号

| 符号 | 含义 |
|------|------|
| `M` | 复用候选总数 |
| `Ñ` | **实际评估**的复用候选数 |
| `S̄` | `Ñ` 个随机候选索引的集合 |
| `m_i` | 标准**确定性** resampling MIS 权重 |
| `m̃_i` | 本文的**随机** resampling MIS 权重 |

### 核心机制 1：General Stochastic Resampling MIS Estimator

`m̃_i` 用 `Ñ` 个候选替代全部 `M` 个候选的做法：把完整的 MIS 权重和 `Σ m_i` 换成一个 **`Ñ`-样本重要性采样估计器**，其选择概率为 `P(i)`。

给定样本 `X̄ = X_1,…,X_M` 及其贡献权重 `W̄`，对每个输入像素 `i` 设定选择概率 `P(i)`。**有放回地**采样 `Ñ` 个像素，结果是唯一像素集合 `S̄ = {S_1,…,S_{|S|}}`（`|S| ≤ Ñ`），并用**重数** `K_S̄(i)` 记录每个像素被选中的次数。随机 resampling MIS 权重为：

```math
\widetilde{m}_i(Y_i; Z) = \frac{K_{\bar{S}}(i)}{\widetilde{N} P(i)}\, m_i(Y_i)
```

其中 `m_i` 是**任意非随机**的 resampling MIS 启发式。

**无偏性条件**：若 `P(i) = 0`，则 `K_S̄(i) = 0`，并定义 `m̃_i(Y_i; Z) = 0`。为保持无偏，**要求 `P(i)` 在 `m_i(Y_i)` 为正处也为正**。

> **关键**：重数 `K_S̄(i)` 的存在，使得只需处理至多 `Ñ` 个候选（而非 `M` 个）。通过精心选择 `P`，可以以一小部分代价得到高质量结果。论文在 Appendix B 证明 Eq.15 满足 Eq.13（无偏性条件）。

### 核心机制 2：为什么选 pairwise MIS 而非 balance heuristic

- 用 balance heuristic（Eq. 9）的随机版本：每个图像像素所需的 shift 次数从 `O(M²)` 降到 `O(Ñ·M)`——**对大 `M` 仍然不可行**。
- 改用 **pairwise MIS 变体（Eq. 11）**：成本可从 `O(M)` 降到 `O(Ñ)` 次 shift，**质量常与 balance heuristic 相当**。
- `Ñ ≪ M` 时，这实现了「从大量像素廉价复用」。

Pairwise MIS 对 canonical 与 non-canonical 情形有不同公式，需要**不同的估计器**：
- **non-canonical MIS 权重**（Eq. 11a）→ 用 stochastic resampling MIS 估计器（Eq. 15）估计；
- **canonical 权重**（Eq. 11b）→ 单独估计，用 `Ñ_c < M` 个样本替换 `m_pw` 中的求和。

### 核心机制 3：Reuse Cells（算法 1）

实现要点：把像素按 **G-buffer 法向、object ID、tile ID** 分类到 **8×8 tiles 的 cell** 中；然后**不看路径样本**地随机选一个 cell（按置信度权重用 **12-sample WRS** 抽取）→ 该 cell 内至多 `M = 64` 个邻居。再从选中 cell 内按贡献与置信度权重选 `Ñ = 3` 个候选。

### 核心机制 4：Adjusted Non-Canonical Confidences

在 MIS 权重评估时，用**乘子 `Ñ/M`** 调整非 canonical 置信度权重 → 重新平衡空间邻居与当前像素的贡献，消除许多场景中恼人的**椒盐噪声（pepper noise）**。

---

## 公式

**Pairwise MIS（canonical 与 non-canonical）：**

```math
\text{(non-canonical)}\quad
m^{pw}_{\text{non\text{-}can}}(Y_i) = \frac{w_i}{\sum_{j} w_j + \sum_{k} w_k^{\text{can}}}
```

```math
\text{(canonical)}\quad
m^{pw}_{\text{can}}(Y_i) = \frac{w_i^{\text{can}}}{\sum_{j} w_j + \sum_{k} w_k^{\text{can}}}
```

**Stochastic resampling MIS 权重（核心公式）：**

```math
\widetilde{m}_i(Y_i; Z) = \frac{K_{\bar{S}}(i)}{\widetilde{N}\,P(i)}\, m_i(Y_i),
\qquad
K_{\bar{S}}(i) = \#\{\text{像素 } i \text{ 在 } \bar{S} \text{ 中被抽中的次数}\}
```

**无偏性条件（选择概率必须覆盖正权重处）：**

```math
P(i) > 0 \quad \text{wherever}\quad m_i(Y_i) > 0
```

**Non-canonical 置信度调整：**

```math
m^{pw}_{\text{non\text{-}can}} \ \leftarrow\ \frac{\widetilde{N}}{M}\cdot m^{pw}_{\text{non\text{-}can}}
```

**复用权重（标准 ReSTIR 形式）：**

```math
w_i = m_i(Y_i)\,\hat{p}(Y_i)\,W_{X_i}\left|\frac{\partial T_i}{\partial X_i}\right|,
\qquad
Y_i = T_i(X_i)
```

```math
W_Y = \frac{1}{\hat{p}(Y)}\sum_{i=1}^{M} w_i
```

---

## 代码片段

```cpp
// Algorithm 2（核心）：stochastic pairwise MIS 评估与复用
// 依论文伪代码重构

// --- 步骤 1：建立 reuse cells（Algorithm 1）---
// 按 G-buffer 法向 / object ID / tile ID 把像素分类到 8x8 tile 的 cell 中
struct ReuseCell {
    int   pixelIds[MAX_M];   // 至多 M = 64 个邻居
    float confWeight[MAX_M];
    int   count;
};

// 按置信度权重用 12-sample WRS 随机选一个 cell
__device__ int select_cell(const ReuseCell* cells, int numCells,
                           uint randState, int samples = 12)
{
    // Weighted Reservoir Sampling over cells, by confidence weight
    // ... 论文使用 12-sample WRS
}

// --- 步骤 2：stochastic pairwise MIS 评估（Algorithm 2, lines 6-12）---
struct StochasticPairwiseState {
    int   selIdx[MAX_NTILDE];   // 抽中的候选索引（多重数）
    float selProb[MAX_NTILDE];  // 对应的选择概率 P(i)
    int   count;
};

__device__ void eval_stochastic_pairwise(
    const ReuseCell& cell, int NTILDE, int NC_TILDE,
    const float* contrib, const float* conf,
    StochasticPairwiseState& st)
{
    // (a) 按贡献与置信度权重选出 NTLDE 个候选（有放回）
    // (b) 计算 canonical MIS 权重 m_pw_c：用 NTLDE_c = 1 个样本替代求和
    // (c) 计算 non-canonical MIS 权重：用 Eq.15
    //     mtilde_i = K_Sbar(i) / (NTILDE * P(i)) * m_i
    for (int k = 0; k < st.count; ++k) {
        int i = st.selIdx[k];
        float K = multiplicity(st, i);          // 该像素被抽中的次数
        st.weight[k] = (K / (NTILDE * st.selProb[k])) * cell.confWeight[i];
    }
    // (d) 调整 non-canonical 置信度：乘以 NTLDE / M
    for (int k = 0; k < st.count; ++k)
        st.weight[k] *= (float)NTILDE / (float)cell.count;
}

// --- 步骤 3：stochastic neighbor reuse（Algorithm 2, lines 13-20）---
// 与标准 ReSTIR 相同：从候选中按权重做 resampling

// 单一 reservoir 同时承载 direct 与 indirect illumination
// （论文明确：不分离 direct/indirect 到不同 reservoir）
```

---

## 实验结论

- **对比设置**：本文方法 vs 标准 **ReSTIR PT**（`M = 3` 空间邻居，30px 半径，defensive pairwise MIS）。
- **本文方法**：从**单个** cell（至多 `M = 64` 邻居）中取 `Ñ = 3` 个候选；cell 按置信度权重用 **12-sample WRS** 选取；canonical MIS 权重用 `Ñ_c = 1`。
- **场景**：Bistro Interior、San Miguel Cave、Bistro Exterior 等，**均含相机运动 / 场景动画造成的 disocclusion**。
- **测量**：50 帧动画序列的**最后一帧**，置信度权重上限 20。
- **结果**：
  - **整体与数值上均显著提升**，**尤其在 disoccluded 区域**（那里几乎没有有用的时域信息）；
  - **改进的 disocclusion**：stochastic pairwise MIS 能在选中的 8×8 cell 内**有效搜索有贡献的像素**，大幅提升空间复用效率并降低 disocclusion 噪声；
  - **调整后的 non-canonical 置信度**消除了 pepper noise。

### Table 2：各阶段耗时（4 个场景平均，10 次运行）

| 阶段 | 耗时 |
|------|------|
| Initial Sampling | 8.68 ms ± 2.12 |
| Temporal Reuse | 4.06 ms ± 1.36 |
| **Create Reuse Cells**（Algorithm 1） | 1.57 ms ± 0.13 |
| **Compute m̃^pw_c**（Alg. 2, lines 6-12） | 4.40 ms ± 0.36 |
| **Stochastic Neighbor Reuse**（Alg. 2, lines 13-20） | 9.19 ms ± 0.98 |

> Initial sampling 与 temporal reuse 始终先于本方法运行。

---

## 局限性

- **只对前层/部分候选做实际评估**（`Ñ` 个），canonical 权重用 `Ñ_c = 1`——理论上增加噪声，论文称实践中可接受。
- 需要 **G-buffer 法向、object ID、tile ID** 来构建 reuse cells。
- 依赖 **object ID** 的稳定性（跨帧一致）才能让 cell 分类有意义。
- 额外的 1.57 ms（建 cell）+ 4.40 ms（MIS 评估）+ 9.19 ms（复用）开销——总增量不小。
- 只处理**空间复用**，时域复用仍是标准 ReSTIR。

---

## 相关工作

- [[ReSTIR]]
- [[ReSTIR PT]]
- [[Pairwise MIS]]
- [[Reservoir Splatting]]
- [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection|Compatibility-Guided Neighbor Selection for ReSTIR]]

---

## 实现建议

- **实现难度**：**高**。需理解并正确实现：
  - **resampling MIS** 权重体系；
  - **pairwise MIS**（canonical / non-canonical 分离）；
  - **随机化权重估计**的无偏性证明依赖（`P(i) > 0` 处处覆盖 `m_i > 0`）；
  - reuse cells 的构建与 WRS 选 cell。
- **预期性能**：显著优于标准 ReSTIR（`M=3`），**尤其在 disocclusion 区域**；但绝对耗时增量明显（约 +15 ms）。
- **适用场景**：
  1. **动态场景 / 大幅相机运动的实时路径追踪**——disocclusion 是 ReSTIR 最大的残余噪声源；
  2. 已有 ReSTIR 实现，希望**不增加邻居数**却提升大核复用效果。
- **行动建议**：**⚠️ 谨慎评估，优先级：中**。
  - 与 [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection|ReSTIR Compat]]（Compatibility-Guided Neighbor Selection）**解决同一问题但路径不同**：
    - **Compat 方案**：改动极小（替换邻居选择），增量成本 2–5%，SMAPE −6~29%；
    - **本文方案**：改动大（需重建 MIS 权重体系 + cell 结构），增量成本约 +15 ms，但覆盖 64 个邻居且聚焦有贡献样本。
  - **建议**：先落地 Compat 方案（低成本高收益）；若 disocclusion 噪声仍是瓶颈，再评估本文方案。
  - 但本文的**两个洞见应立即记录**：
    1. **「MIS 权重求和可用随机重要性采样无偏估计」**——把 `O(M)` 的权重和降为 `O(Ñ)`，是通用的 MIS 加速模式，**优先级：高（作为技术储备）**；
    2. **「用 cell 聚合邻居 + 按置信度选 cell」**——把「用哪些邻居」和「评估哪些邻居」解耦，**优先级：中**。
