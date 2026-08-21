---
title: "As-Rigid-As-Possible Regularization for Implicit Surfaces"
authors: [Tobias Djuren et al.]
date: 2026-08-16
tags: [几何, 网格处理, 隐式曲面, ARAP, 正则化]
arxiv: "2608.15933"
doi: "10.1111/cgf.70519"
subjects: [cs.GR]
conference: "Computer Graphics Forum 2026"
journal: "CGF 2026"
---

# As-Rigid-As-Possible Regularization for Implicit Surfaces

## 核心方法

为**隐式曲面的形变函数计算 As-Rigid-As-Possible (ARAP) 能量**，基于曲面点采样。

### 核心问题
ARAP 能量在分段线性网格上效果好，但在隐式曲面表示上缺乏有效计算方法。

### 关键技术

1. **利用隐式表示提供微分**
   - 在每个采样点提供精确微分
   - 评估高效且精确（至数值精度）

2. **ARAP 能量计算**
   - 基于点采样计算形变函数的 ARAP 能量
   - 适用于神经形状处理的多种应用

### 核心创新点
- 首次为隐式曲面提供精确 ARAP 能量计算
- 可与神经形状处理方法结合
- 兼顾现实变形行为与高效计算

## 性能对比
与文献中替代方法的属性对比，应用于神经形状处理

## 相关技术
- As-Rigid-As-Possible (ARAP)
- Implicit Surface
- Shape Deformation
- Neural Shape Processing
- Regularization

## 可行性评估

**推荐度：✅ 推荐实现**

- CGF 2026，重要期刊
- ARAP 是经典变形能量，应用于隐式曲面有创新
- libigl 的 ARAP 实现可作为参考
- 对隐式曲面变形、神经隐式场处理有参考价值

## 会议信息
Computer Graphics Forum, Volume 25 (2026), Number 5
