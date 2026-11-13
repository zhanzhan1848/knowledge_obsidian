---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, 几何处理, 最近邻搜索, Delaunay三角剖分, 点云, 并行构建, 空间索引, 配准, DP-NNS]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.15320
---

# Delaunay-Based Nearest Neighbor Search with Grid-Accelerated Queries and Parallel Construction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Delaunay-Based Nearest Neighbor Search with Grid-Accelerated Queries and Parallel Construction |
| **作者** | Pengfei Wang, Shiqing Xin, Changhe Tu |
| **单位** | 厦门大学 (Xiamen University) |
| **发表** | arXiv 2026-11-11 (cs.GR, cs.CG) |
| **链接** | [原文](https://arxiv.org/abs/2611.15320) ｜ [HTML 全文](https://arxiv.org/html/2611.15320v1) |
| **DOI** | 10.48550/arXiv.2611.15320 |
| **代码** | 论文未给出公开仓库链接（实现基于 CGAL 5.6.1 + oneTBB） |

---

## 核心贡献

> 加速 **DP-NNS**（Dynamic-Programming Nearest-Neighbor Search，基于增量 Delaunay 构建历史的 successor DAG 搜索）——针对"**数据点在流形表面、查询点充满周围体空间**"这一几何处理中极常见的分布，从**查询**和**构建**两端同时优化。

1. **网格化查询初始化（Grid-Accelerated Search Initialization）**：基于 Voronoi 单元凸性的**引理 1**，为每个网格 cell 预计算一个**共享的合法起始点** $s(C)$，使得落在该 cell 内的所有查询可以直接从 $s(C)$ 开始走 successor DAG，**跳过搜索路径前缀**——且**保持精确性**（结果不变，只是更快）。
2. **层级一致的并行构建（Level-Consistent Parallel Construction）**：证明在**层级一致插入序**（level-consistent insertion order）下，最近邻查询的期望代价仍为 $O(\log n)$，从而可以在**层内并行插入**而不像 CGAL 并行插入那样破坏查询性能。
3. **局部性感知查询重排**：按 **Morton curve** 排序查询点以改善 cache 局部性。
4. **端到端落地**：作为 point-to-plane ICP 配准的 drop-in 搜索后端，取得显著端到端加速。

**为什么这篇重要**：这是几何处理里最底层的"距离查询"原语。隐式曲面重建（Poisson / SDF）、神经隐式表示训练期的体素查询、点云配准、距离场计算——**全都依赖它**，且都是"表面数据 + 体空间查询"这一病态分布。这正是 k-d tree / uniform grid 性能崩塌的场景。

---

## 技术方案

### 核心思想

**问题设定**：许多图形应用中，数据点采样自**曲面**，查询点分布在**周围体积**中。

- k-d tree / R-tree / BVH：包围体只包住大量空区域；远处查询时初始最近邻距离界很大，**branch-and-bound 剪枝几乎失效**
- Uniform grid：对流形分布而言**大部分 cell 为空**，远处查询要遍历海量空 cell，严重退化
- **DP-NNS**：利用增量 Delaunay 构建历史——每个点记录其后插入的 Delaunay 邻居，构成 **successor DAG**（有向无环图），查询沿 DAG 直接朝最近邻前进

**DP-NNS 的代价**：顺序增量 Delaunay 构建远比构建空间树慢，所以只有查询批量足够大时才划算。而现有并行方案（如 CGAL 的 parallel insertion）会**改变插入顺序 → 改变 successor DAG → 严重劣化查询性能**。最坏情况下按"离查询距离递减"插入，会让遍历访问**每一个点**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Successor DAG** | 每个点记录其后插入的 Delaunay 邻居；查询沿这些 successor 列表走向更近的点，不做树回溯 |
| **引理 1（Voronoi 凸性）** | 设 $\Omega\subset\mathbb{R}^3$ 为凸多面体，顶点 $v_1,\dots,v_m$，则 $\bigcap_{i=1}^m \mathcal{T}(v_i)\subseteq\mathcal{T}(q)$，$\forall q\in\Omega$。证明核心：$c\in\mathcal{T}(x)\iff x\in\mathrm{Cell}(c;\mathcal{P}_{\leq c})$，而 Voronoi 单元是凸的，故 $\Omega=\mathrm{conv}\{v_i\}\subseteq\mathrm{Cell}(c;\mathcal{P}_{\leq c})$ |
| **共享起始点 $s(C)$** | $s(C)=\arg\max_{c\in\bigcap_{i=1}^{8}\mathcal{T}(v_i)}r(c)$——取 8 个 cell 顶点查询路径交集中**秩最高**（跳过步数最多）的点。交集非空因为 $p_1$ 属于每条路径 |
| **网格划分** | 均匀网格 $G^3$ cells，**O(1) 定位** + 共享起始点直查 |
| **层级一致插入序** | 点集先随机打乱分成 $L+1=O(\log n)$ 层 $R_0,\dots,R_L$，层大小几何递增；**所有 $R_{l-1}$ 的点必须先于 $R_l$ 插入**，但层内顺序任意 |
| **定理 1** | 在**任意层级一致插入序**下，查询在每层期望评估 $O(1)$ 个点，全程 $O(\log n)$ |
| **Morton 重排** | 查询点沿空间填充曲线排序，改进 cache 局部性 |

### 公式

**查询路径与共享起始点**

```math
\mathcal{T}(q)=\{p_m\in\mathcal{P}:\Phi_m(q)=p_m\}
```

$$
s(C)=\arg\max_{c\in\bigcap_{i=1}^{8}\mathcal{T}(v_i)}r(c)
$$

**层级结构**

$$
S_l=R_0\cup\cdots\cup R_{l-1},\qquad |R_l|\leq\gamma|S_l|,\quad \gamma\geq 1
$$

**定理 1 的证明要点**

$$
S_l\subseteq\mathcal{P}_{<p}\subseteq S_l\cup R_l
$$

移除点永不破坏已有的 Delaunay 边；且在**齐次 Poisson 点过程**假设下每个点的期望 Delaunay 邻居数 $\delta$ 为常数（与文献 [42] 的经验观测一致），故每层期望评估点数为常数。

**复杂度**

- 查询：期望 $O(\log n)$ 距离评估（网格初始化进一步缩短路径）
- 并行构建：$10\times$ 加速（相对顺序 DP-NNS）
- 查询加速：约 $2\times$（相对原 DP-NNS）

---

## 实验结论

- **数据集**：7 个经典 3D 模型点云（Camel / Bunny / Dragon / Kitten / Armadillo / Lucy / Sponza）+ 3 个大规模数据集（Thingi10K、ABC、MedShapeNet）
- **平台**：Intel Core i7-14700K（8P + 12E 核）、64 GB 内存、RTX 4090 24 GB、Windows 11；CGAL 5.6.1 精确谓词 + oneTBB，20 线程
- **基线**：DP-NNS（原始）、nanoflann kd-tree、Boost R*-tree、PCL octree、ANN BD-tree、SciPy cKDTree、ArborX BVH

**查询时间（平均 1-NN，μs）**

| 方法 | Camel | Bunny | Dragon | Kitten | Armadillo | Lucy | Sponza |
|------|------|------|------|------|------|------|------|
| DP-NNS（原始） | 0.284 | 0.314 | 0.352 | 0.484 | 0.585 | 0.675 | 1.151 |
| DP-NNS（CGAL 并行构建） | 0.314 | 0.461 | 0.465 | 1.145 | 1.656 | 2.168 | 4.369 |
| nanoflann | 1.197 | 2.669 | 1.719 | 6.346 | 8.538 | 6.475 | 3.487 |
| R*-tree | 2.115 | 3.480 | 2.524 | 6.780 | 6.603 | 5.087 | 2.207 |
| Octree | 5.968 | 10.337 | 7.002 | 17.031 | 21.322 | 22.057 | 21.550 |
| BD-tree | 2.830 | 5.978 | 7.422 | 22.034 | 199.028 | 62.443 | 6.750 |
| cKDTree | 4.126 | 15.447 | 16.145 | 51.861 | 158.378 | 139.573 | 25.994 |
| ArborX BVH | 1.057 | 2.026 | 1.247 | 4.923 | 4.688 | 3.295 | 0.817 |
| **Ours** | **0.144** | **0.161** | **0.145** | **0.210** | **0.217** | **0.243** | **0.407** |

→ 相对最快基线约 **2× 加速**；相对 CGAL 并行构建版本 **2.2×–10.7×**。

**距离评估次数（每查询）——网格初始化的效果**

| 模型 | 顺序 p₁ | 顺序 s(C) | CGAL 并行 p₁ | CGAL 并行 s(C) | 层级一致 p₁ | 层级一致 s(C) |
|------|---------|-----------|--------------|---------------|---------------|---------------|
| Camel | 190 | 110 | 201 | 116 | 193 | 107 |
| Bunny | 185 | 109 | 211 | 132 | 191 | 108 |
| Dragon | 240 | 104 | 280 | 123 | 235 | 102 |
| Kitten | 226 | 130 | 391 | 194 | 221 | 127 |
| Armadillo | 277 | 112 | 490 | 163 | 276 | 111 |
| Lucy | 332 | 148 | 644 | 226 | 325 | 143 |
| Sponza | 482 | 292 | 958 | 383 | 500 | 300 |

→ 网格初始化把距离评估降低 **约 35%–40%**；层级一致构建的查询代价与顺序构建**几乎相同**（对比 CGAL 并行的显著劣化）。

**构建时间（ms）**

| 方法 | Camel | Bunny | Dragon | Kitten | Armadillo | Lucy | Sponza |
|------|------|------|------|------|------|------|------|
| DP-NNS（顺序） | 147.8 | 368.3 | 515.4 | 1488.7 | 3798.2 | 5524.1 | 6390.5 |
| ArborX BVH | 1.2 | 2.6 | 2.7 | 9.5 | 19.4 | 29.7 | 28.1 |
| DP-NNS（CGAL 并行） | 35.2 | 51.3 | 61.2 | 267.0 | 298.2 | 476.4 | 709.2 |
| **Ours（层级一致并行）** | 26.6 | 45.6 | 49.4 | 180.5 | 261.2 | 390.2 | 499.0 |

→ 相对顺序 DP-NNS **约 9.5×–12.8× 加速**（论文摘要称 10×）；相对 CGAL 并行提升 15%–32%。

**应用**：作为 drop-in 搜索后端集成进 point-to-plane ICP 配准，取得显著端到端加速。

---

## 局限性

1. **构建开销仍高于树结构**：虽然比顺序 DP-NNS 低很多，但构建 Delaunay 层次仍**慢于构建 k-d tree** 等树索引（表中 Lucy：390 ms vs ArborX 29.7 ms）
2. **只针对精确 1-NN**：对一般 k-NN 查询增益有限（网格初始化只服务 1-NN）
3. **维度受限**：继承精确 Delaunay 三角剖分的限制，只能用于低维空间（如 3D），构建复杂度随维度恶性增长

**未来工作**：进一步降低构建开销；设计专用遍历机制加速 k-NN；探索近似 Delaunay 图构建以扩展到高维。

---

## 相关工作

- DP-NNS（论文参考文献 [12]）——本工作的直接基础
- CGAL 5.6.1（并行插入 [13,14]）
- BRIO（Biased Randomized Insertion Order）——多层插入调度 [15]
- Manifold k-NN [17]——作者指出并行构建与查询重排同样惠及它
- FastAtlas [70] / TABI [18] / SF3D [7]——GPU chart 分割相关（见 Sprint3D 笔记）

## 相关笔记

- [[2026-11-13-Sprint3D-Accelerating-3D-Asset-Generation-Pipeline-Optimization]]
- [[2026-11-13-PIM-Physical-Intuition-Model-Equilibrium-Prediction]]
- [[2026-11-13-BrickFlow-Connectivity-Guided-Brick-Reconstruction]]

---

## 实现建议

- **实现难度**：**中**。核心算法（增量 Delaunay + successor DAG + 网格初始化 + 层级一致并行插入）均有成熟理论支撑，CGAL 提供精确谓词的 Delaunay 插入，oneTBB 提供并行。难点在：(a) successor DAG 的正确维护与并行插入的冲突协调；(b) 网格 cell 起始点的预计算需要额外一遍 NN 查询
- **数值稳定性**：**好**。使用 CGAL 精确谓词（exact predicates），不依赖浮点鲁棒性假设；定理 1 的复杂度保证建立在**齐次 Poisson 点过程**假设下，实际数据偏离时查询代价可能退化（论文 Table III 显示 Lucy/Sponza 的距离评估数最高达 500，接近 $O(n)$ 边缘）
- **适用场景**：
  - ✅ 隐式曲面重建 / SDF 计算（表面数据 + 体素查询）——**最契合**
  - ✅ 神经隐式表示训练期的体素采样
  - ✅ 大批量点云配准（ICP 的 inner loop）
  - ✅ 点基渲染（point-based rendering）的邻域搜索
  - ❌ 少量查询 / 在线交互式查询（构建开销无法摊销）
  - ❌ 高维空间（>4D）
- **落地建议**：可直接以 CGAL + oneTBB 复现核心逻辑；若接入现有几何管线，推荐**作为可选后端**——先跑一个 benchmark 判断"查询批量 / 构建成本"的比值是否划算。集成进 ICP 时应注意：论文只验证了 point-to-plane，对 point-to-point 需重新评估

## 开源参考

- **CGAL**：`CGAL::Delaunay_mesh_3`（带增量插入的 3D Delaunay 三角剖分）
- **CGAL**：`CGAL::Exact_predicates_inexact_constructions_kernel`
- **oneTBB**：`tbb::parallel_for`（层内并行插入）
- **ArborX**：`ArborX::BVH`（GPU BVH，作为对照基线）

已传递给 @墨鱼丸。
