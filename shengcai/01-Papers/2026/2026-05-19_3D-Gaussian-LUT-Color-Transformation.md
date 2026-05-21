---
title: "3D Gaussian Lookup Table for Continuous Color Transformation"
authors: Danna Xue
date: 2026-05-19
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.19889
pdf: https://arxiv.org/pdf/2605.19889
tags: [rendering, color-processing, LUT, gaussian, neural-representation]
status: unread
---

# 3D Gaussian Lookup Table for Continuous Color Transformation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Gaussian Lookup Table for Continuous Color Transformation |
| 作者 | Danna Xue |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.19889) |
| PDF | [下载](https://arxiv.org/pdf/2605.19889) |

## 核心贡献
1. 提出 Gaussian LUT (GLUT)，用可学习 3D Gaussian 基元建模连续颜色变换
2. 避免固定分辨率网格，实现灵活表征能力同时保持紧凑内存占用
3. 支持局部颜色区域调整，无需全局重训练

## 技术方案
- **表征**: 3D Gaussian 基元替代传统网格
- **优点**: 连续、可解释、空间局部化
- **扩展**: Conditional Generator (CGLUT) 预测多 LUT 参数
- **应用**: 颜色风格混合、局部调整

## 局限性
- 依赖训练过程
- 颜色空间可能有精度限制

## 可行性分析
- 实现难度：中（Gaussian 表示 + 生成器架构）
- 性能预期：高效颜色变换，支持实时应用
- 适用场景：图像处理、颜色分级、实时滤镜

## 相关工作
- 3D LUT 相关研究
- Neural implicit representations

## 笔记
Project page: https://color.cvc.uab.cat/glut/
该工作为颜色变换提供了连续、可解释的新范式。