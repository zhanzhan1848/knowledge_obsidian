---
type: paper
created: 2026-10-15
updated: 2026-10-15
tags: [paper, geometry-processing, quad-mesh, quadrangulation, sphere, skeletal-joints, lattice-structure, bezier]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.17803
venue: arXiv cs.GR (submitted 2026-10-13)
arxiv_id: "2610.17803"
---

# Construction of Simple Quadrangulations of the Sphere at Skeletal Joints

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Construction of Simple Quadrangulations of the Sphere at Skeletal Joints |
| **作者** | Suil Hwang, Q Youn Hong |
| **发表** | arXiv cs.GR, 2026-10-13 |
| **链接** | [arXiv:2610.17803](https://arxiv.org/abs/2610.17803) |
| **领域** | 球面四分 / 关节体积建模 / 桁架 lattice |

---

## 核心贡献

> 从无序的方向向量集合构造球面上的简单四分 (simple quadrangulation)，直接生成精确有理 Bézier 关节体积，用于参数化骨骼关节建模。

1. **基于方向集 → 简单球面四分**：n 个方向向量作为输入，产出无交叉的简单四分
2. **枚举候选 dual 图**：优先选择 convex + regular 的对偶图
3. **Conflict-constrained assignment + lazy cyclic-order separation**：消除交叉、实现拓扑
4. **多关节装配扩展**：truss-based lattice 在 3D 区域构造

---

## 技术方案

### 核心思想

骨骼关节的典型建模：用桁架 / lattice 在关节区构造参数化体积。挑战：
- 关节附近的方向集 → 不规则拓扑
- 需要**简单 quad** (无多重边、无自环、面共享) 与**无交叉**

Hwang & Hong 的方法：
1. 选 dual graph 拓扑
2. 在球面上实现该拓扑（无交叉）
3. 反推 primal graph → 四分网格
4. 转换到 Bézier 体积

### 关键技术

| 技术 | 说明 |
|------|------|
| Direction vector input | n 个无序方向向量作为输入 |
| Dual graph enumeration | 枚举候选对偶图，按 convexity + regularity 优先 |
| Conflict-constrained assignment | 约束指派问题 |
| Lazy cyclic-order separation | 处理循环顺序避免交叉 |
| Fibonacci sphere sampling | 用球面 Fibonacci 采样 3-20 个方向测试 |
| Exact rational Bézier | primial graph → 精确有理 Bézier shell/column 体积 |
| Multi-joint assembly | 推广到多关节桁架装配 |

### 工作流

```
Direction Vectors (n 个无序)
    │
    ▼
Enumerate Dual Graph Candidates
    ├─ convexity score
    └─ regularity score
    │
    ▼
Conflict-Constrained Assignment
    └─ 解决球面上的 placement 不交叉
    │
    ▼
Lazy Cyclic-Order Separation
    └─ 让 cyclic ordering 满足 planar embedding
    │
    ▼
Recover Primal Graph → 简单四分
    │
    ▼
Convert to Bézier Shell & Column Volumes
    │
    ▼
Multi-joint Assembly (truss-based lattice)
```

---

## 实验结论

- **测试集**: spherical Fibonacci 采样得到的方向集，大小 3 到 20
- **评估指标**: 简单性 (无多重边) + convexity + regularity
- **结果**:
  - 在多种输入配置下稳定生成有效高质量简单四分
  - Primal graph 直接转 Bézier shell + column 体 → 紧凑精确体积表示
  - 多关节扩展可行 → 3D 域 truss-based lattice

---

## 局限性

- **方向数 n 较小**：3-20 范围，更大方向集的可扩展性未充分证明
- **贪心枚举代价**：dual graph 枚举随 n 增长可能指数级
- **关节应用领域特定**：truss-based lattice 概念偏向结构 / 工程应用
- **未与其他 quad meshing 算法比较**：未直接 head-to-head 对比 Blossom-Quad、Instant Meshes 等
- **缺乏视觉比较**：缺少 mesh quality 量化对比（edge length variance、angle skew 等）

---

## 与本知识库其他笔记的关系

- [[Quadrangulation Fundamentals]] - 四分基础
- [[Blossom-Quad]] - 四分匹配的经典工作
- [[Sphere Parameterization]] - 球面参数化基础
- [[Bezier Volumes]] - Bézier 体 / patch 建模
- [[Lattice Structures in CAD]] - CAD 桁架 lattice

---

## 实现建议

- **实现难度**: 中（需要图论算法 + embedding）
- **依赖项**:
  - 图算法库 (`networkx` 或 `Boost Graph`)
  - 球面几何 (CGAL spherical kernel)
  - Bézier 体积 (OpenCascade `Geom_BezierSurface`)
  - 可视化 (libigl viewer / polyscope)
- **可复用模块**:
  - `libigl` 的 quad mesh connectivity
  - `CGAL::Surface_mesh_topology` 的球面 dual computation
- **预期性能**:
  - n=10 方向约 0.1-1 秒（典型 IP 求解时间）
  - n=20 几秒到几十秒
- **适用场景**:
  - 骨骼关节的体积参数化建模
  - truss-based lattice 的拓扑生成
  - 球面到 quad mesh 映射的基础研究

---

## 🥬 可行性结论

✅ **推荐关注** — 球面四分 + Bézier 体积的端到端 pipeline 在关节建模与 lattice 设计领域有独特价值。

- **学术价值**：球面方向集 → 简单四分的干净数学构造
- **工程价值**：骨骼关节参数化 + truss lattice 设计的实用工具
- **下一步**：
  - 跟踪作者开源计划
  - 评估对骨骼角色建模 (3D 资材) 的可用性
  - 与其他 quad meshing 工作 (Blossom-Quad, Instant Meshes) 做严格比较

已传递给 @墨鱼丸 评估 quad meshing 与骨骼关节资材生成的集成。
