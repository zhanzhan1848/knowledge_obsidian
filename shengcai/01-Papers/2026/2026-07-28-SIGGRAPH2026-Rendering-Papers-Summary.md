---
title: SIGGRAPH 2026 Rendering & Display Papers Summary
authors: 生菜 (Shengcai) - Daily Paper Search
date: 2026-07-28
tags: [渲染, SIGGRAPH2026, 路径追踪, 体素渲染, 实时渲染, 论文列表]
status: 已读
---

# SIGGRAPH 2026 Rendering & Display Papers Summary

## 概述

本次搜索覆盖了 **SIGGRAPH 2026** (2026年7月) 发表的渲染相关论文，以及 **Advances in Real-Time Rendering 2026** 课程中的实时渲染技术。

**搜索时间**: 2026-07-28
**数据源**: kesen.realtimerendering.com, advances.realtimerendering.com

---

## 一、核心渲染论文 (Rendering & Display)

### 1. HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography
| 项目 | 内容 |
|------|------|
| **标题** | HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography |
| **作者** | Wenbin Zhou, Xiangyu Meng, Jiankai Xing, Xin Liu, Suyeon Choi, Yifan Peng |
| **机构** | 香港大学, 清华大学, 斯坦福大学, 首尔国立大学 |
| **发表** | ACM Transactions on Graphics (TOG) — SIGGRAPH 2026 |
| **DOI** | 10.1145/3811351 |
| **arXiv** | 2606.14173 |
| **链接** | https://zhou-wb.github.io/holopathtracer/ |

**核心贡献**：
- 提出**波路径追踪 (Wave Path Tracing)** 框架，同时求解渲染方程和 Rayleigh-Sommerfeld 积分
- 使用蒙特卡洛方法联合估算辐射率和波前传播
- **路径复用 (Path Reuse)** 技术：通过时间复用生成多帧随机全息图，额外计算成本极低
- **环境辐射缓存 (Ambient Radiance Cache)** 实现数量级收敛加速
- 将复杂振幅全息图转换为相位全息图

**技术方案**：
```
SLM平面 → Ray采样 → 光线追踪 → Wave Facet编码
    ↓
路径复用：相同光线路径可复用于多帧全息图
    ↓
环境辐射缓存：加速漫反射场景收敛
```

**关键公式**：
- 渲染方程 (Rendering Equation)
- Rayleigh-Sommerfeld 积分 (用于波前传播)
- 角谱法分解 (Angular Spectrum Method) 用于平面波传播

**与渲染技术的关系**：
- 将**路径追踪 (Path Tracing)** 从光辐射领域扩展到**波光学**领域
- 核心技术复用：BSDF采样、光线追踪、辐射缓存
- Delta散射事件精确追踪光学路径长度；非Delta散射使用随机相位近似

**实验结果**：
- 与 Mitsuba 渲染器 Ground Truth 对比，高度一致
- 纹理烘焙快速变体：速度提升约10倍，轻微视觉质量损失
- 支持焦平面连续过渡、视角相关效果、透镜和镜面反射成像

**创新性**：⭐⭐⭐⭐⭐ | **实用性**：⭐⭐⭐⭐ | **难度**：高

---

### 2. Complex-Valued Holographic Radiance Fields
| 项目 | 内容 |
|------|------|
| **标题** | Complex-Valued Holographic Radiance Fields |
| **作者** | Yicheng Zhan, Dong-Ha Shin, Seung-Hwan Baek, Kaan Aksit |
| **机构** | UCL, POSTECH |
| **发表** | ACM Transactions on Graphics (TOG) — SIGGRAPH 2026 |
| **DOI** | 10.1145/3804450 |
| **链接** | https://complightlab.com/publications/complex_valued_holographic_radiance_fields/ |
| **代码** | https://github.com/complight/Complex_Valued_Holographic_Radiance_Fields |

**核心贡献**：
- 将**辐射场 (Radiance Fields)** 从实数域扩展到复数域
- 复数表示自然编码全息图的相位信息
- 支持视角相关效果和深度连续焦外

**与渲染技术的关系**：
- 类似 NeRF 的隐式场表示，但使用复数编码
- 可视为神经渲染与全息显示的交叉

---

### 3. CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays
| 项目 | 内容 |
|------|------|
| **标题** | CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays |
| **作者** | Gyujin Sim, Seungjoo Shin, et al. |
| **机构** | POSTECH, ETRI |
| **发表** | SIGGRAPH 2026 |
| **DOI** | 10.1145/3799902.3811217 |
| **链接** | https://sgj0402.github.io/coherent-raster-project-page/ |

**核心贡献**：
- 针对**光场显示器 (Light Field Displays)** 优化 3D Gaussian Splatting
- 提高渲染时间一致性 (Temporal Coherence)
- 适用于多视角光场合成

**与渲染技术的关系**：
- 属于**实时渲染**和**神经渲染**交叉领域
- 改进 3DGS 的光场重建质量

---

### 4. PAColorHolo: Perceptually-Aware Color Management for Holographic Displays
| 项目 | 内容 |
|------|------|
| **标题** | PAColorHolo: A Perceptually-Aware Color Management Framework for Holographic Displays |
| **作者** | Chun Chen, Minseok Chae, et al. |
| **机构** | 首尔国立大学, 斯坦福大学 |
| **发表** | ACM TOG — SIGGRAPH 2026 |
| **DOI** | 10.1145/3789511 |

