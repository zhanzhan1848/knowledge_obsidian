---
title: "Make It Flow: Animating Water in 3D Gaussian Splatting Scenes"
date: 2026-10-09
tags: [fluid-rendering, water-rendering, 3d-gaussian-splatting, cinemagraph, optical-flow, eulerian-motion]
authors: [Kjell Keune, Florian Hahlbohm, Jannis Möller, Susana Castillo, Martin Eisemann, Marcus Magnor]
paper_id: 2610.13860
subject: cs.GR
status: reviewed
priority: high
relevance: ⭐⭐⭐⭐⭐
---

## 核心创新点

### 问题定义
为静态 3D Gaussian Splatting (3DGS) 场景添加真实的水流动画，使其具备高保真度的时序运动，避免密集多视角高速采集的实际限制。

### 技术挑战
1. **静态场景假设** - 3DGS 默认假设静态场景，难以表达高频流体运动
2. **casual capture 限制** - 野外瀑布拍摄无法使用密集多视角高速采集
3. **物理仿真成本** - 完整物理仿真在实时 3DGS 渲染管线中难以嵌入
4. **无缝循环** - 动画应能无缝循环（cinemagraph 风格）

### 核心方法
- 从参考图像估计 2D 光流（optical flow）
- 将 2D 光流提升为 3D 一致 Eulerian 运动场
- 启发自 cinemagraph 的算法将运动场应用于 Gaussian primitives 的形变
- 保留 3DGS 的实时渲染性能，支持自由视角浏览

### 关键技术

| 技术 | 说明 |
|------|------|
| **3DGS** | 显式高斯原语表示 |
| **2D Optical Flow** | 从参考图像估计光流 |
| **Eulerian Motion Field** | 3D 一致速度场 |
| **Cinemagraph-inspired Deformation** | 高斯原语时序形变 |
| **Loopable Animation** | 无缝循环动画生成 |

## 渲染技术

### 类型
- **表面/动态 Gaussian Splatting** (流体感)
- 表面+体积混合的实时渲染

### 方法
- 基于 3DGS 的可形变 Gaussian primitives
- 无需动态捕捉、无需物理仿真
- 2D 光流 → 3D Eulerian 速度场提升

### 视觉质量
- 实时性能保持（real-time rendering）
- 显著提升感知真实感
- 保留 free-viewpoint 自由视角导航

## 实现建议

### 实现难度
**中** - 需要集成光流估计、3D 提升、Gaussian 形变等多个模块

### 预期性能
- **帧率**: 实时 (real-time) - 继承 3DGS 性能
- **GPU 需求**: 中高（光流估计 + 3DGS 渲染）
- **训练**: 较快（无需动态捕捉）
- **内存**: 与 3DGS 相当

### 适用场景
- ✅ 3DGS 场景中水流/瀑布动态化
- ✅ Cinemagraph 风格无缝循环动画
- ✅ 实时自由视角流体特效
- ⚠️ 仅限水/流体类高频效果
- ❌ 复杂多相流、强物理交互场景

### 推荐度
**✅ 强烈推荐** - 在保留 3DGS 优势的同时为场景注入生命力，方法实用

## 实验与数据集

### 数据集
- 自建野外瀑布 (waterfall) 场景数据集 in-the-wild
- 包含复杂光照、自由视角

### 基线
- 现有 dynamic Gaussian splatting 方法
- 3D cinemagraph generation 方法

### 结果
- 视觉质量优于现有 baseline
- 计算效率优于现有方法
- 用户研究: 在感知真实感、循环无缝性上均胜出

## 相关工作

- [[3D Gaussian Splatting]]
- [[Cinemagraph Generation]]
- [[Dynamic Scene Reconstruction]]
- [[Optical Flow]]
- [[Fluid Rendering]]

## 资源链接

- 论文: https://arxiv.org/abs/2610.13860
- arXiv PDF: https://arxiv.org/pdf/2610.13860

## 一句话总结
> 通过 2D 光流 → 3D Eulerian 运动场提升，将静态 3DGS 场景转化为具有无缝循环水流动画的实时可形变高斯场景，无需物理仿真或动态捕捉。

---
*由豆苗自动收集于 2026-10-12*