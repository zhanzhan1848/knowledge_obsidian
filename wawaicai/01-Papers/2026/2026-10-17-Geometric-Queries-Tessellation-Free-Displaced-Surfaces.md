---
type: paper
created: 2026-10-17
updated: 2026-10-17
tags: [paper, displaced-surfaces, tessellation, geometric-queries, hierarchy, rendering, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.21584
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | (arXiv 2610.21584) — submitted 2026-10 |
| **发表** | arXiv cs.GR, 2026-10 |
| **链接** | [原文](https://arxiv.org/abs/2610.21584) |
| **DOI** | 10.48550/arXiv.2610.21584 |
| **代码** | (未在摘要中给出) |

---

## 核心贡献

> 提出**一阶纹理空间层次结构（first-order texture-space hierarchy）**，无需预细分即可直接在 displaced surface 上支持**采样、镜面 manifold 搜索、最近点查询**等几何查询。

1. 每个节点存**局部仿射高度平面 + 保守残差界**——比 scalar min-max 界更紧
2. 仿射平面 + 残差同时提供**曲面包围**（用于求交/距离搜索）和**面积估计**（用于采样）
3. 额外 slope bound 支持**镜面光路搜索**
4. 应用：焦散渲染、displaced emitter 采样、曲面 PDE 求解

---

## 技术方案

### 核心思想

传统 displacement map 必须先细分成密集三角网格才能查询。本方法用一个**带斜率信息的层次化高度场表示**，让查询可以直接走层次而无需 tessellation。

### 关键技术

| 技术 | 说明 |
|------|------|
| 局部仿射高度平面 | 每个纹理空间节点存一个平面近似 |
| 保守残差界 | 保留空间高度变化（scalar min-max 丢掉的信息） |
| Slope bound | 用于镜面搜索 |
| 纹理空间层次 | 支持对节点做剪枝 / 精确 / 近似三种遍历 |

### 算法复杂度

- 节点数取决于 displacement texture 分辨率
- 查询时间：O(log N) 层次遍历 + 节点内常数次求交
- 比预 tessellation 省内存：**避免每帧细分成密集 mesh**

---

## 公式

N/A（具体公式见论文，核心为 affine-plane + residual 表示）

---

## 实验结论

- **应用**: 焦散渲染、采样 displaced emitter、曲面 PDE 求解
- **结果**: 相对预 tessellation 大幅省内存；相对查询专用基线有性能提升；保留高效 ray tracing

---

## 局限性

- 一阶仿射近似——高曲率区域节点数需求增大
- 残差界的保守性影响查询精度（tight bound 与 hierarchy depth 的权衡）
- 主要面向渲染 / PDE 应用，对纯几何处理（如 mesh 简化）价值有限

---

## 相关工作

- 相关概念：[[displacement-mapping]]、[[tessellation-free-rendering]]、[[BVH]]
- 相关开源：pugixml-style 纹理压缩、OpenGL displacement map 扩展

---

## 实现建议

- **实现难度**: 中（层次结构 + 仿射平面拟合 + 残差界估计）
- **预期性能**: 内存节省明显（避免预 tessellation）
- **适用场景**:
  - 实时渲染 displacement map（影视级几何细节 + 实时帧率）
  - 几何 + PDE 联合求解（如曲面 Laplace 方程）
  - 微多边形几何 / 微表面表示
- **可借鉴**:
  - "仿射 + 残差"表示对 mesh 平滑 / 去噪 / 简化中的层级化也有价值
  - Slope bound 的传播规则可移植到曲面 normal bound 估计
- **推荐度**: ✅ 推荐关注（对实时 displaced surface 渲染 / 几何查询场景特别有价值）
