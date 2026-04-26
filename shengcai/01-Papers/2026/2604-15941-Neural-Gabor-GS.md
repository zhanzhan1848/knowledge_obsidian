---
title: "Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction"
authors: "Haato Watanabe"
date: 2026-04-17
status: 待读
tags: [渲染, Gaussian Splatting, 神经渲染, 高频表面重建, CVPR2026]
conference: CVPR 2026
arxiv_id: "2604.15941"
---

# Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Haato Watanabe |
| 发表 | CVPR 2026 |
| 链接 | [arXiv](https://arxiv.org/abs/2604.15941) |

## 核心贡献
1. **Neural Gabor Splatting**：为每个 Gaussian primitive 添加轻量级 MLP，模拟单 primitive 内大范围颜色变化
2. **频率感知 densification 策略**：基于频率能量选择 mismatch primitives 进行剪枝和克隆

## 技术方案

### 问题
3DGS 的关键缺陷：高频外观细节场景中 primitive 数量急剧增长
- 每个 primitive 只能表示单一颜色
- 每次锐利颜色转换需要多个 primitives

### Neural Gabor Splatting
```
Gaussian primitive + MLP(color variations)
           ↓
单 primitive 内颜色变化范围大幅扩展
```

### 频率感知 Densification
- 基于频率能量选择 mismatch primitives
- 控制 primitive 数量增长
- 适合高频率场景（棋盘格等）

## 实验
- Mip-NeRF360
- High-Frequency datasets (checkered patterns)
- 全面消融研究验证

## 评估
- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐⭐ (解决 3DGS 关键痛点)
- **难度**: 中
- **推荐度**: ⭐⭐⭐⭐⭐

## 相关工作
- 3D Gaussian Splatting (3DGS)
- High-frequency surface reconstruction
- Neural radiance fields
- Gabor filters

## 链接
- PDF: https://arxiv.org/pdf/2604.15941