---
title: "Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models"
arXiv: "2606.22945"
authors: ["Junrong Huang", "et al."]
conference: "N/A"
date: 2026-06-22
tags: [纹理平铺, UV展开, 扩散模型, 纹理合成, 几何处理]
---

# Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models

## 核心方法

### 问题
纹理平铺需要根据用户定义的参数（频率、方向、比例）精确重复参考图案，同时保持结构完整性和一致光照。

### 技术创新

1. **Coordinate-Transformed Rotary Embedding (CT-RoPE)**
   - 对目标潜在变量和图像条件之间的相对位置嵌入应用 2D 仿射变换
   - 无需显式像素变形即可精确控制平铺图案
   - 保留参考条件完整信息

2. **Disjoint Attention Mask**
   - 保护参考特征免受语义泄漏
   - 保持结构完整性
   - 无缝混合合成纹理与场景原始光照和几何

## 实验结果

### 性能指标
- 控制精度优于此 SOTA 基线
- 纹理保真度高

### 应用场景
- 纹理编辑
- 材质迁移
- 几何表面纹理映射

## 开源参考
- Code & Dataset: https://github.com/junrongh/ControlTile

## 关键技术点

### RoPE 增强
- 旋转位置编码
- 变换后的相对位置嵌入

### 仿射变换参数
- 频率控制
- 方向控制
- 比例控制

## 相关笔记
[[UV展开]]
[[纹理映射]]
[[材质编辑]]
