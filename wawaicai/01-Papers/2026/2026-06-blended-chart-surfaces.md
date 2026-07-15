---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, surface-representation, blended-chart, smooth-surface, cs.GR]
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
| **作者** | Romy Williamson, Niloy Mitra |
| **发表** | arXiv cs.GR (2026-06-16) |
| **链接** | [原文](https://arxiv.org/abs/2606.18069) |
| **DOI** | 10.48550/arXiv.2606.18069 |

---

## 核心贡献

> 提出一种紧凑、无网络、显式表示的光滑曲面表示，通过"一环坐标"混合方案融合相邻多项式映射，实现跨面片边界的全局光滑性

1. **紧凑显式表示**：无需神经网络，基于多项式映射
2. **全局光滑性保证**：通过一环坐标混合方案确保面片边界处光滑
3. **拓扑与几何解耦**：代理网格携带拓扑和粗略几何，局部面片携带几何细节
4. **微分量直接访问**：法线、表面积分等可直接计算
5. **等变性**：对代理网格的刚体运动和缩放具有等变性

---

## 技术方案

### 核心思想

给定编码目标曲面拓扑和近似几何的粗代理Mesh，联合优化每个代理顶点处的多项式映射以拟合隐式目标形状，无需输入参数化。相邻映射通过"一环坐标"混合方案融合。

### 关键技术

| 技术 | 说明 |
|------|------|
| 多项式映射 | 每个代理顶点处的局部多项式表示 |
| 一环坐标混合 | smooth blending scheme for neighboring maps |
| 隐式目标拟合 | 无需输入参数化 |
| 微分计算 | 可稳定求导获取法线和表面能量 |

---

## 与现有方法的对比

| 方面 | Blended Chart Surfaces | 隐式场 | 显式神经映射 |
|------|------------------------|--------|-------------|
| 紧凑性 | ✅ 高 | 中 | 低 |
| 光滑性 | ✅ 全局光滑 | ✅ 光滑 | ❌ 有缝 |
| 微分量访问 | ✅ 直接 | ❌ 需要等值面提取 | 中 |
| 可微优化 | ✅ 兼容 | ✅ 兼容 | ✅ 兼容 |
| 无需参数化 | ✅ | ✅ | ❌ 需要 |

---

## 实验结论

- 在各种拓扑和几何复杂度上验证
- 在紧凑性、简洁性、微分量访问和表达力之间取得良好权衡
- 跨面片边界保持光滑

---

## 局限性

- 依赖代理网格质量
- 多项式阶数选择影响表达力

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 适合几何处理下游任务
- **适用场景**: 曲面拟合、网格变形、几何优化
- **参考库**: Eigen (线性代数), libigl (几何处理)

---

## 相关工作

- [[MeshFlow SIGGRAPH2026]]
- [[Poisson Surface Reconstruction]]
