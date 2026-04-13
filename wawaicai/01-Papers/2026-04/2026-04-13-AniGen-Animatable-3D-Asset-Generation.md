---
tags: [几何, 3D生成, 骨骼绑定, 蒙皮权重]
date: 2026-04-13
source: arXiv cs.GR
arXiv_id: 2604.08746
---

# AniGen: Unified S^3 Fields for Animatable 3D Asset Generation

## 核心方法

AniGen 是一个统一框架，直接从单张图像生成可动画的 3D 资产（带有关节骨骼和蒙皮权重）：

1. **S³ Fields 表示** - 在共享空间域上定义 Shape、Skeleton、Skinning 三个一致的场
2. **两阶段 Flow-Matching 管线**:
   - 第一阶段：生成稀疏结构支架
   - 第二阶段：在结构化潜空间中生成密集几何和关节
3. **置信度衰减骨骼场** - 显式处理 Voronoi 边界处骨骼预测的几何歧义
4. **双皮肤特征场** - 解耦蒙皮权重与特定关节数量，允许固定架构网络预测任意复杂度的绑骨架

## 创新点

- 统一表示：形状、骨骼、蒙皮的 S³ 场
- 端到端可动画资产生成
- 处理骨骼预测的几何歧义
- 任意复杂度绑定的固定架构网络

## 算法复杂度

- 基于两阶段 flow-matching
- 复杂度较高，但生成质量优异

## 开源参考

- Project Page: https://yihua7.github.io/AniGen-web/

## 相关笔记

[[2026-04-13-MeshOn-Intersection-Free-Mesh-Composition]]

## 可行性分析

⚠️ 谨慎评估

**技术概述**: 统一 S³ 场生成可动画 3D 资产生成

**实现难度**:
- 算法复杂度：高
- 数值稳定性：flow-matching 需要调参
- 依赖项：深度学习框架、3D 生成模型

**推荐结论**: ⚠️ 谨慎评估 - 技术创新性强但实现复杂度高，适合前沿研究参考

**开源参考**:
- 论文代码: https://yihua7.github.io/AniGen-web/
