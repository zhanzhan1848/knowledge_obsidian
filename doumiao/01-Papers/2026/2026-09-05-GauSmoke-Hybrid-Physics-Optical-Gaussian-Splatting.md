---
title: "GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction"
authors:
  - Wenran Zhang
  - Yuxiang Cai
  - Letian Huang
  - Dongwei Ye
  - Jie Guo
  - Bo Ren
date: 2026-07-19
conference: SIGGRAPH 2026
doi: 10.1145/3799902.3811148
subjects: cs.GR
tags:
  - smoke rendering
  - volume rendering
  - 3D Gaussian Splatting
  - physics-informed
  - sparse view
  - fluid reconstruction
---

## 核心创新点

从**稀疏视角视频**重建动态烟雾，结合**物理引导的高斯优化**与**体积渲染**。

### 核心技术

1. **混合物理-光学模型** — 融合物理动力学约束与光学观测
2. **物理引导的3DGS优化** — 用物理一致性引导高斯优化
3. **体积渲染** — 实现高质量烟雾体积渲染

### 方法特点

- 从稀疏2D视频输入重建3D烟雾
- 密度和运动一致性约束
- 减少伪影，提升真实感
- 高视觉和物理保真度

### 技术对比

| 方法 | 输入 | 物理约束 | 质量 |
|------|------|---------|------|
| Neural Radiance Fields | 多视角密集 | 无 | 中等 |
| Physics-Informed NeRF | 稀疏 | 软约束 | 中等 |
| **GauSmoke** | **稀疏视频** | **结构引导** | **高** |

## 渲染技术分类

- **类型**: 体积渲染
- **方法**: 3D Gaussian Splatting + 物理引导优化
- **关键词**: 烟雾重建, 稀疏视角, 体积渲染

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐
- **实时性**: 离线重建
- **创新度**: ⭐⭐⭐⭐ (跨学科融合)

## 关键词

`smoke reconstruction` `3D Gaussian Splatting` `physics-informed` `sparse view` `volume rendering` `SIGGRAPH 2026`
