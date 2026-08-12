---
tags: [几何, 点云, 各向异性, 曲面逼近, 深度学习]
date: 2026-07-30
venue: arXiv cs.GR
type: paper
source: wawaicai-daily-paper-search
---

# HD-PEA: Learning Manifolds in High-D Point Embedding for Anisotropic Surface Approximation from Unstructured Point Clouds

## 核心方法

**HD-PEA** (High-Dimensional Point Embedding Anisotropic Surface Approximation) 是一个基于深度学习的各向异性曲面逼近框架，直接在非结构化点云上操作。

### 核心创新点

1. **高维点嵌入**：将输入点云映射到高维流形嵌入空间，开发了一种新型的学习型高维欧氏点嵌入方法
2. **Patch-based Meta-embedding**：推理阶段无需重新训练或微调，通过分块元嵌入策略处理大规模点云
3. **切向子空间估计**：对高维嵌入流形进行逼近，并进行各向异性重建
4. **黎曼曲率张量估计**：从点云直接估计曲率张量

## 算法流程

```
输入非结构化点云
     ↓
高维流形嵌入（学习型投影）
     ↓
分块元嵌入（大规模处理）
     ↓
切向子空间估计
     ↓
各向异性曲面重建
     ↓
输出紧凑几何对齐的网格表示
```

## 复杂度分析

- **时间复杂度**：O(n log n) 嵌入 + O(k) 各向异性优化
- **空间复杂度**：O(n) 嵌入存储
- **可扩展性**：支持大规模点云（ScanNet, Thingi10K）

## 数据集评估

- Thingi10K
- AIM@SHAPE
- Stanford 3D Scanning Repository
- ScanNet

## 开源实现

- 论文：arXiv:2607.28855
- GitHub: 待确认

## 相关笔记

[[2026-07-Fast-Exact-Winding-Numbers-Triangle-Meshes]]
[[Points-as-Tori-Signed-Distance-Point-Clouds]]

## 可行性评估

✅ **推荐实现**

- 各向异性网格生成对几何处理非常重要
- 端到端学习型方法，避免手工特征工程
- 支持大规模点云推理
- libigl 可用于对比实验

## 技术分类

- 点云处理
- 各向异性曲面重建
- 深度学习几何
- 流形学习
