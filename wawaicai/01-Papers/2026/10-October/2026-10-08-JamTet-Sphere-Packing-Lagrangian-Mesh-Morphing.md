---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, geometry, tetrahedral-meshing, sphere-packing, differentiable-simulation, remeshing, morphing, delaunay, cgal-related]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.08880
arxiv_id: 2610.08880v1
priority: high
---

# JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physics-based Sphere Packing for Lagrangian Mesh Morphing |
| **作者** | Jiong Lin, Hod Lipson (Columbia University) |
| **发表** | arXiv 2026-10-06 (cs.GR, cs.AI) |
| **链接** | [arXiv:2610.08880](https://arxiv.org/abs/2610.08880) |
| **代码** | Code and media: under review |
| **分类** | cs.GR (primary), cs.AI |

---

## 核心贡献

> 用基于物理的球堆积作为 Lagrangian 体网格表示，统一"网格生成 + 网格变形 + 可微仿真"三件事，解决固定拓扑网格在大形变下退化、重新网格化丢失节点对应关系的两难。

1. **GPU 并行体网格生成器**：八叉树层级球堆积 + 受限 Delaunay 四面体化，生成元素体积比 TetGen / fTetWild 更均匀。
2. **Lagrangian 网格变形**：在形状变化过程中重新平衡同一组球，仅重建边界与连接，保持内部节点身份，从而保持可微梯度流。
3. **JAX 可微仿真器**：mass-spring 边 + volumetric Neo-Hookean 项，端到端可微，在软体形态设计中内部节点梯度比仅表面变体提升游泳适应度 0.73–1.07。

---

## 技术方案

### 核心思想

传统体网格方法的两难：
- **固定拓扑**：大形变下四面体畸变→精度退化甚至翻转；
- **每步 remesh**：丢弃节点对应关系→梯度断裂，无法用于可微设计优化。

**核心洞察**：把四面体网格视为"球堆积的 Delaunay 对偶"——只要保持一组物理平衡的球（重新平衡而非重新采样），其 Delaunay 网格自动保持拓扑一致，且元素质量由球堆积密度决定。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Octree-hierarchical sphere packing** | GPU 并行，自顶向下八叉树细分放置球，球半径与局部形状尺度匹配 |
| **Constrained Delaunay tetrahedralization** | 以球心为输入点，受限 Delaunay 保证四面体化结果覆盖域内、边界贴合 |
| **Sphere re-equilibration** | 形变过程中沿法向 / 边界投影 + 局部半径松弛，使同一组球的拓扑关系稳定 |
| **Differentiable Neo-Hookean** | JAX 实现，可对球中心位置求梯度 |
| **Mass-spring edges** | 在四面体边上叠加弹簧项，避免纯 Neo-Hookean 在大形变下不稳定 |

---

## 公式

四面体体积均匀性度量（与 TetGen / fTetWild 对比指标）：

$$
\mathrm{CV}(V) = \frac{\sigma_V}{\mu_V}
$$

球堆积半径与局部边界距离的关系（重新平衡项）：

$$
r_i^{(t+1)} = r_i^{(t)} - \eta \cdot \left( d_i^{(t)} - r_i^{(t)} \right)
$$

其中 $d_i^{(t)}$ 是球 $i$ 到最近边界的距离，$\eta$ 为松弛步长。

Neo-Hookean 能量密度：

$$
\Psi = \frac{\lambda}{2}(\ln J)^2 - \mu \ln J + \frac{\mu}{2}(\mathrm{tr}(F^T F) - 3)
$$

---

## 实验结论

- **数据集**：软体机器人形态设计（自建合成）
- **基线**：TetGen、fTetWild、固定拓扑网格、TetSphere
- **结果**：
  - 元素体积均匀性优于 TetGen / fTetWild；
  - 大形变下保持无翻转（对比方法出现翻转）；
  - 软体形态设计中，**内部节点梯度**比仅表面梯度方案提升游泳适应度 0.73–1.07；
  - 体素化版本比 mesh 版适应度低 32–63%，说明几何细节对优化重要。

---

## 局限性

- 代码与媒体仍在评审中（无法立即复现）；
- 仅在四类软体形态上验证，泛化到其他可微设计任务未评估；
- 计算成本：GPU 并行 mesher 在大尺度模型上的开销未量化；
- 球堆积在大凹角处可能出现拓扑不一致（论文未深入讨论）。

---

## 相关工作

- **TetGen** (Si, 2015) — 经典受限 Delaunay 四面体化，被超越。
- **fTetWild** (Hu et al., SIGGRAPH 2018) — 鲁棒浮点四面体化，被超越。
- **TetSphere** (Muhammad et al., 2020) — 周期边界球堆积，被对比。
- [[Differentiable Simulation Survey]]
- [[Sphere Packing in Geometry Processing]]

---

## 实现建议

- **实现难度**：中-高（需要 GPU Delaunay + 可微仿真 + 球堆积稳定化）
- **预期性能**：GPU 并行后，体网格生成可比 TetGen 快 10× 以上
- **适用场景**：
  - 可微形态设计 / 软体机器人优化（论文主线场景）；
  - 大变形动画（避免 flip）；
  - 拓扑优化 (topology optimization) 的可微代理；
- **推荐实现路径**：
  1. 用 **CGAL** 的 3D 受限 Delaunay (`CGAL::Delaunay_triangulation_3` + `Mesh_3`) 起步；
  2. 用 **libigl** 做边界约束提取；
  3. 球堆积用八叉树（自己实现或用 **Open3D** / **nanoflann** 加速）；
  4. JAX → 可换 **PyTorch + KeOps** / **Taichi** 做可微物理。

---

## 推荐度

✅ **强烈推荐跟踪**——Lagrangian 体网格是可微几何优化的关键基础设施，球堆积 + Delaunay 的组合是稳健路线。
