---
title: "Large-Scale Photogrammetric Documentation of St. John's Co-Cathedral: A Workflow for Cultural Heritage Preservation"
authors: ["Matthew Kenely"]
date: 2026-04-27
tags: [几何, 点云, 网格细分, 文化遗产, 摄影测量]
categories: [Geometry, Point Cloud, Cultural Heritage]
cite: arXiv:2604.24316
subject: "cs.GR"
---

## 核心方法

大型文化遗产三维重建完整工作流。

### 数据采集

- **99,000 张图像** (7 晚采集)
- DSLR 相机
- 无人机摄影
- LIDAR 扫描

### 重建规模

- **25-30 亿三角形** 3D 重建
- 反射表面 (巴洛克金属表面)
- 暗材质、精细挂毯
- 受限访问

### 技术流程

1. 多模态数据采集
2. 图像分级与 AI 辅助去噪 (低光噪声)
3. 大规模 LIDAR 点云清理
4. 混合摄影测量重建 (RealityCapture)
5. **网格细分策略** 用于实时可视化引擎
6. Gaussian Splatting 补充表示

### 网格细分策略

- 网格细分 (mesh subdivision) 用于实时渲染
- 反射表面处理
- 自动化工作流 + 人工干预

## 算法复杂度

- 数据采集：O(n), n = 图像数量
- 点云处理：O(n log n)
- 网格细分：O(m), m = 面片数

## 开源实现

- RealityCapture (商业)
- LIDAR 处理工具

## 相关技术

- 摄影测量
- LIDAR 点云
- 网格细分 (subdivision)
- Gaussian Splatting
- 文化遗产数字化

## 评估

✅ **推荐实现** - 实践导向的工作流，网格细分用于 LOD 生成，结合点云和网格的方法对逆向工程有参考价值

## 传递给

@墨鱼丸