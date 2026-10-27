---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, 渲染, 神经渲染, SDF, Voronoi, 光栅化, 表面重建, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.35347
---

# CVTSplat: Multi-view Reconstruction Using an Adaptive Centroidal Voronoi Tessellation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CVTSplat: Multi-view Reconstruction Using an Adaptive Centroidal Voronoi Tessellation |
| **作者** | Briac Toussaint, Diego Thomas, Jean-Sébastien Franco, Edmond Boyer, Christian Theobalt（Imperial College London 等） |
| **发表** | arXiv preprint 2026-10-26（cs.CV / cs.GR，13 页） |
| **链接** | [原文](https://arxiv.org/abs/2610.35347) · [HTML](https://arxiv.org/html/2610.35347v1) |
| **DOI** | 10.48550/arXiv.2610.35347（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 用「自适应质心 Voronoi 划分（Adaptive CVT）」作为空间离散化：让单元尺寸随 SDF 变化（靠近零水平集处收缩），同时保持单元形状接近质心（regular cells），从而既拿到自适应表示的效率，又保留标准 Voronoi 的规则性，使整条 GPU 管线（KNN / Voronoi 构造 / 光栅化）都能被专门化。

1. **Biased CVT loss**：把标准 CVT 损失按 SDF 法向偏移，偏移量 β_i 随 SDF 值 tanh 饱和。单元半径随 SDF 近似线性增长，靠近零水平集的单元更小。**无需额外权重场**（不同于 power diagram 需每站点一个 weight 且构造成本更高）。
2. **Voronoi 邻接 = 2D 线性规划可行性测试**：把「某站点是否为 Voronoi 邻居」转化为一个 2D 线性不等式系统的可行性问题，用 **Seidel 增量算法**求解，并按距离升序处理约束（KNN 返回顺序），使不可行性通常在早期就被检出。GPU 上 32 线程/单元，每线程测一个候选平面 vs 剩余 37 个约束（31 邻居 + 6 个场景包围盒面）。
3. **Riemann 和近似计算单元体积与质心**：从 Fibonacci 球格（n=64 条射线）向最近 bisector 平面投射，直接求 $V_i$ 与 $\bar x_i$，避免四面体分解/多面体表示的开销。
4. **Warp-per-query GPU KNN**：**一个 warp 负责一个查询点**（而非一个线程负责一个查询点），共享单个 BVH 遍历栈 + 合并内存访问；ball-query 半径二分自适应到 32–64 个候选点，并跨帧复用上次半径。
5. **Chunked Rasterizer + 逐像素早退标志**：把体积渲染积分拆成 32 单元一块的 chunk 并行光栅化，用 atomic CAS 维护的逐 tile 透射率 $T_c$ 与距离计数器 $D_c$ 实现**动态遮挡跳过**，端到端训练时间 **280s → 147s（≈2×）**。
6. **结果**：DTU 15 场景平均 Chamfer **0.48 mm**（RTX 5090，**2.5 min** 训练），超越 2DGS（0.80 / 12min）、MILo（0.68 / 25min）、PGSR（0.52 / 30min）、GeoSVR（0.47 / 50min），与最佳基线 GGGS（0.47 / 15min）基本持平但**训练快 6×**。

---

## 技术方案

### 核心思想

**问题**：神经场表示（NeRF 系）需要 volumetric ray marching，每像素上百次网络求值，训练数小时到数天；显式 splatting（3DGS 系）训练快但几何精度不足（DTU 上 Chamfer 0.5–0.8+）。中间路线是「**隐式几何 + 显式离散化**」——用 SDF 描述形状，用一个空间离散结构承载 SDF 采样与外观。

**既有中间路线的问题**：
- RadiantFoam / SDFoam：用 Voronoi 单元承载 SDF，但单元内密度为常数 → 不反映局部表面朝向；且 Voronoi 单元形状不规则，导致「构造 Voronoi 图代价高」（不规则单元需访问大量邻近站点）。
- 标准 CVT：单元规则、计算高效，但站点趋于均匀分布 → 失去自适应的意义。

**解法**：设计 **adaptive CVT** —— 保留 CVT 的规则性（单元近质心），同时让单元尺寸由 SDF 调制。规则性带来三个红利：可以专门化 GPU 最近邻查询、可以专门化近似 Voronoi 构造、可以专门化针对「小而近各向同性」的单元的光栅化器。

**直觉**：几何精度需求集中在零水平集附近 → 那里需要更细的离散；远离表面处可以粗放。CVTSplat 不显式指定单元尺寸，而是让它们根据 SDF **自行安排**（与站点数量、表面面积解耦）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Biased CVT loss** | $L_{CVT}=\sum_i \frac{1}{s_g(r_i)}\|x_i-s_g(\bar x_i-\beta_i r_i n_i)\|_2^2$，$s_g(\cdot)$ 为 stop-gradient，$r_i$ 为单元半径。除以 $r_i$ 使损失尺度不变 |
| **偏移系数** | $\beta_i = a\cdot\tanh\!\big(\hat f_i/(2b)\big)$，$a,b>0$。实验中 $a=0.1$、$b=0.001$，即质心沿 SDF 梯度偏移 **10% 单元半径**；$a=0$ 退化为标准 CVT |
| **体积/质心 Riemann 和** | 从站点沿 $n=64$ 条 Fibonacci 球格射线量测到最近 bisector 平面距离 $l_k$；$V_i \approx \frac{4\pi}{3n}\sum l_k^3$，$\bar x_i - x_i \approx \frac{3}{4}\frac{\sum r_k l_k^4}{\sum l_k^3}$ |
| **Voronoi 单元 = 线性规划** | $C_i=\{x\in\mathbb R^3,\;(x-x_i)\cdot(x_j-x_i)\le\frac{1}{2}\|x_j-x_i\|_2^2,\;\forall j\neq i\}$ |
| **邻接测试** | 参数化 bisector 平面 $P_r$，代入得 2D 线性规划 $a_j u+b_j v\le c_j$；用 Seidel 增量算法测可行性；**按距离升序**处理约束 |
| **KNN kernel** | 经典 LBVH（每节点至多 128 点）+ ball-query（二分半径使候选数落在 32–64）；一个 warp 一个查询点；搜索半径跨帧复用 |
| **SPH 式属性平滑** | $G(u)_i = \frac{\sum_{j\in N(i)}u_j w_{ij}}{\sum_{j\in N(i)}w_{ij}}$，$w_{ij}=\frac{V_j\exp(-\|x_i-x_j\|^2/(2\sigma^2 R_i^2))}{R_i}$，$R_i=\max_{j\in N(i)}\|x_i-x_j\|$。可对空间坐标求导 → SDF 梯度 |
| **Piecewise-linear SDF** | $\hat f(x)=\hat f_i+(x-x_i)\cdot n_i,\;\forall x\in C_i$。单元间允许小的不连续，但换来体积积分的**闭式解** |
| **Chunked rasterizer** | 32 单元/块；逐 tile 维护 $T_c$（透射率累乘器）与 $D_c$（最远完成块深度索引），atomic compare-and-swap 更新 |
| **Appearance** | 方向相关外观用「光探针 + SH」而非每站点 SH（降低参数）；两个 32³ 体素网格 × 16 个 SH 系数 × R⁴；MLP 16 神经元 / 2 隐层 / squareplus 激活；探针参数量 ≈ 1 参数/primitive |
| **Delaunay** | 站点邻接矩阵编码 Delaunay 三角化，可从 Voronoi 顶点恢复（若需要更高精度可直接用精确计算替代 Riemann 近似） |

### 公式

**Bias CVT 损失（Eq. 1–2）**：
```math
\mathcal{L}_{\mathrm{CVT}}
= \sum_i \frac{1}{s_g(r_i)}\left\| x_i - s_g(\bar x_i - \beta_i r_i n_i) \right\|_2^2,
\qquad
\beta_i = a\cdot\tanh\!\left(\frac{\hat f_i}{2b}\right)
```

**体积与质心（Eq. 3–5）**：
```math
V_i = \int_{C_i} dx = \int_{\mathbb S^2}\int_0^{l(r)} s^2\,ds\,d\sigma
  \approx \frac{4\pi}{3n}\sum_{k=0}^{n-1} l_k^3
```
```math
\bar x_i - x_i
= \frac{1}{V_i}\int_{\mathbb S^2}\int_0^{l(r)} r\,s^2\,ds\,d\sigma
\approx \frac{1}{V_i}\frac{4\pi}{n}\sum_{k=0}^{n-1} \frac{r_k l_k^4}{4}
= \frac{3}{4}\frac{\sum_k r_k l_k^4}{\sum_k l_k^3}
```

**Voronoi 单元作为线性规划（Eq. 11）**：
```math
C_i = \Big\{ x\in\mathbb R^3,\; (x-x_i)\cdot(x_j-x_i) \le \tfrac{1}{2}\|x_j-x_i\|_2^2,\ \forall j\neq i \Big\}
```

**邻接 ⇔ 2D 规划可行（Eq. 12–15）**：
```math
x_r \text{ 是 } x_i \text{ 的 Voronoi 邻居}
\iff P_r \text{ 对 } C_i \text{ 激活}
\iff P_r \cap C_i \neq \emptyset
```
```math
P_r = \tfrac{1}{2}(x_r+x_i) + u e_1 + v e_2,
\qquad
a_j u + b_j v \le c_j,\quad j\neq i,\; j\neq r
```

**SPH 平滑与梯度（Eq. 16–18, 21–22）**：
```math
G(u)_i = \frac{\sum_{j\in N(i)} u_j w_{ij}}{\sum_{j\in N(i)} w_{ij}},
\qquad
w_{ij} = \frac{V_j \exp\!\big(-\|x_i-x_j\|^2/(2\sigma^2 R_i^2)\big)}{R_i}
```
```math
\hat f = G(f), \qquad n_i = \nabla_{x_i} G(\hat f)_i
```

**正则项（Eq. 23–25）**：
```math
\mathcal{L}_{\mathrm{SDF}} = \sum_i \frac{(f_i-\hat f_i)^2}{\max(|s_g(\hat f_i)|,\,0.01)}
```
```math
\mathcal{L}_n = \sum_i \Big\| \frac{\|n_i\|}{\|n_i\|_2} - s_g\!\Big(\frac{G(n_i)}{\|n_i\|_2}\Big) \Big\|_2^2,
\qquad
\mathcal{L}_{\mathrm{Eik}} = \sum_i (\|n_i\|_2-1)^2
```

**体积渲染与闭式解（Eq. 30–34）**：
```math
C = \int_0^{+\infty} c(t)\sigma(t)T(0,t)\,dt,
\qquad
T(0,t) = \exp\!\Big(-\int_0^t \sigma(u)\,du\Big),
\qquad
\sigma(t) = s\,\Phi(-s\hat f(t))\,|n\cdot r|
```
```math
C = \sum_i c_i (1-\alpha_i)\prod_{j<i}\alpha_j,
\qquad
\alpha_i = \frac{1+e^{-s\hat f(t_i^-)}}{1+e^{-s\hat f(t_i^+)}} \in [0,1]
```
（背向单元需对分数取倒数以保证 $\alpha\le 1$；求和按**到相机距离升序**遍历射线穿过的 Voronoi 单元，以保证几何一致而非深度一致的前向到后向混合。）

**射线/单元求交（Eq. 35–36）**，bisector 平面编码为 $\mathbf p_i^k\in\mathbb R^3$（方向为平面法向、背离站点，长度为站点到平面距离）：
```math
t_i^- = \max_{k:\mathbf p_i^k\cdot r<0}
\frac{\|\mathbf p_i^k\|_2^2 - (\mathbf o-\mathbf x_i)\cdot\mathbf p_i^k}{\mathbf r\cdot\mathbf p_i^k},
\qquad
t_i^+ = \min_{k:\mathbf p_i^k\cdot r>0}
\frac{\|\mathbf p_i^k\|_2^2 - (\mathbf o-\mathbf x_i)\cdot\mathbf p_i^k}{\mathbf r\cdot\mathbf p_i^k}
```
若 $t_i^-\ge t_i^+$ 则射线不与该单元相交。

**Chunked rasterizer 早退决策表**：
| | $T_c\ge\epsilon$ | $T_c<\epsilon$ |
|---|---|---|
| chunk index $< D_c$ | 不能跳过 | 不能跳过 |
| chunk index $> D_c$ | 不能跳过 | **可跳过** |

$T_c$ 是截至 chunk $D_c$ 的真实透射率的**上界**（因为更早的 chunk 可能尚未更新 $T_c$），因此 $T_c$ 低值保证后续 chunk 不会贡献最终颜色。

**图像损失（Eq. 37–42）**：
```math
\mathcal{L}_{\mathrm{RGB}} = \sum \frac{\|C_{\mathrm{final}}-C_{\mathrm{gt}}\|_2^2}{M\max(C_{\mathrm{gt}},0.01)},
\qquad
\mathcal{L}_{\mathrm{Mask}} = \sum (T-(1-M))^2
```
```math
\mathcal{L}_{\mathrm{DSSIM}} = \sum (1-\mathrm{SSIM}(C_{\mathrm{final}},C_{\mathrm{gt}}))M,
\qquad
\mathcal{L}_{\mathrm{MV}} = \sum (1-\mathrm{ZNCC}),
\qquad
\mathcal{L}_D = \sum |d - s_g(\bar d)|
```
```math
\mathcal{L} = \lambda_{\mathrm{RGB}}\mathcal{L}_{\mathrm{RGB}} + \lambda_{\mathrm{Mask}}\mathcal{L}_{\mathrm{Mask}}
+ \lambda_{\mathrm{DSSIM}}\mathcal{L}_{\mathrm{DSSIM}} + \lambda_{\mathrm{MV}}\mathcal{L}_{\mathrm{MV}}
+ \lambda_D\mathcal{L}_D + \lambda_{\mathrm{CVT}}\mathcal{L}_{\mathrm{CVT}}
+ \lambda_{\mathrm{SDF}}\mathcal{L}_{\mathrm{SDF}} + \lambda_n\mathcal{L}_n
+ \lambda_{\mathrm{Eik}}\mathcal{L}_{\mathrm{Eik}} + \lambda_{\mathrm{probes}}\mathcal{L}_{\mathrm{probes}}
+ \lambda_{Fs}\mathcal{L}_{Fs}
```

### 代码片段

```cuda
// GPU 实现要点（论文 §3.3 / §3.5 / §4.3.1 的伪代码级摘要）
// 1) 每个站点分配 32 个线程，每线程测试一个候选邻居平面
for (int tid = 0; tid < 32; ++tid) {
    const int r = knn32[site * 32 + tid];
    if (r < 0) { adjacent[site * 32 + tid] = 0; continue; }
    // 构造 2D 线性规划：a_j u + b_j v <= c_j
    //   j 取剩余 31 个邻居 + 6 个包围盒面
    // Seidel 增量可行性测试，按 KNN 距离升序处理约束
    bool feasible = seidel_feasible(constraints, n_constraints);
    adjacent[site * 32 + tid] = feasible ? 1 : 0;
}
// 2) 光栅化：chunk 内先协作加载 32 个单元属性到 shared memory
__shared__ float cellAttr[32][ATTR_LEN];
// 3) 每线程对 32 个包围球做求交测试，得到 bit mask（顺序执行，便宜）
uint32_t mask = 0;
for (int k = 0; k < 32; ++k)
    if (ray_sphere_intersect(ray, cellBound[k])) mask |= (1u << k);
// 4) 只对 mask 中置位的单元做昂贵的 ray/cell 求交
while (mask) {
    int k = __ffs(mask) - 1; mask &= mask - 1;
    // 用 bisector 平面求 t^- / t^+，若 t^- >= t^+ 则跳过
}
```

---

## 实验结论

- **数据集**：DTU（15 场景，Chamfer 距离，mm）、BlendedMVS（8 场景，4M 站点）
- **基线**：隐式路线 VolSDF / NeuS / Neuralangelo / NeuS2 / Voxurf / ProbeSDF / Geo-NeuS / GeoSVR；显式路线 SuGaR / 2DGS / GOF / RaDe-GS / MILo / PGSR / GGGS / BlobsToSpokes

**DTU 平均 Chamfer（mm，越低越好）与训练时间**：

| 方法 | Mean CD | 训练时间 | GPU |
|------|---------|---------|-----|
| NeuS | 0.84 | 8 h | RTX 2080 Ti |
| NeuS2 | 0.70 | 5 min | RTX 3090 |
| ProbeSDF | 0.68 | 2.5 min | RTX 3090 |
| Geo-NeuS | 0.51 | > 12 h | RTX 3090 |
| GeoSVR | 0.47 | 50 min | RTX 3090 Ti |
| 2DGS | 0.80 | 12 min | RTX 4090 |
| MILo | 0.68 | 25 min | RTX 4090 |
| PGSR | 0.52 | 30 min | RTX 4090 |
| GGGS | 0.47 | 15 min | RTX 4090 |
| BlobsToSpokes | 0.49 | 20 min | RTX 4090 |
| **CVTSplat** | **0.48** | **2.5 min** | **RTX 5090** |

**BlendedMVS 平均 Chamfer**（4M 站点）：NeuS2 2.93 / Voxurf 2.64 / ProbeSDF 2.21 / PGSR 1.56 / GGGS **0.88** / **CVTSplat 1.13**

**训练速度分析（DTU，表 3）**：
| 配置 | Mean CD | 时间 |
|------|---------|------|
| 1M 站点, 10K 步 | 0.50 | 87 s |
| 2M 站点, 10K 步 | 0.50 | 110 s |
| 4M 站点, 5K 步 | 0.50 | 79 s |
| 4M 站点, 7.5K 步 | 0.48 | 115 s |
| 4M 站点, 10K 步（基础光栅器） | 0.48 | 280 s |
| **4M 站点, 10K 步（chunked 光栅器）** | **0.48** | **147 s** |

→ chunked rasterizer 带来 **≈2× 端到端加速**，两者 Chamfer 几乎相同（差异可归因于浮点运算顺序）。

**消融（DTU 平均，基线 0.48）**：
| 变体 | Mean CD | 说明 |
|------|---------|------|
| No Linear Radiance | 0.57 | scan 65 出现大块饱和像素失败 |
| No ZNCC（多视角损失） | 0.55 | 影响显著 |
| No Depth Smoothing | 0.52 | 影响显著 |
| Biased CVT $a=0.05$ | 0.52 | 单元收缩不足 |
| No Ref. Probes | 0.51 | 镜面区域（scan 110/69）几何变粗糙 |
| No Envmap | 0.50 | 补偿监督 mask 的轻微误差 |
| No Linear Radiance / No ZNCC / No Depth Smoothing | 0.52–0.57 | 三项最重要 |
| Planar ZNCC Only / No Color Correction / No View Probes | 0.48 | 影响很小（鲁棒性向） |

**其他**：Voronoi 构造比通用方案快 **5–10×**（论文摘要）。

---

## 局限性

1. **K=32 近邻截断的近似性**：只有 32 个最近邻参与邻接判定。若真实邻居在 K 之外被漏掉 → 该单元被放大并与邻居重叠；漏掉的约束同时会放大 Eq. 15 的可行域 → 非邻居被误判为相邻。两种误差都是局部的，只影响少数站点附近的单元。
2. **单元不重叠假设**：闭式体积积分解依赖「单元不重叠」，这在近质心分布下通常成立，但非常规情形（剧烈自适应）需谨慎。
3. **piecewise-linear SDF 在单元边界有跳变**：允许小的不连续以换取闭式解，代价是边界附近 SDF 非严格连续。
4. **Riemann 近似精度**：$V_i$ 与 $\bar x_i$ 用 64 条射线近似，精度依赖补充材料中的经验分析；需要更高精度时须改用四面体分解/多面体表示（Delaunay 可恢复 Voronoi 顶点）。
5. **BlendedMVS 上不如最优基线**（1.13 vs GGGS 0.88），几何误差略高（部分凹陷区域 GGGS 更好）。
6. **依赖 COLMAP/SfM 初始化**（训练 pipeline 用 SfM 点云起步）。
7. **未发布代码**（论文未给仓库链接）。
8. **不涉及光照传输**：外观走光探针 + 方向相关辐射，不是 path tracing / PBR 光传输求解器。

---

## 相关工作

- [[RadiantFoam]] — Voronoi 承载 SDF 的直接前身（CVTSplat 沿用其 piecewise integration）
- [[SDFoam]] — 同路线，但单元内密度为常数
- [[NeuS]] — SDF-to-density 转换与渲染方程（CVTSplat 复用其 $\sigma(t)=s\Phi(-s\hat f)|n\cdot r|$）
- [[2D-Gaussian-Splatting]] / [[GOF]] / [[PGSR]] / [[GGGS]] / [[MILo]] — 显式 splatting 路线基线
- [[ProbeSDF]] — 方向相关外观的光探针 + SH 方案，CVTSplat 的外观表示直接借鉴
- [[GPU-KNN]] / [[LBVH]] — 加速结构
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 同批次的全局光照前馈工作

---

## 实现建议

- **实现难度**：**高**。需要：(a) 完整 GPU Voronoi 图构造（2D LP 可行性 + Seidel 增量算法在 CUDA 上的并行化，注意约束顺序依赖）；(b) warp-per-query 的 ball-query KNN kernel（自定义 LBVH）；(c) SPH 平滑算子及其对空间坐标的自动微分（SDF 梯度）；(d) chunked rasterizer + atomic CAS 早退协议；(e) NeuS 风格密度转换与闭式体积积分。
- **预期性能**：DTU 15 场景平均 Chamfer 0.48 mm，RTX 5090 上 2.5 min（4M 站点 / 10K 步）。相对 GGGS：精度持平（0.48 vs 0.47），训练快约 6×。
- **适用场景**：
  - ✅ 需要**秒级到分钟级**训练的高精度表面重建（当前隐式路线需 5 min–12 h）
  - ✅ 显式 splatting 的几何精度提升（2DGS/GOF 一档）
  - ✅ 大规模几何重建的工程化落地（训练成本极低）
  - ⚠️ 需要物理正确光照时仍需搭配 path tracer / PBR 求解器
  - ❌ 高保真外观（CVTSplat 无 path tracing 能力）
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 对我们最直接的启示是**「规则性换速度」**这一工程哲学：主动约束表示的规则性（近质心 Voronoi、固定 32 邻居、piecewise-linear SDF），换取整条 GPU 管线的可专门化空间。其 chunked rasterizer 的「逐 tile 原子早退」协议也可直接迁移到我们的实时光栅化场景。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.35347
- HTML 全文：https://arxiv.org/html/2610.35347v1
- PDF：https://arxiv.org/pdf/2610.35347
