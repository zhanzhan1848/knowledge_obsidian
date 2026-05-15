---
title: "Denoising-GS: Gaussian Splatting with Spatial-aware Denoising"
authors: ["Qingyuan Zhou et al."]
date: 2026-05-14
venue: "arXiv (cs.CV)"
tags: [几何, 3DGS, 点云降噪, 新视角合成]
paper_url: "https://arxiv.org/abs/2605.14880"
---

## 核心方法

提出 **Denoising-GS**，将 3D Gaussian Splatting 优化重新定义为**原始去噪过程**。

### 核心洞察
现有方法只调整高斯原语位置，**忽略底层空间结构**

### 关键技术
1. **Spatial-preserving Optimizer**: 保留原语的空间优化流，实现连贯有向去噪
2. **Spatial Gradient-based Denoising**: 联合考虑原语的空间支撑，确保梯度一致的更新
3. **Uncertainty-based Denoising**: 估计原语级不确定性，修剪冗余/噪声原语
4. **Spatial Coherence Refinement**: 在稀疏区域选择性分裂原语，保持结构完整性

### 实验结果
- 在多个 benchmark 数据集上验证
- 持续提升新视角合成 (NVS) 保真度
- 保持表示紧凑性
- 达到 SOTA 性能

---

## 算法复杂度
- 时间复杂度：优化阶段额外计算
- 空间复杂度：不确定性估计模块

---

## 开源实现
- 即将开源（见论文摘要）

---

## 相关笔记
[[3D Gaussian Splatting]]
[[Point Cloud Denoising]]
[[Novel View Synthesis]]

---

## 可行性分析

**推荐度**: ⭐⭐⭐⭐⭐ (5/5)

### 优势
- 创新性框架：将 3DGS 优化重新定义为去噪问题
- 全面改进：位置+空间结构联合优化
- 实际价值：解决 SfM 点云噪声的实际问题
- 性能领先：多个数据集达到 SOTA

### 挑战
- 需要额外的空间结构计算
- 不确定性估计可能增加内存开销
- 参数调优可能复杂

### 开源后推荐
代码开源后建议：
1. 集成到现有 3DGS pipeline
2. 与多视角重建结合
3. 评估对非SfM初始化方法的泛化性

### 推荐理由
**强烈推荐关注**。3DGS 是当前 3D 重建的主流方法，Denoising-GS 解决了其核心痛点之一（SfM 噪声），具有很高的实用价值和学术影响力。