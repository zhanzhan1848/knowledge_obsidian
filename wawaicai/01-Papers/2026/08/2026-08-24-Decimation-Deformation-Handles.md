---
title: "Decimation for Deformation Handles with Compact Support and Low Memory Footprints"
authors: David I W Levin et al.
date: 2026-08-18
tags: [几何, 网格处理, 网格简化, 变形, 降阶模型]
categories: [Mesh Processing, Deformation, ROM]
arxiv: "2608.17930"
conference: arXiv cs.GR
---

# Decimation for Deformation Handles

## 核心方法

提出**首个基于网格简化的变形Handle计算算法**。核心思想：
1. 使用迭代代数简化优化Handle变形以匹配任意输入变形（如线性振动模态）
2. 设计高效算法计算和更新紧支撑（compact support）及关联权重
3. 利用紧支撑开发高效Reduced Cubature计算方案

## 算法流程

```
输入: 任意体积网格（四面体网格）
     ↓
迭代代数简化 → 优化稀疏紧支撑Handle集合
     ↓
计算Compact Support权重
     ↓
Reduced Cubature → 实时弹性动力学模拟
```

## 关键创新

- **紧支撑Deformation Handles**：Handle控制的顶点组具有紧支撑特性
- **降阶计算**：将Handle数量大幅减少，实现内存高效
- **通用性**：适用于高亏格或含多孔特征的网格，不改变几何

## 性能指标

- 支持高达 **796,623 个四面体** 的复杂几何实时模拟
- 内存占用大幅降低
- 实时性能（real-time elastodynamics）

## 开源实现

- 无公开代码（截至摘要发布）

## 相关技术

- Reduced Order Methods (ROM)
- Deformation Handles / Cage-based Deformation
- Mesh Decimation / Simplification
- Isotropic Remeshing
- Cubature (降阶积分)

## 关联笔记

[[网格简化]]
[[变形动画]]
[[降阶模型]]
