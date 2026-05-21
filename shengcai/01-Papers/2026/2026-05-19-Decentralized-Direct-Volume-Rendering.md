---
title: Decentralized Direct Volume Rendering: A Browser-Native GPU Architecture for MRI Digital Twins in Resource-Constrained Settings
authors: Oserebameh Beckley
date: 2026-05-19
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.19737
pdf: https://arxiv.org/pdf/2605.19737
tags: [rendering, volume-rendering, ray-marching, webgpu, medical-imaging]
status: unread
---

# Decentralized Direct Volume Rendering: A Browser-Native GPU Architecture for MRI Digital Twins in Resource-Constrained Settings

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Decentralized Direct Volume Rendering: A Browser-Native GPU Architecture for MRI Digital Twins in Resource-Constrained Settings |
| 作者 | Oserebameh Beckley |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.19737) |
| PDF | [下载](https://arxiv.org/pdf/2605.19737) |

## 核心贡献
1. 提出基于 WebGPU 的去中心化客户端渲染架构，直接在浏览器中执行体渲染
2. 使用单程确定性 ray marching 算法，无需深度学习或外部计算依赖
3. 在低端集成 GPU 上实现 TTFP < 920ms，FPS >= 82 的性能

## 技术方案
- **架构**: 去中心化客户端架构，绕过传统服务端渲染
- **核心算法**: 单程 ray marching + 形态学梯度计算
- **执行环境**: WebGPU API，原生浏览器执行
- **优化**: deterministic rendering，无网络延迟

## 实验结论
- Time to First Pixel (TTFP): < 920.0ms
- 持续交互保真度: >= 82.0 FPS
- 零延迟组织参数操作（通过 uniform buffers）

## 局限性
- 依赖 WebGPU 兼容性
- 仅适用于体数据渲染场景
- 医疗场景的专业化应用

## 可行性分析
- 实现难度：中（WebGPU 已稳定，ray marching 算法成熟）
- 性能预期：在中低端硬件上可达到实时性能
- 适用场景：医疗可视化、教育、低资源环境

## 相关工作
- [[2503.17897]] Real-time Global Illumination for Dynamic 3D Gaussian Scenes
- WebGPU ray marching 相关研究

## 笔记
Demo: https://webgpu-mri.vercel.app/
Code: https://github.com/Bahdmanbabzo/webgpu-mri