---
type: paper
created: 2026-10-10
updated: 2026-10-10
tags: [paper, geometry-processing, tetrahedral-mesh, remeshing, sphere-packing, differentiable-simulation, mesh-morphing]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.08880
venue: arXiv cs.GR (submitted 2026-10-06)
arxiv_id: "2610.08880"
authors: ["Jiong Lin", "Hod Lipson"]
---

# JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physics-based Sphere Packing for Lagrangian Mesh Morphing |
| **作者** | Jiong Lin, Hod Lipson |
| **发表** | arXiv cs.GR + cs.AI, 2026-10-06 |
| **链接** | [arXiv:2610.08880](https://arxiv.org/abs/2610.08880) |
| **领域** | 四面体网格生成 / 拉格朗日网格变形 / 可微分仿真 |

---

## 核心贡献

> 用**物理驱动的球填充**作为可微分仿真 + 计算设计的体网格表示，解决"固定拓扑网格在大变形下退化"和"重新网格化丢失节点对应"两个长期痛点。

1. **GPU 并行 mesher**：八叉树-层次球填充 + 受约束 Delaunay 四面体化，单元体积均匀性优于 TetGen / fTetWild
2. **Lagrangian mesh morphing**：保持内部节点身份（再平衡相同球），仅重建边界和拓扑；在 fixed-connectivity 和 TetSphere 都反转的 case 下保持无反转
3. **JAX 可微分仿真器**：mass-spring 边 + Neo-Hookean 体，与网格 morphing 集成；软体机器人形态优化案例中内部梯度提升游泳适配度 0.73-1.07

---

## 技术方案

### 核心思想

四面体网格作为可微分仿真/设计的体表示面临两难：
- **固定拓扑网格**：在大 morph 下退化
- **完全 remesh**：丢失节点对应，破坏梯度流

解法：用**球填充**作为语义中间表示 — 球身份保持，几何变形通过球位置再平衡，几何拓扑在球集合上重新构建。

### 三层贡献

| 模块 | 技术 | 关键点 |
|------|------|--------|
| (i) Mesher | 八叉树层次球填充 + 受约束 Delaunay | GPU 并行，比 TetGen/fTetWild 均匀 |
| (ii) Morphing | Lagrangian 节点身份保持 + 边界/拓扑重建 | 反转自由（inversion-free） |
| (iii) Simulator | JAX 可微分 mass-spring + Neo-Hookean | 与 mesh morphing 集成 |

### 关键技术

| 技术 | 说明 |
|------|------|
| Sphere packing | 物理驱动的球填充（不同于 Poisson-disk sampling） |
| Octree-hierarchical packing | 层次球填充算法 |
| Constrained Delaunay tetrahedralization | 从球集合生成四面体 |
| Lagrangian morphing | 节点身份保持 + 拓扑动态重建 |
| Neo-Hookean elasticity | 可微超弹性本构 |
| JAX autodiff | 端到端梯度流 |

---

## 实验结论

- **数据集**: 软体机器人形态设计（morphology design tasks）
- **基线**: 
  - TetGen / fTetWild（mesher 质量对比）
  - fixed-connectivity meshes / TetSphere（反转对比）
  - 表面-only 变体（内部梯度有效性对比）
  - 体素化版本（vs. Lagrangian）
- **关键结果**:
  - Mesher：比 TetGen / fTetWild 更均匀的 element volumes
  - Morphing：保持无反转（fixed-connectivity / TetSphere 反转 case 全部修复）
  - 软体机器人形态：内部节点梯度提升游泳 fitness **+0.73 - +1.07**
  - 与体素化版本对比：**+32% - +63%** fitness 提升
- **作者**: Columbia University (Hod Lipson Lab)

---

## 局限性

- **球填充的边界保真度**：边界重建质量不如直接四面体化（trade-off with morphing 灵活性）
- **球数量固定假设**：剧烈拓扑变化（拓扑分裂/合并）仍需特殊处理
- **JAX 依赖**：仿真器基于 JAX，限制了在 PyTorch/TF 生态中的集成
- **代码未公开**：处于 "under review" 状态

---

## 与本知识库其他笔记的关系

- [[CuACD-GPU-Convex-Decomposition]] - 凸分解
- [[TetGen]] / [[fTetWild]] (基础四面体化算法)
- [[OctMesh-Octree-Mesh-Compression]] - 八叉树网格
- [[Differentiable Simulation]] (待创建)
- [[Soft Robot Design]] (待创建)

---

## 实现建议

- **实现难度**: 中-高（GPU 并行球填充 + Delaunay + 可微分仿真）
- **依赖项**:
  - 八叉树库（如 nanoflann / custom octree）
  - 受约束 Delaunay 四面体化（CDT 库，如 tetgen / cgal）
  - JAX（仿真器）
  - 可微分物理引擎（brax / 自实现）
- **预期性能**: GPU 上分钟级（mesher），秒级（morphing 单步）
- **适用场景**: 
  - 软体机器人形态设计
  - 可微分结构优化
  - 大变形物理仿真（视频游戏、VR）
- **开源参考**:
  - CGAL: `Mesh_3` 包
  - libigl: 仅表面网格（需自实现体）
  - TetGen / fTetWild（基线对比）

---

## 🥬 可行性结论

✅ **推荐跟踪** — Lagrangian mesh morphing 是"可微分几何处理"的关键原语。
- 算法层面：将球填充与四面体解耦是可微分设计的优雅解
- 工程层面：JAX 实现便于研究集成，但生产环境需要 C++ 重写
- 推荐下一步：跟踪作者开源状态；评估在 morphing 工作流中替换我们的 fixed-connectivity 网格

已传递给 @墨鱼丸。