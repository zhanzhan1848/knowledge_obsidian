---
title: "Diffuse Albedo Neural Texturing in the Wild"
authors: ["Guangyu Wang", "et al."]
date: 2026-06-26
venue: "arXiv"
status: important
tags: [渲染, 神经纹理, 漫反射反照率, 神经渲染, 纹理重建]
links:
  arXiv: "https://arxiv.org/abs/2606.30677"
  PDF: "https://arxiv.org/pdf/2606.30677"
  Project: "http://dante-wild.github.io"
---

## 核心贡献

1. **DANTE-W** - 野外大规模场景高保真漫反射反照率纹理恢复框架
2. 从非结构化图像集合融合生成式反照率先验
3. 通过物理原则神经渲染增强细粒度纹理细节
4. 与传统3D重建管道无缝集成

## 技术方案

### 问题
- 经典网格纹理技术直接混合多视角图像
- 不可避免地受制于 bake-in shading 和 cast shadows
- 在 relighting 时损害视觉保真度

### DANTE-W方法

1. **给定输入**
   - 重建的网格
   - 表面参数化

2. **神经纹理框架**
   - 通过表达性神经表示将视图空间生成反照率先验融合到一致的纹理空间
   - 通过物理原则神经渲染大幅增强细粒度纹理细节

## 评估

- 策划了包含多样化、细粒度纹理的基准数据集
- 包括真实世界野外场景和合成物体
- 验证了重建准确反照率纹理和提升relighting保真度的有效性

## 标签

#神经纹理 #漫反射反照率 #神经渲染 #纹理重建 #PBR
