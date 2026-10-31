---
type: paper
created: 2026-10-31
updated: 2026-10-31
source: SIGGRAPH Asia 2026 (Technical Papers)
sa2026_id: papers_1384
venue: SIGGRAPH Asia 2026 Conference Papers (ACM TOG)
status: accepted
authors: Anchang Bao, Enya Shen, Jianmin Wang
tags: [几何, 点包含查询, 广义缠绕数, 修剪曲面, 周期性参数化, 通用覆盖空间, B-Rep, 曲面镶嵌]
domain: geometry
agent: wawaicai
recommendation: ⭐⭐⭐ 强烈推荐（纯几何算法，可直接实现，工程价值高）
---

# Point Containment Queries on Trimmed Surfaces via Winding Numbers and Periodicity Lifting

> 📌 **SA2026（papers_1384）**。**今日最「纯几何」的一篇**：CAD 建模 / 实体几何处理 / 曲面镶嵌都需要的基础算子，算法清晰、可直接实现。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | Point Containment Queries on Trimmed Surfaces via Winding Numbers and Periodicity Lifting |
| **作者** | Anchang Bao, Enya Shen, Jianmin Wang |
| **发表** | **SIGGRAPH Asia 2026**（ACM TOG） |
| **项目页** | 摘要未给 |

---

## 技术概述

### 问题：点包含查询是 B-Rep 管线的基础算子

> **修剪曲面（trimmed surface）上的点包含查询**是 **CAD 建模、实体几何处理（solid geometry processing）、曲面镶嵌（surface tessellation）** 的**基础**。

**现有方法的局限**：

| 方法 | 局限 |
|------|------|
| **光线投射（ray casting）** | **鲁棒性**差；对边界附近的点不稳定；典型的「射线穿过缝/顶点」病态 |
| **广义缠绕数（generalized winding number, GWN）** | **计算效率**低；需要全局求和 |

### 核心技术 ①：递归缠绕数计算 + 椭圆包围盒替代控制点包围 ⭐

**思路**：把 GWN 的求和做成**递归**的，用**局部化**的包围盒提前剪枝。

**关键改动**：对于 **Bézier 曲线段**，用**基于椭圆的包围（ellipse-based bound）**替换原来的**控制点包围（control point bound）**。

> **这是本文最实用的技术点**：
> - 控制点包围盒（control-point bound）：Bézier 段整体在控制多边形内 ⟹ **保守但很松**，尤其对高阶或形状弯曲的段
> - **椭圆包围**：用曲线的**实际几何包络**做紧致界 ⟹ **避免昂贵的曲线细分（curve subdivision）**
> - 收益：**省掉 subdivision 这一步** ⟹ 计算量大幅下降，同时保持精度

### 核心技术 ②：周期性提升到通用覆盖空间（Periodicity Lifting）⭐

**问题**：周期性参数化曲面（periodic surfaces）的参数域是**环面（torus）**而非平面。修剪曲线在参数域里可能：
- **不可压缩（non-contractible）**——绕一圈回到自己
- **不连续（discontinuous）**——跳变

此时在参数域上直接做「缠绕数累加」**没有意义**（曲线不同伦类 ⟹ 缠绕数不守恒）。

**解法**：把修剪曲线**提升（lift）到通用覆盖空间（universal covering space）**。

> 通用覆盖空间 = 把环面**沿周期方向无限展开**成平面。
> 于是：
> - 不可压缩的环 ⟹ 在覆盖空间里成为**一条真正的开曲线**（不再闭合）
> - 每个周期副本都独立计算 ⟹ **缠绕数计算准确且一致**

**结果**：即使参数域中存在非可压缩或不连续的环路，仍能正确计算。

---

## 复杂度分析

| 阶段 | 复杂度 | 说明 |
|------|--------|------|
| 缠绕数递归求和 | 与场景中的**段数**和**包围盒剪枝效率**相关 | 椭圆界 ⟹ 剪枝更早 ⟹ 实际访问节点远少于线性 |
| 包围盒构造 | **O(1)** 每次 | 椭圆界可预计算并缓存 |
| 曲线细分 | **0**（本文的核心收益） | 对比传统 GWN 实现需要细分来收紧包围 |
| 覆盖空间提升 | O(周期副本数) | 每副本独立计算 |

**论文报告**：相对现有缠绕数算法有**显著加速（substantial speedups）**，同时在**几何噪声、开放边界、周期性拓扑**下保持**高鲁棒性**。

---

## 实验结论

- **数据集**：真实 **B-Rep 模型**（CAD 模型）+ 周期性/修剪曲面合成基准
- **基线**：现有缠绕数算法（快速广义缠绕数类方法）
- **结果**：
  - **显著加速**
  - 在**几何噪声 / 开放边界 / 周期性拓扑**下保持高鲁棒性
  - 在**真实 B-Rep 模型处理**与**修剪曲面的鲁棒镶嵌**上验证有效性

---

## 数值稳定性

### ✅ 优势
- **椭圆包围**比控制点包围**紧致得多** ⟹ 剪枝更早 ⟹ 既快又更少误差累积
- **通用覆盖空间提升**从根本上解决了周期曲面的缠绕数**拓扑正确性**问题 ⟹ 不是数值近似，而是**拓扑精确**
- **递归结构**天然支持提前退出

