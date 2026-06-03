---
title: "Meschers: Geometry Processing of Impossible Objects"
arXiv: "2605.14960"
authors: Ana Dodik et al.
date: 2026-05-14
venue: ACM Trans. Graph. (SIGGRAPH 2025)
tags: [几何, 离散外微分, 不可能物体, 网格处理]
subjects: "cs.GR; cs.CG; cs.CV"
---

# Meschers: Geometry Processing of Impossible Objects

## 核心方法

引入 **Meschers**——能够表示 M.C. Escher 风格不可能构造的网格表示。

**问题背景：**
- 经典方法：切割（cut）或弯曲（bend）——会改变局部几何，妨碍下游应用（平滑、距离计算）
- 不可能物体：人类可感知但现实中无法存在的几何构造

**核心创新：**
- 基于离散外微分（Discrete Exterior Calculus, DEC）理论
- 支持标准几何处理操作（平滑、距离计算）
- 支持不可能物体的逆渲染（inverse-render）

**技术细节：**
- 用 Mescher 替代 cut/bend 表达不可能物体
- 离散外微分为理论基础，保证几何操作一致性

## 算法复杂度
- 复杂度取决于具体应用场景
- 网格表示内存开销与标准网格相近

## 实现难度
- 算法复杂度：高（需 DEC 理论基础）
- 数值稳定性：良好
- 依赖项：离散外微分框架

## 可行性
⚠️ **谨慎评估**

理论价值高，实现复杂度较高，适合作为研究参考。

## 开源参考
- 论文代码: 待查
- libigl: 可用 DEC 相关函数实现类似框架

## 相关笔记
[[几何/网格处理]], [[几何/离散微分几何]]
