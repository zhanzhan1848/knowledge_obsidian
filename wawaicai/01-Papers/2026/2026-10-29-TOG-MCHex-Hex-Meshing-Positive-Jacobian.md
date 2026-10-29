---
type: paper
created: 2026-10-29
updated: 2026-10-29
source: ACM TOG
doi: 10.1145/3858338
arxiv: 2511.02064
journal: ACM Transactions on Graphics
published: 2026-10-13
status: accepted (Just Accepted)
tags: [geometry, hex-meshing, volumetric-meshing, marching-cubes, mesh-quality, Jacobian-guarantee, finite-element, CGAL, adaptive-refinement, SDF]
domain: geometry
agent: wawaicai
recommendation: 强烈推荐（核心几何处理：保证正雅可比的六面体网格生成）
---

# MCHex: Marching Cubes Based Adaptive Hexahedral Mesh Generation with Guaranteed Positive Jacobian

> 📌 **今日唯一一篇「纯几何处理内核」论文**（非渲染、非神经隐式）。核心贡献是把六面体网格生成中两个长期靠启发式处理的环节（边界拟合 + 单元质量）**同时变成有理论保证的确定性算法**。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | MCHex: Marching Cubes Based Adaptive Hexahedral Mesh Generation with Guaranteed Positive Jacobian |
| **作者** | Hua Tong, Yongjie Jessica Zhang (Carnegie Mellon University) |
| **期刊** | ACM Transactions on Graphics (TOG), 2026-10-13 录用（Just Accepted） |
| **DOI** | [10.1145/3858338](https://doi.org/10.1145/3858338) |
| **预印本** | [arXiv:2511.02064](https://arxiv.org/abs/2511.02064) (cs.CG, v1 2025-11-03 → v5 2026-07-02) |
| **开源** | ✅ [github.com/CMU-CBML/MCHex](https://github.com/CMU-CBML/MCHex) — **MIT License**，C++ / CMake |
| **关键词** | grid, hexahedral mesh, marching cubes, mesh quality |
| **基准** | Thingi10K, **202 个几何模型** |

## 技术概述

### 问题：网格化流水线里最脏的两个环节

基于网格（grid-based）的六面体（hex）网格生成是工业界唯一广泛采用的自动体网格化路线（Intrinsic、Coreform 等），流程是：

```
自适应笛卡尔网格 → 3-refinement 模板消除悬挂节点 → 移除外部单元 (RO) → 投影到输入几何
```

问题出在**最后两步**，且是**长期靠启发式硬撑**的：

1. **边界拟合**：RO（remove outside）直接砍掉网格外部单元，得到的是**轴对齐（axis-aligned）表面**，对任意输入几何只能**一阶收敛**到真值。
2. **投影（projection）**：把轴对齐边界往输入三角形边界推 —— 这是**纯启发式**，**不保证**改善 IoU，**不保证**最终单元质量。
3. 后果：现有商业软件（RO + 投影）**只能二选一** —— 要么边界贴合好但单元质量垮掉，要么单元质量保住但边界是块状的。

### 核心思想：把 Marching Cubes 塞进网格单元里

MCHex 的做法是**用 Marching Cubes 替换掉 RO 这一步**：

> 在**每个被切割的网格单元内部**直接跑 MC，提取相对于输入几何的零等值面，从而保证**最终网格边界就是一个 MC 曲面**。

关键洞察（论文原话）：

> **被切割的单元构成 3-正则图（3-regular graph）**，对这些 3-正则图做**中点细分（midpoint subdivision）**，即可生成**所有单元雅可比均为正**的全六面体网格。

这里有两个几何学上的「巧思」值得记住：

| 概念 | 含义 | 作用 |
|------|------|------|
| **3-正则图** | 每个顶点的度数恰好为 3 的图 | MC 的 3-regular cut-cell 构型具有特殊拓扑性质 |
| **中点细分** | 在图边的中点插入新顶点 | 3-正则图 + 中点细分 ⇒ 全体六面体单元可定向且**雅可比为正** |

### 算法流程（论文 Algorithm 1）

```
输入: 闭合纯 2D 单纯复形 T_geom, 轴对齐包围盒 T_AABB
输出: 内部网格 H_Int(T_geom) 与外部网格 H_Int(T_AABB) \ Int(T_geom)

1. 用 3-refinement 策略初始化网格
   for each cell:
     while 特征敏感误差 > 用户阈值:
       递归细分该 cell 为 27 个子 cell
2. 对网格中每个格点计算 SDF 值
3. for each cell in H_Int(T_AABB):
     if 八个 SDF 值异号:                      # 该 cell 被等值面切割
        用 MC 方法构造把 cell 分成 inside/outside 的 3-正则图
        for each 3-正则图:
          应用中点细分
4. 生成全六面体网格: 内部网格 + 外部网格
5. Warp 体积中心点以确保正雅可比
```

**自适应细化准则**（沿用 Zhang et al. 2005 的特征敏感误差函数）：

$$\sum_{i=1}^{27} \frac{\left| f^{j+1}(\mathbf{x}_i) - f^j(\mathbf{x}_i) \right|}{\left| \nabla f^j(\mathbf{x}_i) \right|}$$

其中 $\mathbf{x}_i$ 是单元八个角点的位置向量，$f$ 为 SDF。

### 三个理论优势（论文明确列出）

1. **理论保证所有六面体单元雅可比为正**（positive Jacobian guarantee）—— 不是「通常为正」，是**保证**。
2. **边界收敛率匹配 MC 的逼近率** —— 即 **O(h²)** 而非 RO 的 **O(h)**（一阶）；且算法**非启发式**，时间复杂度有界，**wall-clock 最快**。
3. **任意几何都能生成流形（manifold）表面**，并且**天然带 padding layer**（外部网格就是边界的一层填充）—— 顺带**内在地解决了拓扑歧义（topology ambiguities）**。

## 算法复杂度

| 项 | 分析 |
|----|------|
| **时间** | 主导项是 **SDF 预计算**（网格上所有格点的距离场）。MC 部分每 cell 局部常数时间 → **O(N_cells)**；自适应细分阶段递归但受阈值控制 |
| **空间** | O(N_grid_points) 用于 SDF 场 + O(N_elements) 用于网格 |
| **网格规模** | 与已有方法**同预算**比较时，MCHex 使用**略少**的单元数（"slightly smaller element budget"）仍达到相当边界拟合度 → **单位预算拟合更优** |

## 实验结果

**基准**：Thingi10K **202 个几何模型**，与此前 SOTA 方法在**相同计算预算**（同一份预计算 SDF，SDF 主导运行时间）下对比。

| 指标 | RO（传统） | MCHex |
|------|-----------|--------|
| **最小 scaled Jacobian** | ≥ 0.48 | **> 0（但更低）** |
| **IoU（越高越好）** | 较低 | **更高** |
| **Hausdorff 距离比 HR（越低越好）** | 较高 | **更低** |
| **边界收敛阶** | O(h) 一阶 | **O(h²) 匹配 MC** |
| **wall-clock** | 较慢 | **最快** |

> ⚠️ **注意一个诚实的取舍**：MCHex 的最小 scaled Jacobian **比 RO 更低**（RO 能到 ≥0.48，MCHex 只保证 >0）。论文的立场是「**正雅可比是硬保证，质量高只是软目标**」—— 这在有限元/等几何分析里是更重要的性质，因为**负雅可比单元会导致求解器直接失败**，而低质量单元只是收敛慢。
>
> 💡 但这也意味着 **MCHex 必须配合后处理**（论文明确提到）：优化式边界平滑 + 网格简化。**MCHex 负责「不破」，后处理负责「变好」**。

## 实现难度与依赖

| 项 | 评估 |
|----|------|
| **算法复杂度** | **中-高**。MC 部分标准；难在 3-正则图构型的构造、中点细分的拓扑一致性、以及 Warp 体积中心点保证正雅可比这一步 |
| **数值稳定性** | **好**。这是本文最大卖点 —— 雅可比是**构造性保证**而非事后修复。边界处可能出现**极薄单元**，但不会反转。SDF 精度直接决定边界拟合精度 |
| **依赖项** | C++，**CMake**，MIT 协议；输入 `.obj` 三角形网格，输出 `.vtk` 六面体网格 |
| **代码规模** | 小巧（README 极简：编译 → 放 `.obj` 到 `inputBoundaries/` → 运行 → 得到 `.vtk`）→ **适合作为参考实现直接读/改** |
| **可复现性** | ✅ 高（开源 + MIT + 公开 202 模型基准） |

## 推荐结论

✅ **强烈推荐收录**

**理由**：
- 这是**近期唯一一篇「几何处理内核」级别的论文**（其余多为渲染/神经表示），对我们主线工作（网格处理工具链）**直接相关**。
- 「**把启发式步骤换成有理论保证的构造**」这一思路，可直接迁移到我们的其他几何算子（例如投影、简化、质量修复）。
- 「**3-正则图 + 中点细分 ⇒ 正雅可比**」是一个**值得记住的独立几何事实**，可以脱离本文单独使用。

**推荐度**：⭐⭐⭐ 强烈推荐（核心几何处理 + 开源 + 有保证）

## 开源参考

- **论文代码**：[github.com/CMU-CBML/MCHex](https://github.com/CMU-CBML/MCHex)（MIT License）
- **arXiv**：[arXiv:2511.02064](https://arxiv.org/abs/2511.02064)
- **CGAL**：`CGAL::Polygon_mesh_processing::remesh_*` 系列可作对比参考；CGAL 的 `Surface_mesh` 不直接支持六面体，但 `CGAL::Polygon_mesh_processing::isotropic_remeshing` 可用于其后处理
- **libigl**：无原生 hex 支持；`libigl::boundary_loop` / `igl::signed_distance` 可用于 SDF 侧
- **TetGen / Netgen**：四面体/多面体路线对比参考

## 相关笔记

- [[2026-10-28-TOG-C2-Point-Normal-Subdivision-Surfaces]]
- [[2026-05-23-DAILY-SUMMARY]]（PolycubeNet 六面体相关）
- [[2026-10-26-BPA-Assisted-Screened-Poisson-Sparse-Point-Clouds]]

---

*收集自 ACM TOG（DOI 直取）/ arXiv / GitHub。检索时间：2026-10-29 14:00 UTC*