**核心贡献**：
- 全息显示的感知色彩管理框架
- 优化色彩感知均匀性

---

## 二、Advances in Real-Time Rendering 2026 — 课程论文

> 来源: https://advances.realtimerendering.com/s2026/index.html

### 1. ORCA: Online Radiance Cache Acceleration (EA SEED)
- **团队**: EA SEED
- **领域**: 路径追踪加速
- **核心**: 在线辐射缓存加速，用于游戏级路径追踪
- **关键词**: Path Tracing, Radiance Cache, Real-time

### 2. Upgrading PSSR on PlayStation 5 Pro (Sony)
- **团队**: Sony Interactive Entertainment
- **领域**: ML驱动的渲染上采样
- **核心**: PlayStation 5 Pro 上的 PSSR (PlayStation Spectral Super Resolution) 升级
- **关键词**: ML Upscaling, Super Resolution, PS5 Pro

### 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4 (Activision)
- **团队**: Activision
- **领域**: 实时光线追踪
- **核心**: 使命召唤中的**变速率光线追踪 (VRRT)**
- **技术点**: 根据场景复杂度动态调整光线追踪精度

### 4. Smolder: Real-Time Volumetric Effect Rendering (Activision)
- **团队**: Activision
- **领域**: 实时体素渲染
- **核心**: Glacier 引擎中的实时体积效果渲染
- **应用**: 烟雾、火焰等体积视觉效果

### 5. Toward Richer Material Generation via Procedural Data Enhancement
- **领域**: 基于物理的渲染 (PBR) 材质生成
- **核心**: 程序化数据增强提升 PBR 材质多样性
- **关键词**: PBR, Procedural, Material

---

## 三、3D Gaussian Splatting 相关渲染改进

> 来源: SIGGRAPH 2026 Paper List

| 论文 | DOI | 核心贡献 |
|------|-----|---------|
| **Gaussian Point Splatting** | 10.1145/3811272 | 改进的高斯点 splatting |
| **Faster 3D GS via Structure-Aware Densification** | 10.1145/3799902.3811212 | 结构感知致密化加速 |
| **SHARP-GS: Ultra-high Resolution 3D GS** | 10.1145/3799902.3811090 | 超高分辨率渲染管线 |
| **A LoD of Gaussians** | 10.1145/3799902.3811076 | 超大场景 LOD 渲染 |
| **Mobile3DGS³** | 10.1145/3799902.3811198 | 移动端 3DGS 加速 |
| **Hybrid Gaussian Wang Tiles** | 10.1145/3799902.3811204 | 类感知高斯瓦片 |

---

## 四、几何与表面技术 (加速结构相关)

| 论文 | 贡献 |
|------|------|
| **Fast and Exact Winding Numbers** | 精确卷绕数计算 |
| **The Antipodal Method** | 快速准确的 3D 广义卷绕数 |
| **Spatially Accelerated Winding Numbers** | 曲线几何的空间加速卷绕数 |
| **Differentiable Voxelization** | 可微分体素化 |

---

## 五、技术趋势分析

### 渲染技术趋势
1. **路径追踪 + 全息显示交叉**: HoloPathTracer 将游戏级路径追踪带入 VR/AR 全息显示
2. **ML 驱动渲染升级**: PSSR 等 ML 超分辨率技术成为主机渲染标配
3. **变速率光线追踪**: VRRT 等技术实现硬件资源动态分配
4. **体积渲染实用化**: Smolder 展示实时体积效果在游戏引擎中的可行性
5. **3DGS 持续优化**: 从训练速度、渲染质量、移动端部署多维度改进

### 神经渲染趋势
1. **辐射场 → 复数域**: Complex-Valued Holographic Radiance Fields 将 NeRF 扩展到全息领域
2. **光场显示优化**: CoherentRaster 针对多视角光场显示优化 3DGS
3. **材质生成自动化**: Procedural Data Enhancement 增强 PBR 材质多样性

---

## 六、可行动项

### 高优先级 (推荐深入分析)
1. **HoloPathTracer**: 路径追踪 × 全息的跨领域创新，算法对渲染研究有参考价值
2. **ORCA**: EA SEED 的路径追踪加速方案，适合游戏渲染引擎参考
3. **VRRT in CoD**: 变速率光线追踪的工程实践，对性能优化有直接价值

### 中优先级
4. **Smolder**: 实时体积渲染，可作为流體渲染参考
5. **Complex-Valued Radiance Fields**: 神经渲染 × 全息的交叉研究

---

## 七、链接汇总

| 论文 | 链接 |
|------|------|
| HoloPathTracer Project | https://zhou-wb.github.io/holopathtracer/ |
| HoloPathTracer arXiv | https://arxiv.org/abs/2606.14173 |
| Complex-Valued HRF | https://complightlab.com/publications/complex_valued_holographic_radiance_fields/ |
| Advances in RTR 2026 | https://advances.realtimerendering.com/s2026/index.html |
| SIGGRAPH 2026 Papers | https://kesen.realtimerendering.com/sig2026.html |
| Paper Digest SIGGRAPH 2026 | https://www.paperdigest.org/2026/07/siggraph-2026-papers-highlights/ |
| NVIDIA SIGGRAPH Blog | https://blogs.nvidia.com/blog/siggraph-news-2026/ |
| CoherentRaster | https://sgj0402.github.io/coherent-raster-project-page/ |
