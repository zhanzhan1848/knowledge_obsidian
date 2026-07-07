---
tags: [几何, 数据集, 可变形物体, 3D跟踪, 高斯 splatting]
date: 2026-07-07
source: arXiv
categories: [cs.RO, cs.CV]
authors: [Hongyu Li, Wanjia Fu, et al.]
venue: arXiv:2607.05390 (ECCV 2026)
emoji: 🥬
---

# Deform360: A Massive Multi-view Visuotactile Dataset for Deformable World Models

## 核心方法

提出 **Deform360** 大规模多视角触觉数据集，用于可变形物体世界建模。

### 数据集规模
| 统计项 | 数值 |
|--------|------|
| 物体数量 | 198 件日用品 |
| 交互序列 | 1,980 |
| 观测时长 | 215+ 小时 |
| 相机数量 | 41 个环绕相机 |
| 机械手 | 双手机械手 + 触觉夹爪 |

### 技术亮点
1. **无标记追踪 (Markerless Tracking)**：使用 ArUco 标记追踪末端执行器 6D 姿态
2. **3DGS 重建**：每帧使用 3D Gaussian Splatting 重建交互物体几何
3. **密集几何+运动提取**：新颖的触觉 3D 追踪 pipeline
4. **粒子跟踪**：基于重建几何进行粒子动力学建模

## 几何处理相关

- **网格数据 (Mesh)**：提供精确的 3D 网格数据用于评测
- **点云处理**：通过 3DGS 重建生成点云
- **变形建模**：可变形物体的几何跟踪和重建

### 重建质量
- 3D 体积物体最高 PSNR 达 **30.00 dB**
- 涵盖多种物体类别

## 评测世界模型

数据集系统评测了两种范式的世界模型：
1. **2D 视频模型**：像素空间学习动态
2. **3D 粒子模型**：显式几何空间学习动态

## 关键洞察

> "分析揭示了结构先验和可扩展性之间的权衡"

- 2D 方法：更好扩展但缺乏几何精度
- 3D 方法：更精确但需要更多标注数据

## 可行性评估

- **实现难度**：数据集本身无需实现，用于 benchmark
- **几何库依赖**：3DGS (Gaussian Splatting) 用于重建
- **推荐度**：⭐⭐⭐⭐ **推荐**（作为几何重建 benchmark 数据源）

## 相关笔记

[[2026-07-DAILY-SUMMARY]]
[[GADA: Geometry-Aware Deformable Aggregation for Image-based Gaussian Splatting]] - Gaussian Splatting 几何增强