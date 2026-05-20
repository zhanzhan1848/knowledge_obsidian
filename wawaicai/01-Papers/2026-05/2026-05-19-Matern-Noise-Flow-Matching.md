---
title: "Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes"
date: 2026-05-19
authors: Tianshu Kuai et al.
arXiv: "2605.19305"
tags: [mesh-generation, flow-matching, Matern-process, triangulation-agnostic]
conference: SIGGRAPH 2026
---

# Matérn Noise for Triangulation-Agnostic Flow Matching

## 核心思想

三角网格上的生成模型通常**绑定特定三角化**，换三角化后失效。

**关键贡献**: 
1. 定义三角化无关的噪声分布（通过谱定义）
2. 使用 Matérn 过程离散化作为噪声模型
3. 结合 Flow Matching + PoissonNet 去噪器

## 数学框架

### 三角化无关性定义

分布 $p$ 是三角化无关的，当且仅当：
$$\text{Spec}(p) = \text{Spec}(\text{refresh}(p, T))$$
对任意三角化 $T$ 成立。

### Matérn 过程

Matérn 核函数：
$$\kappa(r) = \frac{2^{1-\nu}}{\Gamma(\nu)} \left(\frac{\sqrt{2\nu r}}{l}\right)^\nu K_\nu\left(\frac{\sqrt{2\nu r}}{l}\right)$$

离散化后保持三角化无关性。

## 算法流程

1. 定义 Matérn 噪声分布
2. Flow Matching 训练（PoissonNet 去噪器）
3. 采样生成

## 实验

- **规模**: 100万+三角形网格
- **任务**: 弹性静止状态采样、人形姿态生成
- **质量**: 显著优于 SOTA

## 可行性评估

- **算法复杂度**: O(n log n) per iteration
- **数值稳定性**: 高 — 谱方法保证一致性
- **依赖项**: PyTorch, libigl
- **推荐度**: ⭐⭐⭐⭐⭐ — 三角化无关生成的重要突破

## 技术亮点

1. **理论突破**: 首次形式化三角化无关性
2. **实用噪声**: Matérn 过程简单高效采样
3. **泛化能力**: 跨三角化生成

## 相关技术

- [[Flow Matching]] — 生成模型
- [[PoissonNet]] — 梯度域去噪
- [[Mesh Generation]] — 网格生成