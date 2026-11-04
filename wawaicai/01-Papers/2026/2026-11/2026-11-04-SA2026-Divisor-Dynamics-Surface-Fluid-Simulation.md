---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, fluid-simulation, surface-topology, divisor-class, Riemann-surface, vortex-dynamics, algebraic-geometry, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1467&sess=sess110
venue: SIGGRAPH Asia 2026
year: 2026
---

# Divisor Dynamics for Surface Fluid Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Divisor Dynamics for Surface Fluid Simulation |
| **作者** | Rudresh Veerkhare, Hang Yin, Albert Chern（**UC San Diego**） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-03 · `papers_1467` / `sess110` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1467&sess=sess110) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 在**任意拓扑**的曲面上模拟点涡：证明在**非单连通曲面**上引入谐波分量的动力学，等价于引入一个**随时间守恒的新流体不变量**；该不变量有**代数几何中因子（divisor）类**的优雅表述（视作 Riemann 曲面上的因子）。由此，方法成为**涡旋粒子-网格（vortex particle-on-mesh）法**的**简单修改**。

1. **任意拓扑扩展**：标准点涡法（vortex particle method / Biot–Savart）假设曲面**单连通**（平面、球面等）；本文扩展到**任意拓扑**（亏格 > 0、多连通）。

2. **新不变量**：在非单连通曲面上，引入**谐波分量（harmonic components）**的动力学 ⟺ 引入一个**随时间守恒**的流体不变量。

3. **因子类表述**：该不变量 = **点涡作为 Riemann 曲面上的因子（divisor）**的**因子类（divisor class）** ⟹ 建立了**流体力学与代数几何之间一条非平凡的桥**。

4. **实现代价极低**：方法 ⟹ **vortex particle-on-mesh 法的简单修改**，无需重写求解器。

---

## 技术方案

### 核心思想

```
单连通曲面：点涡法成立（平均涡度定理 / 唯一平均涡度）
   ↓
非单连通曲面：存在额外的谐波分量（拓扑自由度）
   ↓
引入谐波分量 ⟺ 引入守恒不变量 = 因子类（divisor class）
   ↓
⟹ 把拓扑自由度作为守恒量显式追踪 ⟹ 方法 = 粒子网格法的简单修改
```

这是本库罕见的一篇**纯几何/数学理论**工作：把**拓扑**（亏格、多连通性）变成流体力学中的**守恒量**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **因子类不变量** | 点涡作为 Riemann 曲面因子；因子类在时间上守恒 |
| **谐波分量动力学** | 非单连通曲面的额外拓扑自由度 |
| **Vortex particle-on-mesh** | 实现载体；方法为「简单修改」 |
| **任意拓扑支持** | 突破单连通假设 |

### 公式

```math
% 因子类不变量
%  点涡在 Riemann 曲面 (S, g) 上视为因子 D = Σ p_i
%  因子类 [D] ∈ Div(S) —— 在时间上守恒

% 谐波分量与因子类的关系
%  非单连通曲面：存在额外谐波分量，其演化等价于保持因子类不变

% 实现：vortex particle-on-mesh 的修改
%  粒子涡度 + 谐波分量（拓扑自由度）共同演化
%  ⟹ 任意拓扑可用
```

---

## 实验结论

- **数据集**：不同拓扑（亏格）的曲面
- **基线**：标准 vortex particle-on-mesh 法（仅单连通有效）
- **结果**：
  - **扩展到任意拓扑曲面**
  - 实现上是「简单修改」⟹ 工程成本低
  - 建立了流体力学 ⟷ 代数几何的理论桥

---

## 局限性

- **理论密度高**：因子类、因子、Riemann 曲面等概念需代数几何背景 ⟹ **实现门槛主要在理解而非编码**
- **拓扑不能变**：仿真中曲面拓扑固定（换行吗?）⟹ 含洞曲面的拓扑编辑不在范围
- **数值验证**规模/精度未详述
- **无开源实现**
- 与**流体渲染**（[[doumiao]] 的领域）交叉更多，但**几何味浓**（拓扑/因子类）

---

## 与本库已有内容的关系

- **11-02 [[Extremum Sum Proximity Potential]]**：同样引入**代数几何视角**（本文用因子类，Extremum Sum 用中轴/临界点结构）⟹ **代数几何正在渗入图形学**
- 与 [[Lanczos Advection]]（本轮同收录，sess 邻接）：同为**流体模拟**的数值方法改进 ⟹ **流体模拟是本轮 SA2026 的隐藏热点**
- 与本库主线「**拓扑内生于方法**」（11-02 [[Ortho-arc]] 把打结/互链作为构造输出）呼应：本文把**拓扑作为守恒量**

---

## 实现建议

- **实现难度**：**中**（代码改动小，**理论理解难**）
- **适用场景**：
  - **含孔/多连通曲面上的流体模拟**：布料、织物表面的涡流
  - **拓扑变化前后的流场连续性**：需要在含洞曲面上保持流场一致
  - **拓扑敏感的多物理场**：如绕流、涡脱落
- **落地建议**：
  1. **先读懂因子类不变量**（可参考 Riemann 面上的因子理论入门）⟹ 这是理解全部实现的前提
  2. 从**最小曲面**（环面、亏格 1）开始验证：确认谐波分量守恒
  3. 再推广到**离散网格**上的实用版本（论文的 particle-on-mesh 离散细节需从 PDF 获取）
- **开源参考**：
  - 曲面拓扑与离散算子：libigl（`igl::euler_character`、`igl::edge_loop`、`igl::harmonic`）
  - CGAL: `CGAL::Polygon_mesh_processing::topology`、流形曲面工具
  - 粒子涡旋法基线：开源「vortex particle method」实现可作对照
  - 代数几何背景：Riemann 曲面上的因子与因子类（教科书章节）

---

## 相关工作

- [[2026-11-02-SA2026-Extremum-Sum-Proximity-Potential]]
- [[2026-11-04-SA2026-Lanczos-Advection-Near-Orthogonal-Semi-Lagrangian.md]]
- [[因子类]]
- [[拓扑守恒量]]

---

## 主题线索

> **本轮 SA2026 的隐藏主线：代数几何进入图形学。**
> - [[Divisor Dynamics]]：因子类 = 流体不变量
> - [[Extremum Sum]]（11-02）：中轴/临界点的代数结构
> - [[Ortho-arc]]（11-02）：可展性的构造性刻画
>
> ⟹ 建议本库建立概念条目 **[[代数几何在图形学中的应用]]**，把散落的代数几何视角论文串起来。这是一个**有潜力的新主线**，且与本库「拓扑/约束内生化」的主线正交。
