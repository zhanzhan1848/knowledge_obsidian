---
tags: [几何, 网格生成, CSG, 布尔运算, 拓扑聚合]
type: paper
venue: arXiv cs.CG
date: 2026-07-17
---

# trueform: Fast And Robust Mesh CSG Via Topological Aggregation

## 核心方法

### 问题定义
Mesh CSG 输出被浮点消费：每个发出的坐标都被 materialize（舍入到可表示位置），下一阶段可能观察到 exact result 从未有过的交叉和顺序。只有基于索引的拓扑 survive materialization。

### 核心思想：Keep Topology Exact

**方法**：
1. 在构建内部，arrangement 的径向结构通过**原始输入平面的精确谓词**排序
2. **Integer-exact predicates without exact constructions**
3. 当决策跨越面时，通过**拓扑聚合 (topological aggregation)** 恢复：多数投票解决分歧几何观测

### 关键技术细节

**五种标准相交类型**：
- VV (顶点-顶点)
- VE (顶点-边)
- VF (顶点-面)
- EE (边-边)
- EF (边-面)

**Two-level Identity**：
- 保持结果在跨面时一致，无需全局结构

**Boolean of Any Arity**：
- per-domain bit test
- volumetric regions 直接从 partition 读取
- open surfaces 作为 oriented sheets

### 性能指标

- 比 prior art 快 **两个数量级**
- 交互式浏览器运行
- Valid, watertight output guaranteed

## 开源实现

- Header-only C++ library
- Python bindings
- TypeScript bindings

## libigl 参考

相关 libigl 函数：
- `igl::copyleft::cgal::mesh_boolean` - 现有布尔运算
- trueform 可作为增强集成

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#mesh-csg #boolean-operations #topological-aggregation #exact-predicates #computational-geometry
