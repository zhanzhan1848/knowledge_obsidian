---
tags: [几何, 参数化, UV展开, 神经参数化, mesh-processing]
---

# Continuous Neural Reparameterization as a Deep Geometric Prior for Robust Fixed-Chart UV Repair

## 核心方法

本文将固定-chart UV展开重新表述为**连续神经参数化**问题：
- 使用未训练的 SIREN (Sinusoidal Representation Networks) 将每顶点网格特征映射到 UV 坐标
- 通过几何目标优化权重

### 技术栈
- **SIREN**: 连续神经表示
- **Laplace-Beltrami 谱输入**: 提供谱条件化
- **Tutte 残差预热**: 初始化策略
- **C² 行列式扩展**: 保证 injectivity
- **Injectivity Barrier + Retry/Fallback**: 防止翻转

### 关键创新
1. NTK-LBO 诊断显示谱条件化改变更新几何（尤其在初始化和中等级子空间）
2. 零翻转求解器：compact pre-cut charts 上 100% 成功
3. 47-chart 分层 Thingi10K/xatlas-cut benchmark: 42/47 有效零翻转分层求解

## 算法复杂度
- 时间：O(n²) 迭代优化
- 空间：O(n) 网格存储

## 核心公式
- Laplace-Beltrami 算子: Δf = div(∇f)
- NTK (Neural Tangent Kernel) 用于分析 SIREN 的谱特性

## 开源实现
- libigl: `igl::harmonic_weights`, `igl::laplacian`
- 代码: https://github.com/... (待补充)

## 相关笔记
[[2026-05-21-Dual-Latent-Diffusion-Polycube-Hexahedral-Mesh]]
[[2026-06-09-quadlink-quad-dominant-mesh-generation]]

## 可行性评估
✅ **推荐实现** - UV 参数化是核心需求，神经方法提供鲁棒性

## 来源
- arXiv: [2606.10050](https://arxiv.org/abs/2606.10050)
- 分类: cs.GR
- 日期: 2026-06-08