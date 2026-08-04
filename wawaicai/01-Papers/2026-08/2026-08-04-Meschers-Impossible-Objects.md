---
tags: [几何, 网格表示, 不可能对象, 离散外微积分]
date: 2026-05-14
conference: ACM Trans. Graph. (2025)
---

# Meschers: Geometry Processing of Impossible Objects

## 核心方法

Meschers 是一种用于表示和处理"不可能物体"(如 M.C. Escher 木刻作品)的网格数据结构。这些物体在现实中无法存在，但人类可以感知。

### 现有方法的问题

- **切割法(Cut)**：改变切割处的局部几何，影响下游图形应用（如平滑）
- **弯曲法(Bend)**：使物体重新着色困难，破坏几何操作（如距离计算）

### Meschers 的创新

- 基于**离散外微积分**(Discrete Exterior Calculus) 理论
- 支持标准的几何处理操作
- 可进行不可能物体的逆渲染

## 技术要点

1. **理论基础**：离散外微积分为不可能对象提供数学框架
2. **支持的操作**：
   - 几何平滑
   - 光照重渲染
   - 距离计算
   - 逆渲染

## 开源实现

- 作者：Ana Dodik 等 7 人
- arXiv: https://arxiv.org/abs/2605.14960

## 相关笔记

[[Geometry-Processing-Basics]]

## 可行性分析

⚠️ **学术价值高，实用性待评估**

- 理论贡献明确（离散外微积分框架）
- 应用场景：艺术生成、视觉感知研究
- 对标准几何处理流程影响有限
