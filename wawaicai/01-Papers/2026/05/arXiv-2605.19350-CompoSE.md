---
title: "CompoSE: Compositional Synthesis and Editing of 3D Shapes via Part-Aware Control"
authors: []
date: 2026-05-19
venue: arXiv cs.GR
tags: [几何, 3D 生成, 扩散 Transformer, 部件感知]
---

# CompoSE: Compositional Synthesis and Editing of 3D Shapes via Part-Aware Control

## 核心方法

提出 **CompoSE**，通过部分感知控制进行 3D 形状的组合合成与编辑。

### 技术要点

1. **输入**: 粗略几何基元（如边界框）表示的不同对象部分
2. **输出**: 部分分离的 3D 对象，支持局部粒度编辑
3. **核心架构**: 扩散 Transformer
   - 局部处理每个部分
   - 全局聚合上下文信息
   - 条件技术确保强依从用户输入

### 编辑能力

- 上下文感知替换
- 添加、删除
- 保留风格的大小调整

## 推荐结论

⚠️ **谨慎评估** - 3D 生成应用，与几何处理有一定关联

## 相关技术

- [[3D Shape Synthesis]], [[Diffusion Transformer]], [[Part-aware Editing]], [[Mesh Generation]]