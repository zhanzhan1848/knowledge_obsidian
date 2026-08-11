---
tags: [几何, 点云, Laplacian, 深度学习, SIGGRAPH2026]
date: 2026-07
venue: SIGGRAPH 2026
---

# Learning Laplacian Eigenspace with Mass-Aware Neural Operators on Point Clouds

## 论文信息

- **DOI**: https://doi.org/10.1145/3799902.3811185
- **作者**: Zherui Yang (USTC), Tao Du (Tsinghua), Ligang Liu (USTC)
- **venue**: SIGGRAPH 2026 (SIG)
- **代码**: https://github.com/Adversarr/NEO
- **项目页**: https://adversarr.github.io/NEO/
- **论文链接**: https://arxiv.org/pdf/2605.24390

## 核心问题

Laplacian 特征函数在几何处理中具有重要作用（分割、对应、参数化），但现有神经网络方法忽略了质量（mass）的影响，导致在非均匀采样点云上表现不佳。

## 核心方法

### Mass-Aware Neural Operators (NEO)

1. **质量感知图卷积**: 考虑每个点的局部质量
2. **谱图神经网络**: 在 Laplacian 谱域中进行操作
3. **Neural Operator 框架**: 学习从输入几何到特征函数的映射

### 关键创新

- **质量感知**: 显式建模点云的局部密度和质量分布
- **非均匀采样鲁棒**: 在稀疏/密集区域都能保持一致性
- **谱域操作**: 在 Laplacian 特征空间中学习和推理

## 应用场景

- 点云分割
- 几何对应
- 形状分析
- 网格生成

## 开源实现

- https://github.com/Adversarr/NEO

## 推荐度

✅ **推荐** - 点云深度学习的重要进展，谱方法与深度学习结合

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
