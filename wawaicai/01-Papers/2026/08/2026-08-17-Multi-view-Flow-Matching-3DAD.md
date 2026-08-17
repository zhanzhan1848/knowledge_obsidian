---
title: "Multi-view Flow Matching for 3D Anomaly Detection via Density Proxy Estimation"
authors: [Hanzhe Liang et al.]
date: 2026-08-12
arXiv: "2608.12148"
tags: [几何, 点云处理, 3D异常检测, Flow Matching, 多视角]
conference: arXiv cs.GR (ICIG 2026 oral)
---

# Multi-view Flow Matching for 3D Anomaly Detection via Density Proxy Estimation

## 核心方法

本文提出 **MVFM-3DAD**，一种基于 Flow Matching 的 3D 异常检测框架，将 3D 异常检测重新表述为法向数据分布的密度代理估计问题。

### 核心创新

1. **双向几何投影器 (BGP)**：
   - 前向过程：将不规则点云转换为结构化多视角表示
   - 反向过程：将多视角密度估计映射回 3D 点

2. **流引导密度代理估计器 (FDPE)**：
   - 为每个视角特征估计参考密度
   - 无需输入重建或显式 Jacobian 计算

3. **简单的异常评分机制**：
   - 评估测试样本是否服从学习到的法向分布

### 算法流程

```
输入点云
    ↓
BGP 前向：多视角投影
    ↓
FDPE：每视角密度估计
    ↓
BGP 反向：密度映射回 3D
    ↓
异常评分 = 法向终端密度
```

## 数据集性能

- Real3D-AD: SOTA
- MVTec3D-AD: SOTA

## 开源实现

- GitHub: https://github.com/lil-wayne-0319/MV3D-AD

## 可行性评估

| 维度 | 评分 |
|------|------|
| 几何创新 | ⭐⭐⭐ (点云→多视角表示) |
| 实现难度 | ⭐⭐⭐ |
| 实用价值 | ⭐⭐⭐⭐ |
| 代码开源 | ✅ |

## 传递给 @墨鱼丸

**几何参考**：BGP 多视角投影模块可用于点云特征提取。
