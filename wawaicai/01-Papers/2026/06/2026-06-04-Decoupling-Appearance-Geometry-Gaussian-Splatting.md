---
title: "Decoupling Appearance and Geometry in Gaussian Splatting"
date: 2026-06-04
tags: [geometry-processing, 3DGS, Gaussian-splatting, surface-representation, rendering]
cite: arXiv:2606.05124
authors: Hongyu Zhou
subjects: cs.GR, cs.CV, cs.LG
---

# Decoupling Appearance and Geometry in Gaussian Splatting

## 核心方法

本文揭示了 **3D Gaussian Splatting (3DGS)** 在同时表示纹理和几何时的固有矛盾，并提出解决方案。

### 关键发现

3DGS 默认形式**天生不适合**同时表示纹理和几何。通过使用完整的 ground-truth 纹理和几何信息训练验证了这一点。

### 解决方案

1. **几何不透明度参数**: 对每个 splat 应用单一额外的几何不透明度参数
2. **可选的透明度筛选优化流程**: 进一步提升性能

## 算法复杂度

- **时间复杂度**: 与标准 3DGS 相当
- **空间复杂度**: 每个 splat 增加一个参数
- **性能提升**: 在各种数据集上改进渲染和几何性能

## 技术细节

### 核心问题

标准 3DGS 试图用同一组参数同时编码：
- 外观（颜色、纹理）
- 几何（表面位置、法线）

这导致两者相互干扰。

### 解决方案架构

```
3DGS splat → [外观参数 | 几何不透明度参数]
                    ↓
          独立优化 → 改进的渲染 + 几何性能
```

### 实验结果

- 使用 ground-truth 和视觉基础模型几何输入
- 在各种数据集上展现改进的渲染和几何性能
- **复杂场景（含透明物体）效果显著提升**

## 开源实现

- **项目链接**: https://arxiv.org/abs/2606.05124
- **参考库**: 3DGS, Gaussian Splatting 相关实现

## 相关笔记

[[3D-Gaussian-Splatting]]
[[Geometry-appearance-decoupling]]
[[Transparent-object-rendering]]

## 可行性分析

✅ **推荐实现**

| 评估项 | 评分 |
|--------|------|
| 算法复杂度 | 低（只需增加一个参数） |
| 数值稳定性 | 高 |
| 实现难度 | 低（改动小） |
| 实用性 | 高（解决实际问题） |

### 推荐理由

1. **简单有效**: 仅增加一个几何不透明度参数
2. **通用性强**: 适用于各种3DGS变体
3. **特殊场景优化**: 对透明物体效果显著
4. **兼容性好**: 可与现有3DGS 管线结合

### 依赖项

- 3D Gaussian Splatting 基础实现
- 优化框架（用于联合优化）