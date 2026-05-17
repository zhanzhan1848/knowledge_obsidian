---
title: "3DGS³: Joint Super Sampling and Frame Interpolation for Real-Time Large-Scale 3DGS Rendering"
authors: Youcheng Cai et al.
date: 2026-05-12
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.11489
pdf: https://arxiv.org/pdf/2605.11489
tags: [rendering, 3DGS, super-sampling, frame-interpolation, real-time, 2026]
status: unread
---

# 3DGS³: Joint Super Sampling and Frame Interpolation for Real-Time Large-Scale 3DGS Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3DGS³: Joint Super Sampling and Frame Interpolation for Real-Time Large-Scale 3DGS Rendering |
| 作者 | Youcheng Cai et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.11489) |
| PDF | [下载](https://arxiv.org/pdf/2605.11489) |

## 核心贡献
1. 提出**3DGS³**：统一的后处理框架，联合执行超采样和帧插值
2. **GASS (梯度感知超采样)** 模块：利用3DGS连续可微性提取图像梯度，引导GRU细化网络实现高保真超采样
3. **LTFI (轻量时域帧插值)** 模块：基于紧凑U-Net骨架，融合时域和可微空间线索合成时域连贯的中间帧

## 技术方案

### 问题背景
3DGS实现高质量实时3D渲染，但在高效扩展到超密集场景和高分辨率时面临计算瓶颈。

### 核心思想
不优化splatting管道本身，而是对低分辨率输出进行可微处理联合超采样+帧插值。

### GASS模块
- 利用3DGS的连续可微性提取图像梯度
- GRU-based refinement network
- 高保真超采样

### LTFI模块
- 紧凑U-Net-like backbone
- 融合时域和可微空间线索
- 合成时域连贯中间帧

### 兼容性
与现有3DGS加速技术兼容

## 实验结论
- 公开数据集上实现SOTA渲染效率和视觉质量
- 代码将公开发布

## 可行性分析
- 实现难度：**中**
- 性能预期：超大规模场景+高分辨率+高帧率
- 适用场景：VR/AR、大规模城市建模、实时渲染应用

## 相关工作
- 3D Gaussian Splatting
- 超分辨率方法
- 帧插值技术

## 标签
#3DGS #超采样 #帧插值 #实时渲染 #大规模场景