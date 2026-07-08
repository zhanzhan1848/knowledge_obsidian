---
tags: [几何, 网格简化, Quadric-Error-Metric, 特征保持]
date: 2026-07-08
source: arXiv
categories: [cs.GR, cs.CG]
---

# Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 核心方法

**FA-QEM** (Feature-Aware Quadric Error Metric) — 针对现代 3D 资产生成的网格简化流水线：

### 多项式 Quadric 误差公式
联合编码三个项：
1. **几何偏差** (geometric deviation)
2. **边界曲率** (boundary curvature)
3. **表面法线一致性** (surface normal consistency)

### 顶点最优放置
- 即使在激进简化下也能保留锐利特征
- 优化顶点位置最小化误差

## 问题背景

现代重建和生成管道（神经渲染、大规模 3D 资产生成）产生的网格特点：
- 密集 (dense)
- 噪声 (noisy)
- 经常是非流形 (non-manifold)

下游应用需求：simulation、AR/VR、科学计算

## 技术创新

1. **特征感知的多项式误差度量**
2. 高保真几何简化 → 改进下游外观迁移
3. 作为纹理映射的优越前端（通过连续映射技术）

## 实验验证

- AI 生成网格评估
- **Thingi10K** 数据集
- **Real-World Textured Things** 数据集

### 性能对比
- 更低的几何误差
- 更好的视觉保真度
- **显著更快的运行时间**
- 对各种挑战性输入的鲁棒性

## 获奖

- **CVPR 2026 Workshop 3D4S Best Paper Award Runner-up**

## 开源实现

- 待补充 (arXiv PDF 可用)

## 相关笔记

[[2026-07-08-ExMesh-Topology-Adaptation]]
[[2026-07-08-Intrinsic-Meshing-Geodesic-Distances]]

## 元信息

- **arXiv**: [2605.14029](https://arxiv.org/abs/2605.14029)
- **作者**: Kunal Bhosikar 等
- **提交日期**: 2026-05-13
- **会议**: CVPR 2026 Workshop on 3D Geometry Generation for Scientific Computing (3D4S)
- **Subjects**: Graphics (cs.GR), Computational Geometry (cs.CG)
