---
title: Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting
authors: Jiahao Kang, et al.
date: 2026-04-21
source: arXiv / CVPR 2026 Highlight
url: https://arxiv.org/abs/2604.19202
pdf: https://arxiv.org/pdf/2604.19202
tags: [rendering, gaussian splatting, face editing, neural rendering, CVPR, 2026]
status: unread
---

# Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting |
| 作者 | Jiahao Kang, et al. |
| 来源 | CVPR 2026 (Highlight) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.19202) |
| PDF | [下载](https://arxiv.org/pdf/2604.19202) |

## 核心贡献
1. **SketchFaceGS**: 首个草图驱动的3D Gaussian头像实时生成框架
2. **Feed-forward Coarse-to-fine Architecture**: 单次前向传播即可生成
3. **UV Mask Fusion**: 支持精确的实时自由视角修改
4. **Layer-by-layer Feature Fusion**: 高保真度3D人头重建

## 技术方案

### 网络架构
```
输入草图 → Transformer-based UV Feature Prediction 
         → 粗粒度几何一致性UV特征图
         → 3D UV Feature Enhancement Module
         → 高保真3D人头
```

### 关键技术
1. **Transformer-based UV Feature Prediction**: 从2D草图预测几何一致UV特征
2. **3D UV Feature Enhancement**: 高频 photorealistic 细节增强
3. **UV Mask Fusion**: 编辑时精确遮罩融合
4. **Layer-by-layer Feature Fusion**: 分层特征融合策略

## 实验结论

### 性能
- 单次前向传播即可完成生成
- 实时编辑能力
- 支持自由视角观察

### 对比
- 生成质量优于现有方法
- 编辑灵活性更佳

## 可行性分析
- 实现难度：中 (有开源Jittor实现)
- 性能预期：实时
- 适用场景：游戏NPC生成、数字人创建、VR/AR应用

## 相关工作
- 3D Gaussian representations for digital head modeling
- Sketch-based 3D reconstruction
- Neural rendering for faces

## 笔记

**CVPR 2026 Highlight 论文**

**代码**: https://github.com/gogoneural/SketchFaceGS_jittor
