---
tags: [几何, 形状检索, 谱描述符, 热核签名, 网格分析]
---

# Frequency-Scale Saliency for Spectral Descriptor Analysis in 3D Shape Retrieval

## 核心方法

提出**频率尺度显著性**框架，量化每个描述符尺度间隔对检索的贡献度。

### 问题背景
经典谱描述符（HKS, WKS）的失败模式理解不足

### 关键概念
- **Class Spectral Fingerprints**: 表征类别级尺度依赖性
- **Descriptor Similarity ↔ Retrieval Failure**: Spearman correlation = 0.479

### 实验发现
1. 短尺度主导检索性能，长尺度有害
2. HKS 和 WKS 表现出不同的尺度依赖模式
3. 显著性加权检索在困难类别上 mAP 提升 0.156

## 数据集
- SHREC'11

## 核心算法
1. Ablation 分析每个尺度间隔的检索贡献
2. 尺度加权优化

## 开源实现
- libigl: `igl::hot_lattice`, `igl::wave_kernel_signature`
- CGAL: `CGAL::heat_method`

## 相关笔记
[[2026-05-20-Accelerated-Winding-Numbers-Curved-Geometry]]
[[2604.04299-Persistent-Homology-Point-Cloud]]

## 可行性评估
✅ **推荐实现** - 形状检索是几何处理的重要应用

## 来源
- arXiv: [2606.07791](https://arxiv.org/abs/2606.07791)
- 分类: cs.GR
- 会议: CGI 2026
- 日期: 2026-06-05