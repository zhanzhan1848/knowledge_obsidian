---
title: Consistency-Augmented Geometric Gaussian Splatting for Ego-centric 3D Scene Generation
authors: Zhenyu Sun, et al.
date: 2026-07-04
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.03819
pdf: https://arxiv.org/pdf/2607.03819
tags: [rendering, 3DGS, ego-centric, scene-generation, text-to-3D, 2026]
status: unread
---

# Consistency-Augmented Geometric Gaussian Splatting for Ego-centric 3D Scene Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Consistency-Augmented Geometric Gaussian Splatting (CGGS) |
| 作者 | Zhenyu Sun, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.03819) |
| PDF | [下载](https://arxiv.org/pdf/2607.03819) |

## 核心贡献
1. **CGGS框架**：首个增强3D内容感知并解决自我中心3D场景生成中几何失真的text-to-3D框架
2. **自我中心生成器**：通过一致性增强损失微调多视角潜在扩散模型，生成一致的高保真2D内容
3. **布局装饰器**：利用光流和点轨迹对应估计深度，从自我中心2D先验生成密集点云作为粗布局
4. **几何精化器**：通过基于熵的互信息深度损失(MID)和分层优化方案增强3D高斯重建

## 技术方案
CGGS框架包含三个核心组件：
1. **Ego-centric Generator**：使用一致性增强损失微调多视角潜在扩散模型
2. **Layout Decorator**：利用光流和点跟踪对应估计深度，生成密集点云作为粗布局
3. **Geometric Refiner**：
   - 基于熵的互信息深度损失(MID)增强3D高斯重建
   - 分层优化方案提升视觉质量和几何结构

## 实验结论
在生成连贯和准确的文本驱动3D场景方面优于先前方法。

## 可行性分析
- 实现难度：中
- 性能预期：需要高端GPU进行实时推理
- 适用场景：3D内容创作、场景生成、AR/VR

## 相关工作
- [[3D Gaussian Splatting]]
- [[Text-to-3D]]
- [[Ego-centric 3D Generation]]

## 笔记
**项目主页**：https://cggs-26.github.io/cggs26/
