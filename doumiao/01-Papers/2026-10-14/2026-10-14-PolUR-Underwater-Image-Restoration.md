---
title: "PolUR: Polarization Aware Multimodal Degradation Perception for Underwater Image Restoration"
date: 2026-10-14
tags: [underwater, water-rendering, polarization, image-restoration, multimodal, cs.CV]
arxiv: 2610.17991
agent: doumiao (🌱)
relevance: ⭐⭐⭐⭐ (海洋/水下渲染管线相关)
---

# 📄 PolUR: Polarization-Aware Multimodal Underwater Image Restoration

## 基本信息

- **arXiv**: [2610.17991](http://arxiv.org/abs/2610.17991v1)
- **日期**: 2026-10-13 (cs.CV)
- **作者**: Wenshuo Zhang, Xiangyue Zhang, Junlin Li 等（中国矿业大学/中国矿业大学（北京））
- **页数**: 10 pages, 10 figures
- **类别**: cs.CV（跨分类，水下成像）
- **代码/数据**: MixPolar benchmark

## 核心创新

> **多模态（偏振 + RGB）+ 语义引导** 的水下图像恢复框架

1. **PolUR 架构**：联合利用偏振观测与 RGB 信息，通过结构化语义指令识别退化类型与严重程度（色偏、雾霭、低光）
2. **Degradation-aware semantic features**：在退化感知语义特征的引导下增强联合恢复表示
3. **MixPolar benchmark**：构建新的水下图像基准，包含真实世界退化样本及其退化描述

## 与流体（水下）渲染的关系

- **水下成像物理**：偏振光在水下散射介质中传播时携带体积/介质信息（类似 Ray Marching 参与介质）
- **可借鉴点**：
  - 偏振作为**散射介质物理先验**的工程范式
  - 退化类型解耦 → 类似"水下体积参数"（衰减系数、雾密度、浊度）解耦
  - 多模态语义引导 → 水下渲染管线（atmospheric scattering + 体积吸收）参数估计

## 对流体渲染的启示

1. **体积参与介质逆向求解**：偏振 + RGB 多模态融合可作为**通用散射介质逆问题**的模板，启发烟雾/雾霾介质参数从图像恢复
2. **退化建模**：MixPolar 三类退化（色偏/雾/低光）的水下叠加可对应流体的**多相介质（multi-phase medium）**渲染
3. **数据驱动 + 物理先验混合**：当前主流方向，PolUR 与之前记录的 WildFireGS / GaussianFlesh 属于同期趋势

## 与现有知识库的链接

- [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] — 水下折射重建
- [[2025-02-22-aquanerf-underwater-nerf]] — 水下神经辐射场
- [[2026-10-13-Multiphysics-Simulation-Visual-Computing-Course]] — 多物理仿真（流体-光学耦合）

## 资源

- arXiv: https://arxiv.org/abs/2610.17991
- 无 GitHub（需确认）

## 推荐度

✅ **推荐** — 水下/海洋渲染管线的物理先验工程模板，与近期 FlamR/WildFireGS 方向同源