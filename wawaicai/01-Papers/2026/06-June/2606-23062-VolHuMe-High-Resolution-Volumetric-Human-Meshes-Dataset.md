---
title: "VolHuMe: A High-Resolution Large Scale Dataset of Volumetric Human Meshes"
arXiv: "2606.23062"
authors: ["Niccolò Bisagno", "et al."]
conference: "N/A (Dataset)"
date: 2026-06-22
tags: [数据集, 人体网格, 3D重建, 点云, 几何处理]
---

# VolHuMe: High-Resolution Volumetric Human Meshes Dataset

## 数据集概述

### 采集设备
- **状态**: 先进体积工作室
- **相机**: 64 RGB + 32 Depth cameras
- **特点**: 近距离、高分辨率捕捉

### 数据规模
- **受试者**: 104 个独立捕获对象
- **格式**: 4D 人体扫描

### Ground Truth 提供
- SMPL-X 参数
- **高分辨率网格 (High-resolution meshes)**
- 多视角 RGB/Depth 图像
-  rigged meshes
- **点云 (Point clouds)**
- 服装分割
- 精细手部和面部几何

## 与现有数据集对比

| 数据集 | 几何保真度 | 纹理分辨率 | 细节保留 |
|--------|-----------|-----------|---------|
| VolHuMe | 高 | 高 | 精细 body-part |
| 竞品 | 中 | 中 | 有限 |

## 基准测试任务
1. 3D 人体重建
2. 4D 人体重建
3. 网格处理下游任务

## 数据集价值
- 评估当前测试平台的局限性
- 推动人体几何处理研究

## 开源信息
- 公开可用数据集

## 相关笔记
[[人体重建]]
[[点云处理]]
[[网格数据集]]
