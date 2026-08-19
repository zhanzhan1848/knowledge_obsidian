---
tags: [渲染, differentiable-rendering, voxelization, SIGGRAPH-2026, 2026]
date: [[2026-08-19]]
status: 待读
source: arXiv cs.GR (SIGGRAPH 2026)
---

# Differentiable Voxelization of Surface Representations

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Tobias Djuren 等 |
| 发表 | SIGGRAPH Conference Papers 2026 |
| 年份 | 2026 |
| 链接 | https://arxiv.org/abs/2608.15934 |
| DOI | https://doi.org/10.1145/3799902.3811203 |
| PDF | https://arxiv.org/pdf/2608.15934 |

## 核心贡献

1. **问题**：不同形状表示适合不同计算——表面表示（mesh）适合建模，体积表示适合空间查询（相交、包容）

2. **目标**：通过梯度下降优化表面表示以满足体积属性，需要体积相对于边界表面的梯度

3. **方法**：推导了**绕数（winding numbers）的梯度公式**，可在规则网格（体素表示）和顶点集（三角形网格）上高效计算

## 技术方案

应用场景：
- **变形网格以解决相交问题**
- **可制造性优化**（三方向锯切）
- **密铺 3D 空间形状创建**

## 创新性

- ⭐⭐⭐⭐ SIGGRAPH 2026 论文，可微体素化方法有明确创新

## 实用性

- ⭐⭐⭐⭐ 多种工程应用场景

## 推荐度

**✅ 推荐实现**

对可微渲染和逆向图形研究有参考价值。

## 相关工作

- 相关概念：Differentiable Rendering, Voxelization, Winding Number, Mesh Processing
