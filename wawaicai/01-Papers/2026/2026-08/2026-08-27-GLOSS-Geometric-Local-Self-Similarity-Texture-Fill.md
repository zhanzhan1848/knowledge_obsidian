---
title: "Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill"
authors: ["Chenyue Cai"]
date: 2026-08-26
arXiv: "2608.25461"
tags: [纹理合成, 几何自相似性, 参考引导, PBR材质]
---

# GLOSS: 几何局部自相似性学习用于忠实参考引导纹理填充

## 核心方法

利用形状的几何自相似性和几何-纹理相关性，训练形状特定的局部纹理生成与补全模型。

### 方法亮点

1. **局部纹理生成**：不依赖大规模 3D 数据集训练
2. **几何感知参考patch**：通过关注一组几何感知参考patch进行纹理迁移
3. **patchwise inpainting**：将任意新参考迁移到完整目标物体纹理

### 能力

- 本地几何条件纹理 inpainting
- 艺术家选择参考的引导
- 泛化到 PBR 材质和未见过的网格纹理迁移

### 应用

- 作为 Blender 插件已有 3D 纹理专业人士测试
- 获得积极反馈：可控性、实用性、创意自由度

## 项目页面
https://chenyuecai.github.io/gloss-page/

## 可行性评估

✅ **推荐关注**

- 问题新颖：局部纹理生成填补了生成纹理控制的空白
- 实用性高：已有 Blender 插件
- 与 ExMesh++ 互补：ExMesh++ 关注几何+材质分解，GLOSS 关注纹理生成

## 关键词
[[纹理合成]], [[几何自相似性]], [[PBR材质]], [[Blender插件]]
