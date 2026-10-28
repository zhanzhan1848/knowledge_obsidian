---
type: report
created: 2026-10-28
updated: 2026-10-28
tags: [报告, 每日搜索, 渲染, 2026-10, ReSTIR, 实时渲染, 全局光照]
status: processed
agent: shengcai
---

# 🥬 每日渲染领域论文搜索报告 — 2026-10-28

**执行时间**：2026-10-28 14:35–14:55 UTC
**搜索窗口**：2026-10-27 ~ 2026-10-28（arXiv cs.GR 近 24h）+ 2026 年 SIGGRAPH / SIGGRAPH Asia / Eurographics / I3D / HPG 论文集补漏
**数据源**：arXiv API（cs.GR + 9 组关键词 + 标题/摘要检索）、arXiv cs.GR recent listing、NVIDIA Real-Time Graphics Research publication 页、SIGGRAPH Asia 2026 官方 + kesen.realtimerendering.com、ACM DL（Cloudflare 拦截，经 Crossref API 反查 DOI）

---

## 一、检索方法与覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR listing（API，100 条） | ✅ | 解析 10-27 当日条目 16 条 + 近 5 日全部 |
| arXiv API 关键词检索（10 组） | ✅ | ray tracing / path tracing / real-time rendering / global illumination / light transport / PBR / BRDF / rasterization / BVH / ray marching / shading / reflectance / denoising |
| arXiv 标题+摘要全库检索 | ✅ | `ti:rendering`、`ti:illumination`、`ti:shading`、`ti:splatting` 等 |
| ACM Digital Library | ⚠️ | 直接抓取被 Cloudflare 拦截（"Just a moment..."）；改用 Crossref API + 各会议官方页反查 DOI |
| SIGGRAPH / SIGGRAPH Asia 2026 | ✅ | 经 kesen.realtimerendering.com 与 asia.siggraph.org 交叉验证；SA 2026 程序页尚未公布论文清单（会议 12 月举办），但期刊/会议 track 论文已陆续上线 |
| **NVIDIA RTG publication 页** | ✅ | **本次最有价值的发现** —— 该页列出 15 篇 2026 年新论文，其中 8 篇直接命中 ray tracing / path tracing / GI / ReSTIR 关键词 |

> **方法论提示**：ACM DL 被 Cloudflare 拦截是稳定现象。建议后续任务把 **Crossref API**（`api.crossref.org`，`prefix:10.1145`）作为 DOI 级元数据的稳定入口，并保留 **NVIDIA RTG / 各实验室 publication 页** 作为会议论文的第一手来源。

---

## 二、收录论文（10 篇，按推荐度排序）

### 🥇 第一梯队：实时路径追踪 / ReSTIR（5 篇）

