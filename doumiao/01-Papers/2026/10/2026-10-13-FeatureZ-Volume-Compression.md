---
title: "FeatureZ: A General Framework for Feature-Preserving Compression via Pointwise Bounds and Star Classification"
date: 2026-10-13
tags: [volume-rendering, scientific-visualization, lossy-compression, isosurface, topological-features]
authors: [Unspecified]
arxiv: 2610.12371
venue: IEEE VIS 2026 (TVCG 2027)
status: processed
subjects: cs.GR, cs.IT
---

## 核心创新点

**FeatureZ** — 一种**保特征的体数据有损压缩框架**，可同时保留**等值面、分位数、合并树、Morse–Smale 复合体**等多种几何/拓扑特征。

### 核心技术

1. **逐点上下界约束** — 对结构化网格标量场施加上下界
2. **星形分类 (Star Classification) 一致性** — 网格中每个点关于其相邻 cell 的分类保持一致
3. **两层实现**
   - **量化层** — 在现有有损压缩器上加 **augmentation layer**
   - **迭代精修** — 保证 star classification 一致
4. **接口通用** — 与具体特征解耦，只要能落入"上下界 + 星形分类"框架

### 关键贡献

- 单一框架保留**多种**特征，而现有方法多针对单一特征定制
- 压缩比与单特征专用方法相当或更好
- **开销极小**（作为增强层而非替换层）

## 渲染技术分类

- **类型**: 体渲染 / 科学可视化（预处理与压缩链路）
- **方法**: 几何-拓扑特征保持压缩

## 实验结论

- **数据集**: 多种科学领域（医学、气候、材料、天文）数据集
- **基线**: 面向单一特征的专用压缩器
- **结果**: 压缩比持平或更优，特征保持一致

## 局限

- 并非所有特征概念都落入"上下界 + 星形分类"框架

## 适用场景

- 海洋/气候模拟的高分辨率时序体数据存档
- 大规模 SPH 粒子→ 网格化流体属性的远程渲染流式传输
- 火/烟模拟的高保真场降采样

## 推荐度

✅ 推荐 — 对做大规模体流体可视化的团队非常实用

## 关键词

`volume rendering` `isosurface` `Morse-Smale complex` `merger tree` `lossy compression`

---
*由豆苗自动收集于 2026-10-13*
