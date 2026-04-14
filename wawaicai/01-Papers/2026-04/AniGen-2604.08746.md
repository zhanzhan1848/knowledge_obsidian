---
title: "AniGen: Unified S^3 Fields for Animatable 3D Asset Generation"
arXiv: "2604.08746"
authors: "Yi-Hua Huang et al."
date: "2026-04-09"
venue: "arXiv cs.GR"
tags: [几何, 3D生成, 骨骼绑定, 蒙皮权重, 神经隐式场]
---

# AniGen: Unified S^3 Fields for Animatable 3D Asset Generation

## 核心方法

AniGen 是一个统一框架，直接从单张图像生成**可动画的3D资产**（带有骨骼和蒙皮权重的几何体）。核心洞察：

**将形状、骨骼和蒙皮表示为定义在共享空间域上的相互一致的 S³ Fields (Shape, Skeleton, Skin)**

### 技术创新

1. **置信度衰减骨骼场 (Confidence-Decaying Skeleton Field)**
   - 显式处理 Voronoi 边界处骨骼预测的几何歧义
   - 在边界区域降低置信度，避免错误预测

2. **双皮肤特征场 (Dual Skin Feature Field)**
   - 将蒙皮权重与特定关节数量解耦
   - 允许固定架构网络预测任意复杂度的绑定

3. **两阶段 Flow-Matching 流水线**
   - 第一阶段：合成稀疏结构支架
   - 第二阶段：在结构化潜在空间中生成密集几何和关节

## S³ Fields 统一表示

```
共享空间域
    ├── Shape Field: 几何形状
    ├── Skeleton Field: 骨骼结构
    └── Skin Field: 蒙皮权重
    (三者相互一致约束)
```

## 适用场景

- 交互式图形资产生成
- 具身智能 (Embodied Agents)
- 动画制作

## 开源参考

- 主页: https://yihua7.github.io/AniGen-web/

## 可行性分析

- **算法复杂度**: 高 (多字段联合学习 + Flow Matching)
- **数值稳定性**: 双皮肤特征场设计提高稳定性
- **实现难度**: 高，需要深度学习 + 3D 生成基础
- **推荐度**: ⭐⭐⭐⭐⭐ 对动画和游戏资产生成有重要价值

## 相关笔记

[[Neural Implicit Fields]]
[[Skeleton-Based Animation]]
[[3D Asset Generation]]
