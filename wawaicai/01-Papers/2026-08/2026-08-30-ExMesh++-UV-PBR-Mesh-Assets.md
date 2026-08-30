---
title: "ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition"
tags: [几何, 网格重建, UV参数化, PBR材质, 多视图重建]
category: geometry-processing
date: 2026-08-30
authors: Chuanjin Fan, Lifan Wu, Wenjie Chang, Hanzhi Chang, Wenfei Yang
venue: arXiv
year: 2026
arXiv: "2608.24109"
---

# ExMesh++: Multi-View to Relightable UV-PBR Mesh Assets

## 核心贡献

**解决的问题**: 多视图重建生成可编辑、可重光照的网格资产需要三个关键要素：良好拓扑、有效 UV 参数化、显式 PBR 材质图。

**核心方法**: 提出 **ExMesh++**，一个分阶段的网格资产生成框架，实现几何、材质、光照的联合优化。

## 问题分析

### 现有方法的局限
1. **隐式场/高斯/点图优化** → 需后续表面提取和纹理烘焙
2. **逆向渲染方法** → 材质/光照仍绑定于神经场或点基元
3. **联合优化** → 各变量可能相互补偿，导致歧义分解

## 技术方法

### ExMesh++ 三阶段
1. **拓扑自适应重建**: 自适应调整网格拓扑结构
2. **UV 参数化**: 生成有效的 UV 展开
3. **PBR 材质分解**: 分离 albedo, metallic, roughness 等

### 关键创新
- **分阶段 + 联合优化**: 避免各组件相互补偿
- **拓扑适应性**: 网格拓扑根据几何特征自适应
- **工业级输出**: 直接输出可编辑、可重光照资产

### 技术栈
```
输入: 多视图图像
  ↓
[拓扑自适应网格重建]
  ↓
[UV 参数化]
  ↓
[PBR 材质分解]
  ↓
输出: 可编辑网格 + UV坐标 + PBR材质图
```

## 核心算法要点

1. **拓扑质量**: 保持网格三角形质量
2. **UV 有效性**: 无明显扭曲的 UV 展开
3. **材质分离**: 各向异性分解避免歧义

## 应用场景
- 游戏/影视资产创建
- AR/VR 实时渲染
- 数字孪生

## 技术标签
#网格重建 #UV参数化 #PBR #多视图 #材质分解 #可编辑资产
