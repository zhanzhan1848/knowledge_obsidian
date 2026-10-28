---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, MIS, 工程优化, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
---

# ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing |
| **作者** | Daqi Lin, Markus Kettunen, Chris Wyman |
| **发表** | **Proc. ACM Comput. Graph. Interact. Tech. (I3D) Vol. 9, No. 1, Article 13, 2026 — Best Paper**；2026-05 发布 |
| **链接** | [NVIDIA RTG](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/) |
| **单位** | NVIDIA |

---

## 核心贡献

> ReSTIR 风格的时空间复用算法已大量涌现，理论改进层出不穷，但**算法改进与面向最优实现的工程洞察被严重忽视**。本文让 ReSTIR PT **快 2–3×**，同时**降低视觉与数值误差**、**提升鲁棒性**，使其更接近**生产可用**。

1. **Reciprocal neighbor selection（成对空间复用）**：通过**邻居配对**把空间复用成本**减半**。
2. **Footprint-based reconnection criteria**：用**与场景无关**的重连判据**鲁棒化 shift mapping**。
3. **Duplication maps（样本重复度图）**：用**自适应 `c_cap` 缩减**降低时空相关性。
4. **统一 direct 与 global illumination 到同一 reservoir**，并配合一系列工程优化（code micro-op、forced NEE reconnect、replay compaction、Russian roulette）。

**核心数字**：Baseline **37.1 ms / FLIP 0.321** → **ReSTIR PT Enhanced 12.6 ms / FLIP 0.263**。

---

## 技术方案

### 核心思想

**问题诊断**：作为已发表的 ReSTIR PT，在**高端 GPU 上仍是 40–80 ms/帧**（RTX 3090），且存在**鲁棒性问题**（时空相关性、相关区域伪影）。论文明确指出：**理论改进很多，算法与工程改进被忽视**。

### 关键技术

| 组件 | 做法 | 效果 |
|------|------|------|
| **Paired spatial reuse（reciprocal neighbor selection）** | ReSTIR PT 的空间/时域复用依赖 GRIS。邻居复用不仅要把邻居 shift 到当前像素，**还需把当前像素 shift 到邻居**以计算好的 MIS 权重——即使有高效的 pairwise MIS，**所有空间邻居都需要两次 shift，工作量翻倍**。<br>**观察**：`A` 从 `B` 复用后，`B` 从 `A` 复用**需要完全相同的 shift mapping** → `B` 可**免费**从 `A` 复用，**摊销重复的空间 shift，节省 50%**。<br>**实现**：预计算一张**随机 reuse texture**，存储每个像素的耦合邻居的**坐标偏移**；`A` 存到 `B` 的 delta，`B` 存到 `A` 的 delta | **空间复用成本减半** |
| **Footprint-based reconnection criteria** | 用**与场景无关**的判据决定 shift mapping 是否接受重连。<br>几何与 microfacet NDF 项在 `ω_t(x̄)f(x̄)/p_t(x̄)` 中**相消**，从而避免 shift 中出现极值；阈值旨在**约束这些密度的变化量**。<br>对**低粗糙度**材质，footprint-based 界可能不可靠 → 需要一个在典型场景中表现良好的 **footprint 参数 `c`**。对**非参数化材质**（non-parametric materials）另作处理 | **鲁棒化 shift mapping** |
| **Duplication maps（自适应 `c_cap`）** | 相关性度量：统计空间邻域中与当前像素**共享同一样本**的像素数（通过比较已存储的 random seed 检测，因为共享样本 = 从同一初始候选 shift 出的副本）。<br>**算法**：(1) 每帧结束后计算 duplication map——每像素统计周围 **17×17** 区域中共享其 random seed 的 reservoir 数，除以 **288** 得 duplication score `D ∈ [0,1]`；(2) 做时域重采样时，查该时域 reservoir 对应的 duplication score（把当前像素反投影到前一帧）；(3) 计算修正的 `c_cap = lerp(c_cap^Default, c_cap^min, D^α)`，其中 `c_cap^Default` 默认 **20**（Lin et al. 2022），`c_cap^min` 是 `D=1` 时使用的最小 `c_cap`，`α` 控制缩减敏感度（`α=1` 线性缩减，`α→0` 随 `D` 增大快速缩减）。<br>**作者实测 `c_cap^min = 1`、`α = 0.1` 效果良好** | 大幅减少高能量样本造成的**相关性伪影** |
| **Unify DI & GI** | 把 **direct 与 global illumination 统一到同一 reservoir**（而非分离到不同 reservoir） | 显著降低 pass 数（见 Table 1：`and others` 从 5.24 → 1.00 ms） |
| **工程优化（第 6 节）** | ① **Code micro-op**（§6.2.1）；② **Replay compaction**（§6.2.2）；③ **Forced NEE reconnect**（§6.2.3）；④ **Russian roulette**（§6.2.4） | 逐项贡献见下表 |

