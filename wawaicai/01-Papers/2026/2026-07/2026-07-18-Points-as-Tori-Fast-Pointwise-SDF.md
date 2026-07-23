---
title: "Points as Tori: Fast Pointwise Signed Distance for Point Clouds"
authors: ["Nicole Feng", "..."]
date: 2026-07-18
tags: [点云, 有符号距离场, 表面重建, 几何处理]
venue: ACM Transactions on Graphics (TOG 2026)
paper: https://arxiv.org/abs/2607.16946
code: https://nzfeng.github.io/research/PointsAsTori
doi: https://doi.org/10.1145/3811385
arXiv: 2607.16946
---

## 核心方法

本文提出一种**用圆环(Tori)拟合点云**的方法，实现快速点态有符号距离(SDF)计算。

### 关键创新点
1. **核心思想**：用圆环(torus)作为局部基元拟合点云，圆环有**闭合形式的有符号距离函数**
2. **前馈网络**：用预训练网络输出每个点的曲率和偏移参数，无需全局优化或空间离散化
3. **统一理论**：提出新理论统一了有符号距离、卷绕数(Winding Numbers)和泊松表面重建

### 算法流程
1. 输入：带法线的点云
2. 局部用圆环拟合点云（网络预测曲率和偏移参数）
3. 输出：解析参数化形式 → 可在任意空间位置查询SDF

### 应用场景
- 点云偏移(offsets)
- 形态学操作和布尔运算
- 球追踪直接可视化偏移面
- 适用于来自摄影测量、网格、3DGS、神经隐式的点云

## 算法复杂度
- **时间复杂度**：O(n) 前馈计算（n为点数），无需全局优化
- **空间复杂度**：O(n) 存储每点参数
- **可并行化**：易于GPU并行

## 开源实现
- 项目主页: https://nzfeng.github.io/research/PointsAsTori
- Code: (见项目主页)

## 相关笔记
[[点云处理]]
[[有符号距离场]]
[[表面重建]]

## 可行性评估

✅ **推荐实现**

- 算法无需全局优化，前馈网络一次推断
- 圆环SDF有闭合形式，计算效率高
- libigl 可用于结果验证和可视化
- 开源代码已公开

### 实现路径
1. 复用项目提供的预训练网络权重
2. libigl 加载点云并计算法线
3. 网络推理获取每点 torus 参数
4. 组合 torus SDF 实现全局查询
