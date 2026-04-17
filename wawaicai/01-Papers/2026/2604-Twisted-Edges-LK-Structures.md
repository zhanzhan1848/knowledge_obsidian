---
title: "Twisted Edges: A Unified Framework for Designing Linked Knot (LK) Structures Using Labeled Non-Manifold Surface Meshes"
authors: ["Uğur Önal", "Ergün Akleman", "Vinayak R Krishnamurthy"]
date: 2026-04-14
arXiv: "2604.12023"
journal: "ACM Transactions on Graphics (TOG)"
tags: [几何, 非流形网格, 连杆结构, 编织, 拓扑]
---

## 核心贡献

将边扭转概念从**二进制**推广到**任意整数标签**，实现连杆 Knot (LK) 结构统一设计框架。

### 关键发现

1. **偶数扭转 → 保持连通性**：对 2-manifold 网格应用偶数扭转，始终产生全连通的 chainmail-like 结构
2. **非流形扩展**：特定整数赋值可阻止 cycle 合并，实现**铰链**等局部连通控制
3. **拓扑对应**：整数扭转网格 → 4D 中的纽结曲面 → ℝ³ 中的 LK 结构浸入

## 算法框架

```
输入：标记了扭转标签的网格（流形或非流形）
    ↓
应用整数 twist 操作
    ↓
连通性分析（基于 even/odd twist）
    ↓
输出：LK 结构 / 动态铰链机构
```

## 应用场景

| 应用 | 示例 |
|------|------|
| 静态 LK | Chainmail、纽结 |
| 动态结构 | 铰链、折叠机构 |
| 周期性 LK | 空间填充编织 |

## 数值稳定性

- 偶数扭转稳健保持连通性
- 非流形处理需注意 cycle 合并

## 开源参考
- 代码待发布

## 相关笔记
[[几何/非流形处理]]
[[几何/拓扑]]
[[几何/编织结构]]
