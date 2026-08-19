---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [mesh-processing, deformation-handles, remeshing, reduction, elastodynamics]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.17930
---

# Decimation for Deformation Handles with Compact Support and Low Memory Footprints

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Decimation for Deformation Handles with Compact Support and Low Memory Footprints |
| **作者** | David I W Levin et al. |
| **发表** | arXiv cs.GR (v1: 18 Aug 2026) |
| **链接** | [原文](https://arxiv.org/abs/2608.17930) \| [PDF](https://arxiv.org/pdf/2608.17930) \| [HTML](https://arxiv.org/html/2608.17930v1) |
| **DOI** | 10.48550/arXiv.2608.17975 |

---

## 核心贡献

> 首个基于网格简化（decimation）计算稀疏、紧支撑（compactly supported）变形句柄的算法，支持任意高 genus 或多孔体网格，且不改变几何形状。

1. 迭代代数简化（iterative algebraic simplification）优化变形句柄以匹配任意输入变形（如线性振动模态）
2. 高效算法计算紧支撑及其关联权重
3. 基于紧支撑的快速简化求积（reduced-cubature）计算方案

---

## 技术方案

### 核心思想

通过**网格简化**而非传统方法（如笼式变形、ROM）来构建变形句柄。传统 ROM 使用 handles 控制顶点组，但本文首次提出基于 decimation 的方法，自动发现紧支撑的稀疏句柄集。

### 关键技术

| 技术 | 说明 |
|------|------|
| 迭代代数简化 | 优化 handle 变形以匹配输入变形场（如振动模态） |
| 紧支撑计算 | 高效算法计算和更新 compact supports 及权重 |
| Reduced-cubature | 利用紧支撑特性加速积分计算 |
| 体积网格处理 | 支持任意 genus 和多孔特征网格（不改变几何） |

### 核心算法流程

1. 输入任意体积四面体网格
2. 迭代代数简化：为每个顶点计算紧支撑句柄权重
3. 优化句柄以匹配目标变形（如线性振动模态）
4. 利用紧支撑特性加速 reduced-cubature
5. 输出：稀疏紧支撑句柄 → 实时弹性动力学模拟

---

## 实验结论

- **数据集**: 多种四面体网格，最高 796,623 个四面体
- **结果**: 在复杂几何上实现实时弹性动力学模拟
- **性能**: 内存高效，handle 数量远小于顶点数量
- **应用**: 计算机动画、工程、机器人仿真中的物理模拟

---

## 局限性

- 依赖输入变形场（如模态）作为监督信号
- 紧支撑优化质量与目标变形的表达能力相关

---

## 实现建议

- **实现难度**: 中高（需理解四面体网格 + 代数简化 + 几何处理）
- **开源依赖**: libigl（四面体网格处理）、CGAL（几何算法）
- **适用场景**: 实时变形仿真、角色动画、有限元模型简化
- **推荐度**: ⭐⭐⭐⭐ 高价值，与网格处理和重网格化直接相关

---

## 相关工作

- [[网格简化]] / [[Quadric Error Metrics]]
- [[变形动画]] / [[Reduced Order Methods]]
- [[物理仿真]] / [[弹性体模拟]]
