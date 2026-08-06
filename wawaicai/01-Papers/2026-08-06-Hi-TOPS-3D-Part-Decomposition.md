---
tags: [几何, 部件分解, 拓扑, 深度学习]
date: 2026-08-06
---

# Hi-TOPS: Hierarchical Topology-aware Scoring Prior for 3D Part Decomposition

## 核心方法

**Hi-TOPS** 提出层次拓扑感知评分先验，用于 3D 部件分解，将形状分离为结构有意义的组件。

### 关键创新点

1. **多分辨率 Flow-Freeze 场**：聚合多尺度互补内在线索
   - **Flow 区域**：提供原始覆盖的可扩展支持
   - **Freeze 区域**：限制关节和薄结构附近的增长

2. **TSDF 引导的 superquadric 拟合器**：捕获主体核心和残余表面结构

3. **SQ-to-mesh 分配**：生成连接良好、边界对齐的部件

### 特点

- 无需语义监督或 2D 基础模型先验
- 保持关节接缝和薄附着结构
- 提供稳定、可编辑的分解

## 开源实现

- 待公布

## 相关笔记

[[Material-Aware 3D Part Decomposition]]

## 链接

- arXiv: https://arxiv.org/abs/2608.00767
- PDF: https://arxiv.org/pdf/2608.00767
