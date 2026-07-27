---
tags: [几何, 点云, Signed-Distance, 重建]
date: 2026-07-27
source: arXiv cs.GR
arXiv: 2607.16946
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 核心方法

本文提出一种计算点云符号距离（SDF）的快速方法，核心思想是用**torus（圆环面）** 局部拟合点云。

### 关键创新点
1. **Torus 拟合**: 用圆环面的解析 SDF 来近似局部点云形状
2. **前向网络预测**: 预训练网络输出每点曲率和偏移参数
3. **无需全局优化**: 不需要昂贵的全局优化或空间离散化
4. **理论统一**: 统一了 SDF 与 winding numbers 和 Poisson 表面重建

### 技术流程
```
输入: 点云 + 法向量
    ↓
预训练网络 → 每点 curvature + shift 参数
    ↓
Torus 局部拟合
    ↓
解析 SDF 查询
```

### 核心公式
- Torus SDF: 解析闭合形式
- 统一了 signed distance、winding numbers、Poisson reconstruction

## 应用场景

1. **点云偏移 (Offset)**
2. **形态学操作**
3. **布尔运算**
4. **球Tracing可视化**

## 复杂度分析

- **时间**: O(n) 并行前向传播
- **空间**: O(n) 网络权重
- **优势**: 无需全局优化/离散化

## 开源实现

- 项目主页: https://nzfeng.github.io/research/PointsAsTori
- 发表于 ACM TOG 2026

## 可行性评估

✅ **推荐实现**

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 中 |
| 数值稳定性 | 高 |
| 实现难度 | 低-中 |
| 实用价值 | 高 |

### libigl 参考函数
- `igl::signed_distance`
- `igl::point_mesh_squared_distance`

### CGAL 参考
- `CGAL::Poisson_reconstruction_function`
- `CGAL::make_point_set`
