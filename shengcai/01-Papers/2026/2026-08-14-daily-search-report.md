---
title: Daily Search Report - 2026-08-14
date: 2026-08-14
tags: [rendering, daily-search, arxiv, SIGGRAPH, 2026]
status: complete
---

# 🥬 每日渲染论文搜索报告 - 2026-08-14

## 搜索概况
- **搜索时间**: 2026-08-14 14:00 UTC
- **搜索范围**: arXiv cs.GR 最近 5 天 + SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 发现论文

### arXiv cs.GR 新论文 (2026-08-10 ~ 2026-08-14)

| 论文 | 日期 | 相关性 | 备注 |
|------|------|--------|------|
| **Amulet: Frame Extrapolation** | 08-11 | ⭐⭐⭐⭐ | 稀疏分层场景 + 自适应着色，帧外推 |
| **WildFireGS** | 08-11 | ⭐⭐ | 物理火灾模拟 + Gaussian Splatting |
| **Hybrid Neural-Microfacet BRDF** | 08-10 | ⭐⭐⭐⭐⭐ | EGSR 2026，实时渲染 BRDF |
| **Blue Noise as Gibbs Ensemble** | 08-13 | ⭐⭐⭐ | 蓝噪声采样，蒙特卡洛渲染 |
| **Geodesic Cut-Cell Skinning** | 08-11 | ⭐⭐ | 皮肤权重生成，几何先验 |
| **Smooth Motion Stitching** | 08-10 | ⭐ | 运动编辑，非渲染核心 |
| **Volumetric Parameterization** | 08-09 | ⭐ | 3D 参数化，几何处理 |
| **Reverse-Sweep Adjoints** | 08-09 | ⭐⭐ | 可微仿真，物理模拟 |

### SIGGRAPH 2026 渲染相关论文

| 论文 | 来源 | 相关性 | 备注 |
|------|------|--------|------|
| **HoloPathTracer** | TOG | ⭐⭐⭐⭐⭐ | 波路径追踪全息显示，路径追踪扩展 |
| **CoherentRaster** | SIG | ⭐⭐⭐⭐ | 3DGS 光场显示，GPU 效率优化 |
| **Complex-Valued Holographic Radiance Fields** | TOG | ⭐⭐⭐⭐ | 全息辐射场，复数值渲染 |

## 🥩 重点推荐

### 1. Hybrid Neural-Microfacet BRDF Model (⭐⭐⭐⭐⭐)
**来源**: EGSR 2026 | Ubisoft La Forge

结合 GGX 微表面模型和神经网络，相同内存下优于 SOTA 神经 BRDF。适合实时渲染，保留 PBR 管线兼容性。

**行动**: 传递给 @墨鱼丸 进行算法评估

### 2. HoloPathTracer (⭐⭐⭐⭐⭐)
**来源**: SIGGRAPH 2026 / ACM TOG

将路径追踪扩展到波光学领域，同时求解渲染方程和瑞利-萨默菲尔德积分。路径复用技术对实时应用有价值。

**行动**: 关注，评估实际应用场景

### 3. Amulet (⭐⭐⭐⭐)
**来源**: arXiv

稀疏分层场景表示 + 自适应着色，将 60Hz 着色率外推到 240Hz，4K@250Hz。帧外推技术的重要进展。

**行动**: 关注，与墨鱼丸讨论实时渲染集成

## 笔记创建
- ✅ 2026-08-14_Amulet-Frame-Extrapolation-Sparse-Layered-Scene.md
- ✅ 2026-08-14_Hybrid-Neural-Microfacet-BRDF-Real-Time-Rendering.md
- ✅ 2026-08-14_Blue-Noise-Lattice-Gibbs-Ensemble.md
- ✅ 2026-08-14_HoloPathTracer-Wave-Path-Tracing-Holography.md
- ✅ 2026-08-14_CoherentRaster-3D-Gaussian-Light-Field-Displays.md

## Git 同步
- 状态: 待同步
- 目标: zhanzhan1848/knowledge_obsidian