### 底层的重连判据（几何与 microfacet 项相消）

```math
\text{几何与 microfacet NDF 项在 } \omega_t(\bar{x})f(\bar{x})/p_t(\bar{x}) \text{ 中相消}
\quad\Rightarrow\quad
\text{避免 shift 中出现极值}
```

---

## 公式

**Paired spatial reuse 的 shift 摊销：**

```math
\text{shift}(A \to B) \equiv \text{shift}(B \to A)
\quad\Rightarrow\quad
\text{B 从 A 复用无需额外 shift} \;\Rightarrow\; \text{成本减半}
```

**Duplication score 与自适应 `c_cap`：**

```math
D = \frac{\#\{\,\text{周围 } 17\times17 \text{ 区域内共享本像素 random seed 的 reservoir}\,\}}{288}
\in [0,1]
```

```math
c_{\text{cap}} = \mathrm{lerp}\big(c_{\text{cap}}^{\text{Default}},\; c_{\text{cap}}^{\min},\; D^{\alpha}\big)
```

```math
c_{\text{cap}}^{\text{Default}} = 20,\qquad
c_{\text{cap}}^{\min} = 1,\qquad
\alpha = 0.1
```

**Footprint-based 重连界（概念式）：**

```math
\big|\Delta\big(\omega_t(\bar{x})f(\bar{x})/p_t(\bar{x})\big)\big| < \text{threshold}(c)
```

---

## 代码片段

```cpp
// Paired spatial reuse：reciprocal neighbor selection
// 预计算随机 reuse texture：每个像素存到其耦合邻居的坐标偏移
struct ReuseTexture {
    // A 存到 B 的 delta，B 存到 A 的 delta（互为逆）
    int2   offsetToCoupledNeighbor;
    uint32 reuseSeed;
};

// 空间复用 pass：像素 A 从耦合邻居 B 复用
__device__ void spatial_reuse_paired(int pixelA, int pixelB, ...)
{
    // 1) shift A -> B（一次）
    // 2) shift B -> A（同一组 shift mapping，A 复用后 B 可免费复用）
    // 3) 用 pairwise MIS 权重合并
}

// Duplication map：每帧结束后统计
__device__ void compute_duplication_map(
    const uint32* randomSeeds,   // 每像素的 random seed
    int width, int height,
    float* D_out)               // duplication score in [0,1]
{
    const int R = 8;             // 17x17 -> 半径 8
    const float INV = 1.0f / 288.0f;
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            uint32 mySeed = randomSeeds[y * width + x];
            int   count   = 0;
            // 统计 17x17 邻域内共享同 seed 的 reservoir 数
            for (int dy = -R; dy <= R; ++dy)
                for (int dx = -R; dx <= R; ++dx) {
                    int nx = x + dx, ny = y + dy;
                    if (nx < 0 || nx >= width || ny < 0 || ny >= height) continue;
                    if (randomSeeds[ny * width + nx] == mySeed) ++count;
                }
            D_out[y * width + x] = count * INV;
        }
    }
}

// 自适应 c_cap（时域重采样时）
__device__ float adaptive_cap(float D,
                              float cDefault = 20.0f,   // Lin et al. 2022 默认
                              float cMin     = 1.0f,
                              float alpha    = 0.1f)
{
    float t = powf(D, alpha);
    return lerp(cDefault, cMin, t);
}
```

---

## 实验结论

### Table 1：帧与 pass 耗时（4 个场景平均：Veach Ajar、Carousel、Opera House、Bathroom）

