---
title: HGGT: Robust and Flexible 3D Hand Mesh Reconstruction from Uncalibrated Images
authors:
  - Yumeng Liu
date: 2026-03-25
updated: 2026-03-26
tags:
  - 3D重建
  - 手部网格
  - 多视角
  - feed-forward
  - 相机位姿估计
  - Geometry
  - Mesh Reconstruction
---

# HGGT: Robust and Flexible 3D Hand Mesh Reconstruction from Uncalibrated Images

## 核心方法

本文提出 **HGGT (Hand reconstruction with Geometry-Grounded Transformation)**，一种前馈网络架构，首次实现从**非标定视图**中联合推断 3D 手部网格和相机位姿。

### 核心创新点
1. **问题重构**：将手部重建重新定义为"视觉-几何接地"任务
2. **前馈架构**：无需迭代优化或极线搜索
3. **联合估计**：同时输出手部网格和相机位姿
4. **无标定**：摆脱了对校准多视图系统的依赖

### 技术pipeline
1. 输入：任意数量的非标定 RGB 图像
2. 使用 3D foundation models 学习显式几何
3. 视觉-几何特征融合
4. 联合输出：3D MANO 手部网格 + 每视图相机位姿

## 算法复杂度
- **时间复杂度**：O(1) per image — 前馈推理
- **空间复杂度**：O(N) 图像数量，O(1) 固定模型参数

## 开源实现
- **代码**：https://lym29.github.io/HGGT/
- **模型**：预训练模型可用

## 数据集与实验
- 在野外非标定场景中展示强泛化能力
- 优于当前 state-of-the-art 基线

## 相关笔记
[[Points-to-3D 结构感知3D生成]]
[[3DGS 点测量工具]]

## 会议/期刊
- arXiv cs.CV (2026-03-25, v2: 2026-03-26)

## 可行性评估

✅ **推荐实现**

### 算法复杂度：低
- 前馈网络，推理速度快

### 数值稳定性：高
- 端到端训练，joint optimization

### 依赖项
- PyTorch
- MANO hand model

### 应用场景
- 机器人交互
- 动画制作
- VR/AR 手部追踪
