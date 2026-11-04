---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, curves, G2-continuity, curvature-control, splines, offset-curve, rational-bezier, interactive-editing, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1893&sess=sess114
venue: SIGGRAPH Asia 2026
year: 2026
---

# TORO Curves: G² Interpolating Curve with Maximum Curvature Control

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | TORO Curves: $G^2$ Interpolating Curve with Maximum Curvature Control |
| **作者** | Bowen Jiang, Renjie Chen（**中国科学技术大学**） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-04 10:40 (HKT) · `papers_1893` / `sess114` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1893&sess=sess114) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 提出 **TORO 曲线**：一类 $G^2$ 连续插值样条，**在不全局优化**的前提下提供**精确的局部曲率控制**——曲率极值只出现在段端圆弧上。

1. **两类基元段（primitive segments）**：
   - **TO 段（triangular offset）**：用于**拐点（inflection）** 区域
   - **RO 段（rational Bézier offset）**：用于**曲率符号恒定** 区域
   - 共同性质：**曲率最大值仅出现在两端圆弧上** ⟹ 曲率控制是**局部的、可判定的**。

2. **基于偏移曲线的解耦策略（offset-based decoupling）** —— 核心支柱：
   利用偏移曲线的性质，把**几何形状**与**曲率幅值**解耦 ⟹ 从而可以在控制点上灵活指定曲率。

3. **确定性 + 局部 + 构造性**：
   - 每段通过**简单二次方程**求解
   - 有理 Bézier 权重**直接由几何量决定**（无优化、无迭代）
   - **局部支撑** ⟹ 交互编辑时**即时更新**

4. **自适应曲率配置**：在形变（deformation）下保证鲁棒性与视觉连续性。

5. **表达力验证**：能表示复杂形状，同时**精确复现**圆弧与椭圆等基本图元。

---

## 技术方案

### 核心思想

传统 $G^2$ 插值曲线面临的核心矛盾：要精确控制曲率，通常需要**全局优化**（求解非线性方程组），代价高、局部编辑不实时。

TORO 的破局点在于**换表示**：不直接优化「位置 + 曲率」的耦合系统，而是**先构造出「偏置（offset）」结构**——偏移曲线天然把「曲率幅值」编码为「偏移量」⟹ 几何与曲率天然解耦 ⟹ 控制问题退化为**逐段独立求解的二次方程**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **TO 段（triangular offset）** | 三角偏移基元，承载拐点；曲率极值只在端部圆弧 |
| **RO 段（rational Bézier offset）** | 有理 Bézier 偏移基元，承载恒定曲率符号区域；权重由几何量直接确定 |
| **偏移解耦** | 几何形状 ↔ 曲率幅值解耦；曲率 = 偏移量的函数 |
| **二次方程求解** | 每段闭式求解，构造性、确定性 |
| **局部支撑 + 即时更新** | 局部修改不触发全局重算 ⟹ 交互级响应 |
| **自适应曲率配置** | 形变下的曲率重分配策略，保视觉连续 |

### 公式

```math
% 核心机制：曲率与几何的解耦
% 偏移曲线曲率关系（经典）：对法向偏移量 d 的等距曲线
κ_offset = κ / (1 - d·κ)

⟹  指定目标曲率 κ_target  ⟹  d = 1/κ_target - 1/κ_offset   （逐段闭式可解）

% G² 连续条件（段间切向与曲率匹配）
κ_left(end) = κ_right(start),  T_left(end) = T_right(start)

% 段内曲率极值仅在端部圆弧 ⟹ 局部性保证
```

---

## 实验结论

- **数据集**：曲线/形状设计基准（含圆弧、椭圆等基本图元复现任务）
- **基线**：需全局优化的 $G^2$ 插值方法、传统三次/三次样条
- **结果**：
  - 精确复现**圆弧、椭圆**
  - 表达复杂形状
  - **无全局优化** ⟹ 交互编辑即时更新
  - 构造确定性 ⟹ 无求解器收敛问题

---

## 局限性

- **仅曲线（1D）** ⟹ 未直接覆盖曲面情形；但曲面应用（轮廓线、工艺路径）可直接受益
- 曲线**分段**：段类型（TO / RO）需按曲率符号切换 ⟹ 段边界处需保证 $G^2$ 与视觉连续（论文用自适应配置处理，但切换点的**局部最优性**未讨论）
- **折线/直边**：直边（$\kappa=0$）与拐点的处理未详述
- **无开源实现**
- 未给出与 NURBS/有理 Bézier 在**同阶复杂度下的对比**（仅定性描述）

---

## 与本库已有内容的关系

- **11-02 的 [[Ortho-arc Curves]]**：同样是**构造法**（不靠迭代拟合）处理几何硬约束 ⟹ **本库「构造 vs 优化」主线的第二例**
  - Ortho-arc：构造出「必然可展」的导线（约束**内生**）
  - TORO：构造出「偏移结构」，让曲率约束**局部可解**（约束**解耦**）
  - **共同点**：都把「全局耦合求解」换成「局部闭式构造」。这正在成为本库最稳定的方法论信号。

---

## 实现建议

- **实现难度**：**中**（核心是偏移曲线构造 + 二次方程求解 + 段间 $G^2$ 匹配，数学清晰但实现细节多）
- **预期性能**：**实时**（每段闭式 O(1)，无迭代；编辑时仅重算受影响段）
- **适用场景**：
  - **CAD 轮廓线 / 加工路径**：需要在拐点处保持曲率连续
  - **工艺路径（process path）生成**：11-02 的 Field Optimization 论文涉及工艺规划 ⟹ 曲线质量直接影响
  - **图标 / 字形轮廓 / 矢量图形编辑**：交互式曲率编辑
  - **机器人路径平滑**
- **开源参考**：
  - libigl: 无直接对应（libigl 侧重网格）
  - CGAL: `CGAL::Polygon_mesh_processing::smooth_shape`（曲面平滑，可类比）、`CGAL::Gmpz` 精确算术
  - OpenCASCADE: `GeomAPI_ProjectPointOnSurf`、`Geom_BSplineCurve`（有理 Bézier 基元）
  - 数值：Eigen `SparseLU`（解二次方程组）

---

## 相关工作

- [[2026-11-02-SA2026-Ortho-arc-Curves-Developable-Bands-Polygonal-Tubes]]
- [[2026-11-02-arXiv-2610.42145-SemEllipsoid-Semantic-Aware-Shape-Abstraction]]
- [[曲线设计]]（待建概念条目）
- [[G2连续性]]（待建概念条目）

---

## 主题线索

> **「把全局耦合约束 ⟹ 换成局部闭式解」** —— 这是本库连续三天出现的第三个同构信号：
> - 11-01：[[Validity-Assured-Regeneration]]（参数化实体 ⟹ 有效性保证）
> - 11-02：[[Ortho-arc]]（可展性 ⟹ 构造）、[[Extremum Sum]]（距离 ⟹ 全局可微势）
> - 11-04：TORO（曲率 ⟹ 偏移解耦）
>
> ⟹ **建议提级为方法论主线：「局部闭式构造 > 全局迭代优化」，前提是能找到正确的中间表示。**
