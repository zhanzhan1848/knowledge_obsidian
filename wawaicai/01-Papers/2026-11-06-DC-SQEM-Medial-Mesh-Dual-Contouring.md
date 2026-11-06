---
tags: [几何, 中轴变换, 双轮廓, SQEM, 八叉树, 点云, 特征保持, 拓扑清理, medial-axis]
date: 2026-11-06
source: arXiv
arxiv_id: 2611.07328
venue: cs.GR (2026-11-05 submission)
status: processed
agent_id: wawaicai
authors: Bingchuan Li, Ruilong Liu, Tianhao Hu, Congyi Zhang, Ningna Wang, Junfeng Yao, Xiaohu Guo
url: https://arxiv.org/abs/2611.07328
code: https://github.com/Jiafeimaochuanqi/dc_sqem.git
pdf: https://arxiv.org/pdf/2611.07328
---

# DC-SQEM: Medial Mesh Extraction by Dual Contouring with Spherical Quadric Error Metric

> 从**定向点云**直接提取**特征保持**的三维中轴网格（medial mesh），无需水密流形表面或体网格。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DC-SQEM: Medial Mesh Extraction by Dual Contouring with Spherical Quadric Error Metric |
| **作者** | Bingchuan Li, Ruilong Liu, Tianhao Hu (厦大) / Congyi Zhang, Ningna Wang, Xiaohu Guo (UT Dallas) |
| **发表** | arXiv cs.GR, 2026-11-05 |
| **链接** | [原文](https://arxiv.org/abs/2611.07328) |
| **代码** | https://github.com/Jiafeimaochuanqi/dc_sqem.git (C++ 模块 + Python 调用) |
| **篇幅** | 21 页（正文 + 补充文档） |

---

## 核心贡献

> 在双轮廓（Dual Contouring）框架内引入 SQEM 拟合 + 虚拟节点机制 + 类型降级策略，把中轴提取的输入假设从「水密流形表面网格」放宽到「带朝向的点云」，同时保持完整的二维中轴片（sheets）而非退化为 1D 骨架。

1. **纯几何的点云中轴提取框架** —— 直接在自适应八叉树上构建 dual cell complex，无需 RPD（Restricted Power Diagram）计算、无需体素化。
2. **虚拟节点（Virtual Node）机制** —— 解决双轮廓中长期存在的「out-of-cell 解」问题，避免因局部 SQEM 解落在胞外而造成孔洞伪影。
3. **单元格类型降级策略（Type Downgrading）** —— 用投影聚类（projection grouping）约束 SQEM 解空间复杂度，按 `Corner → Line → Plane` 顺序降级，提升分类鲁棒性。
4. **几何驱动 + 拓扑感知的清理流程** —— Euler 特征监控的简单对（simple pair）删除 + 特征边支持面保护 + 距离最小化三角化。
5. **完整中轴结构重建** —— 保留片（sheets）、曲线（curves）、缝（seams）、结（junctions），而非仅 1D 骨架。

---

## 技术方案

### 核心思想

中轴（medial axis）同时编码局部厚度、全局拓扑与显著几何特征，但**对噪声极度敏感**且**天然非流形**。既有方案各有取舍：

| 方法族 | 输入要求 | 局限 |
|--------|---------|------|
| Power Crust / SAT / Voxel Cores | 采样条件 / 体素化 | 冗余片、尖刺、拓扑错误 |
| RPD 系（MATFP / MATTopo / MATStruct） | **水密表面网格或四面体网格** | 无法直接吃点云 |
| 点云/神经系（L1-medial / VMAS / Point2Skeleton / Deep Medial Fields / Q-MDF） | 点云 | 偏 1D 骨架，2D 中轴片难以稳定恢复 |

DC-SQEM 走**纯几何路线**：局部投影聚类 + SQEM 拟合 → 八叉树 dual complex → 双轮廓 → 拓扑感知清理。

### 关键技术

| 技术 | 说明 |
|------|------|
| **SQEM 单元格类型分类** | 用奇异值/奇异向量判定 4 类：`Corner`(T4，σ3≠0) / `Line`(T3、T∞，σ3≈0) / `Plane`(T2，σ2≈0) / `Null`(σ1,σ2,σ3≈0，空胞)；退化阈值 ε=10⁻² |
| **虚拟节点** | 当 SQEM 解落在面/边相邻胞之外时，将其记为**候选虚拟节点**，并引用邻近的**真实节点**补全局部连接（Fig. 4） |
| **投影聚类候选胞选择** | 在胞内均匀采样点、投影到点云表面，构建 KNN 图做连通分量测试；**1 簇 = 空胞，≥2 簇 = 候选胞**（故意保守，宁可多留） |
| **类型降级外循环** | SQEM 求解失败时按 `Corner → Line → Plane` 降级重试，全失败才判空胞 |
| **Dual mesh 构建** | 每条网格边被 4 个邻胞共享；4 胞皆非空则生成一个连接 4 个对偶点的四边形 |
| **Solid-cell 删除** | 2×2×2 活跃胞块会造出体积区域；用 (solid,face) 与 (face,edge) 简单对删除，Euler 特征 χ = V−E+F−C 保持不变 |
| **特征边保护** | 外部特征边（凸锐边）必须至少保留一个支撑面；内部特征边（中轴缝）同理 |
| **几何误差 d(f)** | 对四边形的两种三角化取 `min_T max_t dist(t)`；`dist(t)` = 三角形重心到由最大两个投影组拟合的切平面距离；若所有投影样本落在同一连通组则 `dist(t)=+∞` |
| **T∞-型连通性** | 对未被有效面连接的 T∞ 节点，显式插入中轴边：用投影方向张成平面的法向估计局部轴，再评估投影方向绕轴的角度覆盖 |

### 关键公式

**SQEM 单元格类型判定**

$$
\sigma_1 \ge \sigma_2 \ge \sigma_3,\qquad
\begin{cases}
\text{Corner (T4)} & \sigma_3 \gg 0\\
\text{Line (T3/T}\infty\text{)} & \sigma_3 \approx 0,\ \sigma_2 \gg 0\\
\text{Plane (T2)} & \sigma_2,\sigma_3 \approx 0,\ \sigma_1 \gg 0\\
\text{Null (empty)} & \sigma_1,\sigma_2,\sigma_3 \approx 0
\end{cases}
$$

**Euler 特征监控（拓扑保持删除）**

$$
\chi = V - E + F - C
$$

**几何误差定义**

$$
d(f) = \min_{T \in \mathcal{T}(f)} \max_{t \in T} \mathrm{dist}(t),
\qquad
\mathrm{dist}(t) = \mathrm{dist}(c_t, \Pi_t)
$$

**虚拟节点失效的几何条件**

$$
\omega = 2\arctan\frac{\sqrt{2}}{2} \approx 70.53^\circ
$$

> 两张中轴片的二面角小于此值时，所需虚拟引用超出「面/边相邻邻域」，机制失效。统计（MATStruct 的 88 个模型、52,173 个角样本）中仅 **0.56%** 的样本低于该阈值，且实际未遇到失效案例。

---

## 实验结论

- **数据集**：ABC 数据集 **93 个 CAD 模型**（与 MATStruct 完全一致的子集，避免数据集选择偏差）+ 8 个有机模型；全部归一化到 [−0.5, 0.5]³
- **硬件**：Intel Core i7-14700KF @ 3.40 GHz，64 GB RAM
- **基线**：Power Crust (PC_160/PC_200)、NSK、SAT-0.03/0.04、VMAS、MATTopo、VC

### 定量结果（93 个 CAD 模型）

| 方法 | MSER(%)↓ | TQ↑ | TER(%)↓ | HD(%)↓ | SITR(%)↓ |
|------|----------|------|----------|----------|-----------|
| **Ours (DC-SQEM)** | **3.0874** | 0.683 | **2.1505** | **0.4203** | **4.0711** |
| PC_160 | 94.0065 | 0.486 | 100 | 1.1668 | 0 |
| PC_200 | 94.2978 | 0.487 | 100 | 1.1219 | 0 |
| NSK | 98.3696 | 0.653 | 100 | – | 0 |
| SAT-0.03 | 84.0117 | 0.269 | 100 | 4.4955 | 20.3429 |
| SAT-0.04 | 85.0257 | 0.254 | 100 | 4.7628 | 16.8332 |
| VMAS | 95.6633 | **0.695** | 100 | 1.9718 | 10.4908 |

> **关键**：DC-SQEM 在 MSER（表面误差）、TER（拓扑误差率）、HD（Hausdorff 距离）、SITR（自相交率）四项上**大幅领先**（TER 从 100% → 2.15%，SITR 从 10~20% → 4.07%）。TQ（三角面质量）与最佳方法 VMAS（0.695）接近。

### 运行时对比（秒，ABC 子集）

| Model | MATTopo | NSK | PC_160 | PC_200 | SAT-0.03 | SAT-0.04 | VC | VMAS | **Ours** |
|-------|---------|-----|--------|--------|-----------|-----------|-----|------|--------|
| 40051 | 174.13 | 182.49 | 32.07 | 43.99 | 10.93 | 6.37 | 8.47 | 17.15 | **7.74** |
| 40092 | 265.50 | 69.25 | 34.67 | 50.14 | 13.50 | 8.12 | 8.97 | 9.51 | **10.81** |
| bear | 52.50 | 82.53 | 18.10 | 26.81 | 7.90 | 4.74 | 9.80 | 1.87 | **13.2** |
| bug | 75.00 | 158.70 | 13.79 | 21.01 | 5.73 | 3.54 | 8.67 | 1.00 | **4.49** |
| chair | 62.42 | 148.91 | 16.88 | 26.52 | 6.24 | 4.00 | 8.96 | 1.64 | **3.54** |
| plane | 83.21 | 157.40 | 9.97 | 13.31 | 3.16 | 1.88 | 6.78 | 1.31 | **3.01** |
| venus | 65.73 | 150.82 | 17.89 | 27.10 | 9.19 | 5.27 | 9.91 | 11.29 | **10.97** |

> 相对 RPD 系（MATTopo）**快一个数量级以上**；相对 SAT/VC/VMAS 处于同一量级（VMAS 在简单模型上更快但会 failed）。C++ 移植后总时间 **数秒 ~ 约 20 秒**。

**配置**：八叉树最大深度 7，采样数 `n_samples = 500,000`，KNN 参数 K=26。

### 采样密度收敛性

| 采样数 | 结果 |
|--------|------|
| 50,000 | 稳定，片结构连续，χ=1 |
| 15,000 | 稳定，χ=1 |
| 7,000 | **出现拓扑错误**（χ=−3），片不完整 |

---

## 复杂度分析

- **候选胞筛选（投影聚类）**：每胞内采样 m 点 → 投影到点云 → KNN 图 → 连通分量检验。整体约 O(n_samples · K) 级别（K=26）
- **KNN 图构建**：约 50 万有向点的 KNN 图是主要成本之一（鲁棒局部分组 + 特征感知分类所需）
- **SQEM 求解**：逐胞 3×3 奇异值分解，O(1)/胞（常）
- **Dual mesh 构建**：每条网格边判定四邻胞，O(#edges)
- **Solid-cell 删除**：每次删除需更新边-面邻接表与面优先级队列，**部分串行、难以并行化** —— 这是第二主要成本
- **空间复杂度**：O(#cells + #points)

## 数值稳定性

- **ε = 10⁻² 退化阈值**：刻意偏向「保留更多非零奇异方向」而非过早判定退化，避免过早丢失特征
- **候选胞保守化**：故意保留「仅与中轴相切」的胞，避免过度激进的空胞分类破坏跨胞中轴结构
- **类型降级外循环**：保证「一胞一顶点」表示在 medial 场景下的可靠性 —— 不会因为 SQEM 类型不给合法对偶顶点就丢弃有效胞
- **Euler 特征保持**：简单对删除保证 χ 不变（Ju et al. 2007）
- **特征边保护**：至少保留一个支撑面，防止沿特征线出现大间隙

---

## 局限性

1. **点云采样依赖** —— 从网格提取有向点云时需检测锐利特征并均匀采样。采样密度过低（7,000 点）会引入拓扑错误（χ 从 1 变 −3）
2. **复杂管状区域 / T∞ 1D 中轴曲线连接断裂** —— T∞ 节点检测是启发式的，图中 40053、40093 两个模型上 VMAS 直接 failed，而 DC-SQEM 在 40053 仍有局部断裂
3. **参数敏感性** —— 对八叉树分辨率与采样密度敏感。采样过稀时关键节点可能只有单个投影方向而被误判为空胞；八叉树过粗则带孔洞的中轴结构无法重建
4. **虚拟节点固有失效模式** —— 二面角 < 70.53° 的极端配置（理论上 0.56% 概率）无法恢复

---

## 相关工作

- [[MATTopo]] / [[MATFP]] / [[MATStruct]] — RPD 系中轴方法（需水密网格）
- [[PowerCrust]] / [[ScaleAxisTransform]] / [[VoxelCores]] — 经典中轴近似
- [[DualContouring]] — Ju et al. 2002 原始双轮廓（本文是其 medial 场景的推广）
- [[Point2Skeleton]] / [[DeepMedialFields]] / [[Q-MDF]] — 神经/隐式中轴
- [[Octree]] / [[AdaptiveOctree]] — 自适应细分

---

## 实现建议

- **实现难度**: **中-高**（SQEM 求解本身不难，难在类型分类的鲁棒性与拓扑清理逻辑；论文已提供 C++ 代码）
- **预期性能**: 50 万点 + 深度 7 八叉树 → 数秒 ~ 20 秒（CPU，单线程多核 OpenMP）
- **适用场景**:
  - 扫描数据的**结构化内部表示**（中轴片是形状编辑、分割、六面体网格生成的优质输入）
  - CAD 模型的**特征保持内骨架**（相对 MATTopo 快 10×+，拓扑错误率低 46×）
  - 需要在**没有水密表面**的场景下提取中轴（扫描数据、逆向工程）
- **工程注意**:
  - 生产环境建议直接用作者 C++ 实现，Python 绑定仅作接口
  - 采样数建议不低于 15,000（实测 7,000 起开始出现拓扑错误）
  - 复杂管状结构需要人工检查 T∞ 连接，必要时手工补边
- **依赖项**: 自实现 C++（OpenMP + Eigen/SVD）；libigl 可用于最终网格读取与可视化，但无现成 medial 实现

---

## 🔗 相关笔记

- [[2026-11-06-Representation-Aware-Closed-Surface-Parameterization]] — 同日几何核心论文（球面参数化的敏感性分析）
- [[2026-11-06-T2-Splat-Adaptive-Topology-Mesh-Splatting]] — 同日论文（含 QEM 边折叠 + Delaunay 相关技术）
- [[MeshSimplification]] · [[TopologicalRepair]] · [[PointCloudProcessing]]

---

*Generated by 黄喉 (wawaicai) at 2026-11-06*
