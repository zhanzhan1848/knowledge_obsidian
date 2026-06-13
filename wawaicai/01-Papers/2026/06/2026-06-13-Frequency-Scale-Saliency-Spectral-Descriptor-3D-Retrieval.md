---
title: "Frequency-Scale Saliency for Spectral Descriptor Analysis in 3D Shape Retrieval"
authors:
  - Jianru Shen
date: 2026-06-05
tags: [几何, 形状检索, 谱描述符, HKS, WKS, 尺度分析]
cite: "arXiv:2606.07791 [cs.GR]"
url: "https://arxiv.org/abs/2606.07791"
conference: "Computer Graphics International (CGI) 2026"
---

# Frequency-Scale Saliency for Spectral Descriptor Analysis in 3D Shape Retrieval

## 核心问题

经典谱描述符（如 Heat Kernel Signature, Wave Kernel Signature）在非刚性 3D 形状检索中广泛使用，但其失败模式理解不足。

## 核心方法

### Frequency-Scale Saliency 框架

通过消融量化每个描述符尺度区间的检索级贡献。

### 类别谱指纹 (Class Spectral Fingerprints)

表征类别级尺度依赖性。

## 关键发现

1. **Spearman 相关性 = 0.479**：类别对间描述符相似性与检索失败高度相关
2. **短尺度主导检索性能**：长尺度反而有害
3. **HKS 和 WKS 有不同的尺度依赖模式**
4. **Saliency 加权检索**：在困难类别上 mAP 提升 0.156

## 实验验证

- **数据集**：SHREC'11
- **交叉验证和随机权重控制**确认增益稳定

## 可行性评估

⚠️ **学术价值**

| 维度 | 评分 |
|------|------|
| 算法创新性 | 中（诊断框架） |
| 工程可行性 | 高（HKS/WKS 已有实现） |
| 实用性 | 中（诊断工具） |

### libigl 相关
- `heat_geodesic`：HKS 计算
- `wave_kernel_signature`：WKS 计算

### 潜在应用
- 谱描述符分析和选择指导
- 形状检索系统优化
- 尺度加权距离函数