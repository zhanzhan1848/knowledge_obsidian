---
title: "Editable Physically-based Reflections in Raytraced Gaussian Radiance Fields"
authors: ["George Drettakis", "et al."]
date: 2026-06-30
venue: "SIGGRAPH Asia 2025"
status: important
tags: [渲染, 光线追踪, 高斯辐射场, 反射, PBR]
links:
  arXiv: "https://arxiv.org/abs/2606.30861"
  PDF: "https://arxiv.org/pdf/2606.30861"
  Code: "https://repo-sam.inria.fr/nerphys/editable-gaussian-reflections/"
---

## 核心贡献

1. 正确重建反射体和被反射物体
2. 支持高光反射的编辑（粗糙度变化等）
3. 多跳反射效果 (multi-bounce effects)
4. 快速3D Gaussian光线追踪算法

## 技术方案

### 问题
- 3D Gaussian Splatting 重建高光反射质量高，但使用"假"反射几何
- 用反射体后面的图元模拟反射，不真实

### 方法三组件

1. **Path Tracing生成物理反射**
   - 使用漫反射和镜面缓冲区
   - 优化场景的漫反射版本
   - 高效生成物理基础镜面反射

2. **专门训练方法**
   - 使优化过程收敛

3. **快速光线追踪算法**
   - 用于3D Gaussian图元
   - 实现高效多跳反射

### 支持的编辑
- 实时、一致地编辑捕获场景
- 多跳反射效果
- 改变粗糙度
- 其他反射属性编辑

## 实验

- 主要使用合成场景的真值缓冲区
- 真实场景的初步结果（当前学习式缓冲区不完美）

## 标签

#光线追踪 #高斯辐射场 #反射编辑 #SIGGRAPHAsia #PBR
