---
title: "A Dual-Field Continuous Representation for B-rep Modelling"
authors: ["et al."]
date: 2026-06-30
venue: "SIGGRAPH 2026"
status: important
tags: [渲染, CAD, B-rep, 深度学习, 生成模型]
links:
  arXiv: "https://arxiv.org/abs/2606.31579"
  Code: "https://github.com/AutodeskAILab/DualBrep"
---

## 核心贡献

1. **DualBrep** - 统一B-rep几何和拓扑的连续表示
2. 双重标量场方法：
   - SDF（符号距离函数）表示全局形状几何
   - UDF（无符号距离场）通过表面元素的Voronoi分区隐式编码拓扑结构
3. Flow Matching模型可从单一code联合采样几何和拓扑

## 技术方案

### 问题
- B-rep（边界表示）是CAD最常用数据格式
- 异构结构：连续参数几何 + 离散拓扑图
- 深度学习挑战：组合复杂度、离散非可微性质

### DualBrep方法

1. **双重标量场**
   - SDF: 全局形状几何
   - UDF: 通过Voronoi分区编码拓扑
   - 压缩到单一共享潜在空间

2. **Flow Matching模型**
   - 联合采样几何和拓扑
   - 避免顺序B-rep预测的错误累积

3. **神经重建器**
   - 从连续双场提取显式B-rep模型
   - 支持棱镜和自由形式图元

## 应用

- 点云逆向工程
- 生成建模

## 标签

#CAD #B-rep #SDF #深度学习 #SIGGRAPH2026
