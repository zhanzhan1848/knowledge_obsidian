---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, surface-reconstruction, capacitive-sensing, non-planar-manifold, multi-view-reconstruction, shape-sensor, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_2316&sess=sess111
venue: SIGGRAPH Asia 2026
year: 2026
---

# Proximity3D: Shape from Capacitive Proximity on Sensing Manifold

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Proximity3D: Shape from Capacitive Proximity on Sensing Manifold |
| **作者** | Hao Chen, Chenming Wu, Chun Ping Lam, Xiangjia Chen, Guoxin Fang（**厦门大学** · Centre for Perceptual and Interactive Intelligence） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-02 · `papers_2316` / `sess111` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_2316&sess=sess111) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 把**曲面电容织物**当作形状传感器，**把它的表面视为非平面感知流形（non-planar sensing manifold）**；每次扫描 = 该流形上的一个**电容邻近场**；用**多视角前馈重建模型**跨已知传感器视角聚合这些场 ⟹ 恢复被观测物体形状。开创了**在非平面感知流形上做形状重建**的路线。

1. **打破「平面感知域」假设**：主流形状重建方法都假设测量定义在**平面**感知域（RGB 图像、深度图）。本文首次把**弯曲的电容织物**作为形状传感器，其曲面本身即感知域。

2. **电容邻近场（capacitive proximity field）作为测量表示**：每次扫描在流形上产生一个邻近场 ⟹ 该场由**弯曲电极布局与邻近物体几何的相互作用**诱导。

3. **多视角前馈重建模型**：跨**已知传感器视角**聚合邻近场 ⟹ 恢复观测到的物体形状。

4. **仿真 + 实物实验验证**：从弯曲感知曲面上获取的电容邻近信号 ⟹ **鲁棒重建**。

5. **指向新方向**：为**基于纺织品的近场几何感知**（机器人近场几何感知）提供新路径。

---

## 技术方案

### 核心思想

关键洞察：**感知域的几何本身就是问题的一部分**。

```
传统：平面传感器 + 图像/深度  ⟹  感知域是平的 ⟹ 重建在图像域进行
本文：曲面传感器 + 电容邻近场 ⟹  感知域是弯曲流形 ⟹ 重建必须在该流形上进行
```

这不是把平面方法直接套到曲面上，而是**在流形上定义测量、聚合与重建**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **曲面电容织物传感器** | 弯曲电极布局，作为形状传感器 |
| **电容邻近场表示** | 每次扫描 = 流形上的邻近场（非图像、非深度图） |
| **非平面感知流形** | 感知域 = 织物曲面本身（弯曲拓扑） |
| **多视角聚合** | 已知传感器视角下聚合邻近场 |
| **前馈重建模型** | 无需逐场景优化 |
| **仿真 + 实物实验** | 双验证 |

### 公式

```math
% 电容邻近场：在感知流形 S 上定义
φ_S : S → ℝ,   φ_S(p) = f(传感器电极布局, 物体几何, p)

% 多视角聚合（已知视角集合 V）：
%  每次扫描给出流形上一组场，逐场对齐（需流形间的对应关系）
F_agg = Aggregate_{v ∈ V} Align(φ_v)

% 形状恢复：从聚合场回归物体形状
Shapê = Regressor(F_agg)   % 前馈网络
```

---

## 实验结论

- **数据集**：仿真实验 + 实物实验（曲面电容织物 + 已知形状物体）
- **基线**：平面域形状重建方法（作为对照，说明平面假设的局限）
- **结果**：
  - 从**弯曲感知曲面**获取的电容邻近信号实现**鲁棒重建**
  - 仿真与实物均验证
  - 证明**非平面感知流形**路线可行

---

## 局限性

- **电容传感本身信号噪声大、标定依赖强** ⟹ 对油污/湿度/介电常数敏感
- **近场限制**：只能感知很近的物体（近场几何感知），**不适用于远距离**
- **多视角需已知传感器视角** ⟹ 未解决自标定 / 视角未知问题
- **需要物体不遮挡 / 传感器可接近**
- **前馈模型泛化性**未详述（是否跨物体类别泛化）
- **无开源实现**

---

## 与本库已有内容的关系

- 与 **11-02 的 [[Joint Orientation and Weight Optimization]]**（无定向点云水密重建）同属「**输入数据病态/受限**⟹ 建模为内生量」的主线
- 与 **[[Proximity3D]]** 在 11-02 已列入 SA2026 未收录清单（当时标注「几何味浓」）⟹ **今日正式收录**
- 与本库已有的 [[NRSfR]]、点云重建类条目互补：本文的独特性在于**感知域本身是弯曲的**

---

## 实现建议

- **实现难度**：**高**（需要：① 定制曲面电容织物硬件；② 曲面电容传感仿真；③ 流形上的多视角对应与聚合；④ 前馈重建网络训练）
- **预期性能**：实时（论文为前馈模型）
- **适用场景**：
  - **机器人近场几何感知**（抓取前的手部/物体表面探测）
  - **柔性物体/人形机器人表面接触检测**
  - **可穿戴 / 织物化传感**
  - ⚠️ **不适合通用 3D 重建管线**——这是专用传感路线
- **落地建议**：
  1. **先做仿真验证**：纯仿真（已知电极布局 + 已知电容前向模型）⟹ 验证「非平面流形上重建」的方法学是否成立，不碰硬件
  2. 若仿真可行，再评估硬件成本（定制织物是主要门槛）
  3. 关注**自标定**与**视角未知**的扩展（论文留白处）
- **开源参考**：
  - 曲面参数化与流形对应：[[2026-11-04-arXiv-2611.00721-Representation-Aware-Closed-Surface-Parameterization]]（球面参数化 + 敏感性）
  - libigl: `principal_curvature`、`igl::harmonic`、`coplanar`
  - CGAL: `CGAL::Surface_mesh_simplification`、`CGAL::Poisson_reconstruction`（若退到点云重建）
  - 前馈重建网络：可参考 [[Neural Explicit Shape Representation]] 的射线查询范式

---

## 相关工作

- [[2026-11-02-SA2026-Joint-Orientation-Weight-Watertight-Reconstruction]]
- [[2026-11-04-arXiv-2611.00721-Representation-Aware-Closed-Surface-Parameterization]]
- [[形状传感]]（待建概念条目）
- [[非平面感知流形]]（待建概念条目）

---

## 主题线索

> **「感知域 / 表示域的几何本身成为问题的一部分」** —— 与本篇同批次的 [[Representation-Aware Parameterization]]（平面图 vs 球面图）构成一对：
> - 参数化论文：**计算域的表示**影响结果精度
> - Proximity3D：**感知域的形状**决定重建方法
>
> ⟹ 两条独立工作从**计算侧**与**传感侧**同时指向：**「域的几何」是几何处理的一等公民**。可作为本库的一个概念条目候选：[[域几何 / Domain Geometry]]。
