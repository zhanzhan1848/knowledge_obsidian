---
tags: [逆渲染, 线元, 几何重建, SIGGRAPH-Asia]
date: 2026-09-03
category: cs.GR
source: arXiv
conference: SIGGRAPH Asia 2026
---

# Inverse Rendering for Modeling with Line Primitives

## 核心方法

**SIGGRAPH Asia 2026** 论文。提出逆渲染方法重建模糊几何（头发、毛皮、纤维、纺织品），使用显式线段表示。

**核心创新：**
1. **线段表示**：使用亚像素网格光栅化线段，再现半透明外观
2. **随机可微光栅化器**：为线段的顶点位置、属性和离散连通性提供信息梯度
3. **模糊边界捕捉**：优于基于表面的方法，与体素表示质量相当

**与标准图形管线的兼容性：**
- 跨平台渲染
- 多种着色模型
- 物理仿真

## 算法复杂度

- 优化：随机可微光栅化，复杂度取决于线段数量
- 渲染：O(n) 线段光栅化

## 实现难度

- **算法复杂度**：高 (可微光栅化)
- **数值稳定性**：随机梯度估计
- **依赖项**：可微渲染器，线段光栅化实现

## 推荐结论

✅ 推荐实现 - 重要几何表示创新

## 开源参考

- Project: https://kenji-tojo.github.io/sa26-line-primitives/
- 相关库：可微渲染器 (Nerfstudio 等)

## 相关笔记

[[几何-线元]] [[逆渲染]] [[SIGGRAPH-Asia-2026]]
