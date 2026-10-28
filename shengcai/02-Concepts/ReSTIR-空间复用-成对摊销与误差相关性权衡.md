---
type: concept
created: 2026-10-28
tags: [concept, 渲染, ReSTIR, 实时渲染, 空间复用]
domain: rendering
agent: shengcai
related: [[ReSTIR]], [[ReSTIR PT]], [[Compatibility-Guided Neighbor Selection for ReSTIR]]
---

# ReSTIR 空间复用中的成对摊销与误差-相关性权衡

## 定义

ReSTIR（Reservoir-based Spatiotemporal Importance Resampling）通过在**像素**与**帧**之间重采样路径来降低实时路径追踪的噪声。**空间复用**环节通常需要为每个当前像素向若干邻居做双向 shift：

- 把**邻居的路径 shift 到当前像素**（以复用其样本）；
- 把**当前像素的路径 shift 到邻居**（以计算 pairwise MIS 权重）。

传统实现中，每个邻居需要**两次 shift**，成本随邻居数 `M` 线性增长。

## 核心原理

### 1. 成对摊销（reciprocal neighbor selection）

**观察**：像素 `A` 从 `B` 复用时，需要的 shift mapping 是 `A→B` 与 `B→A`；而当 `B` 从 `A` 复用时，需要的恰好是**同一组** shift mapping（只是方向相反）。

因此可以把像素**预配对**：`A` 存到 `B` 的坐标偏移，`B` 存到 `A` 的坐标偏移。`A` 完成对 `B` 的复用后，`B` 可以**零成本**地从 `A` 复用。

> 结果：空间复用成本直接**减半**（14.79 ms → 4.11 ms，含其它优化）。

**实现要点**：
- 预计算一张**随机 reuse texture**，存储每个像素的耦合邻居偏移；
- 几何/法线不兼容时 shift mapping 会失败 → 需配合鲁棒的重连判据（见下）。

### 2. 误差-相关性权衡（error-correlation tradeoff）

**这是比邻居选择算法本身更重要的认知**：

- ReSTIR 的复用越**有效**，被复用样本之间的**相关性**越高（更多像素共享同一初始候选的 shift 副本）。
- 相关性会：
  - 在时域上表现为**拖尾/相关伪影**；
  - 干扰**去噪器**——尤其当去噪器未针对 ReSTIR 的相关性训练时，反而**降低**最终去噪质量。

**实践建议**：某些实现会**增大复用半径** `R` 来降低输出相关性——尽管这会提高去噪前的方差，但最终图像质量反而改善。

**推荐评估协议**（不要只看单一误差指标）：

| 指标 | 含义 |
|------|------|
| **SMAPE** | 图像误差 |
| **空间协方差** | 半径 8 的圆盘内平均相对协方差 |

在 SMAPE-协方差平面上取 **Pareto 前沿的肘部**作为工作点。

**推荐参数**：`K ∈ [8, 32]`（候选数）、`R ∈ [30, 100]`（复用半径）。
（`R = 30` 恰好是 Bitterli et al. 2020 的经验取值，位于改进前 ReSTIR 的 Pareto 肘部——本文验证了这一经验值。）

### 3. 兼容性引导的邻居选择

用**连续兼容性分数**替代二值阈值：

```math
h(\mathbf{x}_1,\mathbf{y}_1) = h_p(\mathbf{x}_1,\mathbf{y}_1)\; h_n(\mathbf{x}_1,\mathbf{y}_1)
```

```math
h_p = \exp\!\left(-\frac{\|\mathbf{x}_1-\mathbf{y}_1\|}{s}\right),
\qquad s = \sqrt{\frac{\Omega d^2}{\pi}}
```

```math
h_n = \max(\mathbf{n}_{\mathbf{x}_1}\cdot\mathbf{n}_{\mathbf{y}_1},\,0)^{\beta},
\qquad \beta = 8,\ \Omega = 0.05
```

- 用 **G-buffer** 的主命中位置/法线计算（独立于积分用的样本与权重 → **保持 GRIS 无偏性**）；
- **材质项被证明冗余**（材质变化与位置/法线变化强相关）；
- 用**加权蓄水池抽样**（`M=1` 用 A-Chao，`M>1` 用 A-ES）从候选池按分数抽取；
- **提前终止**：高质量候选数（`h > 0.5`）超过 `M` 即退出。

**收益**：SMAPE **−6~29%**，时间协方差 **−22~49%**，增量成本仅 **2–5%**。

### 4. 样本重复度图（duplication map）

用**随机种子**检测「哪些像素共享同一样本」（= 同一初始候选的 shift 副本）：

```math
D = \frac{\#\{\text{周围 } 17\times17 \text{ 内共享本像素 random seed 的 reservoir}\}}{288}
\in [0,1]
```

```math
c_{\text{cap}} = \mathrm{lerp}\big(c_{\text{cap}}^{\text{Default}},\; c_{\text{cap}}^{\min},\; D^{\alpha}\big)
```

推荐 `c_cap^Default = 20`、`c_cap^min = 1`、`α = 0.1`。

> **代价**：该修正按具体样本调整置信度权重 → **破坏 MIS 权重的 partition of unity**，引入小偏差（困难场景约 **3.25% 绝对相对偏差**）。本质是「**以偏差换相关性**」。

## 公式

**pairwise MIS 权重的随机化（stochastic resampling MIS）**：

```math
\widetilde{m}_i(Y_i; Z) = \frac{K_{\bar{S}}(i)}{\widetilde{N}\,P(i)}\, m_i(Y_i)
```

其中 `K_S̄(i)` 是像素 `i` 在有放回抽样中的**重数**。无偏性要求：`P(i) > 0` 处处覆盖 `m_i(Y_i) > 0`。

这把完整 MIS 权重和 `Σm_i` 的 `O(M)` 成本降到 `O(Ñ)`。

## 相关论文

- [[ReSTIR PT Enhanced]]
- [[Compatibility-Guided Neighbor Selection for ReSTIR]]
- [[Stochastic Pairwise MIS]]
- [[Multi-Layer Reservoir Splatting for Temporal Reuse under Disocclusion]]
- [[Real-Time Level-of-Detail Rendering with ReSTIR]]
- [[Gradient-Domain ReSTIR Path Tracing]]

## 代码实现

```cpp
// 成对空间复用：预计算的随机 reuse texture
struct ReuseTexture {
    int2   offsetToCoupledNeighbor;   // A 存到 B 的 delta，B 存到 A 的 delta
    uint32 reuseSeed;
};

// 兼容性分数（依赖 G-buffer 主命中）
__device__ float compatibility(const GBuffer& a, const GBuffer& b,
                               float omega = 0.05f, float beta = 8.0f)
{
    float d  = length(a.primaryPos - b.primaryPos);
    float s  = sqrtf(omega * d * d / PI);
    float hp = __expf(-d / (s + 1e-8f));
    float hn = powf(maxf(dot(a.primaryNormal, b.primaryNormal), 0.0f), beta);
    return hp * hn;
}
```

## 参考资料

- [ReSTIR PT Enhanced (I3D 2026 Best Paper)](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/)
- [Compatibility-Guided Neighbor Selection for ReSTIR (HPG 2026 Best Paper)](https://research.nvidia.com/labs/rtr/publication/junkins2026compatibility/)
- [Stochastic Pairwise MIS (EG 2026)](https://research.nvidia.com/labs/rtr/publication/hedstrom2026stochastic/)
- [A Gentle Introduction to ReSTIR](https://intro-to-restir.cwyman.org/)
