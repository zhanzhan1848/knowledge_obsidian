---
tags: [几何, 非流形网格, 拓扑, 链接结构]
arXiv: 2604.12023
authors: [Tolga Yildiz, et al.]
date: 2026-04-13
venue: arXiv cs.GR
---

# Twisted Edges: A Unified Framework for Designing Linked Knot (LK) Structures Using Labeled Non-Manifold Surface Meshes

## 核心方法

**问题定义**：边扭转（edge twists）源自拓扑图论，是链接结（Linked Knot）结构设计的基础，但现有方法仅限于二进制状态（二元扭转），无法覆盖完整拓扑可能性。

**Twisted Edges 框架**：
- 将扭转公式推广到支持**任意整数扭转标签**（integer twist labels）
- 发现：偶数次扭转应用于 2-流形网格时稳健保持连通性 → 形成 chainmail-like 结构
- 推广到**非流形网格**：特定整数分配防止环合并 → 实现部分连通和功能铰链
- 理论贡献：整数扭转网格对应四维中的打结曲面（knotted surfaces），LK 结构为其在 R^3 的浸入

**关键洞察**：
- 二进制约束打破 → 以前未研究的可编织和关节结构的系统探索成为可能
- 零次扭转可能引入断开；偶次扭转稳健保持连通性

## 算法复杂度
- 扭转标签赋值：拓扑验证 O(1) 每边
- 连通性分析：基于网格拓扑

## 实现难度
- 算法复杂度：中（拓扑分析 + 网格处理）
- 数值稳定性：良好
- 依赖项：非流形网格数据结构（如 CGMesh、OpenMesh）

## 推荐结论
✅ 推荐实现（几何/拓扑交叉方向）

## 相关笔记
[[非流形网格, 拓扑, 编织几何]]
