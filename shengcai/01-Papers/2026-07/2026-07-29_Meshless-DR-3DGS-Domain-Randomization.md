---
type: paper
created: 2026-07-29
updated: 2026-07-29
tags: [paper, 3DGS, domain-randomization, sim-to-real, rendering, rasterization]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.22890
---

# Meshless Domain Randomization via Explicit Parameter Perturbation of 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Meshless Domain Randomization via Explicit Parameter Perturbation of 3D Gaussian Splatting |
| **作者** | （见论文） |
| **机构** | （见论文） |
| **发表** | arXiv cs.GR (2026-07-28) |
| **链接** | [原文](https://arxiv.org/abs/2607.22890) |
| **PDF** | [下载](https://arxiv.org/pdf/2607.22890) |

---

## 核心贡献

> 提出基于 3DGS 参数空间操作的 Meshless 领域随机化框架，通过 SH 系数扰动和 3D 空间噪声替换复杂几何有机体的纹理和光照，而非依赖传统多边形网格渲染

1. **光度 DR 管道 (Photometric DR)**：通过调制球谐 (SH) 系数改变 baked 光照和色彩平衡，无需重新渲染几何

2. **程序化 DR 管道 (Procedural DR)**：用 3D 空间噪声替换原始纹理，隔离主体几何形状用于 Sim-to-Real

3. **无网格替代方案**：为复杂有机几何（昆虫标本等）提供传统多边形网格提取和渲染的替代方案

---

## 技术方案

### 传统 DR 的局限
- 依赖多边形网格进行经典计算机图形渲染
- 复杂有机主体（昆虫标本等）难以提取和渲染带纹理网格
- 几何复杂导致 Sim-to-Real gap 难以弥合

### Meshless DR 框架
```
原始 3DGS 表示
    ↓
光度 DR
    └─ SH 系数调制 → 改变 baked 光照和色彩平衡
    ↓
程序化 DR
    └─ 3D 空间噪声替换原始纹理 → 隔离几何形状
    ↓
合成
    └─ 光栅化引擎中与随机背景合成
```

### SH 系数扰动
```math
L_{new}(p) = \sum_{l=0}^{N} \sum_{m=-l}^{l} (c_{lm} + \Delta c_{lm}) \cdot Y_{lm}(p)
```
通过扰动球谐系数 $c_{lm}$ 改变光照和颜色，但保持几何不变。

### 3D 空间噪声替换
用程序化 3D 噪声场替换原始纹理/颜色，实现几何形状隔离的同时保留丰富的随机性。

---

## 实验结论

- 在昆虫标本等复杂有机几何上验证了 Sim-to-Real 数据集生成
- 参数操控提供复杂几何无网格替代方案
- 可生成鲁棒数据集用于训练

---

## 局限性

- 生成的随机化数据与真实场景仍有差异
- SH 扰动可能产生物理上不合理的光照组合
- 对非有机几何（机械零件等）适用性未验证

---

## 可行性分析

| 维度 | 评分 |
|------|------|
| **创新性** | ⭐⭐⭐⭐ 参数空间 DR 是新思路，避免网格提取 |
| **实用性** | ⭐⭐⭐⭐ 有助于 Sim-to-Real 迁移，尤其是有机物体 |
| **实现难度** | ⭐⭐⭐ 中等，主要涉及 SH 系数操作 |
| **适用场景** | 机器人抓取、合成数据生成、物体识别训练 |

**推荐结论**: ⚠️ 谨慎评估（适合特定场景参考，非通用渲染技术）

---

## 相关工作

- Domain Randomization (DR)
- 3D Gaussian Splatting (3DGS)
- Sim-to-Real gap
- Spherical Harmonics (SH)

---

## 标签

#渲染 #3DGS #领域随机化 #Sim-to-Real #合成数据 #光栅化 #2026
