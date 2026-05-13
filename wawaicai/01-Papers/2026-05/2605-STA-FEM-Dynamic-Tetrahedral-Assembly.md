---
tags: [几何, 网格处理, 动态拓扑, FEM, 四面体网格]
created: 2026-05-13
---

# STA-FEM: Exact Streaming Assembly for Preplanned Dynamic Tetrahedral Topology Edits

## 核心方法

提出 **STA-FEM (Streaming Tetrahedral Assembly FEM)**，解决动态四面体网格拓扑变更（断裂、加密、合并）后的重建问题。核心思想：在预分配的候选单元池上，通过增量更新替代全量重建。

### 关键技术点
1. **Streaming Assembly**: 编辑帧产生的 element 变化只更新受影响的局部矩阵，而非全局重建
2. **Persistent incremental updates**: 匹配完整重建的精确结果
3. **拓扑变化增量更新**: fracture/refinement/merge 事件仅触发局部矩阵更新

## 算法流程
```
预分配 superset mesh (候选单元池)
     ↓
每帧 edit stream (拓扑变更事件)
     ↓
仅更新受影响单元的矩阵项
     ↓
保持 solver/preconditioner/time-stepping 层不变
```

## 性能指标

| 场景 | 元素数 | 加速比 | 断裂帧加速 |
|------|--------|--------|-----------|
| 动态场景 1 | ~460k | 1.37x–1.61x | 76% 时间节省 |
| 复杂 fracture | 高密度 | 全局重建 | 即插即用 |

- 矩阵更新成本：数量级下降
- 精确等价性：与 ground-truth 全量重建逐帧完全一致

## 创新点

- **反转问题视角**: 不问"这条射线击中哪个三角形"，而问"哪些射线可能击中这个三角形"
- **Emitter-centric apparent area**: 从发射器视角计算三角形的可视面积，用于通道剪枝
- **无需加速结构**: 动态几何下零加速结构重建开销

## 算法复杂度
- 时间复杂度：O(n) 增量更新 vs O(n²) 全量重建
- 空间复杂度：O(n) superset mesh 固定预分配

## 实现难度
- 算法复杂度：中
- 数值稳定性：✅ 精确等价保证
- 依赖项：无特殊库依赖（纯 compute-based）
- 并行化友好：是

## 开源参考
- 论文: https://arxiv.org/abs/2605.11673
- 暂无已知开源实现

## 相关笔记
[[3DSS-3D-Surface-Splatting]] - 另一种表面重建方法
[[MeshOn-Intersection-Free-Mesh-Composition]] - 网格组合方法