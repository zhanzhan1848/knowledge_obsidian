---
type: paper
created: 2026-06-26
updated: 2026-06-26
tags: [paper, surface-representation, explicit-representation, geometry-processing]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.18069
---

# Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting |
| **作者** | Romy Williamson et al. |
| **发表** | arXiv cs.GR |
| **链接** | [原文](https://arxiv.org/abs/2606.18069) |

---

## 核心贡献

> 提出一种紧凑、无网络、显式、构造光滑的曲面表示

1. **构造光滑**: 全局光滑保证，无接缝伪影
2. **显式表示**: 无需 iso-surfacing，可直接访问
3. **可微优化**: 兼容现代可微优化
4. **局部多项式映射**: 每个代理顶点优化多项式映射拟合隐式目标形状
5. **one-ring blending**: 平滑融合方案

---

## 技术方案

### 核心思想

现有表示的问题：
- 隐式场需要 iso-surfacing
- 显式神经地图受限于标准域参数化或接缝伪影

Blended Chart Surfaces：
- 给定粗糙代理网格（编码拓扑和近似几何）
- 每个顶点优化局部多项式映射
- 使用 one-ring 坐标混合方案融合相邻映射

### 关键技术

| 技术 | 说明 |
|------|------|
| 多项式映射 | 代理顶点上的多项式地图拟合隐式形状 |
| One-ring blending | 一环坐标平滑混合 |
| 刚体/缩放等变 | 对代理网格的刚体运动和缩放等变 |

---

## 实验结论

- **紧凑性**: 优于 mesh-displacement MLPs
- **简单性**: 无需网络
- **可访问微分**: 稳定求导，可直接访问法线和表面能量

---

## 局限性

- 依赖粗糙代理网格质量
- 局部多项式表达能力有限

---

## 实现建议

- **实现难度**: 中 (基于优化，非学习方法)
- **适用场景**: 几何处理、可微优化、曲面拟合

---

## 相关工作

- [[Surface Representation]]
- [[Mesh Processing]]
- [[Parameterization]]
- [[Implicit to Explicit]]