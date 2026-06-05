---
title: Geometry Gaussians: Decoupling Appearance and Geometry in Gaussian Splatting
authors: Hongyu Zhou et al.
date: 2026-06-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.05124
pdf: https://arxiv.org/pdf/2606.05124
tags: [rendering, gaussian-splatting, 3DGS, geometry, transparency, 2026]
status: unread
---

# Geometry Gaussians: Decoupling Appearance and Geometry in Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Geometry Gaussians: Decoupling Appearance and Geometry in Gaussian Splatting |
| 作者 | Hongyu Zhou et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.05124) |
| PDF | [下载](https://arxiv.org/pdf/2606.05124) |

## 核心贡献
1. **发现本质问题**：证明 3DGS 默认形式天然不适合同时表示纹理和几何
2. **几何不透明度参数**：为每个 splat 添加单一额外的几何不透明度参数
3. **透明物体显著改善**：特别适用于透明/半透明物体场景
4. **与视觉基础模型结合**：提供完整的优化管道

## 技术方案

### 问题背景
- 3DGS 中每个 splat 有一个单一不透明度参数，同时用于渲染贡献和场景几何
- 几何重建和外观渲染之间存在根本矛盾
- 透明物体：颜色来源于物体后方的物体，但表面不漫反射

### 核心方法
1. **几何不透明度 (opacity_geo)**：为每个 splat 添加独立的渲染不透明度和几何不透明度
2. **分离策略**：
   - 颜色渲染使用原始不透明度
   - 几何正则化使用几何不透明度
3. **透明度感知优化管道**：
   - 多视角立体匹配损失
   - 其他针对透明物体的正则化器

### 关键洞察
```
颜色渲染和几何定位对 splat 的需求不同：
- 最能解释外观的 splat ≠ 最能描述几何的 splat
```

## 实验结论
- 在 NeRF Synthetic、DTU、TransLab 和 Mip-NeRF 数据集上达到 SOTA
- 透明物体场景显著改善
- 几何重建和渲染质量同时提升

## 局限性
- 需要额外的每 splat 参数
- 优化复杂度略有增加

## 可行性分析
- 实现难度：低（仅需添加一个标量参数）
- 性能预期：同时改善渲染和几何重建
- 适用场景：透明物体场景、机器人视觉、AR、物理模拟

## 相关工作
- SuGaR - 几何正则化
- Gaussian Opacity Field - 不透明度场
- 2DGS - 2D 高斯
- GSDF - 有符号距离函数高斯
- CarGS - 分离几何和渲染的协方差矩阵

## 笔记
**重要发现**：3DGS 的核心矛盾在于 single opacity parameter 同时承担渲染和几何双重角色

**实际应用**：
- 自动驾驶感知
- 工业检测
- 文化遗产数字化
