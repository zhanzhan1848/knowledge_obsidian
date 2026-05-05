---
title: 2026-05-05 生菜每日论文搜索报告
date: 2026-05-05
tags: [daily-report, rendering, paper-search]
---

# 🥬 2026-05-05 每日渲染论文搜索报告

## 搜索概况
- **搜索时间**：2026-05-05 14:00 UTC
- **搜索范围**：arXiv cs.GR、ACM Digital Library、SIGGRAPH
- **关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 发现论文

本次搜索发现 **4 篇** 相关论文：

### 1. Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization
- **来源**：arXiv cs.GR (2026-04-27)
- **作者**：Shrisudhan Govindarajan et al. (Google DeepMind, SFU, UBC)
- **状态**：🆕 新发现
- **重要性**：⭐⭐⭐⭐⭐
- **摘要**：提出统一 ray tracing 和 rasterization 的可微分 3D 表示，有界幂图实现常数时间光线遍历
- **链接**：[arXiv](https://arxiv.org/abs/2604.24994)

### 2. Real-time Global Illumination for Dynamic 3D Gaussian Scenes
- **来源**：arXiv cs.GR / IEEE TVCG (accepted)
- **作者**：Sheng Li et al.
- **状态**：🔄 v2 更新
- **重要性**：⭐⭐⭐⭐⭐
- **摘要**：首个动态 3D Gaussian 场景实时全局光照方案，40+ fps，支持多弹跳间接光照
- **链接**：[arXiv](https://arxiv.org/abs/2503.17897)

### 3. Vertex Features for Neural Global Illumination
- **来源**：arXiv cs.GR / ACM SIGGRAPH Asia 2025
- **作者**：Sheng Li et al.
- **状态**：🔄 v2 更新
- **重要性**：⭐⭐⭐⭐
- **摘要**：将神经特征存储在 mesh 顶点，内存降至网格方法 1/5
- **链接**：[arXiv](https://arxiv.org/abs/2508.07852)

### 4. Rethinking Collision Detection on GPU Ray Tracing Architecture
- **来源**：arXiv cs.GR / ICS 2026
- **作者**：Durga Mandarapu et al. (Purdue, UW)
- **状态**：🆕 新发现
- **重要性**：⭐⭐⭐⭐
- **摘要**：Mochi 方法优化 GPU RT 架构上的碰撞检测，支持非均匀粒子
- **链接**：[arXiv](https://arxiv.org/abs/2604.23520)

## 技术趋势观察

### 1. 实时全局光照 + 3D Gaussian
- 3DGS 与传统光栅化/光线追踪的融合成为热点
- 动态场景实时 GI 仍具挑战，本文首次实现 40+ fps

### 2. 可微分渲染统一管线
- Power Foam 尝试同时利用 ray tracing 和 rasterization 的优势
- 几何/外观解耦是重要方向

### 3. 神经渲染内存优化
- 顶点特征编码大幅降低内存开销
- 对实时应用有重要意义

### 4. RT 架构的非渲染应用
- GPU RT 架构用于碰撞检测等物理模拟
- Mochi 提供非均匀粒子的正确规约

## 建议传递给 @墨鱼丸 的方案

1. **Power Foam**：统一渲染管线 - 实现难度中高
2. **实时 GI for 3DGS**：现有基础上添加 GI 支持 - 实现难度高
3. **顶点特征编码**：可用于其他神经渲染应用 - 实现难度中

## 下一步
- [ ] 等待论文正式发表后的开源代码
- [ ] 深入分析 Power Foam 的实现细节
- [ ] 跟进 SIGGRAPH Asia 2025 的其他论文

---
*本报告由生菜 (shengcai) 自动生成*
