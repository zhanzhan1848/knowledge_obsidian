---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, mesh-generation, B-Rep, CAD, topology]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.02141
---

# Topology-First B-Rep Meshing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Topology-First B-Rep Meshing |
| **作者** | YunFan Zhou, Daniel Zint, Nafiseh Izadyar, Michael Tao, Daniele Panozzo, Teseo Schneider |
| **发表** | arXiv cs.GR, 2026-04-02 |
| **链接** | [原文](https://arxiv.org/abs/2604.02141) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.02141 |

---

## 核心贡献

> 提出一种将 B-Rep 拓扑作为不变量的网格生成方法，保证输出的网格在拓扑上完全正确

1. **拓扑优先方法**：将 B-Rep 拓扑作为网格生成过程的不变量，不依赖 2D 修剪曲线
2. **3D 曲线追踪**：直接在 3D 空间中追踪曲线，使用最近点投影重建修剪边界
3. **拓扑保证**：对于任意容差，输出网格在拓扑上都是正确的

---

## 技术方案

### 核心思想

传统 B-Rep 网格化方法依赖 2D 修剪曲线，但这些曲线常存在自相交和不一致问题（Fusion 数据集中 14% 的修剪曲线包含相交）。本文方法：
- 不使用 2D 修剪曲线
- 直接在 3D 空间中用最近点投影追踪曲线
- 拓扑正确性仅由用户定义的单一几何容差控制

### 关键算法

| 技术 | 说明 |
|------|------|
| 3D 曲线追踪 | 在 3D 空间直接追踪边界曲线 |
| 最近点投影 | 配对拓扑稳健的追踪算法 |
| 约束 Delaunay 三角化 | 用于面片三角化 |

---

## 实验结论

- **数据集**: ABC 和 Fusion 360 数据集中的数千个真实 CAD 模型
- **结果**: 成功网格化标准工具失败的复杂模型
- **鲁棒性**: 即使底层几何不一致或高度近似也能生成正确拓扑的网格

---

## 局限性

- 计算成本可能较高（需要求解非线性优化问题）
- 依赖精确的 3D 曲线几何

---

## 实现建议

- **实现难度**: 中高 - 需要 CAD 内核交互和数值算法
- **预期性能**: O(n) 对模型复杂度
- **适用场景**: CAD 网格化、有限元分析、仿真预处理

---

## 相关工作

- [[Dual Contouring of Signed Distance Data]] - 另一种网格重建方法
- [[MeshTailor-Generative-Mesh-Seams]] - 网格生成相关
