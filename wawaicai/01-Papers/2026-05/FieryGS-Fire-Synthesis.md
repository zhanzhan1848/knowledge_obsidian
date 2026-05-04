---
title: "FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting"
authors: [Qianfan Shen, et al.]
date: 2026-05-01
tags: [几何, 3DGS, 物理模拟, 燃烧模拟, 渲染]
paper_id: 2605.00177
subjects: [cs.GR, cs.CV]
conference: arXiv (ICLR 2026)
status: new
---

# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

## 核心方法

### 问题定义
传统 CFD 和图形管道可产生真实火焰效果，但依赖手工几何、专家调参和劳动密集型工作流，难以扩展到真实世界。

### 三个关键模块

1. **Multimodal LLM-based Physical Material Reasoning**
   - 多模态大语言模型物理材质推理

2. **Efficient Volumetric Combustion Simulation**
   - 高效体积燃烧模拟

3. **Unified Renderer for Fire and 3DGS**
   - 火焰与 3DGS 统一渲染器

### 支持的燃烧现象
- 火焰传播 (flame propagation)
- 烟雾扩散 (smoke dispersion)
- 表面碳化 (surface carbonization)

### 用户控制参数
- 火焰强度
- 气流
- 点火位置等

### 实验结果
- 在室内外场景上优于比较基线
- 视觉真实感、物理保真度和可控性均优

## 项目页面
https://pku-vcl-geometry.github.io/FieryGS/

## 相关笔记
[[3D Gaussian Splatting]]
[[Physics-based Simulation]]
[[Fire Rendering]]

## 可行性分析
⚠️ 谨慎评估

**理由**：
- 偏向渲染/模拟，非纯几何处理
- 应用场景特殊（火焰合成）
- 但 3DGS 与几何结合思路有价值