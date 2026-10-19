---
title: "SplashSplat: Reconstructing Splashing Liquids from Real-World Multi-View Videos"
date: 2026-09-17
retrieved: 2026-10-19
tags: [fluid-rendering, water-rendering, splashing, particle-rendering, gaussian-splatting, multi-view, lagrangian, level-set, dataset]
authors: [Peiyu Liu]
institution:  (to verify from PDF)
paper_id: 2609.20818
subject: cs.CV (cs.GR cross-list)
status: reviewed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2609.20818
project_page: https://niko-creater.github.io/splashsplat-web/
pages: "18 pages (11 main + 7 supplementary)"
figures: 14
tables: 12
acm_classes: "I.4.5; I.3.7"
---

# SplashSplat: Reconstructing Splashing Liquids from Real-World Multi-View Videos

## 元信息

| 字段 | 内容 |
|------|------|
| **arXiv ID** | 2609.20818 v1 |
| **提交日期** | 2026-09-17 (Thu) 17:59 UTC |
| **分类** | cs.CV (primary), cs.GR (cross-list) |
| **主要场景** | 实拍飞溅液体（从连续流 → 暴力飞溅） |
| **ACM 分类** | I.4.5 (Reconstruction), I.3.7 (3D Graphics) |

## 🎯 核心问题

飞溅液体（splash）是计算机图形学长期难题：
1. **寿命极短**：sheet → ligament → droplet 仅几分之一秒
2. **外观 view-dependent**：近无纹理
3. **难以跟踪**：几乎没有持久的视觉特征
4. **数据空白**：至今**无同步多视角**飞溅液体公开数据集

> 现有研究主要聚焦 smoke、合成液体、轻度变形表面 → 本文首次系统性补足 splashing liquids 的公开基准

## 🧠 方法要点

### 核心原则
> **"Only impose physical structure where the observations can constrain it."**
> — 只在观测能约束的地方强加物理结构

### 三个关键流水线

```
Multi-View Video (7 cameras × 4K × 60fps)
        ↓
[1] Per-frame Liquid SDF (融合多视角 mask)
        ↓
[2] Level-Set Transport (相邻 SDF → 粗略速度场)
        ↓
[3] Lagrangian Carriers (沿速度场 advect, 纠错 + 重播)
        ↓
Decoded Local 3DGS Gaussians (Differentiable Rendering)
```

### 数据集贡献
- **20 个真实场景**：从平缓水流到暴力飞溅
- **采集**：7 台同步标定 4K 相机，60 fps
- **标注**：手工精修 per-view 液体 + 容器 mask
- **评估拆分**：fixed splits

## 📊 实验结果

- ✅ 在自建真实 capture 和合成基准上，**均优于 SOTA dynamic GS**
- ✅ 物理更合理的运动
- ✅ 更低的训练成本
- ✅ 同一表示支持**时间插值**和**风格迁移**（无需重训）

## 🩸 渲染分析（豆苗评注）

### 渲染方法
- **类型**：混合 - 表面重建（SDF）+ 粒子渲染（Lagrangian carriers）+ 3DGS
- **技术**：Level-set advection + differentiable rendering + Gaussian decoding

### 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐（5/5）— 实拍场景真实感强
- **风格化支持**：✅ 风格迁移无需重训

### 性能预期
- **训练时间**：明显低于 prior dynamic GS
- **渲染**：3DGS 原生（含 Lagrangian 粒子流）
- **GPU 需求**：中高（SDF + LS + GS 全栈 GPU 计算）
- **内存占用**：场景相关（飞溅密度高）

### 实现建议
- **着色器复杂度**：中（多模块耦合：mask fusion + SDF + LS + carriers + GS）
- **管线要求**：CUDA / WebGPU + 不同iable rasterizer
- **推荐度**：✅ 飞溅液体 + 多视角研究的标杆工作；数据集是关键资产

### 适用场景
- ✅ VFX 中的水花重建（视觉效果需要真实数据驱动）
- ✅ VR / 交互式数字孪生（捕捉真实物理瞬间）
- ✅ 物理引擎验证（与真实数据对比）
- ⚠️ 实时模拟（仍需脱机重建）

## 📦 数据集资源

| 资源 | 说明 |
|------|------|
| 7× 同步 4K 相机 | 60 fps |
| 20 个场景 | 连续流 → 暴力飞溅 |
| Per-view mask | 手工精修液体 + 容器分割 |
| Fixed 评估拆分 | 公开 benchmark |

## 🔗 关键技术映射

| 鸭血关注项 | 本文贡献 |
|-----------|---------|
| 水面渲染 | ✅ 实拍飞溅液体 multi-view reconstruction |
| 粒子渲染 | ✅ Lagrangian carriers + Gaussian decoding |
| 体积渲染 | ⚠️ 略（更偏表面重建） |
| 数据集 | ✅ 首个真实 splashing liquids 公开数据集 |
| 风格迁移 | ✅ 支持无需重训 |

## 📚 引用信息

```bibtex
@article{liu2026splashsplat,
  title={SplashSplat: Reconstructing Splashing Liquids from Real-World Multi-View Videos},
  author={Liu, Peiyu},
  journal={arXiv preprint arXiv:2609.20818},
  year={2026}
}
```

## 🏷️ 标签
`#fluid-rendering` `#water-rendering` `#splashing` `#particle-rendering` `#gaussian-splatting` `#multi-view-reconstruction` `#lagrangian` `#level-set` `#dataset`
