---
tags: [几何, 网格重建, 无符号距离场, 等值面提取]
---

# Superpower Contouring of Unsigned Distance Data

## 核心方法

从无符号距离数据重建任意曲面（开放、非可定向、非流形表面）。

### 核心创新
- **Superpower Contour**: 引入新的理论概念，基于距离样本生成的功率图（power diagram）
- 证明 superpower contour 在采样密度极限下收敛到真实曲面
- 利用 superpower contour 作为初始表面代理，通过算法生成逼近未知几何的多边形网格

### 算法流程
1. 计算距离样本的功率图
2. 构建 superpower contour 作为初始表面代理
3. 迭代细化生成精确网格

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：O(N) 其中 N 为样本数

## 实现难度
- 算法复杂度：中
- 数值稳定性：理论收敛性保证
- 依赖项：无特殊依赖

## 开源参考
- libigl: 可参考 `contouring` 相关函数
- 论文代码: 待发布

## 推荐结论
✅ 推荐实现

## 论文信息
- **arXiv**: [2604.19568](https://arxiv.org/abs/2604.19568)
- **作者**: Ningna Wang
- **日期**: 2026-04-21
- ** Subjects**: cs.GR

## 关键公式/概念

### 功率图 (Power Diagram)
样本点的加权 Voronoi 图，权重影响每个区域的形状。

### Superpower Contour 收敛性
在采样密度趋于无穷时，superpower contour 收敛到真实曲面。

## 相关笔记
[[2026-04-21-Superpower-Contouring-Unsigned-Distance]]

## 技术要点

### 与传统方法对比
| 方法 | 要求 | 限制 |
|------|------|------|
| 传统等值面提取 | 有符号距离、准确梯度 | 无法处理无符号数据 |
| Marching Cubes | 有符号SDF | 需要连续距离函数 |
| 本文方法 | 离散无符号距离 | 无需训练 |

### 适用场景
- 开放曲面重建
- 非可定向曲面
- 非流形几何
- 3D 扫描数据（无符号距离输出）

---
*生成时间: 2026-04-26*
