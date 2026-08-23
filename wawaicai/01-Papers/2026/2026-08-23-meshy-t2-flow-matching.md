---
title: "Meshy T2: Fast Native Mesh Generation with Flow Matching"
date: 2026-08-23
tags: [arXiv, 网格生成, Flow Matching, 图像到网格, 2026]
---

# 🥬 Meshy T2: Fast Native Mesh Generation with Flow Matching

> arXiv: https://arxiv.org/html/2607.28675v1 | Meshy AI

## 核心方法

**问题**: 大多数高质量 3D 生成系统先生成隐式或体积几何表示，然后通过等值面提取得到网格，导致：
- 网格过于密集（数十万三角形）
- 拓扑不规则，不尊重锐利特征和部件结构
- 需要后处理简化

**解决**: Meshy T2 是一个基于 Flow Matching 的框架，直接从图像生成紧凑、可用的网格。

### 两阶段流程

1. **Voxel Flow**: 从图像预测粗粒度 $64^3$ 占用脚手架
2. **Mesh Flow**: 在脚手架上生成每顶点潜在token，受图像和顶点预算条件控制

### 关键创新：顶点集 Mesh VAE

扩展 SpaceMesh，设计近乎无损的顶点集表示：
- 坐标从不量化（连续回归）
- 重合顶点保持独立token
- 联合恢复顶点、边和有向面

### 拓扑预测

#### 边预测
使用时空嵌入，邻接矩阵：
$$A_{ij} = \|e_i^{time} - e_j^{time}\|_2^2 - \|e_i^{space} - e_j^{space}\|_2^2$$

边预测当且仅当时间分离超过空间分离。

#### 面预测
预测每个顶点的循环邻接顺序（半边后继映射）：
$$\pi_i(p) = n \quad \text{for every triangle } (p,i,n) \in \mathcal{F}$$

扩展到开放边界（使用 NULL 元素）。

## 主要贡献

1. **近乎无损顶点集 Mesh VAE**: 坐标不量化，顶点不焊接，联合恢复几何和拓扑
2. **两阶段 Flow Matching 流水线**: 图像条件 voxel flow + mesh flow，10秒内完成端到端生成
3. **强面数控制**: 解码前采样请求的顶点槽数，直接控制面预算，无需后处理简化
4. **状态-of-the-art 几何保真度**: 在 retopology 和图像到网格任务上都达到最佳

## 与之前方法对比

| 方法 | 表示 | 顺序/并行 | 后处理 |
|------|------|----------|--------|
| MeshGPT | 面token | 自回归 | 需要 |
| EdgeRunner | 边token | 自回归 | 需要 |
| Meshy T2 | 顶点token | 并行 | 无需 |

## 标签

#网格生成 #FlowMatching #图像到网格 #VAE #3D生成
