---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, intrinsic-mesh, geodesic-distance, triangulation, cs.CG]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.04989
---

# Intrinsic Meshing of Closed Surfaces Using Geodesic Distances

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Intrinsic Meshing of Closed Surfaces Using Geodesic Distances |
| **作者** | Tim Gabriel et al. |
| **发表** | arXiv cs.CG (2026-07-06) |
| **链接** | [原文](https://arxiv.org/abs/2607.04989) |
| **DOI** | 10.48550/arXiv.2607.04989 |

---

## 核心贡献

> 提出基于精确测地线的闭合离散曲面的内在三角化方法，边对应最短测地路径，面的几何基元继承自底层Mesh

1. **测地线路径边**：边直接对应曲面上的最短测地路径
2. **局部优化操作**：通过边交换、边分裂、边折叠、三角形分裂直接在曲面上构建内在网格
3. **A*搜索加速**：将测地线计算降至标准传播成本的约3%
4. **高阶网格生成基础**：为直接高阶网格生成提供自然基础
5. **Thingi10K验证**：在近5000个几何复杂模型上验证

---

## 技术方案

### 核心思想

从封闭输入三角网格开始，通过局部优化操作（边交换、分裂、折叠、三角形分裂）直接在曲面上构建内在网格，不修改原始几何。元素大小通过特征长度场控制，质量通过基于角度的准则强制执行。

### 关键技术

| 技术 | 说明 |
|------|------|
| 连续Dijkstra | 精确计算测地线距离 |
| A*搜索策略 | 加速至约3%标准成本 |
| 内在三角化 | 边=测地路径，面=几何基元 |
| 局部优化操作 | 边交换/分裂/折叠/三角形分裂 |

---

## 算法复杂度

- **测地线计算**: O(n log n) with A*加速
- **内在网格构建**: 取决于目标网格密度
- **空间复杂度**: O(n)

---

## 实验结论

- 在Thingi10K数据集近5000个模型上验证
- 支持细化(Refinement)和粗化(Coarsening)
- 克服了基于可展三角形先前方法的局限性

---

## 局限性

- 输入必须是水密(watertight)网格
- 高曲率区域可能需要更多细分

---

## 实现建议

- **实现难度**: 高
- **预期性能**: A*加速效果显著
- **适用场景**: 有限元分析、高阶几何处理、测地线相关应用
- **参考库**: CGAL (计算几何), libigl (网格处理)

---

## 相关工作

- [[Geodesic Distance Computation]]
- [[Surface Parameterization]]
- [[High-Order Mesh Generation]]
