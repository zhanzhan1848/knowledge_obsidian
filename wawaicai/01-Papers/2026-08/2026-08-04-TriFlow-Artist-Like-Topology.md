---
tags: [几何, 网格生成, 拓扑优化, 流匹配, QEM]
date: 2026-06-18
conference: arXiv
---

# TriFlow: Generating Artist-Like 3D Mesh Topology via Nearest-Vertex Vector Fields

## 核心方法

TriFlow 提出一种新的生成方法，从输入几何条件（如符号距离场）生成具有艺术家风格三角形拓扑的紧凑 3D 网格。

### 关键创新

1. **最近顶点向量场(Nearest-Vertex Vector Field, NVF)**：
   - 定义在曲面上的向量场
   - 每个点编码其在局部重心坐标系中到最近三角形顶点的关联

2. **潜在流匹配模型**：在 NVF 上训练，生成条件拓扑

3. **网格提取流程**：
   - 使用生成的 NVF 聚类表面区域
   - 使用拓扑感知优化的约束二次误差度量(QEM)网格简化

## 技术优势

- 输出网格紧密匹配输入几何
- 具有结构化的艺术家风格连通性
- 强大的泛化能力
- **90% 更低的 Chamfer 距离**
- **8倍加速**

## 与 MeshFlow 对比

| 方面 | MeshFlow | TriFlow |
|------|----------|---------|
| 方法 | 流匹配生成三角形汤 | 流匹配生成 NVF + QEM 简化 |
| 拓扑 | 无特定拓扑 | 艺术家风格连通性 |
| 输入 | 条件生成 | 符号距离场等几何条件 |

## 开源实现

- Project page: https://derkleineli.github.io/triflow/
- arXiv: https://arxiv.org/abs/2606.20131

## 相关笔记

[[MeshFlow-Equivariant-Flow-Matching]]
[[QEM-Quadric-Error-Metric]]

## 可行性分析

✅ **推荐实现**

- NVF 表示具有创新性
- 与 libigl 的 QEM 简化结合可行
- 生成质量有显著提升
