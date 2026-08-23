---
title: RGBX-Next: Towards Realistic Generative Rendering from G-Buffers
authors: Zheng Zeng, Marco Salvi, Lifan Wu, Jan Novák, Daqi Lin, Saeed Hadadan, Yichen Sheng, Robert Pottorff, Shiqiu Liu, Ravi Ramamoorthi, Ling-Qi Yan, Miloš Hašan
date: 2026-08-14
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.13929
pdf: https://arxiv.org/pdf/2608.13929.pdf
tags: [rendering, generative-rendering, diffusion, G-buffers, inverse-rendering, neural-rendering, 2026]
status: unread
---

# RGBX-Next: Towards Realistic Generative Rendering from G-Buffers

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RGBX-Next: Towards Realistic Generative Rendering from G-Buffers |
| 作者 | Zheng Zeng, Marco Salvi, Lifan Wu, Jan Novák, Daqi Lin, Saeed Hadadan, Yichen Sheng, Robert Pottorff, Shiqiu Liu, Ravi Ramamoorthi, Ling-Qi Yan, Miloš Hašan |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.13929) |
| PDF | [下载](https://arxiv.org/pdf/2608.13929.pdf) |

## 核心贡献
1. **RGBX-Next 统一生成框架** - 结合前向和逆渲染的生成框架
2. **从 G-Buffers 生成逼真图像/视频** - 扩散 transformer (DiT) 模型微调为生成式前向和逆渲染器
3. **从图像/视频/流估计 G-Buffers** - 实现逆向渲染能力
4. **通用微调方案** - 将 DiT 模型微调为生成式前向和逆渲染器的通用方法

## 技术方案

### 核心思想
扩散模型在图像、视频和流生成方面取得了令人印象深刻的结果。但与传统 3D 渲染相比，它们仍然缺乏对生成输出的精确控制。

**解决路径**：使用生成模型作为传统渲染的 G-buffers 条件学习渲染器。

### RGBX-Next 框架
- **Forward rendering**: 从 G-buffers 渲染逼真图像/视频/流
- **Inverse rendering**: 从图像/视频/流估计 G-buffers

### 关键创新
- 将 DiT 模型微调为生成式前向和逆渲染器的通用方案
- 在逼真生成渲染和固有分解方面实现高质量
- 所有模型将公开可用

## 实验结论
- 在逼真生成渲染和固有分解方面实现高质量
- 设计原则将有益于未来可控生成前向和逆渲染研究

## 可行性分析
- 实现难度：高（涉及扩散模型训练）
- 性能预期：高质量渲染结果
- 适用场景：可控生成渲染、图像到 3D、逆向渲染

## 相关工作
- [[扩散模型渲染]]
- [[G-Buffer 渲染]]
- [[逆向渲染]]

## 笔记
将扩散模型与经典 G-Buffer 渲染结合的有趣工作。提供了从传统渲染控制到生成式渲染的桥梁。
