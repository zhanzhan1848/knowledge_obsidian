---
title: Hierarchical Space Partition for Surface Reconstruction
authors: Xiangfei Li et al.
date: 2026-06-03
source: 3DV 2026
url: https://arxiv.org/abs/2606.04891
pdf: https://arxiv.org/pdf/2606.04891
tags: [rendering, 3D-reconstruction, surface-reconstruction, mesh, point-cloud]
status: unread
---

# Hierarchical Space Partition for Surface Reconstruction

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Hierarchical Space Partition for Surface Reconstruction |
| 作者 | Xiangfei Li et al. |
| 来源 | 3DV 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.04891) |
| PDF | [下载](https://arxiv.org/pdf/2606.04891) |

## 核心贡献
1. 提出Plane Assembling Strategy：从点云恢复缺失细节同时保持紧凑性
2. 三类平面分类：highly visible, barely visible, invisible
3. Invisible planes通过场景结构分析恢复，对应缺失细节
4. 层级划分（Hierarchical Partition）：三类平面对应三种生长优先级
5. Min-cut-based优化生成watertight polygonal mesh
6. 在公开数据集上优于主流方法

## 技术方案
**Plane Classification**:
- Highly visible planes
- Barely visible planes
- Invisible planes（通过场景结构分析恢复）

**Hierarchical Partition**:
- 根据优先级逐步划分空间
- 三种生长优先级对应三种平面类型

**Mesh Generation**:
```math
\text{watertight mesh} = \min\text{-cut}(\text{partition})
```

## 实验结论
- 在3DV 2026发表
- 公开数据集对比验证有效性和优越性

## 局限性
- 依赖LiDAR扫描，存在范围约束和遮挡问题
- 对复杂室内场景的泛化能力待进一步验证

## 可行性分析
- 实现难度：中（基于已有分割方法）
- 性能预期：适用于3D重建和渲染前置处理
- 适用场景：数字孪生、SLAM、3D场景渲染

## 相关工作
- [[2026-03-25-Mesh-Generation]]
- [[2026-03-14-RBF-Surface-Interpolation]]