| 方法 | Total | Initial sampling | Temporal reuse | Spatial reuse | and others |
|------|-------|------------------|----------------|---------------|------------|
| **Baseline（Lin et al. 2022）** | 35.73 | 10.59 | 5.30 | 14.79 | 5.05 |
| + Code microop (§6.2.1) | 32.98 | 10.70 | 4.16 | 13.06 | 5.07 |
| + Forced NEE reconnect (§6.2.3) | 29.75 | 11.44 | 3.40 | 9.73 | 5.19 |
| + Replay compaction (§6.2.2) | 26.81 | 11.79 | 2.66 | 6.99 | 5.37 |
| **+ Paired spatial reuse (§3)** | 25.02 | 12.56 | 2.80 | **4.11** | 5.55 |
| + Russian roulette (§6.2.4) | 16.52 | 5.21 | 2.24 | 3.83 | 5.24 |
| **+ Unify DI & GI (§6.1)** | **13.04** | 6.47 | 2.14 | 3.43 | **1.00** |

- **空间复用成本**：14.79 ms → **4.11 ms**（约 **3.6×** 降幅，其中 paired reuse 单项贡献最大：6.99 → 4.11 ms）。
- 相对官方 2022 版本仍 **2.30× 更快**（即使不含质量改进）。

### 头图对比数字

| 方法 | 帧时 | FLIP |
|------|------|------|
| Original ReSTIR PT | **37.1 ms** | 0.321 |
| **ReSTIR PT Enhanced** | **12.6 ms** | **0.263** |

→ **快 2.94×**，同时 FLIP **改善 0.058**。

### 其他

- **Adaptive `c_cap` 的偏差**：该方法按具体样本调整置信度权重 → **破坏了 MIS 权重 `m_i` 的 partition of unity**，引入**小偏差**。偏差只出现在我们修改 `c_cap` 的**相关区域** → 本质是「**以偏差换相关性**」。在最困难的场景中，平均 **3.25% 绝对相对偏差**。

---

## 局限性

- **Adaptive `c_cap` 引入偏差**（3.25% 绝对相对偏差，困难场景）——作者明确承认这是「以偏差换相关性」的自觉权衡。
- **Paired spatial reuse 的耦合邻居是随机预计算的**：像素对是随机的，可能**配对到几何上不兼容的邻居** → 由 footprint-based 重连判据兜底，但仍有潜在损失。
- **Footprint-based 界对低粗糙度材质不可靠** → 需要调 footprint 参数 `c`。
- **实现是 NVIDIA 特定**（Falcor 框架 + 特定硬件特性），移植到其他引擎需重新设计。
- 消融表显示：**部分优化的收益相互依赖**（如 Russian roulette 单独带来 25.02 → 16.52 ms 的大幅下降），实际移植需整体评估。

---

## 相关工作

- [[ReSTIR PT]]
- [[Pairwise MIS]]
- [[ReSTIR]]
- [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection|Compatibility-Guided Neighbor Selection for ReSTIR]]
- [[2026-10-28_ReSTIR-Stochastic-Pairwise-MIS|Stochastic Pairwise MIS]]
- [[2026-10-28_ReSTIR-Multi-Layer-Reservoir-Splatting|Multi-Layer Reservoir Splatting]]

---

## 实现建议

- **实现难度**：**中高**。各优化点相对独立，但需要理解 ReSTIR PT 的 GRIS/pairwise MIS 内部结构才能正确实现 shift 摊销与重连判据。
- **预期性能**：
  - **37.1 ms → 12.6 ms（2.94×）**，FLIP **0.321 → 0.263**（同时变快变好）；
  - 空间复用单独 **14.79 → 4.11 ms**；
  - 增量成本接近零（多数是「省掉重复工作」而非「加计算」）。
- **适用场景**：**所有使用 ReSTIR PT 的实时路径追踪器**——游戏引擎 RT、影视渲染器。
- **行动建议**：**✅ 推荐实现，优先级：高**。这是本批次**性价比最高的工程论文**：
  1. **Reciprocal neighbor selection（成对空间复用）**：**改动小、收益大、几乎零成本**——空间复用直接减半，且**降级风险低**（几何/法线不兼容时退回原路径）。**首选落地项**；
  2. **Unify DI & GI 到同一 reservoir**：`and others` 从 5.24 → 1.00 ms，**架构级收益**，但需确认是否会与自有管线的直接光策略冲突。**次选**；
  3. **Duplication map + 自适应 `c_cap`**：消除相关性伪影效果显著，但**引入 3.25% 偏差**——对精度敏感的场景需谨慎。**建议先在「已知有拖影/相关伪影」的动态场景试点**；
  4. **Footprint-based 重连判据**：鲁棒性提升，**作为 shift mapping 的通用加固项**推荐同步引入。
  - 附注：本文的**方法论立场**值得团队采纳——「ReSTIR 领域理论论文多、算法与工程论文少，而后者对落地价值更大」。
