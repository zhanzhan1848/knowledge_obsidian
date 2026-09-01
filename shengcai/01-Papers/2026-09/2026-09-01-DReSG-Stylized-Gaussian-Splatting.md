---
title: Diffusion Residuals for Stylized Gaussian Splatting
authors: Wenjie Liu et al.
date: 2026-08-29
source: arXiv (Pacific Graphics 2026)
url: https://arxiv.org/abs/2608.29048
pdf: https://arxiv.org/pdf/2608.29048
tags: [rendering, gaussian-splatting, stylization, diffusion-model, 3DGS]
status: unread
---

# Diffusion Residuals for Stylized Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Diffusion Residuals for Stylized Gaussian Splatting |
| 作者 | Wenjie Liu et al. |
| 来源 | arXiv (Pacific Graphics 2026 Conference Track) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.29048) |
| PDF | [下载](https://arxiv.org/pdf/2608.29048) |

## 核心贡献
1. 提出 DReSG (Diffusion Residuals for Stylized Gaussian Splatting) 框架
2. 将注意力引导的扩散 proposals 表示为相对于当前渲染结果的残差目标
3. 通过多视角高斯反馈将残差逐步吸收到共享的高斯场景中
4. 设计残差强度调制、覆盖感知视图选择和冲突过滤颜色更新，保证反馈的稳定性和可控性

## 技术方案

### 问题背景
基于 3DGS 的参考引导风格化对于高效可控的 3D 内容创建很重要。现有基于 VGG 特征的 3D 风格化方法提供稳定的渲染视图优化，但往往不能充分表达参考风格线索；扩散模型提供更强的图像先验，但直接的逐视图或基于分数的扩散引导会导致视图漂移、局部伪影和难以控制的 appearance 更新。

### 核心方法
- **3D grounded 残差反馈框架**: 将扩散 proposals 作为残差目标，通过多视角高斯反馈逐步吸收到 Gaussian 场景
- **残差强度调制**: 在目标构建过程中调制残差强度，保证稳定性
- **覆盖感知视图选择**: 选择最优视图进行多视角拟合
- **冲突过滤颜色更新**: 避免不同视图间的颜色冲突

### 技术亮点
- 保持场景结构，更好地保留跨视图稳定性
- 实现有竞争力的参考引导风格化效果
- 项目页面: https://vpx-ecnu.github.io/DReSG-website/

## 实验结论
- DReSG 在参考引导风格化方面达到有竞争力的效果
- 更好地保留场景结构和跨视图稳定性

## 局限性
- 依赖于预训练扩散模型的图像先验质量
- 计算成本可能高于简单 VGG 方法

## 可行性分析
- 实现难度：中
- 性能预期：中等计算成本，需多视角优化
- 适用场景：3D 内容创作、风格化渲染、场景风格迁移

## 相关工作
- 3D Gaussian Splatting
- Diffusion Models for Image Synthesis
- 3D Stylization

## 笔记
- Pacific Graphics 2026 Conference Track
- 扩散模型与 3DGS 结合的代表性工作
