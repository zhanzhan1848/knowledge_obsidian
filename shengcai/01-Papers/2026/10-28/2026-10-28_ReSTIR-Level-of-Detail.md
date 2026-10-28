---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, LOD, 移位映射, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://research.nvidia.com/labs/rtr/publication/wang2026levelofdetail/
---

# Real-Time Level-of-Detail Rendering with ReSTIR

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Level-of-Detail Rendering with ReSTIR |
| **作者** | Yu-Chen Wang, Markus Kettunen, Daqi Lin, Chris Wyman, Lifan Wu, Shuang Zhao |
| **发表** | **SIGGRAPH 2026 Conference Track**（SIGGRAPH Conference Papers '26，8 页，2026-07-19 发布）；DOI **10.1145/3799902.3811100** |
| **链接** | [NVIDIA RTG](https://research.nvidia.com/labs/rtr/publication/wang2026levelofdetail/) ｜ [PDF](https://research.nvidia.com/labs/rtr/publication/wang2026levelOfDetail/wang2026levelOfDetail.pdf) |
| **单位** | NVIDIA / UC Irvine / UIUC |

---

## 核心贡献

> ReSTIR 的既有 shift mapping 都要求**跨帧网格拓扑相同**，因此几何 LOD 切换时复用必然失效。本文引入**表面点映射 (surface point mapping)**，在**拓扑不同**的表面之间建立**部分双射**，从而让 ReSTIR 在动态 LOD 下保持有效的时空复用。

1. **表面点映射 τ** —— 用**共享的规范参数化（UV 坐标）**在不同 LOD 的表面之间建立顶点对应，进而构成对 shift mapping 的扩展。
2. **LoD-aware ReSTIR path tracing**：把新映射接入 shift mapping 算法，使**跨帧 LOD 切换时的复用保持有效**。
3. **效果**：在 LOD 场景中**恢复复用效率**，渲染质量显著优于既有 ReSTIR 方法。

---

## 技术方案

### 核心思想

**背景**：几何 LOD（level of detail）广泛用于实时渲染——用预过滤的表示替换高频几何，降低成本。但在 ReSTIR 中：

> ReSTIR 的样本复用依赖 **shift mapping**，而既有 shift mapping 都要求**跨帧网格拓扑相同**。当物体的 LOD 等级切换时，**网格拓扑改变**，复用即失效。

**本文解法**：不要求拓扑相同，而是构造**表面点对应关系**，让 shift mapping 能跨拓扑变化工作。

### 关键技术

| 组件 | 设计 | 说明 |
|------|------|------|
| **顶点映射 τ** | `τ: Ω₁ → Ω₂` 及其逆 `τ⁻¹`，**双射地**映射关联表面 `S₁ ⊂ Ω₁` 与 `S₂ ⊂ Ω₂` 之间的顶点 | `S₁` 与 `S₂` **拓扑可以不同**。允许 `τ`/`τ⁻¹` 是**部分双射**（部分表面点在对侧无像）→ shift mapping 偶尔失败，这通常不可避免 |
| **非重叠 UV 参数化（简单情形）** | 用**纹理坐标作为共享的规范参数化**：若 `Φ₁: S₁→R²` 与 `Φ₂: S₂→R²` 是一对一（UV 非重叠），则直接取 `τ(x) = Φ₂⁻¹(Φ₁(x))` | 即「同一 UV 坐标对应同一表面点」 |
| **一般 UV 参数化（多对一情形）** | 考虑**所有共享纹理坐标 `v`** 的表面点（来自两个表面）；在世界空间做**最近点匹配** | 用 Algorithm 1 的贪心最近点匹配消解「多点映射到同一 UV」的歧义 |
| **Algorithm 1: MatchPoints** | 贪心：每轮在两个点集中找**世界空间最近点对** `(x₁*, x₂*)`，加入匹配集 `M`，从两个点集中各移除该点，直到某一方为空 | 输出**无向**表面点匹配 `M` |
| **Shift mapping 扩展** | 把新顶点映射 `τ` **同时**用于**主命中顶点 (A)** 与**重连顶点 (B)** | 消融表明：只用于 A 或只用于 B 都会损失质量，但**仍优于完全不用**；而基线「始终用三角形索引 + 重心坐标映射两个顶点」→ LoD 切换时复用必然失败 |
| **非可逆 UV 的歧义消解** | 世界空间的最近点匹配 | 见 Fig. 6 |

---

## 公式

```math
% 顶点映射（部分双射，允许跨拓扑）
\tau : \Omega_1 \to \Omega_2,
\qquad
\tau^{-1} : \Omega_2 \to \Omega_1,
\qquad
\tau(\mathbf{x}) = \Phi_2^{-1}\big(\Phi_1(\mathbf{x})\big)
```

```math
% shift mapping 作为部分双射的定义
\text{partial bijection from } A \text{ to } B:
\quad \exists\, f: A' \to B',\ A' \subseteq A,\ B' \subseteq B,\ \text{bijective}
```

```math
% Algorithm 1 的贪心最近点匹配
(\mathbf{x}_1^*, \mathbf{x}_2^*) = \arg\min_{\mathbf{x}\in X_{1,v},\,\mathbf{y}\in X_{2,v}}
\Big\| \mathbf{x} - \mathbf{y} \Big\|_2
```

```math
% 世界空间距离对应的立体角半径（复用自 Compatibility-Guided 论文）
s = \sqrt{\frac{\Omega\, d^2}{\pi}},\qquad d = \|\mathbf{x}_1 - \mathbf{x}_0\|
```

---

## 代码片段

```cpp
// Algorithm 1: 匹配两个 LOD 表面的表面点（依论文伪代码重构）
// 返回无向匹配对
std::vector<std::pair<Vec3,Vec3>> match_points(
    const std::vector<Vec3>& X1_v,   // 共享纹理坐标 v 的 S1 表面点
    const std::vector<Vec3>& X2_v)   // 共享纹理坐标 v 的 S2 表面点
{
    std::vector<std::pair<Vec3,Vec3>> M;
    // 贪心最近点匹配：每轮取世界空间最近的一对并移除
    // 实现提示：用空间哈希网格加速最近邻查询
    SpatialHash grid(X2_v);
    std::vector<bool> used1(X1_v.size(), false), used2(X2_v.size(), false);

    while (true) {
        double best = std::numeric_limits<double>::max();
        int bi = -1, bj = -1;
        for (size_t i = 0; i < X1_v.size(); ++i) {
            if (used1[i]) continue;
            for (int j : grid.near(X1_v[i])) {     // 只查邻近候选
                if (used2[j]) continue;
                double d2 = (X1_v[i] - X2_v[j]).length_squared();
                if (d2 < best) { best = d2; bi = (int)i; bj = j; }
            }
        }
        if (bi < 0) break;                         // 某一方耗尽 -> 结束
        M.emplace_back(X1_v[bi], X2_v[bj]);
        used1[bi] = true; used2[bj] = true;
    }
    return M;
}

// 非重叠 UV 的快速路径：同 UV 直接对应
inline Vec3 vertex_map(const Vec3& x,
                       const UVMap& phi1, const UVMap& phi2)
{
    return phi2.inverse(phi1(x));      // tau(x) = Phi_2^{-1}(Phi_1(x))
}
```

---

## 实验结论

- **场景**：Coastal Cliff（相机向前移动逼近远处悬崖）。
- **对比设置（等时 50 ms）**：与 SOTA ReSTIR path tracing（Liu et al. 2025）比较，后者分别用于**动态 LOD 几何**与**固定最高细节几何**。

| 方法 | RelMSE |
|------|--------|
| Baseline + Highest detail（固定最高细节） | **0.104** |
| Baseline + LoD（动态 LOD） | 0.126 |
| **Ours（跨 LOD 切换保持有效复用）** | **0.092** |

- **解读**：预过滤几何（LOD）通常**降低**高频变化、从而降低噪声；但**当悬崖切换 LOD 时，拓扑变化使既有 ReSTIR 无法做时域复用 → 噪声反而上升**（0.104 → 0.126）。本文方法在 LOD 切换时保持复用有效，把噪声降到 **0.092**，**优于两个基线**。

- **顶点映射位置的消融（Fig. 5）**：

| 配置 | RelMSE |
|------|--------|
| Ours（A + B 都用新 τ） | **0.127** |
| Base ReSTIR + A（仅主命中用新 τ） | 0.225 |
| Base ReSTIR + B（仅重连顶点用新 τ） | 0.287 |
| Base ReSTIR（都不用，始终按三角形索引 + 重心坐标映射） | **0.358** |

→ **两个顶点都必须用新映射**；只用其一虽仍优于完全不用，但损失显著。

- **匹配与不可逆 UV（Fig. 6）**：

| 场景 | Ours (w/ Matching) | Ours (w/o Matching) |
|------|---------------------|----------------------|
| Plane | 14.1 ms / **0.026** | 13.6 ms / 0.057 |
| Cube | 14.4 ms / **0.061** | 12.9 ms / 0.261 |

→ 世界空间最近点匹配对**多对一 UV** 场景是必需的（Cube 上 RelMSE 差 4 倍以上）。

- **其它基线**：**Path Tracing（B.2）** 因无样本复用产生噪声结果（Fig. 8）。

---

## 局限性

- **部分双射**：不是所有表面点在对侧都有像 → shift mapping 偶尔失败（论文明确承认「通常不可避免」）。
- 需要资产管线**提供可用的 UV 展开**（且 UV 在不同 LOD 间需语义一致）——这是**较强的前置条件**：程序化生成的 LOD 或 UV 未同步的资产需要额外处理。
- 一般 UV 情形下的**贪心最近点匹配**是 O(n²) 级别（论文用空间结构加速），大网格上有开销。
- 仅处理**几何 LOD**；材质 LOD / 外观 LOD 未涉及。
- 需要同时在**主命中与重连顶点**上应用映射——实现上要改动 shift mapping 的多个环节。

---

## 相关工作

- [[ReSTIR]]
- [[ReSTIR PT]]
- [[Shift Mapping]]
- [[Hybrid Shift Mapping]]
- [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection|Compatibility-Guided Neighbor Selection for ReSTIR]]

