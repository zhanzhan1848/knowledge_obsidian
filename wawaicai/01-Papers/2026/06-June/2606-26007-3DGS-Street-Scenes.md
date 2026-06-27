---
title: "From Sparse and Imperfect 2D Anchors to Consistent 3D Gaussian Street Scenes"
date: 2026-06-24
tags: [几何, 3DGS, 街道场景, 外观烘焙, 逆向渲染]
paper_id: arXiv:2606.26007
authors: Yuhan Chen et al.
conference: cs.CV (cross-list)
---

# Support-Aware Appearance for 3D Gaussian Street Scenes

## 核心方法
使用教师相对外观残差蒸馏进行外观烘焙，解决稀疏不完美 anchors 和标准光栅器部署的联合处理问题。

### 技术方案
1. **Teacher-Relative Appearance Residual Distillation** - 外观残差蒸馏
2. **Frequency Decomposition** - 频域分解的结构化空间
3. **Confidence Estimation** - 置信度估计
4. **Primitive-Level Lifting** - 基元级提升
5. **Support-Aware Gaussian-Space Aggregation** - 支持感知的 Gaussian 空间聚合
6. **Confidence-Gated Coarse-to-Fine Optimization** - 置信度门控粗到细优化

### 推理流程
- 所有残差烘焙到固定几何球谐系数
- 教师和辅助训练模块在推理时丢弃

## 评估
- Waymo 街道资产
- Tanks and Temples 场景
- 多种目标条件

## 开源实现
- GitHub: https://github.com/Cagares/Baking-for-3D-Gaussian

## 相关笔记
[[3D Gaussian Splatting]]
[[Scene Reconstruction]]
[[Appearance Baking]]