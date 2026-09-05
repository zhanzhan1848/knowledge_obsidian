---
title: Inverse Rendering for Modeling with Line Primitives
authors: Kenji Tojo et al.
date: 2026-09-01
source: SIGGRAPH Asia 2026
url: https://arxiv.org/abs/2609.00625
pdf: https://arxiv.org/pdf/2609.00625
tags: [rendering, inverse-rendering, line-primitives, rasterization, fuzzy-geometry, SIGGRAPH-Asia-2026, 2026]
status: unread
---

# Inverse Rendering for Modeling with Line Primitives

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Inverse Rendering for Modeling with Line Primitives |
| 作者 | Kenji Tojo et al. |
| 来源 | SIGGRAPH Asia 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.00625) |
| 项目页 | [tojo.github.io/sa26-line-primitives](https://kenji-tojo.github.io/sa26-line-primitives/) |

## 核心贡献
1. **线段原语逆渲染**：使用显式线段重建毛发、皮毛、纤维、纺织品等模糊各向异性结构
2. **亚像素栅格化线段**：抗锯齿渲染产生半透明外观，兼容标准深度测试光栅化
3. **随机可微光栅化器**：为线段顶点位置、属性和离散连通性提供信息梯度
4. **完整图形管线兼容**：跨平台渲染、各种着色模型和物理模拟

## 技术方案

**问题**: 捕获毛发/皮毛/纤维等模糊结构时，3DGS 等体积原语不兼容标准光栅化、反射建模和物理模拟。

**方案**: 线段原语 + 可微光栅化
1. **线段表示**: 亚像素网格光栅化，抗锯齿重现半透明外观
2. **随机可微光栅化器**: 
   - 线段提供关于顶点位置、属性和连通性的信息梯度
   - 解决大量线段原语优化匹配目标图像的挑战
3. **兼容标准图形管线**: 深度测试光栅化 + 各种着色模型 + 物理模拟

**实验**: 合成和真实数据集，表现优于 surface-based 方法，捕获模糊边界，质量可比体积表示。

## 可行性分析
- 实现难度：高（需可微光栅化器设计 + 逆渲染优化）
- 性能预期：离线重建为主
- 适用场景：毛发/皮毛/纤维建模，兼容标准渲染管线和物理仿真

## 相关工作
- [[2026-09-05_TileGS_Tile-Local-Depth-Binning-GS]]
- [[2026-09-05_LightBridge_Feed-Forward-Relighting-3DGS]]

## 笔记
SIGGRAPH Asia 2026 论文。线段原语是连接神经渲染和传统光栅化管线的好思路，既保持可微优化能力，又兼容标准硬件光栅化。随机可微光栅化器的梯度设计是核心创新。
