---
title: "A Systematic Survey on Deep Learning Architectures for Point Cloud Classification and Segmentation"
authors: "Minhas Kamal et al."
date: 2026-05-16
category: Point-Cloud, Survey, Deep-Learning
tags: [point-cloud, classification, segmentation, deep-learning, survey, CNN, GNN, Transformer]
paper: https://arxiv.org/abs/2605.17131
github: https://github.com/MinhasKamal/DLForPCD
publication: "ACM Transactions on Multimedia Computing, Communications, and Applications (TOMM) 2026"
---

# A Systematic Survey on Deep Learning Architectures for Point Cloud Classification and Segmentation

## 论文概述

系统综述深度学习在3D点云分类、部件分割和语义分割任务上的架构创新与局限。

## 核心内容

### 1. 点云数据的本质挑战
- **无序性** (permutation invariant)
- **不规则性** (irregular)
- 传感器噪声与遮挡

### 2. 处理策略分类

| 策略 | 代表方法 |
|------|---------|
| 转为有序格式 | Voxel-based (VoxelNet), Multi-view (MVCNN) |
| 提取局部几何 | PointNet++, DGCNN |
| Permutation-invariant | PointNet, Set Abstraction |
| Self-attention | Point Cloud Transformer, Pointformer |

### 3. 主干架构演进

```
PointNet (2017) → PointNet++ (2017) → DGCNN (2019) 
→ Point Transformer (2021) → PointNeXt (2022) → ...
```

### 4. 关键发现

- **架构创新趋于瓶颈**：近年性能提升主要来自训练策略（数据增强、优化），而非架构本身
- **PointNeXt** 刷新 SOTA：引入更优训练协议
- 3D Gaussian Splatting (2023) 和 NeRF (2021) 推动了隐式表示研究

### 5. 应用领域

- 自动驾驶 & 机器人
- GIS & 数字孪生
- AR/VR
- 医学影像
- CAD/CAM

## 重要数据集

- **KITTI** (2012) - 自动驾驶
- **S3DIS** (2016) - 室内语义分割
- **ScanNet** (2017) - 室内3D重建
- **Waymo Open Dataset** (2020)

## 重要开源库

- **Point Cloud Library (PCL)** (2011)
- **Open3D** (2018)
- **PyTorch3D** (2020)

## 综述结论与开放挑战

1. **可扩展性** (Scalability) - 大场景处理效率
2. **鲁棒性** (Robustness) - 噪声、遮挡
3. **跨域泛化** (Cross-domain generalization)
4. **自监督学习** - 减少标注依赖

## 可行性评估

- ✅ **推荐参考** - 全面覆盖点云 DL 架构
- ✅ 对几何处理工具选型有参考价值
- 适合作为 墨鱼丸 点云模块的技术调研文档

## 与几何处理关联

- 点云 → 网格重建管线
- 局部几何特征 → 网格简化权重
- Permutation invariance → 网格处理并行化