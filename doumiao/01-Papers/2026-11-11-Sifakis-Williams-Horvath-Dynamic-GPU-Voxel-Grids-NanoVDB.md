---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, volume-rendering, sparse-grid, nanovdb, gpu, voxel, simulation, openvdb, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.08665
---

# Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB |
| **作者** | Eftychios Sifakis, Francis Williams, Christopher Horvath, Rohan Sawhney, Mark Harris, Jonathan Swartz, Ken Museth — **NVIDIA** |
| **发表** | arXiv preprint (cs.GR, cs.CV, cs.DC), 2026-11-05 |
| **链接** | [arXiv:2611.08665](https://arxiv.org/abs/2611.08665) |
| **DOI** | — |
| **代码** | **NanoVDB 开源**（github.com/AcademySoftwareFoundation/openvdb） |
| **分类** | 体积渲染 / 稀疏网格 / GPU 数据结构 / 流体模拟基础设施 |

---

## 核心贡献

> **给 NanoVDB 装上"动态拓扑"能力**：把只读的稀疏体素网格变成**可动态增删改的 GPU 原生结构**，并引入 **voxel-sequential（体素顺序流式）访问范式**，让复杂 stencil 算子逼近**峰值显存带宽**——直接解锁了"直接在稀疏网格上跑流体模拟 + 几何操作"这一长期瓶颈。

1. **问题：NanoVDB/fVDB 的拓扑是静态的**
   - NanoVDB 的**线性化内存布局**（linearized memory layout）在 GPU 上表现优异；
   - fVDB 的 **Index-Grid** 概念（Williams et al. 2024）实现了拓扑/数据分离与紧凑存储；
   - 但**两者都假设拓扑固定** → 无法用于**模拟过程**与**动态几何过程**；
   - 这是稀疏网格在 CFD / 烟雾模拟中落地最大的结构性障碍：**模拟每帧都要改密度场拓扑**。

2. **贡献一：动态 GPU 原生拓扑更新算子**
   - 新增算子套件：**形态学膨胀 (morphological dilation)**、**网格合并 (grid merging)**、**剪枝 (pruning)**、**跨分辨率粗化/细化 (cross-resolution coarsening & refinement)**；
   - 全部使用**位并行 (bit-parallel)** 算法；
   - 性能：**数亿体素 (hundreds of millions of voxels) 的网格重建只需数毫秒**。

3. **贡献二：Voxel-sequential 访问范式**
   - 新数据 + 新范式：把**活跃体素流式化为一条扁平的线性序列**，**最小化甚至消除 GPU kernel 中的树遍历 (tree traversal)**；
   - 带来**计算密度与规整性**，使得即便复杂的 **stencil-based 算子也能逼近峰值内存带宽**，且存储开销极小。

4. **意义：移除 NanoVDB 的只读约束**
   - 使 NanoVDB 成为**动态 GPU 模拟与几何操作的高性能主表示** (primary representation)。

5. **基准验证来源**：3D 重建、**流体模拟**、大规模网格体素化。

---

## 技术方案

### 核心思想

稀疏网格 (sparse grid) 的性能瓶颈在于**间接寻址**：GPU 上访问一个体素需要树遍历 → 内存不连续 → 算术强度低 → 带宽利用率极低。NanoVDB 的 linearized layout 已解决"读"的问题，但"改拓扑"需要重建/搬移。

本工作两条腿走路：

| 层面 | 手段 | 收益 |
|------|------|------|
| **拓扑层** | 位并行动态算子集（dilation / merge / prune / coarsen / refine） | 百万~亿级体素网格毫秒级重建 |
| **访问层** | voxel-sequential 流式访问（活跃体素 → 扁平线性序列） | stencil 算子逼近峰值带宽，消除树遍历 |

### 关键技术

| 技术 | 说明 |
|------|------|
| **Linearized memory layout** | NanoVDB 既有设计，将稀疏层级树展平为连续内存，GPU 友好 |
| **Index-Grid (fVDB)** | 拓扑/数据分离，拓扑是轻量稠密索引网格，数据按需稀疏存储 |
| **Bit-parallel topology operators** | 位并行实现形态学膨胀/合并/剪枝/分辨率变换；数亿体素重建 < 几 ms |
| **Voxel-sequential access** | 活跃体素流式化为扁平线性序列，GPU kernel 内**免树遍历** |
| **Memory-bandwidth-bound stencil** | 计算密度与规整性提升，复杂 stencil 逼近峰值带宽 |
| **Cross-resolution coarsening/refinement** | 跨分辨率层级动态变换（AMR 式多分辨率流体的基础构件） |

---

## 公式

```math
\text{Reconstruction time} \sim O\!\left(\frac{N_{\text{voxels}}}{64}\right)
\quad\text{(bit-parallel, 每 64 体素一次字级操作)}

\text{Bandwidth utilization} \approx \frac{\text{useful bytes}}{\text{DRAM bytes}}
\to \text{near peak},\qquad
\text{access pattern: linear stream} \gg \text{tree traversal}
```

---

## 代码片段

```cpp
// 概念伪代码：voxel-sequential 访问 —— 免树遍历的活跃体素流式扫描
for (auto voxel : grid.activeVoxelStream()) {   // 扁平线性序列，而非 tree traversal
    // dense, regular compute pattern
    float d = voxel.density();
    voxel.density() = advect(d, vel, dt);
}
// 动态拓扑算子（位并行）
grid.dilate();      // 形态学膨胀
grid.merge(other);  // 网格合并
grid.prune();       // 剪枝
grid.coarsen();     // 跨分辨率粗化
```

---

## 实验结论

- **数据集/基准**：3D 重建、**流体模拟**、大规模网格体素化；
- **结果**：
  - 动态算子在**数亿体素**规模下**数毫秒**完成网格重建；
  - voxel-sequential 让复杂 **stencil 算子逼近峰值显存带宽**，存储开销极小；
  - 消除了 NanoVDB 长期以来的**只读拓扑限制**。

---

## 局限性

- 论文聚焦**数据结构与算子**，未给出完整的流体模拟管线端到端渲染结果；
- 动态拓扑重建虽快，但每帧重建仍需与求解器步进做**负载均衡调度**；
- 对**非网格对齐边界**（cut-cell 类需求）仍需外部方案配合（可对照 [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] 的 cut-cell 路线）。

---

## 相关工作

- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — 边界贴合流体求解器（cut-cell 路线，互补）
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 烟雾体积密度场 + 3DGS
- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — 非结构网格 ALE
- [[NVIDIA-GPUGems3-Fluids]] — 经典 GPU 流体实现参考

---

## 实现建议

- **实现难度**：🔴 高（需深入理解 OpenVDB 层级树 + 位并行 GPU 编程）；**但可直接用上游开源版本**
- **预期性能**：数亿体素网格动态重建 **~ms 级**；stencil 算子带宽利用率接近峰值
- **适用场景**：
  - ✅ **实时/交互式稀疏网格烟雾模拟**（每帧需改拓扑的场景）
  - ✅ **大规模体素几何操作**（3D 重建、网格体素化）
  - ✅ 跨分辨率 AMR 流体管线的基础设施
  - ⚠️ 离线高精度渲染中拓扑变化少，可另选静态布局
