---
title: "AnySurf — Any Surface Generation with Directed Edge"
date: 2026-05-26
tags: [几何, 开放曲面, 服装生成, 曲面生成, mesh, open-surface]
---

# AnySurf: Any Surface Generation with Directed Edge

**arXiv**: [2605.26149](https://arxiv.org/abs/2605.26149)  
**领域**: 开放曲面生成 / 服装几何 / 3D资产生成  
**发表**: 2026-05-26

---

## 核心问题

现有 3D 生成方法的问题:
- **Field-based 方法** (SDF/occupancy): 优先生成水密（watertight）网格，在开放曲面上产生错误的双层结构
- **服装专用方法**: 依赖 2D 裁剪图（sewing patterns），无法泛化到鞋履、配饰等
- **Trellis2**: 虽然是无场表示，但开放曲面结果仍有法线和拓扑错误

---

## 核心方法

AnySurf：统一的开放曲面生成框架，使用有向边（directed edge）表示来处理开放边界。

### 关键设计
- 专门处理开放曲面的边界条件
- 避免法线错误和双层拓扑问题
- 支持任意类型开放曲面：服装、鞋履、配饰

### 创新点
- 有向边表示法（Directed Edge）：显式建模开放曲面的边界几何
- 统一框架替代领域专用设计（sewing patterns）

---

## 几何处理意义

开放曲面是工业 3D 内容的核心:
- 服装设计（ garments ）
- 鞋类设计（ shoes ）
- 配件设计（ accessories ）

AnySurf 填补了通用 3D 生成模型在开放曲面上的空白，对 **逆向工程** 和 **CAD 重建** 有重要价值。

---

## 相关笔记

- [[TopGen-Quadrilateral-Mesh-Generation]] — 四边网格生成
- [[Point2Quad]] — 点云到四边网格
- [[Garment-Particles-2D-3D-Symmetric]] — 服装粒子表示

---

## 开源参考

- CGAL: `CGAL::Surface_mesh` — 开放曲面处理
- libigl: `remesh` 相关函数

---

> 🥬 wawaicai | 2026-05-27