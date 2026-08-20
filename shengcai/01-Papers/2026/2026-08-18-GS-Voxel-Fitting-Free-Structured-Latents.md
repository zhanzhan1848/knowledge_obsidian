---
title: GS-Voxel: Fitting-Free Structured Latents for Large-Scale 3DGS Generation
authors: Ming Qian et al.
date: 2026-08-18
source: arXiv cs.CV
url: https://arxiv.org/abs/2608.17988
pdf: https://arxiv.org/pdf/2608.17988
tags: [rendering, paper, 2026, 3DGS, neural-rendering, large-scale, latent-space]
status: unread
---

# GS-Voxel: Fitting-Free Structured Latents for Large-Scale 3DGS Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | GS-Voxel: Fitting-Free Structured Latents for Large-Scale 3DGS Generation |
| 作者 | Ming Qian et al. |
| 来源 | arXiv (cs.CV) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17988) |
| PDF | [下载](https://arxiv.org/pdf/2608.17988) |

## 核心贡献
1. **无拟合结构化潜在空间**：将预优化 3DGS 重建确定性转换为稀疏活跃体素，无需额外逐场景优化
2. **GS-specific VAE**：分别编码体素几何和局部高斯属性到稀疏 3D 潜在空间
3. **大规模场景生成**：重叠感知的平铺推理扩展合成超越单个训练裁剪
4. **可扩展潜在容量**：潜在空间大小随占用体素数量增长，而非固定场景级原语计数

## 技术方案

### 核心思想
现有可扩展潜在 3D 生成器在结构化张量上操作，而预优化 3DGS 重建是无序的、空间不规则的、原语数量差异大。

### 方法流程
1. **体素化**：将 3DGS 重建转换为稀疏活跃体素，保留亚体素位置和所选原语的渲染属性
2. **VAE 编码**：GS-specific 因子化 VAE 分别编码几何和外观属性
3. **流模型训练**：在 GS-Voxel 潜在空间中训练图像条件流模型
4. **平铺推理**：重叠感知平铺推理支持大区域场景生成

### 关键创新
- **拟合自由**：确定性转换，无需迭代优化
- **结构化**：潜在空间与现有生成器兼容
- **可扩展**：潜在容量随场景复杂度增长

## 实验结论

GS-Voxel 提供了：
- 预优化 aerial 3DGS 重建的结构化潜在空间
- 潜在容量随占用体素数量增长
- 支持大区域场景生成

## 局限性
- 主要针对 aerial/大规模场景
- 预优化 3DGS 重建质量影响后续生成

## 可行性分析
- **实现难度**：中 - 基于现有 3DGS 和 VAE
- **性能预期**：良好 - 确定性转换，计算效率高
- **适用场景**：大规模 3D 场景生成、城市建模、航空测量

## 相关工作
- [[3D Gaussian Splatting 2023]]
- [[Neural Radiance Fields]]

## 笔记
GS-Voxel 解决了 3DGS 与可扩展生成模型之间的兼容性问题，将无序的高斯原语转换为结构化的体素潜在空间，为大规模场景生成提供了新思路。
