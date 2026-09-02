---
type: paper
created: 2026-06-05
updated: 2026-08-31
tags: [paper, mesh-reconstruction, topology-adaptation, differentiable, CVPR]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.07288
---

# ExMesh: Explicit Mesh Reconstruction with Topology Adaptation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ExMesh: Explicit Mesh Reconstruction with Topology Adaptation |
| **作者** | Chuanjin Fan et al. |
| **发表** | CVPR 2026 · Jun 5, 2026 (v2: Aug 31, 2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.07288) |
| **项目页** | [fan-treasure.github.io/ExMesh_page.github.io/](https://fan-treasure.github.io/ExMesh_page.github.io/) |
| **代码** | - |

---

## 核心贡献

> 首个将离散拓扑操作（顶点分裂/合并）无缝集成到连续可微优化管道中的框架，直接优化显式网格。

1. **自适应顶点分裂与合并策略**：根据几何细节需求自适应调整网格拓扑
2. **实时UV维护**：网格结构演化时保持一致的UV坐标
3. **粗到细优化**：在保持几何完整性的同时实现多尺度细节优化
4. **无中间表示**：直接优化显式网格，避免 Marching Cubes 等后处理

---

## 技术方案

### 核心思想

现有方法（隐式或显式）依赖中间表示（如 SDF、TSDF）后处理（如 Marching Cubes），导致伪影和碎片几何。ExMesh 直接在连续优化管道中嵌入离散拓扑操作。

### 关键技术

| 技术 | 说明 |
|------|------|
| 可微拓扑更新 | 顶点分裂/合并操作嵌入反向传播图 |
| 自适应细化 | 根据几何细节需求动态调整拓扑 |
| 实时UV维护 | 拓扑变化时保持 UV 坐标一致性 |
| 粗到细优化 | 逐步增加网格分辨率同时传递优化状态 |

---

## 实验结论

- **数据集**: 多种多视图场景
- **基线**: 现有隐式/显式重建方法
- **结果**: 
  - 精度、计算效率和网格简洁性的平衡
  - 避免碎片几何和非流形结构
  - 高保真纹理重建

---

## 局限性

- 顶点分裂/合并的梯度传播仍存在近似
- 对于极端拓扑变化场景（如空洞创建）支持有限
- UV 维护在高度变形的网格上可能不稳定

---

## 相关工作

- [[网格重建]]
- [[可微渲染]]
- [[神经隐式表征]]
- [[拓扑修改]]

---

## 实现建议

- **实现难度**: 高（需设计可微拓扑操作）
- **预期性能**: 端到端优化，无需后处理
- **适用场景**: 多视图网格重建、纹理保留几何优化、生成式3D资产
