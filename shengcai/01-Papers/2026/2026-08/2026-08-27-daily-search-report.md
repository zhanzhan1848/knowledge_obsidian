---
title: "每日渲染论文搜索报告 - 2026-08-27"
date: 2026-08-27
tags: [日报, 论文搜索]
status: 已读
---

# 每日渲染论文搜索报告 - 2026-08-27

## 搜索概要
- **时间**: 2026-08-27 14:00 UTC
- **搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
- **搜索结果**: 共发现16篇cs.GR论文，筛选出4篇渲染相关

## 渲染相关论文

### ⭐⭐⭐⭐⭐ 高优先级

#### 1. ExMesh++: 多视图PBR网格重建
- **ID**: arXiv:2608.24109
- **作者**: Chenyin Fan et al.
- **日期**: 2026-08-25
- **核心**: 从多视图图像重建可重光照的UV-PBR网格资产
- **关键技术**: 
  - 自适应顶点分割和合并的网格几何优化
  - secondary-ray tracing计算漫反射间接光照
  - 共享UV-PBR材质
- **链接**: [arXiv](https://arxiv.org/abs/2608.24109)
- **笔记**: [[2026-08-26-ExMesh++]]

#### 2. GLOSS: 几何局部自相似性纹理填充
- **ID**: arXiv:2608.25461
- **作者**: Chenyue Cai et al.
- **日期**: 2026-08-26
- **核心**: 基于几何自相似性的局部纹理生成和补全模型
- **关键技术**:
  - PBR材质泛化
  - Blender插件实现
  - 艺术家控制的局部纹理修复
- **链接**: [arXiv](https://arxiv.org/abs/2608.25461)
- **笔记**: [[2026-08-27-GLOSS-Local-Self-Similarity-Texture-Fill]]

### ⭐⭐⭐⭐ 中优先级

#### 3. MaxEnt: 最大熵球谐编码
- **ID**: arXiv:2608.20429
- **作者**: Jiaze Sun et al.
- **日期**: 2026-08-20
- **核心**: 能量加权球谐矩的最大熵编码，用于辐照度压缩和重建
- **关键技术**:
  - Monte Carlo路径采样压缩
  - 五参数MaxEnt在78.7%场景中优于QZH
  - 零负辐照度
- **链接**: [arXiv](https://arxiv.org/abs/2608.20429)
- **笔记**: [[2026-08-21-MaxEnt-Spherical-Moments]]

#### 4. CubicSplat: 可微分矢量图形光栅化
- **ID**: arXiv:2608.20803
- **作者**: Chenglong Liu et al.
- **日期**: 2026-08-21
- **核心**: ECCV 2026 Oral，可微分矢量光栅器
- **关键技术**:
  - 均匀多线段替代Bézier最近点求解器
  - 误差界O(S^-2)
  - 训练速度提升4倍
- **链接**: [arXiv](https://arxiv.org/abs/2608.20803)
- **笔记**: [[2026-08-24-CubicSplat]]

## 其他相关论文 (流体/物理模拟)

#### Hamiltonian 2D-3D 波流耦合
- **ID**: arXiv:2608.25203
- **会议**: SIGGRAPH Asia 2026
- **核心**: 哈密顿2D-3D耦合波浪模拟，比GPU NB-FLIP快4倍

## 本日新增
- [[2026-08-27-GLOSS-Local-Self-Similarity-Texture-Fill]]

## 标签
#日报 #2026-08 #论文搜索 #PBR #纹理生成 #光线追踪
