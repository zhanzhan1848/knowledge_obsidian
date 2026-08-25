---
title: "MultiCube: Compositional 3D Generation With Part-Level Semantic and Spatial Control"
authors: [Ava Pun et al.]
date: 2026-08-20
status: 待读
tags: [几何, 3D生成, diffusion, 零件级控制]
keywords: [3D generation, diffusion, part-level control, compositional]
links:
  arXiv: https://arxiv.org/abs/2608.20448
  PDF: https://arxiv.org/pdf/2608.20448
  Project: https://multi-cube.github.io
reviewDate: 2026-08-25
---

# MultiCube: Compositional 3D Generation With Part-Level Semantic and Spatial Control

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | Ava Pun et al. |
| 发表 | arXiv cs.GR, 2026-08-20 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.20448) |

## 核心贡献

**MultiCube**：组合式 3D 生成方法，提供对每个零件的语义和空间独立控制。

### 输入

- 全局文本 prompt
- 文本 schema（指定零件）
- 空间布局（零件边界框）

### 输出

- 3D 对象由独立 mesh 组成，每个零件一个 mesh

### 创新点

1. **双阶段扩散过程**：
   - 第一阶段：生成 schema 和 layout 对齐的单体 mesh
   - 第二阶段：同时将 mesh 分解为各个零件

2. **Part Layout Adapter**：独立编码每个零件条件，不受其他零件影响

## 技术方案

### 两阶段流程

```
Stage 1: Schema/Layout-aligned monolithic mesh
         ↓
Stage 2: Simultaneous part decomposition
         ↓
Output: Individual meshes per part
```

### Part Layout Adapter

编码每个零件的：
- 语义条件（来自 text schema）
- 空间条件（来自 bounding box layout）

## 实验结论

- 生成高质量组合式 3D 对象
- 实现精确的零件级控制
- 支持独特布局（难以通过文本/图像 prompt 单独实现）

## 实用性评估

- **创新性**：⭐⭐⭐⭐ 组合式 3D 生成
- **实用性**：⭐⭐⭐⭐ 游戏和动画应用
- **实现难度**：中

## 应用场景

- 游戏资产生成
- 动画角色创建
- 需要零件级控制的创意工作流
