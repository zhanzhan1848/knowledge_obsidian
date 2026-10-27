---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, geometry-processing, cs.GR, cs.CV, Voronoi, CVT, Delaunay, multi-view-reconstruction, implicit-surface, GPU-algorithm, marching-tetrahedra, surface-adaptive-discretization]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.35347
arxiv_id: 2610.35347v1
---

# CVTSplat: Multi-view Reconstruction Using an Adaptive Centroidal Voronoi Tessellation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CVTSplat: Multi-view Reconstruction Using an Adaptive Centroidal Voronoi Tessellation |
| **作者** | Briac Toussaint, Diego Thomas, Jean-Sébastien Franco, Edmond Boyer, Christian Theobalt |
| **发表** | arXiv 2026-10-26 (v1)，cs.CV / **cs.GR**，13 页 |
| **链接** | [原文](https://arxiv.org/abs/2610.35347) · [HTML](https://arxiv.org/html/2610.35347v1) |
| **DOI** | [10.48550/arXiv.2610.35347](https://doi.org/10.48550/arXiv.2610.35347) |
| **机构** | MPI-INF / Saarland 大学系（Theobalt 组） |
| **代码** | 论文未附代码链接（自研 CUDA kernel） |

---

## 核心贡献

> **用「自适应质心 Voronoi 剖分（adaptive CVT）」同时拿到两样东西：像非结构网格那样的表面自适应分辨率，以及像规则网格那样的规整单元形状 —— 从而把 Voronoi 重建整条管线 GPU 化，训练只要 2.5 分钟。**

1. **提出自适应质心 Voronoi 离散（adaptive CVT）**：在标准 CVT 基础上引入**非均匀单元尺寸**，由演化中的 SDF 调制 —— 单元尺寸 ∝ 局部 SDF 斜率，在零水平集附近加密站点，但**保持单元仍近似质心（centroidal）**。这是与普通 Voronoi（不规则、需遍历大量邻居）的关键分野。
2. **利用「近质心 ⇒ 单元形状规则」这一性质，特化整条管线**：
   - GPU 上的**近似 Voronoi 构造**（沿用 Ray et al. 2018 的 clipping 范式）
   - GPU **KNN 查询**（每个站点取 32 近邻作为候选集）
   - GPU **Delaunay 三角剖分**
   - 针对「小、近各向同性单元」定制的**分块光栅化器（chunked rasterizer）**
3. **几何 + 外观统一表示**：每个 Voronoi 站点携带**可训练 SDF 值 + 视角相关外观属性**，直接光栅化 Voronoi 单元做可微体渲染；用 Delaunay 对偶网格 + **marching tetrahedra** 抽取零水平集得到网格。
4. **性能**：Voronoi 构造比通用方案**快 5~10×**；DTU 上几何精度逼近最优 3DGS 表面方法，**单卡 RTX 5090 约 2.5 分钟训练完成，显存仅 4 GB**。

---

## 技术方案

### 整体架构（论文 Fig. 2）

```
┌─ 上排：剖分构建（几何侧）────────────────────────────────┐
│ (a) 对每个站点做 GPU KNN → 取 32 个最近邻作为候选集          │
│ (b) 用候选集做 Voronoi 剖分 → 得到邻接图                    │
│ (c) 计算每个单元的质心（center of mass）→ CVT loss 正则化站点分布 │
│ (d) Voronoi 对偶 → Delaunay 三角剖分 → marching tetrahedra 抽零水平集│
└─────────────────────────────────────────────────────┘
┌─ 下排：可微体渲染（外观侧）────────────────────────────────┐
│ (e) 站点属性（SDF 值 + 特征）用高斯核平滑                    │
│ (f) 计算 SDF 梯度 → 法向量 → 在单元上定义分段线性 SDF          │
│ (g) 按相机位置为每个站点计算颜色（view-dependent radiance）    │
│ (h) 光栅化 → 与 GT 图像比较（多视角 ZNCC + 深度 + 法向损失）   │
└─────────────────────────────────────────────────────┘
```

### 关键设计点

| 技术 | 说明 |
|------|------|
| **Adaptive CVT** | 标准 CVT 倾向站点均匀分布；本文用**演化中的 SDF 调制单元尺寸**，在零水平集附近加密站点，同时保持单元近似质心。**注意：用的是标准 Voronoi 图而非 power diagram**（power diagram 才能任意指定权重） |
| **近似 Voronoi 构造** | 沿 Ray et al. (2018) 的 clipping 形式：各单元独立地依次被邻站点的**垂直平分面**裁剪。近质心 ⇒ 邻居少且近 ⇒ 只需小候选集 |
| **单元质心 → 线性规划** | 论文标题式地提到「Cells as linear programs」——单元质心计算被建模为 LP（见 §3.2） |
| **Delaunay 三角剖分** | Voronoi 图的对偶；提供抽取零水平集所需的局部邻域结构 |
| **SDF 梯度 → 法向** | 由站点 SDF 值求梯度得到法向量，在站点间定义**分段线性 SDF** |
| **属性平滑** | 站点属性用高斯核平滑（解决站点属性在空间上的不连续） |
| **颜色重映射（color remapping）** | 训练稳定化的一个 trick |
| **梯度调制（gradient modulation）** | 不改变最终结果，但**让训练更稳定**（消融：Chamfer 0.48 → 0.48，但稳定性提升） |

### CVT 损失（论文式 2 附近）

```math
L_CVT = Σ_i (1 / sg(r_i)) · || x_i − sg( x̄_i − β_i r_i n_i ) ||²_2
β_i = a · tanh( f̂_i / (2b) ),   a = 0.1,  b = 0.001
```

其中 $x_i$ = 站点，$x̄_i$ = 单元质心，$r_i$ = 单元半径，$n_i$ = 法向，$\mathrm{sg}(\cdot)$ = **stop-gradient**（梯度不回传到单元几何，只更新 $f̂_i$），$f̂_i$ = 可学习的站点特征。

**单元体积的蒙特卡洛估计**（用 **Fibonacci 球格** $n=64$）：

```math
V_i = ∫_{S²} l(r)³/3 dσ  ≈  (4π / 3n) · Σ_{k=0}^{n−1} l_k³
```

**质心的一阶近似**：

```math
x̄_i − x_i = (3/4) · ( Σ_k r_k l_k⁴ ) / ( Σ_k l_k³ )
```

### 初始化与致密化（论文 §5.3）

- 场景包围盒内**均匀随机站点**
- **10 次 Lloyd 松弛**（$a = 0$），SDF 由球体初始化，其余特征取正态分布
- 初始 **200K 站点**，**每 10 次迭代几何级增长**至 **4M 站点**
- **新站点从第 400 次迭代开始加入到最后 400 次迭代**
  - 新站点深度从**渲染深度图的随机有效像素**采样
  - $F^s$ 从**渲染特征图**采样

### 损失函数（消融显示各项重要性）

论文损失由 **多视角 ZNCC（Z-buffer Normalized Cross Correlation）+ 深度损失 + 法向平滑 + 环境贴图（envmap）** 等组成。消融（DTU，15 个 scan 的 Chamfer 均值，越低越好）：

| 变体 | Chamfer 均值 | 结论 |
|------|------|------|
| **Base Model** | **0.48** | 基准 |
| No Linear Radiance | 0.57 | 用线性辐射可避免 scan 65 的失败案例 |
| No ZNCC | 0.55 | 去掉多视角 ZNCC 显著变差 |
| No Depth Smoothing | 0.52 | |
| Biased CVT (a=0.05) | 0.52 | 偏置 CVT 变差 |
| No Ref. Probes | 0.51 | |
| No Envmap | 0.50 | envmap 缓解遮罩不准导致的轮廓 artifact（scan 83） |
| **Planar ZNCC Only** | 0.48 | 与 base 同，但**细节变差**（scan 106） |
| No Color Correction | 0.48 | |
| No View Probes | 0.48 | |
| No SSIM | 0.48 | |
| No Gradient Mod. | 0.48 | 结果不变，仅稳定性下降 |
| No Normal Smoothing | 0.47 | 略好但引入 artifact |

> 📌 **要点**：多视角 ZNCC、深度与法向损失、以及 reflection probes **对几何精度是必要的**；只保留 planar ZNCC 会**抑制精细细节**。

### 网格抽取

- Voronoi → 对偶 Delaunay 三角剖分 → **marching tetrahedra** 抽零水平集。
- 训练中为实时可视化输出 "triangle soup"（重复顶点）；**最终落盘的网格在 CPU 端合并重复顶点，总计耗时 2 秒**。

---

## 复杂度与性能

| 项 | 数值 |
|----|------|
| **Voronoi 构造加速** | 比通用方案快 **5~10×**（MeshlessVoronoi 5×、Paragram 10×） |
| **Voronoi 构造实测（400 万点 DTU 云）** | **CVTSplat 29.9 ms** vs MeshlessVoronoi **171.0 ms**（**5.7×**）、RestrictedVoronoi 138.4 ms、Paragram **275.5 ms**（**9.2×**）、gDel3D 617.4 ms、RadiantFoam 18995 ms |
| **训练时间** | DTU 上约 **2.5 分钟**（单张 **RTX 5090**）；对比：PGSR 30 min / RTX 4090，GGGS 15 min / RTX 4090，ProbeSDF 2.5 min / RTX 3090 |
| **显存** | **4 GB VRAM** |
| **KNN 候选数** | 每站点 **32** 近邻（ball query 二分搜索重启至找到 32~64 点，按距离排序后取前 32） |
| **KNN 结构** | **LBVH**，每节点至多 **128 点**，每次查询一个 warp；**每点搜索半径在迭代间缓存**（保证时间一致性） |
| **后处理** | CPU 合并重复顶点 **2 秒** |

---

## 实验结论

### DTU（Chamfer 距离，单位 mm，越低越好）

| 方法 | Mean | 运行时 |
|------|------|--------|
| Implicit VolSDF | 0.86 | >12 h, RTX 2080 Ti |
| NeuS | 0.84 | 8 h, RTX 2080 Ti |
| Neuralangelo | 0.61 | >128 h, V100 |
| NeuS2 | 0.70 | 5 min, RTX 3090 |
| Voxurf | 0.76 | 15 min, A100 |
| ProbeSDF | 0.68 | 2.5 min, RTX 3090 |
| Geo-NeuS | 0.51 | >12 h, RTX 3090 |
| GeoSVR | 0.47 | 50 min, RTX 3090 |
| **SuGaR**（显式） | 1.33 | 1 h, RTX 4090 |
| 2DGS | 0.80 | 12 min, RTX 4090 |
| GOF | 0.74 | 50 min, RTX 4090 |
| RaDe-GS | 0.68 | 8 min, RTX 4090 |
| PGSR | 0.52 | 30 min, RTX 4090 |
| BlobsToSpokes | 0.49 | — |
| MILo | 0.48 | — |
| GGGS | **0.47** | 15 min, RTX 4090 |
| **CVTSplat（本文）** | **0.48**（最佳/次佳） | **~2.5 min, RTX 5090, 4 GB** |

> 📌 **核心对比点**：CVTSplat 用 **2.5 分钟**达到与 **50 分钟~12 小时**的方法相当的精度（0.48 vs 最佳 0.47）—— **速度-精度比是最强项**。

### BlendedMVS（Chamfer，4M 站点）

| 方法 | Mean |
|------|------|
| NeuS2 | 2.93 |
| Voxurf | 2.64 |
| ProbeSDF | 2.21 |
| PGSR | 1.56 |
| **GGGS** | **0.88** |
| **CVTSplat** | **1.13** |

> ⚠️ 在 BlendedMVS 上**落后于 GGGS（0.88 vs 1.13）**；DTU 上领先（0.48 vs 0.47）。
> 📌 **PGSR 在 8 个场景中有 2 个因白色背景歧义导致 GPU 显存溢出、无法产出网格**。

---

## 局限性（论文 §7 原文要点）

1. **近似性**：Voronoi 构造算法是**近似**的，**不适用于需要精确邻接关系**的应用。可通过**迭代重试 + 增大邻居数**（仿 Basselin et al. 2021）找回缺失邻接；**退化构型下回退到双精度**可提升鲁棒性。附录实测：不完整单元比例在所用超参下**很低**。
2. **理论缺口**：可基于单元规则性推导所需邻居数的**理论上界**（Hudson et al. 2006），但**本文不保证站点间距**，故可能不适用。
3. **仅限闭场景**：扩展到**开放场景**是未来方向 —— 障碍是（a）**朴素的球面初始化**（可用单目先验解决）；（b）**大空间范围下的可扩展性**（可用基于图像内容的自适应加密，或表达力更强的 primitive）。
4. **Delaunay 不完备性**：会导致抽取出的网格出现**少量孔洞或非流形边**（论文附录 C 有专门分析）—— 这是近似构造的副产物。

---

## 相关工作

- [[Adaptive-CVT-Voronoi]]（本篇提出的表示）
- [[Voronoi-Delaunay-Duality]]（GPU 上的 Voronoi 构造：Ray et al. 2018 / Basselin et al. 2021 / Cao et al. 2014）
- [[ProbeSDF]]（同组 Toussaint et al. 2025，前作）
- [[2DGS]] / [[RaDe-GS]] / [[GGGS]]（3DGS 表面方法）
- [[Marching-Tetrahedra]]（零水平集抽取）
- [[Neural-Implicit-Surface-Reconstruction]]

---

## 实现建议

- **实现难度**：**高**（需要 GPU Voronoi 构造 + Delaunay + 定制的 chunked rasterizer + 可微 SDF 光栅化整条链）
- **数值稳定性**：**中**。近似 Voronoi 在退化构型下不稳，作者建议双精度回退；不完整单元比例实测很低
- **依赖项**：**自研 CUDA kernel**（`__ffs` intrinsic、atomic compare-and-swap、ball query + 并行排序）、**GPU KNN 用 LBVH**、NeuS 风格的 SDF→密度转换、**SPH 启发的平滑**；相关工作引用 **CGAL**（Voronoi/Delaunay）；对比工具涉及 cuPy-KNN、torch_kdtree、scikit-learn、TrueKNN。作者**未直接使用 libigl/CGAL**；框架（PyTorch/CUDA vs 裸 CUDA）未说明。
- **适用场景**：
  - ✅ 快速多视角重建（**分钟级**出网格，适合批量扫库 / 预览）
  - ✅ 需要显式网格输出（非隐式场）的应用
  - ✅ 表面自适应分辨率 —— 薄壁结构、细长杆件处自动加密
  - ❌ 需要精确 Voronoi 邻接（如 Voronoi 应力分析、纤维取向分析）→ 用近似版不可靠
  - ❌ 大尺度开放场景 / 城市级重建
- **性能预期**：单卡 2.5 分钟训练，4 GB 显存；端到端（含 CPU 顶点合并）约 2.5 min + 2 s

---

## 备注

> 与本文相关的一条独立线索：**「用规则性换取速度」是一个反复出现的设计模式**。近质心 Voronoi 的规则性 → 邻居少 → KNN 候选集小 → 近似构造快 → 光栅化器可特化。整套链条是**「表示的数学性质 → 算法复杂度」的传导链**，这是几何处理里少见的清晰因果。建议在自身管线设计中寻找类似的传导点。
>
> 相关：[[2610-35621-Synthetic-Deformable-Tubular-Benchmark]]（同样来自 Theobalt 组的可变形重建基准）
