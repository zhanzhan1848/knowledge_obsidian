---
type: paper
created: 2026-04-30
updated: 2026-04-30
tags: [paper, ray-tracing, rasterization, differentiable-rendering, neural-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.24994
---

# Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Unifying Real-Time Differentiable Ray Tracing and Rasterization |
| **作者** | arXiv submission |
| **发表** | arXiv cs.GR (2026-04-29) |
| **链接** | [原文](https://arxiv.org/abs/2604.24994) |
| **DOI** | 10.48550/arXiv.2604.24994 |
| **代码** | TBD |

---

## 核心贡献

> 将基于泡沫的射线追踪能力与现代化光栅化管线统一，实现同时支持射线追踪效率和光栅化性能的差异化渲染

1. 将 **Voronoi foams** 泛化为 **Bounded Power Diagrams**，实现空间有界的原语，无需在训练期间进行昂贵的 Delaunay 三角剖分
2. 提出 **Oriented Surface Formulation**，显式建模内外部区域界面，解耦几何与外观
3. 在可微纹理中嵌入，把纹理直接贴合在曲面上

---

## 技术方案

### 核心思想

先前基于泡沫的表示通过空间显式划分实现常数时间射线遍历，但其无界单元阻碍了高效的基于瓦片的光栅化。

通过将有界 Power Diagrams 与可控单元范围结合，解决了这个限制。

### 关键技术

| 技术 | 说明 |
|------|------|
| Bounded Power Diagrams | 有界单元，支持高效光栅化 |
| Oriented Surface Formulation | 显式建模内外部界面 |
| Differentiable Texture | 纹理直接嵌入曲面 |
| 射线追踪效率 | 保持state-of-the-art射线追踪效率 |
| 光栅化性能 | 与3DGS竞争的光栅化性能 |

---

## 实验结论

- 保持state-of-the-art射线追踪效率
- 实现与当前一代3DGS竞争的光栅化性能
- 为统一实时差异化渲染提供了实用路径

---

## 局限性

- 实现复杂度较高
- 需要对曲面方向进行显式建模

---

## 实现建议

- **实现难度**: 高（涉及多种渲染技术融合）
- **预期性能**: 射线追踪 + 光栅化双优
- **适用场景**: 实时可微渲染，游戏渲染，混合渲染管线
- **优先级**: 高 - 可能成为下一代渲染架构

---

## 相关工作

- [[Differentiable Rendering]]
- [[Ray Tracing]]
- [[Rasterization]]
- [[3D Gaussian Splatting]]