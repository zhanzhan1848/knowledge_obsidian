---
title: Generative World Renderer
authors: Zheng-Hui Huang, Zhixiang Wang, Jiaming Tan, Ruihan Yu, Yidan Zhang, Bo Zheng, Yu-Lun Liu, Yung-Yu Chuang, Kaipeng Zhang
date: 2026-06-26
source: arXiv (cs.CV)
url: https://arxiv.org/abs/2604.02329
pdf: https://arxiv.org/pdf/2604.02329
tags: [rendering, inverse-rendering, forward-rendering, G-buffer, dataset, 2026]
status: unread
---

# Generative World Renderer

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Generative World Renderer |
| 作者 | Zheng-Hui Huang, Zhixiang Wang, Jiaming Tan, Ruihan Yu, Yidan Zhang, Bo Zheng, Yu-Lun Liu, Yung-Yu Chuang, Kaipeng Zhang |
| 来源 | arXiv (cs.CV) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.02329) |
| PDF | [下载](https://arxiv.org/pdf/2604.02329) |

## 核心贡献
1. 提出大型动态数据集，从 AAA 游戏使用双屏拼接捕获方法提取 4M 连续帧（720p/30 FPS）RGB 和五个 G-buffer 通道
2. 支持双向渲染：野外几何和材质分解，以及高保真 G-buffer 引导的视频生成
3. 提出基于 VLM 的评估协议，用于无 ground truth 的逆渲染评估

## 技术方案
**双屏拼接捕获方法**：使用两个同步屏幕提取高质量渲染数据，包括 RGB 和 G-buffer（几何缓冲区）。

**数据集特点**：
- 4M 连续帧
- 720p/30 FPS
- 多样化场景、视觉效果和环境
- 包含恶劣天气和运动模糊变体

**VLM 评估协议**：测量语义、空间和时间一致性，与人类判断高度相关。

## 实验结论
- 逆渲染器在该数据集上微调后，跨数据集泛化能力显著提升
- 支持可控生成
- VLM 评估与人类判断强相关

## 局限性
- 数据来源于合成游戏场景，可能存在领域差距
- 需要双屏设备进行数据采集

## 可行性分析
- 实现难度：低（数据集已发布）
- 性能预期：高质量 G-buffer 数据可用于训练逆渲染模型
- 适用场景：逆渲染、材质分解、G-buffer 引导的视频生成

## 相关工作
- 3D Gaussian Splatting
- Inverse Rendering
- G-buffer 引导生成

## 笔记
项目页面：https://alaya-studio.github.io/renderer/