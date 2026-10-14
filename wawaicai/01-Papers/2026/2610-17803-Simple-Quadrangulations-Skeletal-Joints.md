---
title: "Construction of Simple Quadrangulations of the Sphere at Skeletal Joints"
arxiv_id: "2610.17803"
date: 2026-10-13
venue: Pacific Graphics 2026 (Journal Track)
tags: [几何, 网格生成, 四边形化, Quadrangulation, 球面参数化, 骨骼关节]
authors:
  - Suil Hwang
url: "https://arxiv.org/abs/2610.17803"
---

# Construction of Simple Quadrangulations of the Sphere at Skeletal Joints

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Construction of Simple Quadrangulations of the Sphere at Skeletal Joints |
| **作者** | Suil Hwang |
| **发表** | Pacific Graphics 2026 (Journal Track) |
| **链接** | [arXiv:2610.17803](https://arxiv.org/abs/2610.17803) |
| **DOI** | 10.48550/arXiv.2610.17803 |
| **代码** | TBD |

---

## 核心贡献

> 提出一种从无序方向向量集合构造球面简单四边形化网格的方法，应用于骨骼关节的参数体素建模。

1. **拓扑枚举策略**: 穷举候选对偶图，优先考虑凸性和规则性
2. **冲突约束赋值**: 通过 lazy cyclic-order 分割在球面实现无交叉拓扑
3. **精确有理 Bézier 体**: 直接转换为参数体（精确有理贝塞尔壳/柱），用于关节建模

---

## 技术方案

### 核心思想

从给定的 $n$ 个方向向量（关节拓扑编码），通过以下流程构造球面简单四边形化网格：

1. **方向采样**: 球面 Fibonacci 采样，$n$ 从 3 到 20
2. **对偶图枚举**: 穷举所有候选对偶图，保留满足凸性与规则性的
3. **约束赋值问题**: 解决 conflict-constrained assignment（带 lazy cyclic-order 分割）
4. **体素化**: primal graph → 精确有理 Bézier shell/column 体积

### 关键技术

| 技术 | 说明 |
|------|------|
| 球面方向采样 | Fibonacci 采样 3–20 个方向 |
| 对偶图枚举 | 拓扑空间穷举，按凸性/规则性剪枝 |
| 冲突约束赋值 | 几何放置避免边交叉 |
| lazy cyclic-order 分割 | 保证简单性的高效分割方法 |
| 精确有理体素 | 关节的精确贝塞尔壳表示 |

---

## 算法复杂度

- **拓扑枚举**: 候选数随 $n$ 指数增长但 $n$ 很小（≤ 20），可接受
- **赋值求解**: 多项式时间，依赖 lazy-separation 高效求解
- **输出**: primal graph 同时为 B-Rep，可直接用于 CAD

---

## 数值稳定性

- 有理 Bézier 表示 → 精确算术，零舍入误差
- 凸性约束 → 几何有效性
- 简单性约束 → 无交叉边

---

## 局限性

- 局限于球面拓扑（可推广至圆盘、环面需修改）
- 方向向量数量限制为 3–20，难以扩展到密集关节
- 单关节假设，多关节需额外组装逻辑

---

## 相关工作

- [[球面参数化]]
- [[Quadrangulation-Remesh]]
- [[Subdivision-Surfaces]]
- [[Bezier-Surface-Modeling]]

---

## 实现建议

- **实现难度**: 中等（图的穷举 + 整数规划）
- **预期性能**: 多项式时间，原型可数小时内完成
- **适用场景**: 骨骼关节建模、医学植入物设计、晶格结构生成
- **开源参考**:
  - libigl: 可用于图枚举辅助
  - CGAL: 2D/3D 凸包、Bézier 拟合
  - Exact-bézier: 任意有理运算库

---

## 论文元数据

- **arXiv 提交**: 2026-10-13 06:30 UTC
- **会议接收**: Pacific Graphics 2026 (Journal Track)
- **预期引用场景**: 几何处理、参数化建模、CAD
