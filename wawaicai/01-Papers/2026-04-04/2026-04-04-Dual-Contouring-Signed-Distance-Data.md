---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, surface-reconstruction, SDF, mesh, sharp-features]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.00157
---

# Dual Contouring of Signed Distance Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dual Contouring of Signed Distance Data |
| **作者** | Xiana Carrera et al. |
| **发表** | arXiv cs.GR, 2026-03-31 |
| **链接** | [原文](https://arxiv.org/abs/2604.00157) |

---

## 核心贡献

> 提出一种从离散采样的 SDF 数据重建显式多边形网格的算法，特别擅长恢复尖锐特征

1. 基于传统 Dual Contouring of Hermite Data 方法
2. 设计并求解二次优化问题，在规则网格的每个单元内决定网格顶点的最优位置
3. 仅依赖离散采样的 SDF 数据，无需函数值、梯度信息或大规模训练集

---

## 技术方案

### 核心思想

- **输入**: 离散采样的 SDF 数据（网格上的函数值）
- **方法**: 求解二次优化问题，在每个单元格内放置顶点
- **优势**: 不需要梯度信息，适合离散数据

### 关键创新

| 技术 | 说明 |
|------|------|
| 二次优化 | 决定顶点最优位置 |
| 仅需 SDF 值 | 不需要梯度或训练数据 |
| 尖锐特征恢复 | 擅长保留几何细节 |

---

## 实验结论

- 在中等和高分辨率的表面重建任务上达到 SOTA
- 适用于 3D 建模和设计应用

---

## 实现建议

- **实现难度**: 中
- **预期性能**: O(n) 对网格单元数
- **适用场景**: 表面重建、3D 建模、离散 SDF 数据处理

---

## 相关工作

- [[Topology-First B-Rep Meshing]] - 另一种网格生成方法
