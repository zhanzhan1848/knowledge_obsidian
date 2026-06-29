---
title: "VolHuMe: High-Resolution Large Scale Dataset of Volumetric Human Meshes"
authors: ["Niccolò Bisagno", "et al."]
venue: arXiv
date: 2026-06-22
tags: [数据集, 人体网格, 高分辨率, SMPL-X, 点云]
category: 数据集
arXiv: "2606.23062"
---

## 数据集概述

VolHuMe 提供高质量 4D 人体扫描，采集设备：64 RGB + 32 深度相机的体素工作室

### 数据规模
- **104 个独立受试者**的捕获
- 每个受试者包含：
  - SMPL-X 参数
  - 高分辨率网格
  - 多视角 RGB/深度图像
  - 绑定网格
  - 点云
  - 服装分割
  - 精细手部和面部几何

### 采集特点
- 近距离高分辨率采集设置
- 保留细粒度身体部位细节
- 提升几何保真度和纹理分辨率

## 基准测试

在 3D/4D 人体重建任务上对 SOTA 方法进行基准测试：
- 暴露当前评估测试平台的局限性
- 提供 ground truth 质量对比

## 开源参考

- 论文链接：arXiv:2606.23062

## 可行性评估

✅ **推荐使用**

- 首个高精度人体网格数据集
- 适合训练和评估人体重建模型
- 包含多模态数据便于研究

## 传递给

@墨鱼丸 - 用于人体网格处理训练数据
