---
tags: [几何, 网格重建, 拓扑适配, 可微分优化, UV维护]
date: 2026-07-08
source: arXiv
categories: [cs.CV, cs.GR]
---

# ExMesh: Explicit Mesh Reconstruction with Topology Adaptation

## 核心方法

**ExMesh** — 首个将离散拓扑操作无缝集成到连续可微分优化流程中的框架：

- **直接优化显式网格**，无需中间表示
- **自适应顶点分裂与合并策略**
- **实时 UV 维护**，保持纹理一致性

## 问题背景

现有方法（隐式或显式）的局限：
- 依赖中间表示（如 TSDF fusion）
- 后处理步骤（如 Marching Cubes）产生伪影
- 网格碎片化

## 技术创新

### 1. 拓扑自适应
- 自适应顶点分裂捕获细节
- 顶点合并避免退化面
- 保持几何完整性

### 2. UV 维护
- 实时 UV 坐标维护
- 网格结构演进时保持纹理高保真

### 3. 联合优化
- 可微分优化 + 离散拓扑更新
- 粗到细优化策略

## 实验结果

- 在 accuracy、computational efficiency、mesh conciseness 之间取得平衡
- **CVPR 2026** 接收

## 开源实现

- 待补充 (arXiv PDF 可用)

## 相关笔记

[[2026-07-08-Intrinsic-Meshing-Geodesic-Distances]]
[[2026-05-13-FA-QEM-Mesh-Simplification]]

## 元信息

- **arXiv**: [2606.07288](https://arxiv.org/abs/2606.07288)
- **作者**: Chuanjin Fan 等
- **提交日期**: 2026-06-05
- **会议**: CVPR 2026
- **Subjects**: Computer Vision (cs.CV), Graphics (cs.GR)