### ⚠️ 风险点
- ⚠️ **椭圆界对非有理 Bézier 段**（权重非均匀）：加权 Bézier 的椭圆包络比普通 Bézier 复杂 ⟹ 需确认实现细节；论文摘要未展开
- ⚠️ **周期性提升的副本数**：若修剪曲线跨越很多周期，副本数会增长 ⟹ 需检查是否有截断策略
- ⚠️ **边界点**（恰在修剪边界上）：缠绕数本身在边界处**数学上未定义/不连续** ⟹ 仍需额外 tie-break 规则（论文提到「开放边界」下鲁棒，但具体规则未知）
- ⚠️ **几何噪声**下的鲁棒性依赖包围界的**保守余量（padding）** ⟹ 噪声大时须加大余量，否则会误剪枝

---

## 推荐结论

✅ **强烈推荐（今日最值得动手实现的一篇）**

### 理由
1. **纯几何 + CAD 内核级算子**：点包含查询是 B-Rep 内核、布尔运算、镶嵌、偏移操作的基础
2. **无学习成分**：算法清晰 ⟹ **可直接实现、可用 CPU、可验证**
3. **两个技术点都有独立价值**：
   - **椭圆包围替代控制点包围** ⟹ **即使不做覆盖空间提升，这个改动也能单独加速现有 GWN 实现**
   - **周期性覆盖空间提升** ⟹ 解决周期性曲面的**拓扑正确性**问题，是原理性创新
4. **与我库中已有工作的直接关联**：
   - [[2026-05-18-Spatially-Accelerated-Winding-Numbers]]（空间加速缠绕数，GPU 路线）
   - [[2026-05-18-Accelerated-Winding-Numbers-Curved-Geometry]]（The Antipodal Method，快速 GWN）
   - [[2026-07-Fast-Exact-Winding-Numbers-Triangle-Meshes]]（三角形网格上的快速精确缠绕数）
   - [[2026-05-18-Accelerated-Winding-Numbers-Curved-Geometry]]（曲面几何的缠绕数加速）
   - ⟹ **我库已有 4+ 篇缠绕数相关笔记，本文是这条线的最新推进**
   - ⚠️ **注**：本文作者 Anchang Bao 的前作「Fast & Robust Point Containment on Trimmed Surface」(2025-10, arXiv 2510.25159) 与更早的 One-Shot GWN (2408.04466) / Fast Normal Orientation (2405.16634) **在本库尚无独立笔记** ⟹ 建议补录后再对照阅读

### 落地建议
- **优先级**：**高**。建议在 CAD 内核/几何工具链中做**对照实现**
- **分两步落地**：
  1. **第一步（低成本高收益）**：在现有 GWN 实现里把**控制点包围换成椭圆包围**，量测加速比
  2. **第二步**：实现**通用覆盖空间提升**，覆盖周期性曲面（管道、扫掠面、回转面）
- **参考实现**：CGAL 有 `Side_of_triangle_mesh` / `do_intersect`；OpenCascade 有 `BRepClass3d_SolidClassifier`（用的是射线法）⟹ 可作为正确性基准

---

## 相关工作脉络

| 方向 | 代表 | 与本文关系 |
|------|------|-----------|
| 缠绕数 | [[2026-05-18-Spatially-Accelerated-Winding-Numbers]]（CGF'25） | **空间加速 + GPU 路线**，与本文的**局部紧致包围**互补 |
| 缠绕数 | [[2026-05-18-Accelerated-Winding-Numbers-Curved-Geometry]]（The Antipodal Method，2026-05） | 快速 GWN，替代偶极子求和 |
| 缠绕数 | [[2026-07-Fast-Exact-Winding-Numbers-Triangle-Meshes]] | 三角形网格上的快速精确缠绕数 |
| 缠绕数 | Robust Containment over Trimmed NURBS via GWN（2024） | **直接前作**，本文是其加速与周期性扩展 |
| 缠绕数 | 3D Reconstruction with Fast Dipole Sums | 快速偶极子求和，另一条加速路径 |
| 缠绕数 | Fast & Robust Point Containment on Trimmed Surface（2025-10） | **本人前作**，本文是延续（本库未收录） |
| 点包含 | 剪裁曲面查询 / Point Containment Queries on Trimmed Surfaces（VCG'21） | 经典基线 |
| B-Rep | Ray casting / winding number | 两类主流方法，本文针对 |
| 镶嵌 | CGAL / OpenCascade 曲面镶嵌 | 应用场景 |

---

## 相关笔记

- [[2026-05-18-Spatially-Accelerated-Winding-Numbers]]
- [[2026-05-18-Accelerated-Winding-Numbers-Curved-Geometry]]
- [[2026-07-Fast-Exact-Winding-Numbers-Triangle-Meshes]]
- [[2026-07-08-ExMesh-Topology-Adaptation]]
- [[2026-10-30-SA2026-OffsetAxis-UDF-Medial-Axis-Reconstruction]]

相关主题：[[几何处理]] [[缠绕数]] [[点包含查询]] [[修剪曲面]] [[B-Rep]] [[CAD]] [[曲面镶嵌]] [[通用覆盖空间]] [[周期性参数化]]
