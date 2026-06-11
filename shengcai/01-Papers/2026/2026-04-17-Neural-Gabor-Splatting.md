---
title: Neural Gabor Splatting: Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction
authors: (待补充)
date: 2026-04-17
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.15941
pdf: https://arxiv.org/pdf/2604.15941
tags: [rendering, 3DGS, neural-rendering, gaussian-splatting, 2026]
status: unread
---

# Neural Gabor Splatting: Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Neural Gabor Splatting |
| 作者 | (见原文) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.15941) |
| PDF | [下载](https://arxiv.org/pdf/2604.15941) |

## 核心贡献
1. **MLP 增强的高斯原语**：为每个高斯原语配备轻量级 MLP，突破单色限制，实现丰富的颜色变化
2. **频率感知 densification 策略**：基于频率能量选择不匹配原语进行剪枝和克隆
3. 在 Mip-NeRF360 和高频表面数据集上实现更好重建质量

## 技术方案

### 问题背景
3DGS 的主要问题：原语数量在高频细节场景中急剧增长，因为每个高斯只能表示单一颜色。

### 方法
每个高斯原语配备 MLP，输入局部原语坐标和视角方向，输出 RGB 颜色，使单一原语能表示多种图案。

### 频率感知 Densification
使用分解的频率能量图来克隆特定频率范围内的原语，实现高效的Primitive数量控制。

## 可行性分析
- 实现难度：中等
- 性能预期：减少原语数量同时保持高频细节
- 适用场景：高质量新视角合成，高频纹理场景

## 相关工作
- [[3D Gaussian Splatting (Kerbl et al.)]]
- [[3D Gabor Splatting]]

## 笔记
**重要性**：⭐⭐⭐⭐  
**推荐度**：高 - 解决 3DGS 关键瓶颈