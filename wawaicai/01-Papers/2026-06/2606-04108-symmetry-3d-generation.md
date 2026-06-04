---
tags: [几何, 对称性, 3D生成, voxel latent]
date: 2026-06-04
category: [Geometry Processing, 3D Generation]
arXiv: 2606.04108
authors: 
title: "Symmetry-Enforced Voxel Latents for 3D Generation"
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.04108
pdf: https://arxiv.org/pdf/2606.04108
---

## 核心方法

### SymTRELLIS
- 在 flow-based 3D 生成中强制任意有限点群对称性（旋转、反射、多面体）
- 基于 TRELLIS.2，无需重训练 VAE 或 flow model

### 关键创新
- 将空间变换的 latent 空间动作近似为 voxel latents 上的学习线性算子
- lightweight spatial-transform latent mapper
- 在通用非对称 3D 数据上训练

### 速度对称化 (Velocity Symmetrization)
- 在每个 ODE step 聚合所有对称等效变换的预测流速度
- 强制对称性

### 对称估计
- 可自动从初始 TRELLIS.2 生成估计
- 或由用户指定（支持 deliberate fold manipulation）

## 问题定义
- 现有单视图 3D 生成模型不满足结构/功能要求
- 对称性违规会使模型物理上不可用

## 技术细节

### 方法
- Voxel latent 空间线性算子
- 学习空间变换
- Velocity symmetrization

## 复杂度分析
- 额外计算：O(k) where k = 对称群阶数
- 内存：voxel latent 额外参数

## 开源参考
- TRELLIS.2: Microsoft Research

## 可行性评估

**推荐度**: ✅ 推荐实现

**理由**:
- 对称性约束对几何质量至关重要
- 可与现有 3D 生成 Pipeline 集成
- 不需要重训练

**适用场景**:
- 3D 网格生成后处理
- 几何质量增强
- 建筑/机械零件生成
- 医学图像生成