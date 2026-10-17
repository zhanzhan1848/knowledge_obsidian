---
type: paper
created: 2026-10-17
updated: 2026-10-17
tags: [paper, fluid-rendering, water-rendering, displacement-mapping, caustics, ray-tracing, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.21584
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | Bing Xu, Yang Zhou, Brian Budge |
| **发表** | arXiv preprint 2026-10-15 |
| **链接** | [原文](http://arxiv.org/abs/2610.21584v1) |
| **DOI** | [10.48550/arXiv.2610.21584](https://doi.org/10.48550/arXiv.2610.21584) |
| **代码** | 未公开（arXiv 提交）|
| **分类** | cs.GR (primary) |

---

## 核心贡献

> 提出首个**无需预镶嵌**（tessellation-free）的置换表面几何查询统一框架，把 caustics 渲染、置换发射器采样、表面 PDE 求解这三大任务从"必须预镶嵌"中解放出来

1. **一阶纹理空间层级**：每个节点存储局部仿射高度平面 + 保守残差边界，保留标量 min-max 边界丢失的空间高度变化
2. **几何查询解锁**：表面采样、镜面流形搜索、最近点查询不再需要预镶嵌
3. **三个应用演示**：caustics 渲染、采样置换发射器、表面 PDE 求解器
4. **节省内存**：相比预镶嵌方案大幅减少内存占用

---

## 技术方案

### 核心思想

传统 displacement mapping 流程：
- 高分辨率高度纹理 → 预镶嵌成稠密三角网格 → 才能查询（采样、求交、最近点）
- 问题：**内存爆炸**（高度纹理每像素 1 顶点，远超预算）

本文方案：
- 一阶纹理空间层级（**不依赖预镶嵌**）
- 每个层级节点：`[local affine height plane] + [conservative residual bound]`
- 仿射平面 + 残差 → 提供**表面封闭性**（surface enclosures）
- 平面斜率 → 提供**面积估计**、**法线边界**、**镜面路径搜索支持**

### 关键技术

| 技术 | 说明 |
|------|------|
| 一阶纹理空间层级 | 节点 = (仿射平面, 残差边界)，保留空间变化 |
| 表面封闭性 | 用于曲面求交和距离搜索 |
| 面积估计 | 由平面高度和斜率推导，用于重要性采样 |
| 斜率边界 | 用于镜面光线路径搜索（specular light-path search）|
| Query-specific traversal | 针对不同查询定制的遍历/剪枝/采样算法 |

### 三个演示场景

#### 1. Caustics 渲染

- 光线穿过**波动表面**（如水/玻璃）→ 折射后聚焦形成 caustics
- 传统方法需要预镶嵌成稠密网格
- 新方法：直接对一阶层级做光线追踪，仿射平面提供求交
- **与流体渲染关系**：水面焦散是水/海洋渲染的核心难点

#### 2. 采样置换发射器

- 波动表面（如海面、湖面）作为发射光的光源
- 需要在表面随机采样发射点（按面积加权）
- 新方法：平面斜率 → 面积估计 → 重要性采样
- **与流体渲染关系**：海面作为反射光的发射体（specular reflection sampling）

#### 3. 表面 PDE 求解器

- 求解表面上的偏微分方程（如水波方程）
- 需要曲面几何查询（最近点、曲率、法线）
- 新方法：直接对一阶层级求几何量
- **与流体渲染关系**：水波方程是实时水面动画的物理基础

---

## 与流体渲染的关联

### 直接应用

1. **水面焦散（Caustics）**：无需预镶嵌即可渲染波动表面聚焦光斑 → 适用于实时水面
2. **海面反射采样**：波动海面作为反射光源采样器
3. **水波方程求解**：直接在层级结构上做水波模拟
4. **玻璃/透明液体渲染**：透光容器内的液体表面

### 与现有方案对比

| 方案 | 内存 | 实时性 | 适用场景 |
|------|------|--------|----------|
| 传统预镶嵌 | 高（受镶嵌密度限制）| 中 | 离线渲染 |
| Tessellation-free (前作) | 低 | 高 | 仅基础求交 |
| **本文** | 低 | 高 | **基础求交 + caustics + 采样 + PDE** |

### 与近期工作联系

- **Make It Flow (2610.13860)**: 3DGS 水流动效（光学流驱动）— 关注动效
- **OuroWorld (2610.12461)**: 3DGS 周期循环动效 — 关注循环
- **Fluid-Gen-Zero (2610.10984)**: 物理感知流体视频生成 — 关注生成
- **本文**: 关注**静态波动表面**的高质量几何查询

→ 互补关系：本文补齐"波动表面几何精度"环节，与动效生成类工作互补

---

## 推荐度

✅ **推荐**

理由：
- 内存节省显著
- 性能优于 query-specific baselines
- 对水面/海面渲染工程有直接借鉴价值
- 应用范围广（caustics / 采样 / PDE）

适用场景：
- 实时水面渲染（焦散 + 反射）
- 海面渲染引擎
- 玻璃容器中的液体渲染
- 任何需要高质量置换表面几何的实时应用

---

## 引用信息

```bibtex
@article{xu2026tessfree,
  title={Geometric Queries on Tessellation-Free Displaced Surfaces},
  author={Xu, Bing and Zhou, Yang and Budge, Brian},
  journal={arXiv preprint arXiv:2610.21584},
  year={2026}
}
```

---

## 🔗 相关论文

- [[2026-10-13-Make-It-Flow]] — 3DGS 水流动效
- [[2026-10-13-OuroWorld]] — 3DGS 循环动效
- [[2026-10-13-Fluid-Gen-Zero]] — 物理感知流体视频生成
- [[2026-10-17-Daily-Research-Summary]] — 今日报告

---

*由豆苗自动整理于 2026-10-17 14:05 UTC*
