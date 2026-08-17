---
title: RGBX-Next: Towards Realistic Generative Rendering from G-Buffers
authors: Zheng Zeng, Marco Salvi, Lifan Wu, Jan Novák, Daqi Lin, Saeed Hadadan, Yichen Sheng, Robert Pottorff, Shiqiu Liu, Ravi Ramamoorthi, Ling-Qi Yan, Miloš Hašan
date: 2026-08-14
source: arXiv cs.GR/cs.CV
url: https://arxiv.org/abs/2608.13929
pdf: https://arxiv.org/pdf/2608.13929
tags: [rendering, generative, diffusion, G-Buffer, inverse-rendering, 2026]
status: unread
---

# RGBX-Next: Towards Realistic Generative Rendering from G-Buffers

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RGBX-Next: Towards Realistic Generative Rendering from G-Buffers |
| 作者 | Zheng Zeng, Marco Salvi, Lifan Wu, Jan Novák, Daqi Lin, Saeed Hadadan, Yichen Sheng, Robert Pottorff, Shiqiu Liu, Ravi Ramamoorthi, Ling-Qi Yan, Miloš Hašan |
| 来源 | arXiv (cs.GR/cs.CV) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.13929) |
| PDF | [下载](https://arxiv.org/pdf/2608.13929) |

## 核心贡献
1. **统一生成框架**: RGBX-Next 是首个统一的前向和逆向渲染框架，支持从 G-Buffer 生成逼真图像/视频
2. **扩散变换器微调**: 提出将 DiT (Diffusion Transformer) 模型微调为生成式前向和逆向渲染器的通用方法
3. **高质量结果**: 在生成式渲染和固有分解两方面都达到高质量

## 技术方案

### 核心思想
扩散模型在图像、视频和流生成方面取得了令人印象深刻的成果。然而，与传统 3D 渲染相比，它们对生成输出的精确控制仍然不足。RGBX-Next 的路径是使用生成模型作为条件于传统渲染 G-Buffer 的可学习渲染器。

### 方法流程
1. **前向渲染**: 输入 G-Buffer → DiT 渲染器 → 逼真图像
2. **逆向渲染**: 输入图像 → DiT 逆渲染器 → 估计 G-Buffer
3. **视频/流生成**: 支持从 G-Buffer 生成视频和流

### 关键创新
- 通用微调方案：将预训练的 DiT 模型适配为生成式渲染器
- 支持多种输入模式：图像、视频、流
- 内在分解：同时估计几何和材质属性

## 实验结论
- 在生成式渲染任务上达到高质量
- 在固有分解任务上展现优势
- 框架具有良好的泛化能力

## 局限性
- 依赖预训练的扩散模型
- 计算成本较高
- 对 G-Buffer 质量敏感

## 可行性分析
- **实现难度**: 高（需要扩散模型训练经验）
- **性能预期**: 实时性有待优化
- **适用场景**: 电影预可视化、游戏资源生成、虚拟场景创建

## 相关工作
- [[Generative-Rendering]]
- [[Diffusion-Models-Rendering]]

## 笔记
本文来自 NVIDIA 和 UC San Diego 的研究团队，是生成式渲染领域的重要进展。将扩散模型与经典 G-Buffer 渲染结合是一个很有前景的方向。
