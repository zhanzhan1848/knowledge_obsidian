---
title: "Interactive Stroke-based Neural SDF Sculpting"
authors: ["Fizza Rubab", "Yiying Tong"]
date: 2026-08-19
tags: [几何, 神经SDF, 雕刻, 3D编辑, Implicit-Representation]
cite: "arXiv:2502.02891v2"
conference: "High-Performance Graphics 2025"
doi: "10.2312/vmv.20251230"
---

# Interactive Stroke-based Neural SDF Sculpting

## 核心方法

本文提出一个**交互式神经SDF雕刻框架**，允许用户直接在神经隐式表示上进行笔画式修改。

### 核心创新点

1. **笔画雕刻**: 用户可在神经SDF上进行笔画式修改，而非仅限点编辑
2. **管状邻域采样**: 使用管状邻域采样笔画
3. **可定制画笔轮廓**: 实现沿用户定义曲线的平滑变形
4. **保持隐式表示的平滑性**: 编辑同时保持神经场的平滑特性

### 技术框架

```
笔画定义 → 管状邻域采样 → 画笔轮廓应用 → SDF更新 → 实时渲染
```

### 与传统方法对比

| 方法 | 优点 | 缺点 |
|------|------|------|
| ZBrush (Mesh) | 直观编辑 | 需要切换表示 |
| 现有Neural SDF | 连续平滑 | 仅支持点编辑 |
| 本文方法 | 笔画编辑 + 保持平滑 | 需优化性能 |

## 开源实现

- **libigl**: 等值面提取 `marching_cubes`
- **神经隐式**: NeRF++, Instant NGP

## 几何相关性

✅ **高相关**: 直接涉及3D几何编辑
- SDF表面编辑
- 等值面提取 (Marching Cubes/Tetrahedra)
- 变形传播

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐ 中等 |
| 应用价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

神经隐式表示是当前3D几何研究热点，笔画雕刻提供了更直观的编辑方式，具有很高的实用价值。

## 相关笔记
[[2026-08-20-SuperSDF-Sparse-SDF-Super-Resolution]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: arXiv cs.GR (更新: 2026-08-19), HPG 2025*
