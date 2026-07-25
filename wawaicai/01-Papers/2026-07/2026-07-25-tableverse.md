---
title: "TableVerse: A Large-scale Tabletop Dataset with Real-world Grounded Layouts for Generalizable Manipulation"
authors: ["Boyuan Wang", "Yue Zhang", "Xutao Xue", "Xueyu Song", "Yu Sun"]
date: 2026-07-24
venue: arXiv
categories: [Geometry Processing, 3D Reconstruction, Scene Generation]
tags: [mesh processing, point cloud, reconstruction, Real2Sim, robotics]
---

# TableVerse: A Large-scale Tabletop Dataset

## 核心方法

TableVerse 是一个全自动 Real2Sim 管道,将从野外非结构化图像数据转换为高保真、可仿真的桌面环境。

### 核心技术栈

1. **几何处理模块 (Geometry Processing)**
   - SAM2 实例分割提取物体掩码
   - SAM3D 重建初始 3D 网格
   - LCCR Optimization: 层级场景图驱动的网格交点分离
   - 布局保持的几何优化

2. **物理稳定化**
   - MuJoCo 物理引擎稳定物体到真实静止状态
   - 碰撞检测与机械稳定性验证

3. **轨迹生成**
   - 加速运动规划自动合成任务条件无碰撞轨迹

### 关键创新点

- **LCCR Optimization**: Layout-Consistent Geometric Rectification, 通过层级场景图优雅地分离相交网格
- **Real2Sim 范式转变**: 从想象式布局生成转向确定性从非结构化野外图像重建
- **规模**: 100K 物理一致环境, 近 1M 独立物体实例, 35K+ 语义类别

## 算法复杂度

- 时间复杂度: O(n) per scene (n = 物体数量)
- 空间复杂度: O(n) 存储网格和场景图

## 开源实现

- 项目页面: https://bytedance.github.io/TableVerse
- SAM2: 实例分割
- SAM3D: 3D 网格重建
- MuJoCo: 物理仿真

## 相关笔记

[[2026-07-geometry-processing-survey]]
[[mesh-reconstruction-methods]]
