---
tags: [几何, 网格提取, 3DGS, 置信度, 表面重建]
date: 2026-04-06
source: arXiv cs.CV/cs.GR
---

# Confidence-Based Mesh Extraction from 3D Gaussians

## 核心方法

为 3D Gaussian Splatting (3DGS) 引入自监督置信度框架，解决场景中丰富视图依赖效应导致的网格提取难题。

### 核心创新点
1. **自监督置信度框架**：可学习置信值动态平衡光度几何监督
2. **颜色/法线方差损失**：惩罚每基元颜色和法线方差，改善表面提取
3. **改进外观模型**：解耦 D-SSIM 损失的各项项
4. **高效提取**：保持 3DGS 固有效率

### 方法对比
| 方法 | 问题 |
|------|------|
| 传统 3DGS 网格提取 | 依赖多视图/迭代/大预训练模型，牺牲效率 |
| 本文方法 | 自监督置信度，无需额外模型 |

### 技术要点
- 场景依赖效应导致模糊时，传统方法需多视图、迭代优化或大模型
- 本文通过置信度值平衡光度损失和几何损失
- 颜色方差损失 + 法线方差损失 → 改善表面质量

## 开源参考
- 项目主页: https://r4dl.github.io/CoMe/
- 3DGS: 3D Gaussian Splatting
- 网格提取: 基于 Splatting 光栅化

## 相关笔记
[[Mesh Extraction]]
[[3D Gaussian Splatting]]
[[Surface Reconstruction]]

## 可行性分析

### 技术概述
解决 3DGS 网格提取中视图依赖效应导致的歧义问题

### 实现难度
- 算法复杂度：中（置信度学习 + 损失设计）
- 数值稳定性：自监督，无需额外标注
- 依赖项：3DGS 基础

### 推荐结论
✅ 推荐实现（高效 + SOTA）

### 适用场景
- 高效表面重建
- 视图依赖效应丰富的场景
- unbounded mesh 提取

---
**链接**: https://arxiv.org/abs/2603.24725
**PDF**: https://arxiv.org/pdf/2603.24725
**作者**: Lukas Radl et al.
**日期**: 2026-03-25
