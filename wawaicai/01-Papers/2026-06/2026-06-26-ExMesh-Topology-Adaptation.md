---
type: paper
created: 2026-06-26
updated: 2026-06-26
tags: [paper, mesh-reconstruction, topology-adaptation, CVPR2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.07288
---

# ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation |
| **作者** | Chuanjin Fan et al. |
| **发表** | CVPR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.07288) |

---

## 核心贡献

> 首个将离散拓扑操作无缝集成到连续可微优化管道的框架

1. **自适应顶点分裂/合并策略**: 在高曲率区域分裂顶点以恢复细节，在低曲率区域合并以保持简洁
2. **实时 UV 维护**: 拓扑变化时保持一致的 UV 坐标
3. **粗到细优化**: 从粗糙网格开始逐步优化几何细节

---

## 技术方案

### 核心思想

现有方法问题：
- 依赖中间表示（如 Marching Cubes、TSDF fusion）
- 产生伪影和碎片几何

ExMesh 解决方案：
- 直接优化显式网格
- 可微优化 + 离散拓扑更新

### 关键技术

| 技术 | 说明 |
|------|------|
| 自适应顶点分裂 | 高曲率区域分裂顶点恢复细节 |
| 自适应顶点合并 | 避免引入退化面 |
| 实时 UV 维护 | 拓扑变化时保持纹理坐标一致性 |

---

## 实验结论

- **准确性**: 高
- **效率**: 计算效率高
- **简洁性**: 网格简洁，无碎片

---

## 局限性

- 需要预定义粗糙拓扑
- 对极端复杂拓扑可能需要更多迭代

---

## 实现建议

- **实现难度**: 高 (需结合可微优化和拓扑操作)
- **适用场景**: 多视角图像网格重建、3D 扫描后处理

---

## 相关工作

- [[Mesh Reconstruction]]
- [[Topology Adaptation]]
- [[Differentiable Optimization]]
- [[UV Mapping]]