| # | 论文 | 来源 | 推荐度 |
|---|------|------|--------|
| 1 | [ReSTIR PT Enhanced](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/) | **I3D 2026 Best Paper** | ⭐⭐⭐⭐⭐ |
| 2 | [Compatibility-Guided Neighbor Selection for ReSTIR](https://research.nvidia.com/labs/rtr/publication/junkins2026compatibility/) | **HPG 2026 Best Paper** | ⭐⭐⭐⭐⭐ |
| 3 | [Multi-Layer Reservoir Splatting for Temporal Reuse under Disocclusion](https://research.nvidia.com/labs/rtr/publication/hong2026multilayer/) | SIGGRAPH 2026 | ⭐⭐⭐⭐ |
| 4 | [Real-Time Level-of-Detail Rendering with ReSTIR](https://research.nvidia.com/labs/rtr/publication/wang2026levelofdetail/) | SIGGRAPH 2026 | ⭐⭐⭐⭐ |
| 5 | [Gradient-Domain ReSTIR Path Tracing](https://onlinelibrary.wiley.com/doi/abs/10.1111/cgf.70328) | Eurographics 2026 | ⭐⭐⭐⭐ |

### 🥈 第二梯队：全局光照 / 物理正确渲染（3 篇）

| # | 论文 | 来源 | 推荐度 |
|---|------|------|--------|
| 6 | [Gaussian Light Transport](https://arxiv.org/abs/2609.11430) | **SIGGRAPH Asia 2026** | ⭐⭐⭐⭐⭐ |
| 7 | [GraftRay](https://arxiv.org/abs/2610.37036) | arXiv (10-27) | ⭐⭐⭐⭐ |
| 8 | [Wave Tracing](https://arxiv.org/abs/2508.17386) | **Eurographics 2026 Best Paper HM** | ⭐⭐⭐ |

### 🥉 第三梯队：图元设计 / 场景合成（4 篇）

| # | 论文 | 来源 | 推荐度 |
|---|------|------|--------|
| 9 | [Honeycomb-Surfels (Hexels)](https://arxiv.org/abs/2610.37668) | arXiv (10-27) | ⭐⭐⭐⭐⭐ |
| 10 | [CTBakeGS](https://arxiv.org/abs/2610.37406) | arXiv (10-27) | ⭐⭐⭐ |
| 11 | [DomeGS](https://arxiv.org/abs/2610.37172) | arXiv (10-27) | ⭐⭐⭐ |
| 12 | [Texture Consolidation of Generated Multi-View Renderings](https://arxiv.org/abs/2610.36098) | arXiv (10-26) | ⭐⭐⭐ |
| 13 | [VISTA: Differentiable Viewpoint Planning](https://arxiv.org/abs/2610.36111) | arXiv (10-26) | ⭐⭐⭐ |

**已收录但本次升级**：[[2609.11430-gaussian-light-transport|Gaussian Light Transport]]（原为简略存根，已重写为完整提炼）、[[2026-10-28_Texture-Consolidation|Texture Consolidation]] 与 [[2026-10-28_VISTA-Differentiable-Viewpoint-Planning|VISTA]]。

**已存在、跳过**：[[2026-04-29-8D-Neural-Asset-Light-Transport|8DNA]]（arXiv 2604.25129）、[[2026-07-07_Generalizable-Light-Transport-3D-Embedding-GI|A Generalizable Light Transport 3D Embedding]]（arXiv 2510.18189）、[[2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation|CVTSplat]]（10-27 已收录）、[[2026-10-27_GaussianSpline-Adaptive-Bezier-4D-Gaussian-Splatting|GaussianSpline]]（10-27 已收录）。

---

## 三、今日技术趋势观察

### 1. ⭐ ReSTIR 从「理论竞赛」转向「工程竞赛」——本期最强烈的信号

NVIDIA RTG 一年之内产出 **5 篇 ReSTIR 论文**，且**三篇获奖**（I3D Best Paper、HPG Best Paper、Eurographics Best Paper HM）。更关键的是**ReSTIR PT Enhanced 论文的作者自述**：

> 「许多论文探索了新颖的理论改进，但**算法改进和面向最优实现的工程洞察在很大程度上被忽视**。」

这句话是本期最重要的判断。ReSTIR PT Enhanced 的成绩单说明**工程改进的杠杆远大于理论改进**：

| | 帧时 | FLIP |
|---|---|---|
| Original ReSTIR PT | 37.1 ms | 0.321 |
| **ReSTIR PT Enhanced** | **12.6 ms** | **0.263** |

**快 2.94×，同时更好**。且其消融表显示多数优化是「**省掉重复工作**」而非「加计算」：

| 优化项 | 空间复用耗时 |
|--------|-------------|
| Baseline | 14.79 ms |
| + Paired spatial reuse | **4.11 ms** |

### 2. ⭐⭐ 「配对/摊销」成为时空复用的通用解题思路

本期三篇论文**独立地**用同一个模式解决问题：

- **Reciprocal neighbor selection**（ReSTIR PT Enhanced）：`A` 从 `B` 复用后，`B` 从 `A` 复用**需要完全相同的 shift mapping** → 摊销掉 50% 的重复 shift。
- **Multi-Layer Reservoir Splatting**：深度区间（depth ranges）把「层归属判定」从多次连续最近命中查询降为 **2 次可见性查询**；活跃域传递式激活把维护域数从 `kN` 降到 **1/4~1/8**。
- **Stochastic Pairwise MIS**：把完整的 MIS 权重求和 `Σm_i` 换成 `Ñ`-样本重要性采样估计器，配合 **reuse cells** 把「用哪些邻居」与「评估哪些邻居」解耦。

> **共同洞见**：不增加「采样质量」的前提下，**通过重新组织计算结构消除冗余**。这是比发明新估计量更可靠、风险更低的改进路径。

### 3. ⭐⭐ 「遮挡/拓扑变化」成为 ReSTIR 的残余战场

三篇论文各自处理 ReSTIR 的一个已知失效模式：

| 失效模式 | 论文 | 解法 | 效果 |
|---------|------|------|------|
| 相机/物体运动导致的 **disocclusion** | Multi-Layer Reservoir Splatting | 把重采样域从「像素」扩展为「**像素-层**」，让被遮挡样本存入深层 reservoir | Carousel: MAPE 1.863 → **1.631**；比 uniform 5 层**快近一倍** |
| **几何 LOD 切换**导致拓扑变化 | Real-Time LoD Rendering with ReSTIR | 用**共享 UV 规范参数化**构造跨拓扑的部分双射 | RelMSE 0.126 → **0.092** |
| **大运动**导致邻域内无贡献样本 | Stochastic Pairwise MIS | 从至多 64 邻居中聚焦有贡献样本 | 显著改善 disocclusion 区域 |

### 4. ⭐ 错误-相关性权衡被显式化，成为新的评估维度

Compatibility-Guided Neighbor Selection 论文最有价值的可能不是算法本身，而是它**把 ReSTIR 的「误差-相关性权衡」显式化**：

- 论文指出：实践中人们常**增大复用半径**来降低输出相关性——「尽管去噪前方差增大，但这常改善最终去噪图像质量（当去噪器未针对 ReSTIR 的相关性训练时）」。
- 推荐评估协议：**SMAPE vs 空间协方差**双指标，参数 `K ∈ [8,32]`、`R ∈ [30,100]`。
- 并**验证**了 Bitterli et al. 2020 经验选取的 `R = 30` 确实位于 Pareto 曲线肘部。

> **行动建议**：把「SMAPE + 空间协方差」作为团队内部 ReSTIR 调参的**标准评估协议**。只看误差会选到相关性差的工作点。

### 5. ⭐ 显式 GI 表示的第三条路线：「解方程」而非「拟合图像」

Gaussian Light Transport（SIGGRAPH Asia 2026）代表了与 3DGS/NeRF「拟合图像」路线**正交**的思路：

- 把光传输方程的解表示为 **13D 高斯混合**（位置 3 + 方向 3 + 法线 3 + albedo 3 + 粗糙度 1）；
- **直接最小化渲染方程残差**：`θ* = argmin ‖L_θ − E − T·L_θ‖²`，而非 Neumann 级数展开；
- **训练数据全部来自路径追踪器**（Mitsuba 3）——**没有真实采集数据**，模型是「解方程」不是「拟合图像」。

对比 Neural Radiosity（同一实验室组的直接竞争者，Hadadan et al. 2021）：

| | Gaussian Light Transport | Neural Radiosity (hash grid) |
|---|---|---|
| 训练时间 | 9m17s ~ 12m08s | 1h54m ~ 4h29m |
| 模型大小 | **1.0 – 5.9 MB** | 35.7 MB（固定） |
| FLIP (living room) | **0.1177** | 0.1326 |
| FLIP (dining room) | **0.0831** | 0.2455 |
| 渲染 | **10–17 ms @ 1080p 1 spp** | — |

**训练快 10–23.4×，渲染快 2.2–4.5×，内存小一个数量级，FLIP 全面更优。**

其**世界空间 Morton tile + 13 维保守包围盒 + 可分离剔除**是**可直接迁移到任何高斯/神经表示渲染器的通用加速手段**——不限于本文模型。

### 6. ⭐ 图元设计换效率：Hexels 的数据

Honeycomb-Surfels 用「**六边形支撑域 + 一阶局部颜色场**」替换 2DGS 的高斯核，把效率做进图元本身（而非靠量化压缩）：

- 同等内存：PSNR **+4.53 ~ +7.38 dB**，FPS 1.54–1.87×，训练 VRAM 最多 ↓3.6×
- 同等基元数：PSNR 最多 **+4.74 dB**，FPS **2.31×**，训练 VRAM 最多 ↓7×
- 表面重建：DTU Chamfer **0.978 mm vs 1.375 mm（↓28.9%）**
- **O(1) 直接导出六边形 surface cell**（无需 TSDF/Marching Cubes）

关键几何事实：最优仿射正六边形面积是**三角形的 2 倍、正方形的约 1.3 倍**——这正是 honeycomb theorem 的直接应用。

### 7. 1/255 不透明度地板是 3DGS 的普遍陷阱

CTBakeGS 与 Hexels **独立地**撞上了同一个问题：标准 3DGS rasteriser 的 8-bit alpha 缓冲有 `1/255 ≈ 0.0039` 的量化地板，低于此值的 splat 被直接丢弃。

CTBakeGS 的解法很优雅：**随机化不透明度量化**——以概率 `p = τ_splat/τ₀` 保留淡 splat 并把不透明度抬到 `α₀ = 0.01`：

```math
p\cdot\alpha_0 = 1-\exp(-\tau_{\text{splat}})
```

**期望光学深度不变**，但每个 splat 都能通过 8-bit 地板。这解决了「薄半透明层整体消失」问题（skin+骨 wide view：29.8 → 23.8 dB 的差异来源）。

> **行动建议**：这是**任何做薄层/半透明结构 3DGS 的团队都该立刻知道的通用技巧**，迁移成本接近零。

---

## 四、给墨鱼丸的方案清单（按落地优先级）

| 优先级 | 方案 | 来源论文 | 难度 | 预期收益 |
|--------|------|---------|------|---------|
| **P0** | **Reciprocal neighbor selection**（成对空间复用） | ReSTIR PT Enhanced §3 | 低 | 空间复用成本**减半**（14.79 → 4.11 ms）；**降级风险低** |
| **P0** | **1/255 地板的随机保留** | CTBakeGS | 低 | 薄层/半透明结构 3DGS 的通用修复；期望光学深度不变 |
| **P0** | **兼容性引导的邻居选择** + 双指标评估协议 | Compat Neighbor Selection | 低 | SMAPE **−6~29%**、时间协方差 **−22~49%**，增量成本 **2–5%** |
| **P1** | **Unify DI & GI 到同一 reservoir** | ReSTIR PT Enhanced §6.1 | 中 | `and others` pass 从 5.24 → **1.00 ms** |
| **P1** | **Duplication map + 自适应 `c_cap`** | ReSTIR PT Enhanced §5 | 中 | 消除相关性/拖尾伪影；**代价：3.25% 偏差** |
| **P1** | **Footprint-based 重连判据** | ReSTIR PT Enhanced §4 | 中 | shift mapping 鲁棒性加固（可与上一项同步） |
| **P1** | **世界空间 Morton tile + 可分离剔除** | Gaussian Light Transport | 中高 | **通用加速手段**，可用于任何高斯/神经表示渲染器 |
| **P2** | **Depth ranges 层归属判定** | Multi-Layer Reservoir Splatting | 中 | splatting 光线数 **−59%**，时间 6.05 → **3.93 ms**（独立可落地） |
| **P2** | **随机接受概率 = alpha 合成权重** | GraftRay | 中高 | 高斯路径追踪中**免排序、每段一次遍历**的实用技巧 |
| **P2** | **显式近场面光源** | GraftRay | 中高 | 比环境贴图更贴近室内场景真实光照需求 |
| **P3** | **α 合成而非网格分割** 的背景融合 | DomeGS | 中 | 3DGS 背景补全免分割 |
| **P3** | **前景冻结 + 背景免剪枝** 训练保护 | DomeGS | 中 | 增量式 3DGS 训练通用技巧 |
| **P3** | **Hexel 六边形支撑 CUDA 栅格化** | Honeycomb-Surfels | 中 | 同等内存 PSNR **+4.5~7.4 dB**、**2.31×** FPS；已开源 |
| **P4** | **多层 reservoir（像素-层域）** | Multi-Layer Reservoir Splatting | 高 | disocclusion 噪声显著降低；需 instance ID + 多层存储 |
| **P4** | **表面点映射 τ（跨 LOD 拓扑）** | Real-Time LoD with ReSTIR | 中 | RelMSE 0.126 → **0.092**；**前置条件：LOD 间 UV 需一致** |
| **P4** | **梯度域路径空间扩展** | Gradient-Domain ReSTIR | 高 | 首个实时梯度域渲染；但需 Poisson/神经重建（L2 11 ms、L1 300 ms） |
| **P5** | **双线性路径积分 + 椭圆锥** | Wave Tracing | 极高 | 波动光学/射频仿真；完整实现成本极高，**建议仅跟踪** |

### 方法论层面的三条通用结论（无论是否实现具体方案）

1. **「先复用、后求导」是错的** —— 若要在任何可微量/导数量上做复用，必须在**目标量的积分域**上做复用（Gradient-Domain ReSTIR 的核心洞察）。
2. **「目标函数必须非负」时用正/负双 reservoir 正部化** —— 通用的 ReSTIR 工程模式。
3. **「MIS 权重求和可用随机重要性采样无偏估计」** —— 把 `O(M)` 降为 `O(Ñ)` 的通用加速模式（Stochastic Pairwise MIS）。

---

## 五、笔记清单

| 笔记 | 文件 |
|------|------|
| ReSTIR PT Enhanced | `2026-10-28_ReSTIR-PT-Enhanced.md` |
| Compatibility-Guided Neighbor Selection | `2026-10-28_ReSTIR-Compatibility-Neighbor-Selection.md` |
| Multi-Layer Reservoir Splatting | `2026-10-28_ReSTIR-Multi-Layer-Reservoir-Splatting.md` |
| Real-Time Level-of-Detail Rendering with ReSTIR | `2026-10-28_ReSTIR-Level-of-Detail.md` |
| Gradient-Domain ReSTIR Path Tracing | `2026-10-28_ReSTIR-Gradient-Domain.md` |
| Stochastic Pairwise MIS | `2026-10-28_ReSTIR-Stochastic-Pairwise-MIS.md` |
| Gaussian Light Transport（升级重写） | `2026/09/2609.11430-gaussian-light-transport.md` |
| GraftRay | `2026-10-28_GraftRay-Path-Tracing-Mesh-Insertion.md` |
| Wave Tracing | `2026-10-28_Wave-Tracing-Path-Integral-Wave-Optics.md` |
| Honeycomb-Surfels (Hexels) | `2026-10-28_Honeycomb-Surfels-Hexels.md` |
| CTBakeGS | `2026-10-28_CTBakeGS.md` |
| DomeGS | `2026-10-28_DomeGS.md` |
| Texture Consolidation | `2026-10-28_Texture-Consolidation.md` |
| VISTA | `2026-10-28_VISTA-Differentiable-Viewpoint-Planning.md` |
| **本报告** | `2026-10-28-daily-search-report.md` |

---

## 六、下期关注

- **NVIDIA RTG 2026 剩余论文**：`ahmed2026zpp`（Z++: Temporal, Non-Uniform, and 3D Z Sampling，ACM TOG SIGGRAPH Asia 2026）、`ahmed2026nile`（NILE: Nested Interleaving of Low-Dimensional Elements，ACM TOG SIGGRAPH 2026）、`bitterli2026taming`、`yu2026toward`、`xue2026videoneumat` —— **采样器方向**（Z sampling、局部/全局采样器统一）尚未覆盖，值得单独一期。
- **SIGGRAPH Asia 2026 程序页**将于会议前（12 月 1–4 日，Kuala Lumpur）公布完整论文清单。
- **ACM DL 抓取**：建议改用 Crossref API 为主路径，避免 Cloudflare 反复拦截。
- 关注 **ReSTIR 在 GPU 架构层**的进展（如 Ray-by-Ray 的资源管理粒度）。
