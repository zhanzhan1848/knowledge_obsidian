---
title: "RADmesh: Remesh-Aware Mesh Deformation"
authors: [Nam Anh Dinh et al.]
date: 2026-08-17
tags: [几何, 网格处理, 网格变形, 重网格化]
arxiv: "2608.17182"
doi: "10.48550/arXiv.2608.17182"
subjects: [cs.GR, cs.CV]
conference: "ECCV 2026 (Oral)"
---

# RADmesh: Remesh-Aware Mesh Deformation

## 核心方法

提出**重网格化感知的网格变形方法**，结合视觉损失（visual losses）进行生成式形状变形。

### 核心问题
大幅变形网格而不改变三角化会损害元素质量，但大多数生成式、文本驱动、视觉监督的网格变形方法不进行重网格化。

### 关键技术

1. **基于顶点的变形优化量**（Vertex-based Deformation Optimization Quantity）
   - 支持大变形
   - 对视觉损失的噪声具有鲁棒性

2. **周期性重网格化**
   - 使用各向同性重网格器（isotropic remesher）
   - 插值并传递变形优化状态
   - 实现从粗到细的连续、几何信息引导的分辨率添加

3. **局部化能力**
   - 可在基础形状上生长新特征
   - 保持其他部分不变

### 核心创新点
- 首次将重网格化与视觉监督变形结合
- 生成的网格三角化拟合优化几何，具有各向同性元素
- 支持局部特征生长

## 开源参考
- 项目页面：https://threedle.github.io/radmesh

## 相关技术
- Mesh Deformation
- Remeshing / 重网格化
- Visual Loss / 视觉损失
- Isotropic Remeshing

## 可行性评估

**推荐度：✅ 推荐实现**

- ECCV 2026 Oral，顶级会议
- 重网格化与变形结合的方法有重要应用价值
- libigl 的 `remesh_isotropic` 函数可作为基础
- 方法创新性强，解决生成式变形的痛点

## 会议信息
ECCV 2026 (Oral)
