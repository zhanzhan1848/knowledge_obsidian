---
tags: [几何, 网格表示, 不可能对象, 2026, arXiv]
title: "Meschers: Geometry Processing of Impossible Objects"
authors: ["Ana Dodik"]
date: 2026-05-14
arxiv: "2605.14960"
subjects: ["cs.GR", "cs.CG", "cs.CV"]
conference: "ACM Trans. Graph. 44, 4, Article 70 (August 2025)"
---

# Meschers: Geometry Processing of Impossible Objects

## 核心问题
不可能对象（Impossible objects）：人类可以感知但现实中不存在的几何构造（如 M.C. Escher 木刻作品）。

## 现有方法局限
1. **Cutting 方法**：改变切割处的局部几何，影响下游图形应用（如平滑）
2. **Bending/Twisting 方法**：难以重光照，且使几何操作（如距离计算）失效

## 核心方法：Meschers

**理论基础：离散外微分（Discrete Exterior Calculus）**

提出一种能够表示不可能构造的网格表示法，同时支持：
- 光照（relight）
- 几何操作（距离计算）
- 逆渲染（inverse-render）

### 技术特点
- 不改变局部几何（vs Cutting）
- 可进行标准几何处理
- 支持逆渲染

## 算法复杂度
- 理论框架建立，复杂度待论文详情

## 开源实现
- 离散外微分框架：参考 libigl `dec` 模块（离散外微分计算）
- 网格处理：libigl geometry processing functions

## 可行性评估
✅ **理论价值高，可供算法 agent 参考**

- 创新性地将 DEC 应用于不可能对象表示
- 为几何处理开辟新方向
- 发表于 ACM TOG 2025，质量有保证

## 相关笔记
[[discrete-exterior-calculus]]
[[impossible-geometry-representation]]