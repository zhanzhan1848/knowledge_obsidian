---
type: paper
created: 2026-07-03
updated: 2026-07-03
tags: [paper, surface-representation, parametrization, smooth-surface, chart-mesh]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2606.18069
---

# Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting |
| **作者** | Romy Williamson (UCL), Niloy Mitra (UCL, Adobe) |
| **发表** | arXiv cs.GR (2026-06-16), Submitted to Eurographics 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.18069) |
| **DOI** | 10.48550/arXiv.2606.18069 |
| **代码** | - |

---

## 核心贡献

> 提出一种紧凑、无网络、显式表示的曲面表示方法，在给定粗代理网格编码的拓扑和近似几何下，联合优化每个代理顶点处的多项式映射，跨面片边界全局光滑

1. **显式光滑表示**: 无需神经网络，紧凑且显式，由用户提供的拓扑锚定
2. **多项式映射优化**: 给定编码目标曲面拓扑和近似几何的粗代理网格，在每个代理顶点处联合优化多项式映射
3. **One-ring混合**: 相邻映射使用光滑的"单环坐标"混合方案，解耦拓扑/粗几何与局部面片承载的几何细节
4. **微分友好**: 全局光滑、完全可微，支持稳定求导，微分量和表面能量可直接访问
5. **等变性**: 对代理网格的刚体运动和缩放具有等变性

---

## 技术方案

### 核心思想

适合几何处理的曲面表示应满足：
- 紧凑且显式
- 提供全局光滑性保证
- 支持多种曲面拓扑
- 可靠访问微分量（法线、表面能量）
- 与现代可微优化兼容

现有神经表示的局限：
- 隐式场通常需要等值面提取
- 显式神经映射受限于规范域参数化或局部面片间接缝伪影

Blended Chart Surfaces通过以下方式解决：
- 给定粗代理网格编码拓扑和近似几何
- 在每个代理顶点优化多项式映射以拟合隐式目标形状
- 无需输入参数化
- 使用"单环坐标"混合方案融合相邻映射

### 关键技术

| 技术 | 说明 |
|------|------|
| 多项式映射 | 每个代理顶点处的局部参数化 |
| One-ring blending | 光滑混合相邻面片 |
| 隐式目标拟合 | 避免等值面提取 |
| 微分求导 | 支持法线和表面能量计算 |

---

## 公式

核心混合公式（one-ring坐标）：
$$S(p) = \sum_{i \in N(p)} w_i(p) \cdot P_i(\phi_i(p))$$

其中 $w_i$ 是权重函数，$P_i$ 是顶点 $i$ 处的多项式映射，$\phi_i$ 是局部参数化坐标。

光滑性条件：
$$\nabla S(p) = 0 \text{ 跨面片边界}$$

---

## 实验结论

- **数据集**: 多种拓扑和几何复杂度
- **基线**: 插值函数基线、网格位移MLP等显式替代方法
- **结果**: 在紧凑性、简单性、微分量访问和表达力之间取得良好权衡
- **特点**: 面片边界处保持光滑

---

## 局限性

- 依赖粗代理网格质量
- 多项式阶数选择影响表达力和复杂度平衡
- 高频细节表达能力可能受限

---

## 相关工作

- 隐式神经表示 (NeRF, SIREN, etc.)
- 曲面参数化 (LSCM, ABF++)
- 网格位移方法
- 分段参数化方法

---

## 实现建议

- **实现难度**: 中 (需要优化和参数化基础)
- **预期性能**: O(n) 评估，可微
- **适用场景**: 曲面拟合、几何处理、可微渲染
- **开源参考**:
  - libigl: `parameterize`, `lscm`, `harmonic`
  - CGAL: 曲面参数化相关
