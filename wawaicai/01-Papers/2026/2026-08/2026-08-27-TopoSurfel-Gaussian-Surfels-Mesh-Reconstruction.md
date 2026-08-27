---
title: "Closing the Loop between Gaussian Surfels and Meshes for Surface Reconstruction"
authors: ["Chuanjin Fan"]
date: 2026-08-21
arXiv: "2608.20687"
tags: [几何重建, 3DGS, 网格重建, 高斯溅射]
---

# TopoSurfel: 闭合 Gaussian Surfels 与网格的闭环

## 核心方法

解决 3D Gaussian Splatting (3DGS) 直接提取高保真表面的挑战。现有方法因 3DGS 的离散非结构化特性，难以获得干净网格。

### 核心创新

**可微分等值面提取**
- 通过非可学习的可微分等值面过程动态提取连续代理网格
- 不需要引入辅助神经网络或额外每高斯参数

**网格引导的高斯演化策略**
1. 法向量对齐 (normal alignment)
2. 几何感知密度控制 (geometry-aware density control)
- 有效抑制浮动物、填补表面空洞

**空间感知混合重初始化**
- 解决大规模环境初始化挑战
- 确保复杂场景稳健重建

## 与 ExMesh++ 的关联
- 同一作者 Chuanjin Fan
- 互补：TopoSurfel 解决 3DGS 表面重建，ExMesh++ 关注多视图 PBR 网格
- 可结合使用：先用 TopoSurfel 重建几何，再用 ExMesh++ 优化 PBR 材质

## 开源实现
- GitHub: https://github.com/Fan-Treasure/TopoSurfel

## 可行性评估

✅ **推荐实现**

- 代码已开源
- 方法创新：闭合 3DGS 与网格的闭环
- 实验充分：多种场景验证
- 可与 ExMesh++ 结合形成完整重建流程

## 相关论文
[[2026-08-27-ExMesh-Multi-View-Relightable-UV-PBR-Mesh]]
