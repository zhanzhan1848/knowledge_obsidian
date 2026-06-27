---
title: "Neural Texture Compression using Hypernetworks"
date: 2026-06-25
tags: [几何, 纹理, 压缩, 神经材质, 渲染]
paper_id: arXiv:2606.26913
authors: Laurent Belcour et al.
conference: Eurographics Symposium on Rendering 2026
---

# Neural Texture Compression using Hypernetworks

## 核心方法
使用 Hypernetworks 学习统一的纹理表示，由 latent textures 和小型 MLP decoder 组成，可在着色时实时解码以重现基于物理的着色模型输入。

### 技术要点
- **问题**: 现有方法需要对给定 MLP 和潜在配置执行梯度下降优化
- **解决方案**: 训练单一 hypernetwork，同时输出 latent features 和 MLP 的 weights/biases
- **扩展**: 可推断多个 decoder 或产生学习超分辨率的 decoder

## 创新点
- 高维 solution space 中仍能产生与当前参考神经纹理压缩器质量相当的结果
- 单次训练支持多种解码器配置

## 复杂度分析
- 时间：训练 O(1) inference
- 空间：压缩率显著优于传统纹理压缩

## 开源实现
- 会议: Eurographics Symposium on Rendering (2026)

## 相关笔记
[[Neural Materials]]
[[Texture Compression]]
[[Physically Based Rendering]]