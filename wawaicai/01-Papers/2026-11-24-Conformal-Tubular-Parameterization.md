---
type: paper
created: 2026-11-24
updated: 2026-11-24
tags: [paper, 参数化, 共形映射, 准共形映射, 管状曲面, 血管, 曲面处理]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.16305
---

# Conformal Tubular Parameterization and Toroidal Bending of Tube-Like Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Conformal tubular parameterization and toroidal bending of tube-like surfaces |
| **作者** | Shunyu Yao, Gary P. T. Choi |
| **发表** | arXiv cs.GR / math.CV / math.NA (v3, 2026-11-24) |
| **链接** | [原文](https://arxiv.org/abs/2605.16305) |
| **DOI** | — |
| **代码** | 未公开 |

---

## 核心贡献

> 为"双边界管状曲面"提出一套完整的共形参数化框架：切割 → 准共形映射 → 提升到柱面，并额外处理接缝畸变、自由边界与环面弯折三个现实痛点。

1. **固定边界管状参数化**：切割输入网格 → 计算 disk-to-parallelogram 准共形映射 → 将结果提升到 ℝ³ 中的柱面。
2. **局部化接缝校正**：在环形域（annular domain）上引入局部准共形校正方案，改善共形性同时**不改变远离接缝的区域**。
3. **自由边界变体**：基于边界延拓与 cycle-Laplacian 平滑处理噪声/不规则边界，把边界约束施加在人工构造的外环上而非原始曲面。
4. **共形环面弯折映射**：推导两种共形 toroidal bending maps，把管状参数化嵌入环面几何**且不改变其共形结构**。

---

## 技术方案

### 核心思想

传统参数化（矩形展开 / 平面环形展开）对管状曲面（如血管、管道）的问题在于：**内在的纵向（longitudinal）与周向（circumferential）信息无法被保持**。矩形域会把管子"摊平"，周向接缝处必然出现畸变。

本文的框架：

$$
\text{输入管状曲面}
\xrightarrow{\text{cut}}
\text{拓扑圆盘}
\xrightarrow{\text{disk→parallelogram QC map}}
\text{平行四边形域}
\xrightarrow{\text{lift}}
\text{ℝ}^3 \text{ 柱面}
$$

**切割（cut）**：沿纵向切开曲面得到圆盘拓扑，从而可用圆盘参数化算法。

**准共形映射**：采用 disk-to-parallelogram 的准共形（quasi-conformal）映射——平行四边形是矩形/圆盘之间更"接近"的目标域，能减小拉伸比。相比直接 disk→square，准共形映射在保持角度结构的同时更好控制面积比。

**提升到柱面**：把平行四边形域上的坐标按线性规则映射到圆柱面，从而得到"柱面坐标"作为参数域——纵向参数对应周向角，周向参数对应轴向位置。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Disk-to-parallelogram QC map** | 用准共形映射把圆盘映射到平行四边形；相比 disk→square 显著降低最大拉伸 |
| **切割 + 提升柱面** | 用纵向切割消除管状曲面的环面拓扑障碍，再提升到柱面恢复管状语义 |
| **局部化接缝校正（annular domain）** | 在接缝附近的环形域内做局部 QC 修正，**远离接缝的区域逐点不变** → 保持全局结构稳定 |
| **自由边界变体** | 边界延拓（boundary extension）+ cycle-Laplacian 平滑 → 对边界噪声鲁棒，约束施加到人工外环 |
| **共形环面弯折** | 两种 toroidal bending maps（保持共形结构），支持把管状参数化嵌入环面（管道弯曲/结） |
| **Cycle-Laplacian 平滑** | 基于环面网格图的拉普拉斯平滑，比普通拉普拉斯更能保持结构 |

### 关键公式

共形性条件（Cauchy–Riemann 方程的离散形式）：

$$
\frac{\partial u}{\partial s} = \frac{\partial v}{\partial t}, \qquad
\frac{\partial u}{\partial t} = -\frac{\partial v}{\partial s}
$$

共形能量（带权重）：

$$
E(u,v) = \iint_{\Omega} \left( \left\|\frac{\partial (u,v)}{\partial s}\right\|^2 + \left\|\frac{\partial (u,v)}{\partial t}\right\|^2 \right) \, ds\,dt
$$

环面弯折映射（示意）：柱面坐标 $(\theta, z)$ 经曲率 $\kappa$ 弯折后

$$
\text{Arc length preservation:} \quad \int_0^\theta \sqrt{(1-\kappa r)^2 + (r\,d\varphi)^2}
$$

---

## 代码片段

```python
# 概念性伪代码：管状共形参数化流程
def tubular_param(mesh, boundary_mode="fixed"):
    # 1) 纵向切割，得到圆盘拓扑
    disk = cut_longitudinal(mesh)

    # 2) disk -> parallelogram 准共形映射
    uv, info = quasiconformal_map(disk, target="parallelogram")

    # 3) 提升到 ℝ³ 柱面
    cylindrical = lift_to_cylinder(uv)

    # 4) 接缝局部校正（只改环形域内）
    if info.seam_distortion > tau:
        annular = extract_annular_band(disk, around=seam)
        corrected = local_qc_correction(annular, cylindrical)
        cylindrical = blend(corrected, cylindrical, mask=annular_band)

    # 5) 可选：共形环面弯折
    # cylindrical = toroidal_bend(cylindrical, kind="map1")
    return cylindrical
```

---

## 实验结论

- **数据集**：合成管状网格（synthetic tube meshes）+ 真实血管表面（real vascular surfaces）
- **结果**：
  - 低畸变参数化；
  - 有效缓解接缝诱导的伪影（seam-induced artifacts）；
  - 对边界含噪输入鲁棒性提升；
  - 提供灵活的管状 / 环面目标域，便于下游曲面处理

---

## 局限性

- 仅处理**开放**管状曲面（两个边界分量）；闭合管（无边界）需要额外割口处理；
- 需要干净的切割路径与初始共形映射质量；
- 准共形映射的求解通常用数值方法（迭代求解），无解析保证；
- 代码未开源，复现需要自己实现 QC 映射 + 柱面提升。

---

## 相关工作

- [[UV-Unwrapping]] · [[LSCM]] · [[ABF++]] · [[Quasi-Conformal-Mapping]]
- [[Parametrization]] · [[Tube-Surface]] · [[Vascular-Mesh]] · [[Conformal-Mapping]]
- [[Harmonic-Map]] · [[Boundary-Laplacian]] · [[Toroidal-Bending]]

---

## 实现建议

- **实现难度**：中-高（QC 映射数值求解是主要门槛）
- **预期性能**：QC 映射求解为迭代式，O(k·|E|) 每迭代（k 为迭代次数）；单次参数化在秒级到分钟级
- **适用场景**：血管/管道参数化、管状资产纹理展开、可展曲面分类处理
- **落地建议**：先以 libigl 的 LSCM/ABF++ 作为基线，评估管状曲面上的畸变；本方法的增量价值主要在**接缝处理**与**自由边界鲁棒性**，可先实现接缝局部校正模块

## 开源参考

- libigl: `igl::lscm`（最小二乘共形映射）、`igl::harmonic`（调和映射，可做边界延拓）
- libigl: `igl::harmonic(U, b, bpd, W, E, n, Q, diffuse, known, w, b, gamma)` — 自由边界变体的调和延拓基础
- CGAL: `CGAL::Polygon_mesh_processing::parameterize`（多算法可切换）
- libigl: `igl::boundary_loop`、`igl::loop_closure`（切割与环检测）
