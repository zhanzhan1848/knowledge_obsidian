---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, Gaussian-splatting, point-rendering, rendering, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://jorisar.nl/gaussian_point_splatting/
---

# Gaussian Point Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gaussian Point Splatting |
| **作者** | Joris Rijsdijk, Christoph Peters, Michael Weinmann, Ricardo Marroquim |
| **机构** | Delft University of Technology |
| **发表** | SIGGRAPH 2026 |
| **链接** | [项目页面](https://jorisar.nl/gaussian_point_splatting/) |
| **代码** | [GitHub](https://github.com/JorisAR/gaussian-point-splatting) |

---

## 核心贡献

> 提出Gaussian Point Splatting：一种结合3D Gaussian与点基渲染的新方法

1. 融合3D Gaussian Splatting的视觉质量与点基渲染的灵活性
2. 提出新的点 splatting 技术用于高质量渲染
3. 可能比传统Gaussian splatting更高效的渲染方式

---

## 技术方案

### 核心思想

3D Gaussian Splatting近期在场景重建和新视角合成方面取得突破。本工作探索将Gaussian分布以点基 splatting 的方式渲染，可能带来效率和质量的平衡。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian | 三维高斯分布表示 |
| Point Splatting | 点基绘制技术 |
| 体积渲染 | Volumetric rendering |
| 光栅化 | Rasterization-based |

### 潜在优势

- 点基渲染的内存效率
- Gaussian的连续体积表示
- 可能支持更高效的硬件加速

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 实时渲染、场景重建、AR/VR
- **推荐度**: ⭐⭐⭐⭐⭐ 3DGS的重要演进

---

## 相关工作

- 3D Gaussian Splatting (3DGS)
- Point-based Graphics
- Volumetric Rendering
- Delft University of Technology graphics research
