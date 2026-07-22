---
title: Points as Tori: Fast Pointwise Signed Distance for Point Clouds
authors: Nicole Feng
date: 2026-07-18
source: ACM Transactions on Graphics (TOG 2026)
url: https://arxiv.org/abs/2607.16946
pdf: https://arxiv.org/pdf/2607.16946
tags: [rendering, geometry, point-cloud, signed-distance, SDF, ray-marching]
status: unread
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Points as Tori: Fast Pointwise Signed Distance for Point Clouds |
| 作者 | Nicole Feng |
| 来源 | ACM Transactions on Graphics, Volume 45 (2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.16946) |
| PDF | [下载](https://arxiv.org/pdf/2607.16946) |

## 核心贡献
1. **Tori SDF**: 用环面(tori)局部拟合点云，具有闭合形式符号距离函数
2. **Feed-forward Fitting**: 预训练网络输出每点曲率和偏移参数，无需全局优化
3. **统一理论**: 将符号距离与经典重建方法（winding numbers, Poisson表面重建）统一
4. **应用广泛**: 直接用于offset、布尔运算、sphere tracing可视化

## 技术方案
**输入**: 带法线的点云

**核心思想**: 局部用环面重建形状，环面具有闭合形式SDF

**方法**:
- 预训练网络输出每点曲率和偏移参数
- 无需全局优化或空间离散化
- 易于并行化

**应用场景**:
- 点云offset
- 形态学和布尔运算
- 直接sphere tracing可视化

## 实验结论
- 适用于photogrammetry、meshes、3D Gaussians、neural implicits来源的点云
- 避免显式表面重建

## 局限性
- 依赖预训练网络
- 对噪声点云可能不鲁棒

## 可行性分析
- 实现难度：中
- 性能预期：快速点态评估
- 适用场景：点云处理、渲染加速

## 相关工作
- [[Signed Distance Function]]
- [[Poisson Surface Reconstruction]]
- [[Winding Numbers]]
- [[Sphere Tracing]]

## 笔记
环面SDF方法为点云处理提供新思路，可直接用于ray marching等渲染技术。
