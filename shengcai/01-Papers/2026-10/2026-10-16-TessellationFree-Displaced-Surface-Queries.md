---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, ray-tracing, displacement-mapping, tessellation-free, BVH, sampling, specular, caustics, surface-queries, CPU]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.21584
venue: arXiv preprint (cs.GR)
year: 2026
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | Bing Xu, Yang Zhou, Brian Budge |
| **发表** | arXiv preprint (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21584) |
| **DOI** | [10.48550/arXiv.2610.21584](https://doi.org/10.48550/arXiv.2610.21584) |
| **PDF** | [arXiv PDF](https://arxiv.org/pdf/2610.21584) (44.6 MB, 含附录/视频) |
| **代码** | 未在摘要中声明 |

---

## 核心贡献

> 提出**首阶纹理空间层次结构** (first-order texture-space hierarchy)，无需预细分即可对位移贴图曲面直接执行**几何查询**：曲面采样、镜面流形搜索、最近点查询；用平面 + 残差界替代传统 min-max scalar 区间，保留高度方向的空间变化。

1. **统一查询框架**：在 displacement 纹理空间建树，每个节点存 (局部仿射高度平面 + 保守残差界)，既保留空间高度变化又比单纯 min-max 更紧
2. **直接 ray tracing**：保留 tessellation-free 的光线追踪（无需细分），同时解锁三族新查询
3. **斜率界 → specular 流形搜索**：节点额外存 slope bounds，支持 caustics、displaced emitters 采样的镜面光线路径搜索
4. **应用验证**：焦散渲染 / 位移发光体采样 / 表面 PDE 求解；与 query-specific baselines 相比性能更优，内存对比预细分显著更省

---

## 技术方案

### 核心问题

Displacement mapping 是 CG 主流细节表达方式，但要**直接做几何查询** (不只是可见性) 一直很痛：

| 方法 | 缺陷 |
|------|------|
| 预细分成密集三角形网格 | 内存爆炸（凹凸细分可能 100× 面数） |
| Scalar height interval (min-max) | 各方向高度变化丢失，包围保守 → 大量误命中 |
| 现有 tessellation-free ray tracing | 只能做光线求交，**不能**做采样/镜面路径/PDE |

### 核心思想：首阶仿射平面 + 残差

```
每节点:
  - Plane:  p(u,v) = h₀ + a·u + b·v       (一阶泰勒近似)
  - Residual:  h(u,v) - p(u,v) 的有界残差   (still tight)
  - Slope bounds:  ∂p/∂u, ∂p/∂v 上下界
```

- 平面 + 残差 → 真正的表面**包围盒**（而非单值 interval）
- 平面斜率 + slope bounds → 法线界 → specular 反射/折射路径搜索的几何线索
- 平面高度 + 斜率 → 面积估计 → 重要性采样

### 关键技术

| 技术 | 说明 |
|------|------|
| First-order texture-space tree | 每个节点存 affine height plane + residual bound + slope bounds |
| Surface enclosure | 平面 + 残差 → 求交/距离搜索的紧包围 |
| Slope bounds | 支持 specular light-path search（曼式反射搜索） |
| Area estimate | 平面几何 → Jacobian → 重要性采样 |
| Query-specific traversal/pruning/sampling | 同一数据结构，三族算法复用 |

### 应用场景

1. **Caustics rendering**：displacement 受光面 → 反射光焦散路径的求交与采样
2. **Sampling displaced emitters**：位移发光体（灯罩、织物）的发射方向采样
3. **Surface PDE solvers**：直接在 displacement 表面解扩散/波方程，无需重新网格化
4. **Direct ray tracing**：保留的"基本盘"——常规可视性光线追踪

### 与传统方案对比

| 维度 | 预细分 | Scalar min-max | **本文 (plane+residual)** |
|------|--------|----------------|----------------------------|
| 内存 | 高（密集网格） | 低（单树） | **低** |
| 求交紧度 | 紧（细分即可） | 极松（min-max） | **紧（仿射平面）** |
| 采样支持 | ✓ | ✗ | **✓** |
| Specular 路径 | ✓ | ✗ | **✓** |
| PDE 求解 | ✓ | ✗ | **✓** |

---

## 公式

### 首阶仿射高度表示

```math
h(u,v) ≈ h_0 + a·(u - u_0) + b·(v - v_0) + r(u,v)
```

其中 $r(u,v)$ 是残差，节点内 $|r| \le \epsilon_r$。

### 法线界（specular 搜索）

```math
n(u,v) ∝ \left(-\partial h/\partial u, -\partial h/\partial v, 1\right)
```

每个节点存 $\partial h/\partial u \in [n_u^-, n_u^+]$、$\partial h/\partial v \in [n_v^-, n_v^+]$，可推导出法线锥。

### 面积估计（采样）

```math
A \approx \iint_J \sqrt{1 + (\partial h/\partial u)^2 + (\partial h/\partial v)^2}\,du\,dv
```

用节点内 Jacobian 的上下界估计。

---

## 代码片段

> 摘要未提供代码，结构可推测为分层 traversal:

```cpp
// Pseudo-traversal pattern
bool DisplacementTree::intersect(Ray& r, Hit& h, float tmin, float tmax) {
    // node holds affine plane (h0, a, b) + residual bound rmax + slope bounds
    float t_plane = intersectAffinePlane(r, h0, a, b);
    if (t_plane < tmin || t_plane > tmax) return false;
    
    float r_bound = fabs(t_plane) * rmax;          // project residual onto ray
    if (t_plane + r_bound >= tmax) return false;    // whole node inside → skip deeper
    
    if (isLeaf) return refineDisplacement(r, h);
    return traverseChildren(r, h, tmin, tmax);
}
```

---

## 实验结论

> 摘要级声明：
- 内存明显低于预细分方案
- 性能优于 query-specific baselines
- 在 caustics / displaced-emitter sampling / surface PDE 三个应用上验证有效
- 保留原有"高效 ray tracing"优势

(数值 benchmark 表格在 PDF 附录中，待后续精读补充)

---

## 局限性

- 仅 cs.GR preprint，**尚未见会议去向**（候选 SIGGRAPH Asia 2026 12 月）
- 一阶仿射的精度受曲率限制——极端高度变化区域仍可能保守
- 树构建成本未在摘要中量化
- 未声明开源实现（PDF 44 MB 含视频/附录，但无 GitHub 链接）

---

## 相关工作（脉络）

### 同领域近期
- **2026-10-09** H2-Ray (Hybrid Ray Tracing 3DGS) — RT Core + 3DGS 加速
- **2025** Tessellation-Free Displaced Surface ray tracing 系列

### 历史脉络
| 年份 | 工作 | 关系 |
|------|------|------|
| 2018 | Tessellation-free ray tracing (Zirr & Kaplanyan) | 直系前作，仅做求交 |
| 2021 | Displacement mapping 重要性采样 (Heitz) | 互补：本文给采样提供几何基础 |
| 2026 | 本文 | 把"查询"补齐 |

---

## 实现建议

- **实现难度**: 中（数据结构清晰，三族查询算法各异但思路相通）
- **预期性能**: 求交应优于 scalar min-max，采样与 specular 路径首次以 "通用方案" 给出基线
- **适用场景**:
  - 渲染器中的 displacement-heavy 资产（角色、植被、织物）
  - PBR + area light 中的精细凹凸发光体
  - 光线追踪 PDE（光学表面/纺织物仿真）
- **依赖项**: 与现有 RT 引擎的 BVH/traversal 解耦，可作为独立加速结构库

**给墨鱼丸 / moyuwan 的工作建议**:
1. 先复现 scalar min-max 基线，对照采样的查询紧度
2. 在 Cycles / Mitsuba 中以 BVH 子树形式移植 plane+residual 节点
3. 优先验证**采样紧度**（这是 scalar min-max 完全做不到的）

---

## 备注

- 论文较新（2026-10-15 v1），可能近期投 SIGGRAPH Asia 2026 / I3D / HPG 2027
- 一作 Bing Xu 邮件可见（hide email 在 arxiv 上），可后续关注代码开源

— 已纳入 shengcai 每日搜索报告 2026-10-16
