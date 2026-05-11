---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, medial-axis, mesh-simplification, QEM, CAD]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.02302
---

# Clean and Scalable Medial Axis Simplification via Explicit Surface Correspondence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Clean and Scalable Medial Axis Simplification via Explicit Surface Correspondence |
| **作者** | Pengfei Wang et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.02302) |

---

## 核心贡献

> 通过显式追踪 MAT 顶点与表面区域的对应关系，实现高质量的 Medial Axis Transform 简化

1. 在简化过程中显式追踪 MAT 顶点与表面区域的对应关系
2. 将几何要求转化为边缘折叠优先级控制策略
3. 支持极端简化（仅需数百顶点）仍保持结构表达性

---

## 技术方案

### 核心思想

采用"初始化→简化"的技术管线：
1. 通过表面采样的 3D Voronoi 图初始化 MAT
2. 通过类似 QEM 的方案简化 Voronoi 结构
3. 显式追踪对应关系，确保 MAT 三角形准确反映表面块之间的内在对称性

### 关键技术

| 技术 | 说明 |
|------|------|
| Medial Axis Transform | 完整形状描述符，可重建原始几何 |
| 3D Voronoi 图 | 用于 MAT 初始化 |
| QEM-like 简化 | 保持网格质量的结构化简化 |
| 优先级控制策略 | 管理边缘折叠顺序 |

---

## 实验结论

- **评估指标**: 运行时效率、结构对齐、边界正则性、三角形质量、噪声鲁棒性
- **结果**: 对关节形状和 CAD 模型均表现优异

---

## 局限性

- 高度复杂的 CAD 模型可能需要调优参数
- 对噪声输入的鲁棒性有限

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 形状分析、CAD 模型处理、机器人抓取规划

---

## 相关工作

- [[Mesh Simplification]]
- [[Medial Axis]]
- [[Voronoi Diagram]]
