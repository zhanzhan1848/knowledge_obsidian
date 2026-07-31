---
title: "Structure-aware Gaussian Splatting for Articulated Object Reconstruction"
authors:
  - Gahye Lee
arXiv: "2607.26889"
conference: "ECCV 2026"
date: 2026-07-29
tags: [几何, 3D重建, 高斯泼溅, 关节物体, 神经渲染]
---

# StructureGS: Structure-aware Gaussian Splatting

## 核心方法

StructureGS 通过**结构感知指导**增强 3D Gaussian Splatting，用于重建具有多个可动部件的关节物体。

### 关键创新点

1. **结构感知指导**: 利用有向边界框 (OBB) 强制执行两个关键结构属性
2. **空间一致性**: 约束每个部件的几何保持紧凑并在指定区域内
3. **结构连通性**: 强制执行相邻部件之间的物理合理接触关系

### 技术实现

- **有向边界框 (OBB)**: 表示物体部件
- **结构感知损失**: 将显式结构约束注入优化过程
- **纠缠解耦**: 解决几何、外观和运动参数的纠缠问题

## 问题背景

现有方法主要依赖光度监督，通常无法解耦这些相互依赖的组件，导致：
- 部分分解差
- 边界模糊
- 几何伪影

## 性能表现

- 在关节物体重建上达到最先进性能
- 产生高质量、定义清晰的部分几何

## 开源实现

- 论文代码: 待发布

## 相关笔记

[[3D Gaussian Splatting]]
[[Articulated Object Reconstruction]]
[[Neural Rendering]]
[[Structure-aware Optimization]]

## 可行性分析

- **算法复杂度**: O(n × iterations)，n 为高斯数量
- **实现难度**: 中等，基于 3DGS 扩展
- **数值稳定性**: 良好
- **推荐度**: ⭐⭐⭐⭐⭐ 实用价值高，适合机器人操作和动画应用
