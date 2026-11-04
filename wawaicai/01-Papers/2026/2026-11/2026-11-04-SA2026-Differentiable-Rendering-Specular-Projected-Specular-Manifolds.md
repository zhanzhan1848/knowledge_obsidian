---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, differentiable-rendering, specular-BSDF, specular-manifold, boundary-integral, reparameterization, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1311&sess=sess103
venue: SIGGRAPH Asia 2026
year: 2026
---

# Differentiable Rendering for Specular Materials via Projected Specular Manifolds

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Rendering for Specular Materials via Projected Specular Manifolds |
| **作者** | Ruizeng Li, Peiqi Wang, Beibei Wang, Ligang Liu（**中国科学技术大学** · 南京大学） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-02 · `papers_1311` / `sess103` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1311&sess=sess103) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 物理可微渲染需处理场景不连续性；**镜面 BSDF 中的 Dirac delta**（完美反射/折射的 Dirac delta 分布）把光路限制在**镜面流形（specular manifold）**上，导致边界积分难以求值。本文提出**投影镜面流形（PSM, Projected Specular Manifold）**，并用**变形面积重参数化（warped-area reparameterization）**把边界积分转成**表面积分**，从而**无需精确定位不连续曲线**即可求导。

1. **首次系统处理「材质（尤其镜面）引起的不连续性」**：此前工作只研究**遮挡引起**的不连续性。

2. **PSM 的构造（关键洞察）**：镜面流形由几何约束定义、**没有显式位置** ⟹ 难以求值边界积分。本文把镜面流形**投影到镜面物体的一个子区域**上 ⟹ 得到 **PSM**。投影后不连续曲线的**精确位置仍未知**，但已足够。

3. **变形面积重参数化**：把**边界积分转成表面积分** ⟹ **避免精确定位不连续曲线**。

4. **附加速度场的构造**：重参数化的关键难点是构造额外速度场 ⟹ 观察：对镜面光路，**顶点到不连续曲线的距离**具有可利用的结构性性质。

---

## 技术方案

### 核心思想

```
可微渲染 = 对场景参数求辐射量的导数
   难点：场景不连续性 ⟹ 出现定义在「不连续曲线」上的边界积分
      ├─ 遮挡不连续性：已被充分研究
      └─ 材质不连续性（本文）：
            镜面 BSDF 含 Dirac δ ⟹ 光路被约束在镜面流形上
            镜面流形由几何定义、无显式位置 ⟹ 边界积分难求
   本文的解法：
      1) 把镜面流形投影到物体子区域 ⟹ PSM
      2) 变形面积重参数化 ⟹ 边界积分 → 表面积分（不需要曲线位置）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Projected Specular Manifold (PSM)** | 把镜面流形投影到镜面物体子区域，规避「无显式位置」问题 |
| **变形面积重参数化** | 边界积分 → 表面积分 |
| **附加速度场构造** | 利用「顶点到不连续曲线距离」的结构性质构造速度场 |
| **Dirac delta BSDF 处理** | 镜面反射/折射的分布特性 |
| **分支化可微渲染** | 对比现有仅处理遮挡不连续性的方法 |

### 公式

```math
% 目标：求 ∂/∂θ ∫ L dω  对场景参数 θ 的导数

% 镜面 BSDF 含 Dirac δ：
f_spec(ω_o, ω_i) = δ(ω_i - ω_reflect(ω_o))   % 或折射分支

% ⟹ 光路被约束在镜面流形 M 上 ⟹ 出现边界积分：
d/dθ ∫_{∂V} g dω

% 本文转换（变形面积重参数化）：
∫_{∂V} g dω  ⟶  ∫_{V} g·(warp) dA      % 无需知道 ∂V 的精确位置

% PSM：M 投影到物体子区域 S ⊂ V
proj : M → S

% 速度场构造依赖：顶点到不连续曲线的距离 d(v, ∂V) 的结构性
```

---

## 实验结论

- **数据集**：镜面材质场景（金属、玻璃等）
- **基线**：仅处理遮挡不连续性的可微渲染方法
- **结果**：成功对镜面材质引起的不连续性求导，扩展了物理可微渲染的适用范围

---

## 局限性

- **镜面流形投影子区域（PSM）的选择**需要启发式 ⟹ 可能引入额外近似
- 变形面积重参数化**引入额外的速度场**，其构造依赖镜面光路的特殊性质 ⟹ 推广到粗糙反射/多次散射未讨论
- **未解决**「不连续曲线精确位置未知」这一根本问题 ⟹ 而是用重参数化绕开 ⟹ 精度上限受限
- **无开源实现**
- 偏渲染侧，**几何处理贡献相对间接**（但「流形上的投影 + 重参数化」是纯几何手法）

---

## 与本库已有内容的关系

- **11-02 的 [[Extremum Sum Proximity Potential]]**：同为「把不可解的积分/距离问题**换表示**使其可处理」
  - Extremum Sum：用临界值有符号组合 ⟹ 全局可微的邻近势
  - PSM：把镜面流形投影 ⟹ 边界积分转表面积分
  - ⟹ **「重参数化 + 表示替换」正在成为跨领域的通用手法**，值得在方法论条目中并列收录
- 与 [[GraftRay]]（arXiv 2610.37034，10-27）相关：后者做 3DGS 场景的**物理一致插入**（路径追踪）⟹ 本文提供的是**镜面材质的可微**基础

---

## 实现建议

- **实现难度**：**高**（需要路径追踪 + 可微渲染框架 + Dirac delta BSDF 处理 + 重参数化速度场推导）
- **适用场景**：
  - **镜面材质的外观逆问题**：材质参数反演、反射率重建
  - **可微渲染管线**：需要在 glossy / mirror 材质上做梯度优化
  - **重材质 3D 编辑**：把物体插入镜面场景并求导优化
- **落地建议**：
  1. 若现有可微渲染器（如 Mitsuba 3 / redner / nvdiffrast）已有可微 BSDF ⟹ **可先在其上验证边界项的数值求导**是否已隐式处理了镜面情形
  2. 本文的价值主要在**理论完备性**（覆盖材质不连续性）⟹ 若需求是「能对镜面求导」，可能已有工程方案
  3. 若需求是「**高阶导数**」或「导数的解析形式」⟹ 本文价值凸显
- **开源参考**：
  - Mitsuba 3：可微渲染 + 解析 BSDF 导数（**首选对比基线**）
  - redner（Google）：可微路径追踪
  - PBRT: `BSDF::Sample_f`
  - libigl: `igl::harmonic`（若需曲面上的速度场投影）

---

## 相关工作

- [[2026-11-02-SA2026-Extremum-Sum-Proximity-Potential]]
- [[可微渲染]]
- [[镜面流形]]
- [[边界积分]]

---

## 主题线索

> **「重参数化 / 表示替换」三连击（本库近期主线）：**
> 1. 11-02 [[Extremum Sum]]：距离不可微 ⟹ 换为临界值有符号组合（全局可微势）
> 2. 11-04 **PSM**：边界积分不可求 ⟹ 换为投影 + 变形面积重参数化（表面积分）
> 3. 11-04 [[Representation-Aware Parameterization]]：表示误差 ⟹ 换为分支化灵敏度分析（显式 Jacobian）
>
> ⟹ **三个不同领域（邻近势 / 可微渲染 / 参数化）用同一种思维：找到使原问题良态的表示。**这已是本库最稳定的方法论信号，建议正式立为概念条目：[[表示替换 / Representation Substitution]]。
