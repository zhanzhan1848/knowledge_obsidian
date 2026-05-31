---
title: A 2D-3D Symmetric Garment Representation for Generation and Editing
authors: Kiyohiro Nakayama
date: 2026-05-25
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.26391
pdf: https://arxiv.org/pdf/2605.26391
tags: [rendering, garment, generation, editing, 2D-3D, paper, 2026]
status: unread
---

# A 2D-3D Symmetric Garment Representation for Generation and Editing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A 2D-3D Symmetric Garment Representation for Generation and Editing |
| 作者 | Kiyohiro Nakayama |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.26391) |
| PDF | [下载](https://arxiv.org/pdf/2605.26391) |

## 核心贡献
1. 提出 **Garment Particles**：5D 点云表示，联合编码 2D 缝纫图案和 3D 几何
2. **Garment Particles Flow (GPF)**：支持从高级输入（文本、图像、草图）的直观生成
3. 支持2D 缝纫图案和 3D 几何的各种编辑操作
4. **Particles-to-Pattern Flow**：将生成的服装粒子转换为基于曲线的图案用于模拟

## 技术方案

###5D Point-Cloud Representation
- 联合编码 2D 缝纫图案
- 编码 3D 几何

### GPF (Rectified Flow)
- 扩散后验采样
- 支持多种编辑操作

### 应用场景
- 服装插值
- 缝纫图案编辑
- 点云/轮廓条件服装生成

## 可行性分析
- 实现难度：高
- 性能预期：支持生成和编辑，适合服装设计
- 适用场景：服装设计、虚拟试衣、电影制作

## 相关工作
- [[Garment Generation]]
- [[Cloth Simulation]]
- [[Diffusion Models]]