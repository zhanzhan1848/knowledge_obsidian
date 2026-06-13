---
title: Palette-Based Material Decomposition and Physically-Based Relighting with 2D Gaussian Splatting
authors: Hao Zhang et al.
date: 2026-06-08
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.09018
pdf: https://arxiv.org/pdf/2606.09018
tags: [rendering, PBR, material-decomposition, gaussian-splatting, relighting, BRDF, 2026]
status: unread
---

# Palette-Based Material Decomposition and Physically-Based Relighting with 2D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Palette-Based Material Decomposition and Physically-Based Relighting with 2D Gaussian Splatting |
| 作者 | Hao Zhang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.09018) |
| PDF | [下载](https://arxiv.org/pdf/2606.09018) |

## 核心贡献
1. 提出MaterialClusterGS，基于调色板的2D Gaussian Splatting材质分解框架
2. 使用紧凑的全局共享BRDF原型调色板，通过连续空间材质场分配
3. 解决现有方法将独立BRDF参数分配给单个基元导致的欠约束问题
4. 支持物理基础重光照和材质编辑

## 技术方案
**问题**：
- 现有高斯逆渲染方法为每个基元分配独立BRDF参数
- 局部拟合策略使材质恢复高度欠约束
- 阴影、间接光照、几何误差和可见性残差被吸收到数千个略微不同的局部材质估计中

**MaterialClusterGS解决方案**：
- **全局调色板**：共享BRDF原型集合
- **连续空间材质场**：通过MLP学习从空间位置到调色板索引的映射
- **联合优化**：同时优化材质场、调色板原型和环境光照

```python
# 核心概念：空间材质场
def material_field(position):
    palette_weights = mlp(position)
    return blend_palette_prototypes(palette_weights)
```

## 实验结论
- 恢复紧凑、空间连贯的属性
- 可直接用于材质编辑、重光照和迁移
- 相比per-primitive方法有更一致的跨区域编辑效果

## 局限性
- 调色板大小的选择需要先验知识
- 复杂多材质场景的分解挑战

## 可行性分析
- 实现难度：中（需要联合优化框架）
- 性能预期：适合离线渲染和静态场景
- 适用场景：基于图像的材质分解、重光照、材质迁移

## 相关工作
- 2D Gaussian Splatting
- Inverse rendering for Gaussian splatting
- Palette-based appearance methods
- BRDF estimation

## 笔记
**推荐优先级：中**

本文提出了一个实用的材质分解方案，通过全局调色板解决per-primitive材质估计的欠约束问题。对于需要从单视图或多视图图像中提取材质属性的应用有价值。核心思想与材质聚类概念相关，可能对材质库构建和材质迁移有启发。