---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, 空间复用, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://dl.acm.org/doi/full/10.1145/3820024
---

# Compatibility-Guided Neighbor Selection for ReSTIR

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Compatibility-Guided Neighbor Selection for ReSTIR |
| **作者** | Orion Junkins, Markus Kettunen, Daqi Lin, Ravi Ramamoorthi, Chris Wyman |
| **发表** | **Proc. ACM Comput. Graph. Interact. Tech. (HPG) Vol. 9, No. 4, Article 52, 2026 — Best Paper**；DOI **10.1145/3820024**；在线发布 2026-06-29 |
| **链接** | [ACM DL](https://dl.acm.org/doi/full/10.1145/3820024) ｜ [NVIDIA RTG](https://research.nvidia.com/labs/rtr/publication/junkins2026compatibility/) |
| **单位** | NVIDIA / UC Irvine |

---

## 核心贡献

> ReSTIR 的空间复用质量取决于**邻居与当前像素的路径兼容性**。本文把这件事从「二值阈值」升级为「连续兼容性打分 + 加权蓄水池抽样」，用极小的增量成本同时降低**误差**与**时间相关性**，并把 ReSTIR 的**误差-相关性 Pareto 前沿**整体推向外移。

1. **简单的 drop-in 替换**：改进后的空间邻居选择算法，**兼容任何像素空间 ReSTIR 技术**（论文在 ReSTIR PT 上验证，同时说明也适用于 Bitterli et al. 2020 的 ReSTIR DI）。
2. **定量收益**：**SMAPE 降低 6–29%**，**时间协方差降低 22–49%**，**增量成本仅 2–5%**。
3. **理论根基**：
   - 分析像素间的**路径兼容性**；
   - 实证研究 ReSTIR 的**基本误差-相关性权衡**；
   - 改进该权衡的 **Pareto 前沿**，并提供在方差与相关性之间调节的**可调控制**。

---

## 技术方案

### 核心思想

ReSTIR 的空间复用把当前像素的样本「shift」到邻居像素去复用。但 shift mapping 能否成功，取决于**两个像素的主命中（primary hit）是否相似**——位置、法线、材质越接近，复用越可能成功且不引入偏差。

**Bitterli et al. 2020 的做法**是**二值阈值**（binary threshold）：只有当邻居与当前像素足够相似才允许复用。
**问题**：
- 阈值会**剔除有害像素**（这是好的），但
- 若只提出**边界附近**的邻居，二值阈值可能**把它们全部剔除** → 此时「一个略低于阈值的邻居」也优于「完全没有邻居」。

**本文做法**：不设硬阈值，而是**从大候选池中按兼容性分数加权抽样**——既保留剔除有害邻居的效果，又不浪费「略差但可用」的邻居。

### 兼容性启发式的推导

**分析依据**：Lin et al. 2022 的 ReSTIR PT 使用 **hybrid shift**，它在镜面上通过**随机重放（random replay）**推迟重连。hybrid shift 的随机重放顶点，只有在**主命中位置、法线、材质相似**时才最接近原始顶点。无论 shift mapping 与路径长度如何，我们都想选**主命中位置、法线、材质相似**的邻居。

**与 reservoir splatting / area ReSTIR 的联系**：这些近期的时域重采样工作正是要**精确保持跨帧的主命中**。本文把这个概念**应用到空间重采样**：显式寻找主命中位置、法线、材质相似的邻居，以提高复用成功率。

**启发式形式**：沿用 Dammertz et al. 2010 与 Schied et al. 2017 的**边缘停止函数**（edge-stopping function）形式——法向兼容项与位置兼容项之**乘积**：

```math
h(\mathbf{x}_1, \mathbf{y}_1) = h_p(\mathbf{x}_1,\mathbf{y}_1)\; h_n(\mathbf{x}_1,\mathbf{y}_1)
```

```math
h_p(\mathbf{x}_1, \mathbf{y}_1) = \exp\!\left(-\frac{\|\mathbf{x}_1 - \mathbf{y}_1\|}{s}\right),
\qquad
h_n(\mathbf{x}_1, \mathbf{y}_1) = \max\big(\mathbf{n}_{\mathbf{x}_1}\cdot\mathbf{n}_{\mathbf{y}_1},\,0\big)^{\beta}
```

其中 `s = √(Ω d²/π)` 是对应立体角 `Ω` 的世界空间半径（Keller et al. 2016），`d = ‖x_1 − x_0‖` 为当前主命中距离。取 `Ω = 0.05`、`β = 8`。

**材质项被显式省略**：作者最初加入了**二值的材质一致性检查**，但在测试场景中**无可测收益**。假设材质变化与位置/法线变化强相关，故独立材质项是冗余的。（作者指出：边缘情形下显式处理材质可能仍有帮助，是未来方向。）

**为什么用 G-buffer 属性做引导是安全的**：用 **G-buffer 值**（独立于用于积分的样本与权重）引导选择，**保持了 GRIS 的无偏性**（Wyman et al. 2023）。

### 算法 1：兼容性引导的邻居选择

```text
Input : G-buffer G, 当前像素 i, 候选数 K, 返回邻居数 M, 搜索半径 R
Output: M 个选中的邻居

初始化 WRS 蓄水池 ℛ（容量 M）
for k = 1 to K:
    j ← randomPixelFromDisk(i, R)        # 从 R 半径圆盘内随机取候选
    w ← h(G[i], G[j])                     # Eq.14 兼容性启发式
    ℛ.insert(j, w)                        # 按兼容性比例抽样
return ℛ.chosenPixels
```

**加权蓄水池抽样 (WRS)**：
- `M = 1` 时用 **Chao 1982 的 A-Chao 算法**（与既有 ReSTIR 论文一致）；
- `M > 1` 时用 **A-ES 算法**（Efraimidis 2015），保证选出 `M` 个**互不重复**的样本（前提：输入唯一）。

**提前终止 (early stopping)**：跟踪高质量候选数（`h(i,j) > 0.5`），若超过 `M` 则提前终止 → 降低运行时，**在简单场景中尤为明显**，对质量影响极小。

**圆盘采样**：从圆盘内采 `K` 个候选的方式是——把二维 `R²` 序列用**随机起始索引**（Roberts 2018）经**同心映射**（concentric mapping，Shirley & Chiu 1997）映射到圆盘。出于性能考虑，实现**预计算 8192 个随机偏移**。

### 误差-相关性权衡分析

使用 area reservoirs（Zhang 2024）+ reservoir splatting（Liu 2025）时，初期观察到**图像质量显著改善，但相关性也上升**。

论文绘制不同复用半径下的 **SMAPE³ vs 协方差**曲线，发现**图像误差与协方差之间存在根本性权衡**：
- 改变复用半径即可在协方差与误差之间交易；
- **固定半径下**，本文的邻居选择因复用更有效而**协方差上升**；
- 但**增大空间复用半径**可降低协方差，同时**保留显著的质量改善**；
- 协方差度量方式：在**半径 8 的圆盘内**平均相对协方差。

**推荐参数**：
- 候选数 **`8 ≤ K ≤ 32`**（更大的 `K` 增加成本但质量收益递减）；
- 半径 **`30 ≤ R ≤ 100`**（误差与相关性的良好折中，位于 Pareto 曲线**肘部**）。
- 这同时**验证了** Bitterli et al. 2020 经验选取的 `R = 30`——它确实位于改进前 ReSTIR 的 Pareto 曲线肘部。

---

## 公式

```math
% 兼容性启发式
h(\mathbf{x}_1,\mathbf{y}_1) = h_p(\mathbf{x}_1,\mathbf{y}_1)\,h_n(\mathbf{x}_1,\mathbf{y}_1)
```

```math
h_p(\mathbf{x}_1,\mathbf{y}_1) = \exp\!\left(-\frac{\|\mathbf{x}_1-\mathbf{y}_1\|}{s}\right),
\qquad
s = \sqrt{\frac{\Omega d^2}{\pi}}
```

```math
h_n(\mathbf{x}_1,\mathbf{y}_1) = \max\big(\mathbf{n}_{\mathbf{x}_1}\cdot\mathbf{n}_{\mathbf{y}_1},\,0\big)^{\beta},
\qquad \beta = 8,\ \Omega = 0.05
```

```math
% 加权蓄水池抽样（A-ES, Efraimidis 2015）
u_j \sim \mathrm{Uniform}(0,1),
\qquad
\text{key}_j = u_j^{1/w_j},
\qquad
\text{select top-} M \text{ by key}
```

```math
% 空间协方差度量
\mathrm{Cov}_8 = \mathbb{E}_{\|\Delta p\| \le 8}\big[\mathrm{corr}\big(\hat{p}_t,\ \hat{p}_{t-1}\big)\big]
```

---

## 代码片段

```cpp
// 兼容性引导的邻居选择（依论文 Algorithm 1 重构）
__device__ float compatibility(const GBuffer& a, const GBuffer& b,
                               float omega = 0.05f, float beta = 8.0f)
{
    // 位置兼容项：s = sqrt(Omega * d^2 / pi) 为对应立体角的世界空间半径
    float d   = length(a.primaryPos - b.primaryPos);
    float s   = sqrtf(omega * d * d / PI);
    float hp  = __expf(-d / (s + 1e-8f));

    // 法线兼容项：max(dot, 0)^beta
    float ndot = maxf(dot(a.primaryNormal, b.primaryNormal), 0.0f);
    float hn   = powf(ndot, beta);

    // 材质项被证明冗余，故省略
    return hp * hn;
}

// 加权蓄水池抽样（A-ES）：M=1 用 A-Chao，M>1 用 A-ES
struct AChaoReservoir {
    float  w;         // 当前保留样本的权重
    int    idx;       // 像素索引
    // insert(j, weight)
    __device__ void insert(int j, float weight) {
        if (weight > w) { w = weight; idx = j; }
    }
};

// 圆盘采样：R^2 序列 + 随机起始索引 -> 同心映射
__device__ vec2 concentric_disk_sample(vec2 u, float radius) {
    // Shirley & Chiu 1997 的同心映射
    float ox = 2.0f * u.x - 1.0f, oy = 2.0f * u.y - 1.0f;
    float theta, r;
    if (ox == 0.0f && oy == 0.0f) { return vec2(0.0f); }
    if (abs(ox) > abs(oy)) { r = ox; theta = (PI/4.0f) * (oy/ox); }
    else                   { r = oy; theta = PI/2.0f - (PI/4.0f) * (ox/oy); }
    return radius * r * vec2(cosf(theta), sinf(theta));
}

// 提前终止：高质量候选数超过 M 时退出
// if (++high_quality_count > M) break;   // h(i,j) > 0.5
```

---

## 实验结论

- **实现**：在 Liu et al. 2025（ReSTIR PT + reservoir splatting）的代码中实现该邻居选择。
- **配置**：ReSTIR PT，使用 area reservoirs（Zhang et al. 2024）+ reservoir splatting（Liu et al. 2025）。
- **结果**：
  - **SMAPE 降低 6–29%**；
  - **时间协方差降低 22–49%**；
  - **增量成本 2–5%**；
  - 在 SMAPE-协方差平面上，**Pareto 前沿整体外移**（Fig. 1）。
- **参数敏感性**：`K ∈ [8, 32]`，`R ∈ [30, 100]`；`R = 30` 被验证位于 Pareto 肘部。
- **早期终止**：在简单场景中显著降低运行时，对质量影响极小。

---

## 局限性

- 启发式基于**主命中位置、法线**；**材质项被证明冗余**，但作者承认在边缘情形（材质剧变而位置法线不变）可能仍需显式处理。
- 兼容性打分依赖 **G-buffer 属性**，要求渲染管线能导出主命中位置与法线（无 G-buffer 的纯 BSDF 路径追踪场景不适用）。
- 早期终止依赖「场景简单」的前提；在复杂场景中收益减少。
- 需要**空间协方差度量**（半径 8 圆盘内平均）来评估质量-相关性权衡，这本身有额外分析成本。

---

## 相关工作

- [[ReSTIR]]
- [[ReSTIR PT]]
- [[Area ReSTIR]]
- [[Reservoir Splatting]]
- [[Hybrid Shift Mapping]]

---

## 实现建议

- **实现难度**：**低**。这是**可插拔的 drop-in 替换**——只需替换空间邻居选择逻辑，不动 ReSTIR 的其余部分。工作量约数十行 CUDA。
- **预期性能**：SMAPE −6~29%、时间协方差 −22~49%、增量成本仅 2~5%。**性价比是本批次论文中最高的**。
- **适用场景**：**任何使用 ReSTIR 空间复用的实时路径追踪器**——游戏引擎 RT、影视离线渲染器、实时光追 demo。
- **行动建议**：**✅ 推荐实现，优先级：高**。
  - 理由：改动小、收益明确、且**兼容任何像素空间 ReSTIR 技术**，迁移成本极低。
  - 落地步骤：
    1. 在现有 ReSTIR 实现中暴露 G-buffer 主命中位置/法线；
    2. 替换空间邻居选择为加权蓄水池抽样（A-ES / A-Chao）；
    3. 用 `K ∈ [8,32]`、`R ∈ [30,100]` 做扫描；
    4. 用「SMAPE vs 空间协方差」而非单一指标评估（**重要**：只看误差会选到相关性差的工作点）。
  - 额外建议：可**直接复用其「误差-相关性双指标评估协议」**作为团队内部 ReSTIR 调参的评估规范。
