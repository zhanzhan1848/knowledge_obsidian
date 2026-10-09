---
tags: [几何, 网格处理, 四面体网格, 球填充, 体素化, 重网格化, 形变, 可微仿真]
date: 2026-10-09
source: arXiv
arxiv_id: 2610.08880
venue: cs.GR (under review)
authors: Jiong Lin et al.
---

# JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing

## 核心问题
固定连接性四面体网格在大形变下退化；从零重网格化又丢失节点对应关系。需要一种既保持内部点身份又抗大形变的体网格方法。

## 方法概述

**JamTet 框架**：基于物理的球填充四面体网格化与形变。

### 三大贡献

#### (i) GPU 并行 mesh 生成器
- 结合 **八叉树-层次球填充** 与 **约束 Delaunay 四面体化**
- 单元体积比 TetGen 和 fTetWild 更均匀
- 优势：GPU 加速，重建速度快

#### (ii) Lagrangian 网格形变
- 在变化形状中重新平衡**相同的球**
- 重建边界和连接性
- **保持内部节点身份**
- 形变过程中保持无反转（inversion-free）
- 对比基线（固定连接性 / TetSphere）在大形变下不反转

#### (iii) JAX 中的可微 GPU 仿真器
- 含 mass-spring 边项 + 体素 Neo-Hookean 项
- 与 mesh morphing 集成于设计 pipeline

## 实验结果

**软体机器人形态设计实验**：
- 内部节点梯度比仅用表面的变体提升 **0.73-1.07** 游泳适应性
- 体素化版本比同一设计降低 **32-63%** 适应性
- 结论：球填充作为基于梯度的形状优化的实用体网格表示

## 复杂度分析
- **时间复杂度**：mesh 生成 O(n log n)；形变 O(n)；可微仿真 O(n · T)
- **空间复杂度**：O(n) — 球填充 + 四面体化数据结构
- **可扩展性**：GPU 并行支持城市级模型

## 实现难度
- 算法复杂度：**高**
  - 八叉树球填充
  - 约束 Delaunay 四面体化 (CGAL 实现可参考)
  - 可微仿真与形变的耦合管线
- 数值稳定性：**中**
  - 球填充需谨慎处理边界 (boundary handling)
  - Neo-Hookean 形变在极端压缩下需正则化
- 依赖项：
  - **CGAL** — Delaunay 四面体化 (`CGAL::Delaunay_triangulation_3`)
  - **TetGen / fTetWild** — 对比基线
  - **JAX** — 可微仿真
  - **八叉树数据结构**（自定义 GPU 实现）

## 推荐结论
✅ **推荐关注**（工程实现 + 学术研究双价值）

技术亮点：
1. **首次系统性证明**：保持内部点身份的 Lagrangian 网格在大形变 + 可微设计任务中的优势
2. **数值稳健**：球填充带来的均匀单元体积改善计算稳定性
3. **可微端到端**：从形状到梯度流动完整
4. **应用价值**：软体机器人形态设计开辟新方向

## 开源参考

### CGAL 对应物
| CGAL 包 | 用途 |
|---------|------|
| 3D Convex Hull | 球层初始化 |
| 3D Triangulation | Delaunay 四面体化 |
| Mesh 3 | TetGen/fTetWild 集成 |

### 替代/补充库
- **libigl** — 简单的四面体重网格化原型
- **OpenVolumeMesh** — 通用四面体网格数据结构
- **libMesh** — FEM 仿真框架

## 与墨鱼丸的协作建议
- 推荐关注可微仿真与几何的耦合管线
- 适合作为"重网格化+形变"组合任务的参考实现
- 可探索为本体建模管线 (Body Modeling Pipeline) 增加形变模块

## 备注
- 代码与媒体："under review" — 尚未公开
- 关注作者是否同期开源 JAX 实现

---
相关主题：[[重网格化]] [[四面体网格]] [[可微仿真]] [[形状优化]]
