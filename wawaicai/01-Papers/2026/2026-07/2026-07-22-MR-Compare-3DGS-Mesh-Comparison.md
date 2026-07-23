---
title: "MR-Compare: Mixed Reality Framework for Spatially Grounded Visual Comparison of 3D Gaussian Splatting and Mesh Reconstructions"
authors: ["Changrui Zhu", "..."]
date: 2026-07-22
tags: [3DGS, 网格重建, 混合现实, 点云配准, 几何处理]
venue: arXiv cs.GR
paper: https://arxiv.org/abs/2607.20325
code: https://github.com/changruizhu96/MR-Compare
arXiv: 2607.20325
---

## 核心方法

MR-Compare：混合现实框架，用于空间锚定的3DGS与mesh重建视觉对比。

### 关键创新点
1. **两阶段配准pipeline** + **3D Slider** 跨媒体对比
2. **Anisotropy Filter**：零样本模块，利用高斯各向异性改善3DGS在MR中的配准
3. **中等程度剪枝**可提高鲁棒性并减少残差

### 技术细节
- Meta Quest 3 + PC-tethered 实现
- 厘米级平移误差
- 评估5种代表性重建workflow（桌面+移动）
- 3DGS-MCMC 最低配准误差

### 应用场景
- 3DGS与mesh质量对比评估
- MR中虚实融合校准
- 重建质量客观评价

## 算法复杂度
- **配准**：两阶段，复杂度依赖场景
- **各向异性过滤**：轻量零样本模块
- **实时性**：MR系统实时

## 开源实现
- GitHub: https://github.com/changruizhu96/MR-Compare

## 相关笔记
[[3DGS]]
[[网格重建]]
[[点云配准]]
[[混合现实]]

## 可行性评估

⚠️ **适度关注**

- 主要是MR系统研究，几何算法创新较少
- Anisotropy Filter 思想可借鉴用于3DGS后处理
- 配准pipeline对网格-点云对齐有参考价值
