---
title: "Meschers: Geometry Processing of Impossible Objects"
authors: ["Ana Dodik et al."]
date: 2026-05-14
venue: "ACM Trans. Graph. (SIGGRAPH 2025)"
tags: [几何, 网格处理, 离散外微分, 非欧几里得几何]
paper_url: "https://arxiv.org/abs/2605.14960"
doi: "10.1145/3731422"
---

## 核心方法

提出 **Meschers** (Mesh + Meschers)，一种能够表示不可能几何体（如 M.C. Escher 木刻作品）的网格表示方法。

### 关键技术点
1. 基于 **离散外微分 (Discrete Exterior Calculus, DEC)** 的理论基础
2. 支持标准几何处理操作（平滑、距离计算）
3. 支持不可能物体的逆渲染 (inverse-rendering)

### 与传统方法对比
| 方法 | 问题 |
|------|------|
| Cutting | 切割改变局部几何，影响下游应用如平滑 |
| Bending | 难以重新光照物体，破坏几何操作 |

### 创新点
- 第一个支持不可能物体标准几何处理的计算机表示
- 理论基础扎实（DEC）
- 可进行逆渲染

---

## 算法复杂度
- 时间复杂度：待评估
- 空间复杂度：待评估

---

## 开源实现
- 暂无开源代码

---

## 相关笔记
[[Mesh Processing]]
[[Discrete Exterior Calculus]]
[[Impossible Objects]]

---

## 可行性分析

**推荐度**: ⭐⭐⭐⭐ (4/5)

### 优势
- 理论创新性强，首次为不可能物体提供严谨的几何处理框架
- 基于 DEC，有良好的数学基础
- 支持主流几何操作

### 挑战
- 实现复杂度较高，需要深入理解 DEC
- 应用场景相对专一

### 适用场景
- 艺术风格化渲染
- 视觉感知研究
- 特殊效果制作