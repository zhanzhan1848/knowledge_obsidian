---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, stochastic-solids, gaussian-splatting, surface-reconstruction, volumetric-rendering, occupancy-function, 3DGS, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1106&sess=sess118
venue: SIGGRAPH Asia 2026
year: 2026
---

# Grounding Gaussian Splatting Geometry with Stochastic Solids

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Grounding Gaussian Splatting Geometry with Stochastic Solids |
| **作者** | Baowen Zhang, Chenxing Jiang, Heng Li, Shaojie Shen, Ping Tan（**香港科技大学 HKUST**） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-04 · `papers_1106` / `sess118` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1106&sess=sess118) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 把 **3D Gaussian Splatting 重新解释为随机几何（stochastic geometry）**：每个高斯 = 一个**连续的随机不透明实体**，从而为 3DGS 提供了**唯一连续的占据函数（occupancy function）**，把阶梯状的透射率变成**光滑可微曲线** ⟹ 高质量深度 ⟹ 高保真表面提取。

1. **「Objects as Volumes」形式化的应用**：证明在 splatting 公式下，**单个高斯**存在一个**唯一的连续占据函数**，其体积渲染结果**与原始 splat 完全一致**（⟹ 不改变原有外观）。

2. **连续深度渲染**：利用随机几何的体积性质，**高效渲染高质量深度图**，用于细粒度几何提取。

3. **多视角一致性提升**：标准 3DGS 的离散 alpha 合成导致**锯齿状深度剖面**与**弱多视角一致性** ⟹ 连续占据函数同时修复两者。

4. **不牺牲优化效率**：在保持 3DGS 原有优化效率的前提下，达到 3DGS 方法中**state-of-the-art 的表面重建精度与平滑度**。

---

## 技术方案

### 核心思想

3DGS 的根本问题是**离散表示**：每个高斯通过 primitive-wise alpha compositing 离散地更新透射率。

本文的转换（**换表示**主线的又一例）：

```
离散 alpha 合成  ⟹  连续随机不透明实体 + 连续占据函数  ⟹  光滑可微透射率曲线
```

关键在于**这个替换是无损的**：占据函数的体积渲染结果与原 splat 相同 ⟹ 所以外观/新视角合成质量不退化，**额外**获得连续深度。

### 关键技术

| 技术 | 说明 |
|------|------|
| **随机实体建模** | 每个高斯建模为连续随机不透明实体 |
| **唯一连续占据函数** | 定理：splatting 公式 ⟹ 单高斯存在唯一连续 occupancy function |
| **体积渲染等价性** | occupancy 渲染 ≡ 原 splat 渲染 ⟹ 外观无损 |
| **连续透射率** | 阶梯 alpha → 光滑可微曲线 |
| **连续深度图** | 高质量深度 ⟹ 细粒度几何提取 |
| **多视角一致性** | 体积性质天然提供跨视角一致性 |

### 公式

```math
% 3DGS 离散透射率（标准）
T_i = Π_{j<i} (1 - α_j)          % 阶梯状

% 连续随机实体占据函数
o_i(r) = 1 - exp(-∫ ρ_i(t) dt)   % 沿射线连续累积

% 等价性定理：体积渲染下
%   ∫ T(t) c(t) dt  ≡  ∫ o(r) c(r) dr
% ⟹ 渲染结果与原 splat 一致，但透射率变为光滑可微曲线

% 连续深度
D(x) = ∫ T(t) · t · dt / ∫ T(t) dt   % 光滑，可微
```

---

## 实验结论

- **数据集**：3DGS 表面重建标准基准
- **基线**：标准 3DGS 及其表面提取变体、其它 3DGS 表面重建方法
- **结果**：
  - **3DGS 方法中 SOTA 的表面重建精度**
  - **表面平滑度 SOTA**
  - **不牺牲优化效率**
  - 多视角一致性显著改善（深度剖面不再锯齿化）

---

## 局限性

- **只针对 3DGS 生态** ⟹ 对 NeRF / 隐式场 / SDF 方法不适用（那些本就有连续表示）
- 高斯被建模为「随机不透明实体」⟹ **对高斯形状/尺度的假设**：各向同性高斯最自然；强各向异性高斯的占据函数闭式可能不成立
- 深度提取质量仍依赖**高斯本身的表面位置准确度**（3DGS 的「胖高斯」问题未解）
- **无开源实现**

---

## 与本库已有内容的关系

- **[[Neural Explicit Shape Representation]]**（arXiv 2610.38441，10-28）：同样是「显式表面 + 射线求交」路线，但走的是**神经八叉树**而非随机实体 ⟹ **两篇对照阅读价值高**：
  - NeuOctree：学习式、预测射线-表面交点 + 法线 + albedo
  - Stochastic Solids：**解析式**、从 3DGS 现有表示**无损导出**连续占据函数
  - ⟹ 若已有 3DGS 资产，本文的迁移成本**远低于** NeuOctree（后者需重新训练）
- **[[GOFish]]**（arXiv 2610.37818）：鱼眼 3DGS 表面重建 ⟹ 同属「GS ⟹ 网格」家族

---

## 实现建议

- **实现难度**：**中**（概念深刻但实现路径清晰：把 alpha 合成换成连续积分）
- **预期性能**：**高**——连续深度比原始离散深度快得多（避免大量排序/遍历）；但需实测
- **适用场景**：
  - **已有 3DGS 资产、需要高质量碰撞网格 / 仿真网格**（机器人仿真、AR 数字孪生）
  - 需要**从 3DGS 提取网格**做几何处理的下游管线（几何编辑、布尔、网格简化）
  - **多视角一致性要求高**的重建任务
- **落地建议**：
  1. **先做「深度平滑化」最小验证**：不必重写整个渲染管线，仅把透射率从离散 α 换成连续占据函数积分，测深度剖面锯齿改善程度
  2. 再评估是否需要改优化目标（本文称不牺牲优化效率 ⟹ 优化阶段可保持原样）
  3. 深度质量达标后，接标准 Marching Cubes / TSDF 提取网格
- **开源参考**：
  - 3DGS: `gsplat`（nerfstudio）、`diff-gaussian-rasterization`（官方 CUDA）
  - CUDA: 现有的 **prefix-sum 透射率累积**代码可复用，只需把离散前缀和换成连续积分
  - libigl / Open3D: 网格提取与后处理（`MarchingCubes`）

---

## 相关工作

- [[2026-11-04-arXiv-2611.00721-Representation-Aware-Closed-Surface-Parameterization]]
- [[3D Gaussian Splatting]]
- [[表面重建]]
- [[随机几何]]

---

## 主题线索

> **「3DGS ⟹ 网格」是当前最热的几何落地路径**，且本轮出现**两种不同路线**：
> 1. **本文**：解析式，从现有 splat **无损导出**连续占据函数（迁移成本低）
> 2. [[Neural Explicit Shape Representation]]：学习式，重新训练神经表示（质量上限高、成本高）
>
> ⟹ **建议在方案评审中明确区分这两条路线**，按「已有资产可复用性」选型。
