---
title: "Make It Flow: Animating Water in 3D Gaussian Splatting Scenes"
date: 2026-10-09
retrieved: 2026-10-19
tags: [fluid-rendering, water-rendering, gaussian-splatting, optical-flow, cinemagraph, real-time, dynamic-3d]
authors: [Kjell Keune, Florian Hahlbohm, Jannis Möller, Susana Castillo, Martin Eisemann, Marcus Magnor]
institution: TU Braunschweig — Institut für Computergraphik
paper_id: 2610.13860
subject: cs.CV (cs.GR cross-list)
status: reviewed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.13860
overview_video: https://youtu.be/qf04D73kgrc
---

# Make It Flow: Animating Water in 3D Gaussian Splatting Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **arXiv ID** | 2610.13860 v1 |
| **提交日期** | 2026-10-09 (Fri) 17:08 UTC |
| **分类** | cs.CV (primary), cs.GR (cross-list) |
| **主要场景** | Waterfall / 流水（wild in-the-wild captures） |
| **场景类型** | 3DGS 静态场景 + 高频流体外观 |

## 🎯 核心问题

3D Gaussian Splatting 在静态重建中表现出色，但面对真实环境中的高频动力学（如瀑布、流水），存在两大挑战：
1. **动态捕获困难**：常规捕捉条件下，稠密多视角 + 高速采集不可行
2. **物理模拟昂贵**：不需要 dynamical capture，但纯物理仿真需要重计算
3. **外观 + 几何**：流体往往是 view-dependent 且近无纹理

## 🧠 方法要点

### 核心思路
> **Cinemagraph 启发的二维 → 三维运动场提升法（lift）**
> 不做物理模拟，不做密集多视角捕获；只从参考图估计 2D 光流，提升到 3D Eulerian 速度场，作用于 3DGS primitives。

### 关键组件
1. **2D 光流估计**：从参考图或者模型渲染图中获取像素级 motion
2. **3D Eulerian motion field reconstruction**：将 2D 流提升到一致 3D 速度场
3. **Gaussian primitive deformation**：用 3D 速度场形变每个 Gaussian（位置 + 朝向 + 尺度）
4. **无缝循环**：使用 cinemagraph 风格算法，保证时间维度首尾闭合

### 关键创新 — Cinemagraph 启发的循环动画
- 提取"哪些 Gaussian 应被驱动（运动区域）vs. 静态（背景）"
- 时序相位偏移 → 缓出 → 缓入 → 完美循环闭合
- 形变无缝循环，无跳帧

## 📊 数据集 & 评估

- **新数据集**：野外瀑布场景，in-the-wild，不需专业设备
- **对比基线**：prior dynamic Gaussian splatting, 3D cinemagraph
- **结果**：
  - 视觉质量显著提升
  - 计算效率更高
  - **保留实时渲染性能**（free-viewpoint 实时）

## 🩸 渲染分析（豆苗评注）

### 渲染方法
- **类型**：表面增强型粒子（3DGS primitives）
- **技术**：3DGS deformation field + 光流引导

### 视觉质量
- **逼真度**：⭐⭐⭐⭐（4/5）— 接近物理水流观感，但不是基于物理
- **风格化支持**：部分 — 取决于光流估计的稳健性

### 性能预期
- **帧率**：实时（free-viewpoint, decoupled from simulation cost）
- **GPU 需求**：与 3DGS 渲染等价，加上少量 deformation cost
- **内存占用**：3DGS 原生 + 速度场 buffer

### 实现建议
- **着色器复杂度**：低（继承 3DGS 渲染管线）
- **管线要求**：3DGS pipeline；需可靠的光流估计器
- **推荐度**：✅ 用于离线 → 实时入口：无需物理代价获取流动感

### 适用场景
- ✅ VR / 社交 VR 中真实户外瀑布视频捕获
- ✅ 数字孪生 / 文化遗产数字化
- ✅ 3DGS-based 实时场景中的流体"激活"
- ⚠️ 高保真物理仿真（如工业级 CFD）— 不适用

## 🔗 与豆苗关心的关键技术映射

| 鸭血关注项 | 本文贡献 |
|-----------|---------|
| 水面渲染 | ✅ 流水外观（瀑布场景） |
| 流体动力学 | ⚠️ 非物理，但视觉逼真 |
| 实时性能 | ✅ 完全实时 |
| 数据集 | ✅ 野外瀑布多视角数据集 |

## 📚 引用信息

```bibtex
@article{keune2026makeitflow,
  title={Make It Flow: Animating Water in 3D Gaussian Splatting Scenes},
  author={Keune, Kjell and Hahlbohm, Florian and M{\"o}ller, Jannis and Castillo, Susana and Eisemann, Martin and Magnor, Marcus},
  journal={arXiv preprint arXiv:2610.13860},
  year={2026}
}
```

## 🏷️ 标签
`#fluid-rendering` `#water-rendering` `#gaussian-splatting` `#optical-flow` `#cinemagraph` `#real-time` `#dynamic-3d`
