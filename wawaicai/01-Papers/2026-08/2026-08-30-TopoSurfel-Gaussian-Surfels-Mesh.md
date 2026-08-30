---
title: "TopoSurfel: Closing the Loop between Gaussian Surfels and Meshes for Surface Reconstruction"
tags: [几何, 表面重建, 3DGS, Gaussian-Splatting, 网格]
category: geometry-processing
date: 2026-08-30
authors: Chuanjin Fan, Wenjie Chang, Bohao Liao, Yujia Chen, Wenfei Yang
venue: arXiv
year: 2026
arXiv: "2608.20687"
---

# TopoSurfel: Closing the Loop between Gaussian Surfels and Meshes

## 核心贡献

**解决的问题**: 3D Gaussian Splatting (3DGS) 在新视角合成方面取得显著成功，但直接从 3DGS 提取高保真曲面仍具挑战，因为其离散、非结构化特性。

**核心方法**: 提出 **TopoSurfel** 框架，闭合 Gaussian surfels 与连续 meshes 之间的循环。

## 问题分析

### 现有方法的局限
1. 现有 3DGS 重建方法通常依赖多视角几何一致性或局部约束
2. 缺乏显式结构化几何先验，导致：
   - 伪影和漂浮物
   - 无纹理或遮挡区域处理困难
3. 3DGS 的离散特性使其难以直接提取高质量网格

## 技术方法

### 关键创新
1. **Loop Closure**: 将 Gaussian surfels 与连续 mesh 相互转化
2. **结构化几何先验**: 引入显式几何约束指导优化
3. **互补优势**: 结合 3DGS 的灵活性与 mesh 的结构化特性

### 算法流程
```
Gaussian Surfels ←→ Mesh Loop
     ↓                    ↓
  视口合成            几何约束
     ↓                    ↓
  联合优化 ←────────→ 拓扑保持
```

## 相关工作对比

| 方法 | 优势 | 局限 |
|-----|------|------|
| 3DGS | 灵活性高 | 非结构化 |
| Mesh | 结构化、可编辑 | 提取困难 |
| TopoSurfel | 两者兼顾 | 需进一步验证 |

## 开源状态
- 代码: 待发布
- 项目页: 待更新

## 技术标签
#表面重建 #3DGS #Gaussian-Splatting #网格 #几何处理
