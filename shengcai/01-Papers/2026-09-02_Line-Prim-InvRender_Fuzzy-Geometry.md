---
title: Inverse Rendering for Modeling with Line Primitives
authors: —
date: 2026-09-02
source: SIGGRAPH Asia 2026
url: https://arxiv.org/abs/2609.00625
pdf: https://arxiv.org/pdf/2609.00625
tags: [rendering, line-primitives, inverse-rendering, fuzzy-geometry, rasterization, hair-rendering, fur, paper, 2026, SIGGRAPH-Asia]
status: unread
---

# Inverse Rendering for Modeling with Line Primitives

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Inverse Rendering for Modeling with Line Primitives |
| 来源 | SIGGRAPH Asia 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.00625) |
| PDF | [下载](https://arxiv.org/pdf/2609.00625) |
| 项目页 | https://kenji-tojo.github.io/sa26-line-primitives/ |

## 核心贡献
1. 首个**线段基元**逆渲染方法，用于重建毛发、皮毛、纤维、纺织品等各向异性结构
2. 提出**随机可微光栅器**用于线段，提供关于顶点位置、属性和离散连通性的有信息量梯度
3. 重建结果完全兼容标准图形管线：跨平台渲染、各类着色模型、物理仿真

## 技术方案

**问题**：现有辐射场重建方法（如3DGS）使用半透明体积基元，而非不透明低维基元（三角形、线段、多段线），导致兼容标准深度测试光栅化、反射建模和物理仿真的局限性。

**方法**：用显式线段重建模糊几何，在亚像素网格上进行光栅化以实现抗锯齿，再现半透明外观。

**关键创新 — 随机可微光栅器**：
- 线段的光栅化结果提供关于顶点位置、属性和离散连通性的有信息量梯度
- 使得大量线段基元能够优化以匹配目标图像

**优化挑战**：优化大量线段基元以匹配目标图像极具挑战。解决方法：
- 随机可微光栅器产生关于顶点位置、属性和连通性的梯度
- 支持亚像素网格抗锯齿

**输出兼容性**：
- 跨平台渲染
- 各类着色模型
- 物理仿真

## 实验结论
- 在合成数据集和真实数据集上均有效
- 在捕获模糊边界方面优于基于表面的方法
- 与体积表示质量相当，同时完全依赖显式几何

## 局限性
- 线段数量大时优化难度增加
- 依赖随机可微光栅器的梯度质量

## 可行性分析
- 实现难度：高（需要可微光栅器设计）
- 性能预期：支持实时渲染（标准光栅化）
- 适用场景：毛发/皮毛渲染、织物仿真、影视特效

## 相关工作
- 3D Gaussian Splatting (体积基元)
- 毛发渲染 (Kulla, Marschner等)
- 可微光栅化 (SoftRas等)

## 笔记
**对渲染领域的价值**：这是首个完全用显式线段重建各向异性结构的方法，打破了体积基元对标准光栅化管线的依赖。对毛发渲染、织物仿真领域有重要价值。SIGGRAPH Asia 2026 接收论文。
