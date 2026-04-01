---
title: Direct Differentiable Rasterization of Triangle Soup for Extreme Radiance Field Simplification
authors: Kenji Tojo et al.
date: 2026-03-28
source: arXiv cs.GR
url: https://arxiv.org/abs/2603.27151
pdf: https://arxiv.org/pdf/2603.27151
tags: [rendering, rasterization, radiance-field, differentiable-rendering, 2026]
status: unread
---

# Direct Differentiable Rasterization of Triangle Soup for Extreme Radiance Field Simplification

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Direct Differentiable Rasterization of Triangle Soup for Extreme Radiance Field Simplification |
| 作者 | Kenji Tojo et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.27151) |
| PDF | [下载](https://arxiv.org/pdf/2603.27151) |

## 核心贡献
1. 提出 DiffSoup，使用高度非结构化的三角形集合（soup）来表示辐射场
2. 引入二元不透明度表示，可通过随机不透明度遮罩进行直接微分
3. 实现稳定训练，无需 mollifier（即平滑光栅化）
4. 支持标准深度测试光栅化，可集成到传统图形管线

## 技术方案
DiffSoup 采用辐射场的高度非结构化表示，使用少量带有神经纹理和二元不透明度的三角形。关键创新：

- **二元不透明度表示**：通过随机不透明度遮罩实现直接可微，避免传统方法需要的平滑近似
- **标准深度测试**：可使用传统 GPU 光栅化管线实现
- **极简表示**：将原始数量级的图元数量简化至极小规模
- **交互式渲染**：支持在消费级笔记本和移动设备上运行

## 实验结论
- 在极端简化场景下保持视觉质量
- 支持消费级硬件上的交互式渲染
- 代码已开源：https://github.com/kenji-tojo/diffsoup

## 局限性
- 简化率极高时可能损失部分细节
- 需要预先训练的辐射场作为输入

## 可行性分析
- 实现难度：中
- 性能预期：<10ms 渲染速度
- 适用场景：移动端渲染、在线传输、实时应用

## 相关工作
- 3D Gaussian Splatting
- Radiance Field Reconstruction
- Differentiable Rendering

## 笔记
核心思想是将辐射场简化为极少量可光栅化的三角形，利用神经网络存储纹理信息。这是一种将神经渲染与传统光栅化结合的思路，适合需要极致简化的场景。
