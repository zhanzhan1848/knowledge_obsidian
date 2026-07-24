---
tags: [渲染, SDF, 点云, Tori, 球追踪, 2026-07]
date: [[2026-07-24]]
status: 待读
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Points as Tori: Fast Pointwise Signed Distance for Point Clouds |
| 作者 | Nicole Feng |
| 链接 | [arXiv:2607.16946](https://arxiv.org/abs/2607.16946) |
| PDF | [PDF](https://arxiv.org/pdf/2607.16946) |
| 发表 | ACM Transactions on Graphics, Volume 45 (2026) |

## 核心贡献

1. **Tori 局部拟合**: 用环面 (torus) 局部拟合点云，每个环面有闭合形式的 SDF
2. **前馈计算**: 预训练网络输出每点曲率和偏移参数，feed-forward 方式计算 SDF
3. **统一理论**: 将符号距离与经典重建方法（卷绕数、泊松表面重建）统一

## 技术方案

### 输入输出
- **输入**: 带法线的点云
- **输出**: 分析参数化，允许任意空间分辨率的点态符号距离查询

### 关键思想
用环面重建形状：
- 环面有闭合形式的 SDF
- 通过预训练网络输出每点曲率和偏移参数
- 无需全局优化或空间离散化
- 易于并行化

### 应用场景
- 点云偏移 (Offsets)
- 形态学和布尔运算
- 球追踪直接可视化偏移表面

## 统一理论框架

本文建立了 SDF 与经典重建方法之间的理论联系：
- **卷绕数 (Winding Numbers)**: 用于判断点的内外
- **泊松表面重建 (Poisson Surface Reconstruction)**: 隐式曲面重建
- **本文方法**: 通过环面局部参数化实现 SDF 计算

## 实验数据

在以下来源的点云上测试：
- Photogrammetry
- Meshes
- 3D Gaussians
- Neural Implicits

## 标签
#sdf #point-cloud #ray-marching #sphere-tracing #surface-reconstruction #torus
