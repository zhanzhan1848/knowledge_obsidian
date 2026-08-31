---
tags: [几何, 点云重建, 3DGS, NeRF, 高斯溅射]
date: 2026-08-31
venue: arXiv cs.GR
---

# Comparative Evaluation of 3D Reconstruction Methods for Immersive Visualization

## 核心方法

比较四种3D重建方法用于教育场景的全息表示:

1. **Photogrammetry** (摄影测量)
2. **NeRF-based method** (神经辐射场)
3. **Gaussian Splatting** (高斯溅射)
4. **LiDAR** (激光雷达)

### 评估对象

实验室常见物品的全息模型，由研究生评估:
- 形状 (shape)
- 颜色 (color)
- 纹理 (texture)
- 视觉缺陷 (visual defects)

### 实验设计

- 重复测量设计 (repeated-measures design)
- 参与者: 研究生
- 对象: 多种实验室物品

## 主要发现

1. **NeRF方法**对透明、反射、低纹理物品重建效果最好
2. **形状和颜色**比纹理更容易准确重建
3. **纹理**仍然是具有挑战性的视觉属性
4. 各方法各有优劣:
   - Photogrammetry: 快速，但对特殊材质敏感
   - NeRF: 一致性高，但速度慢
   - Gaussian Splatting: 平衡速度与质量
   - LiDAR: 精确但设备昂贵

## 应用价值

- 沉浸式学习对象创建
- 实验室预准备支持
- 空间推理训练
- AR/MR教育环境

## 开源实现

- arXiv: https://arxiv.org/abs/2608.27301
- Authors: Maitrey Gramopadhye et al.

## 相关笔记

[[2026-05-09-3D-Surface-Splatting-Inverse-Rendering]]
[[2026-03-25-Accurate-Point-Measurement-3DGS]]
[[2026-08-26-TopoSurfel-Gaussian-Surfels-Mesh-Reconstruction]]

## 可行性评估

✅ **参考价值高**

- 对比研究全面: 四种方法系统比较
- 教育应用导向: 实用性强
- 方法选择指导: 为不同场景选择提供依据

**实现建议**:
1. 参考其实验设计进行方法评估
2. 关注NeRF对特殊材质的优势
3. Gaussian Splatting作为平衡选择
