---
title: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting
authors: Kristof Overdulve, et al.
date: 2026-07-06
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.05598
pdf: https://arxiv.org/pdf/2607.05598
tags: [rendering, 3DGS, artifact-removal, unsupervised, novel-view-synthesis, 2026]
status: unread
---

# SSA-3DGS: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | SSA-3DGS: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting |
| 作者 | Kristof Overdulve, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.05598) |
| PDF | [下载](https://arxiv.org/pdf/2607.05598) |

## 核心贡献
1. 提出SSA-3DGS框架，无需监督或手动输入即可联合优化3D场景和可学习的2D叠加层
2. 利用几何一致性跨视图将静态伪影与3D场景几何分离
3. 在多种合成损坏和自捕获真实世界数据集上，将重建保真度提升高达9 dB PSNR

## 技术方案
SSA-3DGS通过以下方式处理屏幕空间伪影：
- **问题**：屏幕空间伪影（静态遮挡）固定在2D图像平面而非3D世界中
- **常见例子**：传感器缺陷、环境遮挡、捕获遮挡（水滴、拇指）、数字叠加（水印、UI元素）
- **解决方案**：联合优化3D场景和可学习的2D叠加层
- **利用几何一致性**：跨视图分离静态伪影与3D场景几何

## 实验结论
SSA-3DGS在相同损坏输入上训练时，相比3DGS将重建保真度提升高达9 dB PSNR，同时忠实保留损坏伪影。

## 局限性
- 需要多视图输入以建立几何一致性
- 对极端遮挡情况的处理可能有限

## 可行性分析
- 实现难度：中
- 性能预期：对渲染性能影响较小，主要是训练阶段的额外计算
- 适用场景：真实世界3D重建、图像修复、数据清洗

## 相关工作
- [[3D Gaussian Splatting]]
- [[Novel View Synthesis]]
- [[Scene Reconstruction]]

## 笔记
**关键词**：Screen-Space Artifacts, Floaters, 3DGS, Occlusions, Inverse Rendering
