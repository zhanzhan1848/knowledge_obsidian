---
tags: [渲染, 逆渲染, 动态重建, 2026, ECCV]
date: 2026-07-18
status: 待读
---

# Dynamic Inverse Rendering for Enhanced Material-Lighting Decomposition

## 基本信息

| 标题 | Dynamic Inverse Rendering for Enhanced Material-Lighting Decomposition |
|------|-------|
| 作者 | Raza Yunus 等 (University of Technology Nuremberg, Intel, Max Planck Institute) |
| 发表 | ECCV 2026 |
| 链接 | [arXiv:2607.09329](https://arxiv.org/abs/2607.09329) |
| 代码 | [Project Page](https://razayunus.github.io/DIR) |

## 核心贡献

1. **核心洞察**：刚体运动中的物体观察能提供更丰富的光-表面交互，比静态多视角捕获更有利于材质-光照分解
2. **4D 逆渲染框架**：将物体姿态跟踪与表面材质估计结合
3. **合成数据集**：提供带真实材质和重光照视图的日常物品数据集

## 技术方案

### 问题背景
逆渲染的核心难题是材质-光照歧义性（material-lighting ambiguity）：
- 在固定光照下，无合适约束时，物体颜色会被烘焙到环境贴图中
- 传统方案需要多光照条件捕获或学习先验

### 核心方法：三阶段管道

**Stage 1**: 使用 Progressive Sequential Optimization + NeuS 获取粗略几何和初始姿态

**Stage 2**: 引入 3D Gaussians，与物体姿态联合优化获得精细几何和姿态估计

**Stage 3**: 赋予 Gaussians 材质属性，使用基于物理的渲染（PBR）跨时间步优化材质

### 关键公式

物体表面点变换：
```math
x_t = R_t x + t_t; \quad \hat{n}_t = \hat{n}(x_t) = R_t \hat{n}
```

入射光照：
```math
L_i(x, \hat{\omega}) = L_{direct}(\hat{\omega}) V(x, \hat{\omega}) + L_{indirect}(x, \hat{\omega})
```

### 技术亮点
- 利用高效的 Gaussian Ray Tracing 建模精确遮挡
- 2D 对应关系来自 SOTA 特征匹配器
- 手持物体捕获设置提供 360° 覆盖

## 实验结论

- 合成数据上，运动下的重建材质显著比静态更准确
- 真实手持物体 RGB 视频上， pipeline 在噪声条件下保持优势

## 可行性分析

- **实现难度**：中
- **渲染相关**：高（使用 3D Gaussian Ray Tracing 进行逆渲染）
- **适用场景**：物体重光照、AR 物体放置、材质分离
- **代码可用性**：有项目主页，代码待开源

## 行动建议

已传递给 @墨鱼丸 进行算法评估。

## 标签

#渲染 #逆渲染 #3DGS #材质分解 #ECCV2026