---

## 实现建议

- **实现难度**：**中**。
  - 核心是一个**顶点/表面点映射 τ**，可在 shift mapping 的两个顶点（主命中、重连）上接入；
  - 难点在**资产侧**：需要 LOD 各级之间保持 UV 一致（程序化 LOD 需生成匹配的 UV）。
- **预期性能**：Coastal Cliff 等时 50 ms 下 RelMSE 0.092 vs 动态 LOD 基线 0.126（**改善 ~27%**），且优于固定最高细节的基线 0.104。
- **适用场景**：
  1. **使用动态几何 LOD 的实时路径追踪器**（大型场景、远景几何、开放世界）——这是目前 ReSTIR 的**明确空白区**；
  2. 任何**拓扑逐帧变化**的场景（程序化网格、变形几何、geometry cache 切换）。
- **行动建议**：**✅ 推荐实现，优先级：中高**。
  - 理由：这是**已知问题上的首个解决方案**，且效果明确（RelMSE 0.126 → 0.092）。对有动态 LOD 的场景是**直接可用**的改进。
  - 落地前检查项：
    1. **资产管线是否有 LOD 间一致的 UV**？若无，这是**主要工作量**（可能超过渲染器侧改造）；
    2. 主命中与重连顶点**都要**应用映射（消融显示只做一处会损失大量质量）；
    3. 多对一 UV 场景必须实现世界空间最近点匹配（Cube 场景 RelMSE 差 4 倍）。
  - 若资产侧 UV 不可得，则优先级下调至**低**。
