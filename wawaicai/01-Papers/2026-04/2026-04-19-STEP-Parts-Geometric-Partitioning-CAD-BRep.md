---
tags: [几何, CAD, B-Rep, 分割, mesh-tessellation]
---

# STEP-Parts: Geometric Partitioning of Boundary Representations for Large-Scale CAD Processing

## 论文信息

- **arXiv**: [2604.14927](https://arxiv.org/abs/2604.14927)
- **Authors**: Shen Fan et al.
- **Submitted**: Thu, 16 Apr 2026 (v1)
- **Subjects**: cs.GR, cs.AI, cs.CV, cs.LG
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2604.14927)

## 核心方法

解决 CAD B-Rep（Boundary Representation）三角化后丢失解析几何和拓扑邻接信息的问题。

### 关键算法
1. **几何分割**：合并共享相同解析几何类型（平面/圆柱/球面/圆锥/自由曲面）且满足 near-tangent 连续性准则的相邻 B-Rep 面
2. **对偶表示优化**：在偶角度上分析 same-primitive 的分布特性，提取对分割不敏感的低偶角度区域
3. **分割稳定性**：基于固有 B-Rep 拓扑而非特定三角化定义，保证网格分辨率变化时边界稳定

### 创新点
- STEP-Parts 工具链：从原始 STEP B-Rep 直接提取几何实例分割
- 通过保留 source-face 对应关系将分割迁移到 tessellated carrier
- 生成分割标签和元数据，用于下游学习和评估
- 处理 ABC 数据集 DeepCAD 子集约 18 万模型，CPU 6 小时内完成

## 复杂度分析
- **时间**：约 180k 模型 / 6h → 平均 ~0.12s/模型（CPU）
- **空间**：B-Rep 解析表示 vs 三角网格（存储开销更小）

## 实现难度
- **算法复杂度**：中（需要解析 B-Rep 面分类 + 拓扑分析）
- **数值稳定性**：near-tangent 连续性阈值需调参
- **依赖项**：STEP 文件解析（Opencascade 或类似）、B-Rep 拓扑操作

## 推荐结论
✅ 推荐实现（CAD 几何处理 pipeline 集成价值高）

## 开源参考
- Opencascade: B-Rep 拓扑/几何操作
- ABC-Dataset: 基准数据
- 代码/标签: https://github.com/...

## 相关笔记
[[MeshOn-Intersection-Free-Mesh-Composition]]
[[TopGen-Quadrilateral-Mesh-Generation]]
