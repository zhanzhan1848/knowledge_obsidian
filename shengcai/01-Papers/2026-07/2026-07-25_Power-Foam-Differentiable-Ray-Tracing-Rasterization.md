---
type: paper
created: 2026-07-25
updated: 2026-07-25
tags: [paper, differentiable-rendering, ray-tracing, rasterization, Voronoi-foam]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.24994
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
| **作者** | Shrisudhan Govindarajan et al. |
| **发表** | arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2604.24994) |
| **DOI** | 10.48550/arXiv.2604.24994 |

---

## 核心贡献

> 将 Voronoi foam 推广为有界 power diagram，实现可微渲染中光线追踪与光栅化管线的高效统一

1. 将 Voronoi foam 推广为有界 power diagram，支持可控单元格范围
2. 无需训练时 Delaunay 三角化
3. 提出有向表面公式，显式建模内外界面
4. 几何与外观解耦，在表面上嵌入可微纹理

---

## 技术方案

### 核心思想

先前 foam 表示通过显式体素划分实现常数时间光线遍历，但无界单元格阻碍了高效的基于 tile 的光栅化。Power Foam 通过有界 power diagram 解决这一矛盾。

### 关键技术

| 技术 | 说明 |
|------|------|
| Bounded Power Diagram | 可控单元格范围，无需 Delaunay |
| Oriented Surface | 内外区域界面建模 |
| Decoupled Geometry/Appearance | 几何与纹理解耦 |
| 可微纹理 | 在表面上嵌入可微纹理 |

### 性能目标

- 保持 SOTA 光线追踪效率
- 光栅化性能与当前 3DGS 相当
- 统一的实时光线追踪/光栅化可微渲染

---

## 实验结论

- 论文 2026-04-27 v1 发布
- 实现了光线追踪与光栅化的统一

---

## 局限性

- 实现复杂度较高
- 对复杂场景的 power diagram 构建开销

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 统一光线追踪+光栅化实时性能
- **适用场景**: 可微渲染、逆渲染、实时 USD/Zombie 等应用
