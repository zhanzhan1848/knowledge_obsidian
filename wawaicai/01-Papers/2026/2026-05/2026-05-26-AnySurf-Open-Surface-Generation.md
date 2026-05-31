---
tags: [几何, open-surface, mesh-generation, directed-edge, garments]
title: AnySurf - Any Surface Generation with Directed Edge
authors: AnySurf Authors
date: 2026-05-26
source: arXiv
venue: cs.GR
---

# AnySurf: Any Surface Generation with Directed Edge

## 核心方法

使用 **directed-edge enhanced Flexible Dual Grid (FDG-D)**统一生成开放/封闭/混合 3D 曲面，解决开放曲面的 normal 和 topology 错误。

###关键创新
1. **FDG-D 表示**: 通过 oriented grid edges 保留法向量方向信息
2. **ROS-FT post-training**: 保持原有生成性能的同时学习 directed edge
3. **DE-Adapter**: 仅 1% 额外参数

### 问题背景
- 现有 field-based 3D 生成器优先生成 watertight meshes
- 在开放曲面上产生错误的 double-layer 结构
- Trellis2 的开放曲面结果仍有 normal 和 topology 错误

## 数据集
- **Outfit3D**: 包含工业服装和封闭配饰

## 几何处理相关性

⭐⭐⭐⭐⭐ **直接相关** - 3D 几何生成是几何处理的核心任务

## 应用场景
- 服装建模
- 鞋子生成
- 配饰设计
- 统一的 3D 生成框架

## 链接
- GitHub: 待确认

## 评估
✅ **强烈推荐** - 解决开放曲面生成的实际问题，技术创新明确