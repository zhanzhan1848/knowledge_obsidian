---
type: paper
created: 2026-08-30
updated: 2026-08-30
tags: [paper, rendering, texture, PBR, deep-learning]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2608.25461
---

# Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill (GLOSS)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill |
| **作者** | Chen Yuecai 等 |
| **发表** | arXiv cs.GR, 2026-08-27 |
| **链接** | [原文](https://arxiv.org/abs/2608.25461) |

---

## 核心贡献

> 利用几何自相似性实现可控制的参考引导纹理填充

1. **局部纹理生成方法**：不同于大规模 3D 数据集训练的全物体纹理生成，聚焦局部、数据需求量少的纹理生成方法
2. **几何自相似性利用**：利用自然和人造形状中存在的几何自相似性和几何-纹理相关性
3. **可扩展到 PBR 材质**：推广到 PBR 材质和未见网格的纹理迁移

---

## 技术方案

### 核心思想

训练形状特定的局部纹理生成和补全模型，从单张 3D 形状和图像模型先验中学习。通过几何感知的参考 patch 引导，完成从局部参考到完整纹理的空间迁移。

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何自相似性 | 利用形状自身的几何-纹理相关性 |
| Patch-wise Inpainting | 分块纹理补全 |
| PBR 材质迁移 | 支持物理渲染材质 |
| Blender addon | 已集成到 Blender 供专业纹理师使用 |

---

## 实验结论

- 在质量上优于或可比强基线
- 可控性和实用性获得 3D 纹理专业人员正面反馈
- 支持局部几何条件纹理修复

---

## 局限性

- 依赖于特定形状的训练
- 对于复杂几何形状效果可能有限

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 离线训练，实时推理
- **适用场景**: 游戏资产生成、纹理编辑、材质迁移

---

## 与渲染领域的关联

本文涉及 **PBR 材质** 和纹理生成，与以下渲染技术相关：
- 基于物理的材质系统
- 纹理空间映射
- 材质烘焙
- 图像条件纹理生成
