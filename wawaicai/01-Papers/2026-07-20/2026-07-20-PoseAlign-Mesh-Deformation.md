---
tags: [几何, 网格变形, Text-Guided, SDS, Laplacian]
type: paper
date: 2026-07-20
source: arXiv cs.GR
---

# Sculpting Pose-Consistent Meshes via Text-Guided Deformation

## 论文信息

- **arXiv**: [2607.10560](https://arxiv.org/abs/2607.10560)
- **作者**: Yang Zhou et al.
- **会议/期刊**: CGI 2026 (Best Paper Award)
- **日期**: 2026-07-12

## 核心方法

### 问题定义
- 网格变形：改变 3D 网格顶点位置同时保持拓扑结构
- 现有文本引导 3D 网格变形方法难以同时满足：
  - 文本提示一致性
  - 姿态保持

### 创新点：PoseAlign
将文本引导网格变形分解为两阶段：

1. **全局姿态缩放** (Global Pose Scaling)
   - 引入 Laplacian 作为可微分网格表示
   - 实现更高效且更平滑的全局变形

2. **局部细节雕刻** (Local Detail Sculpting)
   - 提出 Pose-aligned SDS Loss
   - 适配 Score Distillation Sampling (SDS)
   - 使用注意力共享机制
   - 雕刻细粒度几何细节同时保持原始姿态

## 技术亮点

### Laplacian 作为网格表示
- 保持网格局部结构
- 有利于平滑变形
- 可微分，支持端到端训练

### Pose-aligned SDS Loss
- 解决 SDS 姿态漂移问题
- 保持原始 pose 一致性
- 注意力共享机制增强细节保真

## 实验结果

- 文本对齐和网格质量均有竞争力
- 姿态保持与文本对齐的平衡点优异

## 开源资源

- **Project Page**: [https://cousingrade6.github.io/PoseAlign](https://cousingrade6.github.io/PoseAlign)
- **Code**: Available (链接见项目页面)

## 相关技术

- [[Mesh Deformation]]
- [[Laplacian Smoothing]]
- [[Score Distillation Sampling]]
- [[Text-to-3D]]
- [[Shape Manipulation]]

## 可行性评估

✅ **推荐实现**

- 核心 Laplacian 表示可与 libigl 结合
- SDS Loss 概念可迁移到其他变形任务
- 姿态保持机制对角色动画有价值
- 获得 Best Paper Award，质量有保证

## libigl 参考

- `igl::cotangent_laplacian`
- `igl::massmatrix`
- `igl::parameterization`
