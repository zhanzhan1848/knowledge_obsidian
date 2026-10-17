---
type: paper
created: 2026-10-17
updated: 2026-10-17
tags: [paper, quad-meshing, quadrangulation, sphere, computational-geometry, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.17803
---

# Construction of Simple Quadrangulations of the Sphere at Skeletal Joints

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Construction of Simple Quadrangulations of the Sphere at Skeletal Joints |
| **作者** | Suil Hwang |
| **发表** | Pacific Graphics 2026 (Journal Track), arXiv cs.GR 2610.17803, 2026-10-13 |
| **链接** | [原文](https://arxiv.org/abs/2610.17803) |
| **DOI** | 10.48550/arXiv.2610.17803 |
| **代码** | (未在摘要中给出) |

---

## 核心贡献

> 从一组无序方向向量出发，构建一个**球面简单四边形剖分（simple quadrangulation）**，应用于骨架关节的**参数化体模型**。

1. 枚举候选对偶图，优先考虑 quad 的凸性与规则性
2. 在不交叉的约束下用 **lazy cyclic-order separation** 解冲突约束分配问题
3. 恢复 primal graph → 转为**有理 Bézier 壳与柱体体积**，得到紧凑精确的体模型
4. 自然扩展到**多关节装配体**，支持域内桁架结构

---

## 技术方案

### 核心思想

不是直接优化 quad mesh，而是：(a) 在拓扑层面枚举候选对偶图结构；(b) 在几何层面通过冲突约束分配把拓扑实例化到球面上。

### 关键技术

| 技术 | 说明 |
|------|------|
| 对偶图枚举 | 穷举候选拓扑，prioritize convex + regular quads |
| Lazy cyclic-order separation | 无交叉地把对偶图实例化到球面 |
| Conflict-constrained assignment | 把方向向量分配到 face 上 |
| 有理 Bézier 体积 | primal graph → shell + column 精确体表示 |

### 算法复杂度

- 枚举对偶图：候选数随方向向量数 n 指数增长，但 n 在此应用场景下小（3–20）
- 分配问题：多项式时间内可解

### 应用

- 关节体模型：骨骼关节、桁架结构、3D 域内的参数化结构生成
- 适用规模：n ∈ [3, 20]（spherical Fibonacci 采样方向数）

---

## 公式

N/A（拓扑构造类论文，详细公式见论文内部）

---

## 实验结论

- **数据集**: 方向向量 n ∈ [3, 20]（球面 Fibonacci 采样）
- **结果**: 方法稳健生成有效、高质量 quadrangulation；primial graph 直接转为精确有理 Bézier 体积

---

## 局限性

- 仅限小规模 n（3–20）；大规模 quad mesh 重建需其他方法
- 评估范围窄，未在大规模真实 mesh 上验证

---

## 相关工作

- 相关概念：[[quad-meshing]]、[[quad-remeshing]]、[[field-aligned-meshing]]
- 相关开源：libigl quad mesh 程序、CGAL Surface_mesh_quad_remeshing
- 参见：[[SIGGRAPH2026-Strips-as-Tokens-UV-Segmentation]]（同期 quad mesh 生成思路对比）

---

## 实现建议

- **实现难度**: 中（对偶图枚举 + 分配问题求解）
- **预期性能**: n 小时毫秒级（n≤20）
- **适用场景**:
  - **骨架关节的参数化建模**（骨骼、关节、医疗建模）
  - 桁架结构生成（增材制造、点阵结构）
  - 球面 quad mesh 设计
- **可借鉴**:
  - "枚举拓扑候选 + 几何实例化"的两步策略可推广到其他受拓扑约束的 mesh 生成
  - 有理 Bézier 体积表示比 mesh 体积表示更紧凑精确
- **推荐度**: ✅ 推荐关注（小规模 quad mesh + 体模型场景特别合适；Pacific Graphics 录用，质量有保障）
