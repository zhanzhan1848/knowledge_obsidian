---
title: Geometric Partitioning of Boundary Representations for Large-Scale CAD Processing
tags: [几何, CAD, B-Rep, 网格处理, 分割]
cite: arXiv:2604.14927
date: 2026-04-16
authors: [Shen Fan]
venue: cs.GR
---

# Geometric Partitioning of Boundary Representations for Large-Scale CAD Processing

## 核心方法

提出 **STEP-Parts** 工具链，从原始 STEP B-Rep 提取几何实例分割。

### 问题背景
- CAD学习管道将 B-Rep 离散化为三角网格
- 丢弃了解析曲面结构和拓扑邻接
- 削弱了一致的实例级分析

### 核心创新
1. **确定性分割**：合并相邻B-Rep面片
   - 相同解析基元类型
   - 满足近切线连续性标准
   
2. **tessellation-robust**：分割定义在固有B-Rep拓扑上
   - 不依赖特定三角化
   - 分割边界在三角化变化时保持稳定

### 实验规模
- ABC 数据集的 DeepCAD 子集
- 处理约 180,000 模型
- 在消费级CPU上约6小时

## 算法细节

### 面片合并条件
- 相同解析基元类型（平面、圆柱、圆锥等）
- 近切线连续性（dihedral angle < threshold）
- ABC数据集上 dihedral angles 呈强双峰分布

## 下游应用
1. 隐式重建-分割网络
2. 数据集级点云骨干网络

## 开源资源
- 代码已发布
- 预计算标签已发布

## 相关笔记
[[CAD处理]]
[[B-Rep]]
[[网格分割]]