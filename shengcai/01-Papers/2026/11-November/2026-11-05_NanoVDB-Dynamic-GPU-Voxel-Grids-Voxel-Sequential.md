---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, sparse-voxel, gpu-optimization, openvdb, nanovdb, simulation, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08665
arxiv_id: 2611.08665
---

# Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB |
| **作者** | Eftychios Sifakis, Francis Williams, Christopher Horvath, Rohan Sawhney, Mark Harris, Jonathan Swartz, **Ken Museth**（NVIDIA + DreamCores / BRL / Autodesk） |
| **发表** | arXiv cs.GR / cs.CV / cs.DC, 2026-11-05（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.08665) |
| **DOI** | - |
| **代码** | 开源（NanoVDB, NVIDIA） |

---

## 核心贡献

> 打破 NanoVDB "只读拓扑"的长期限制，并提出 **voxel-sequential 访问范式**——把稀疏体素流式化为扁平线性序列，让 GPU kernel 逼近峰值带宽。

1. **动态 GPU 原生拓扑更新**：形态学膨胀、网格合并、剪枝、跨分辨率粗化/细化等算子，**数毫秒内重建包含数亿体素的网格**。
2. **Bit-parallel 算法**：动态拓扑算子采用位并行实现。
3. **Voxel-sequential 访问范式与数据结构**：GPU kernel 操作稀疏数据时，把活跃体素以扁平线性序列流出，**最小化或消除树遍历**。
4. **计算密度与规整性提升**：即使复杂的基于模板（stencil）的算子也能逼近峰值内存带宽，存储开销极小。

---

## 技术方案

### 核心思想

NanoVDB 的线性化内存布局此前带来很强的 GPU 性能；fVDB 的 Index-Grid 概念（Williams et al. 2024）提供了拓扑/数据分离与最优紧凑存储。

**但所有这些迭代都假设静态拓扑**，这限制了 NanoVDB 在仿真与动态几何过程中的使用。

本文做两件事：
1. **解除只读约束**：引入一系列动态拓扑算子（膨胀、合并、剪枝、跨分辨率粗化/细化），使用位并行算法重建含数亿体素的网格只需数毫秒。
2. **改变访问模式**：传统稀疏访问要沿树遍历（branchy、访存不连续）。voxel-sequential 把活跃体素按线性序列流出，得到规整访存 → 模板算子可逼近峰值带宽。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Index-Grid 拓扑/数据分离** | fVDB 继承，拓扑与 payload 分离存储 |
| **Bit-parallel 动态算子** | 形态学膨胀 / 合并 / 剪枝 / 跨分辨率粗化细化 |
| **Voxel-sequential 访问** | 活跃体素 → 扁平线性序列，消除树遍历 |
| **模板算子优化** | 基于模板的算子（stencil-based）达到接近峰值带宽 |
| **GPU 原生拓扑更新** | 不再需要 CPU 往返 |

---

## 代码片段

```cpp
// Voxel-sequential 访问范式（语义伪代码）
// 传统方式：遍历树 -> branchy, 访存不连续
for (auto it = tree.begin(); it != tree.end(); ++it) { ... }

// Voxel-sequential：活跃体素扁平流式化
auto stream = grid.activeVoxelStream();      // 扁平线性序列
for (int i = 0; i < stream.size(); ++i) {
    Vec3i c = stream.coord(i);                 // 连续访存
    float v = stream.value(i);
    // stencil 算子在连续内存上运行 -> 逼近峰值带宽
    out[i] = stencilOp(v, stream.neighbor(i));
}

// 动态拓扑算子（bit-parallel，数毫秒级重建亿级体素网格）
grid = morphologicDilation(grid);   // 膨胀
grid = mergeGrids(gridA, gridB);    // 合并
grid = prune(grid);                 // 剪枝
grid = coarsen(grid);               // 跨分辨率粗化
```

---

## 实验结论

- **数据集**: Mai City（合成 Velodyne LiDAR，700 帧轨迹）、Replica（NICE-SLAM 深度渲染，8 场景 × 2000 帧）、KITTI Odometry（真实 LiDAR，seq 00/02/05，2.2–5.1 km）、7-Scenes（RGB-D，长轨迹持久性）
- **基线**: **nvblox**、**Open3D**、VDBFusion（CPU-only OpenVDB，仅供完整性/定性参考）
- **统一设置**: 截断 $\tau = 3\times$ 体素尺寸，ESDF 最大距离 $R = 10\times$ 体素尺寸；nvblox 的 depth/LiDAR 积分距离配置为与本文一致
- **结果**:
  - **尺度**：同等内存预算下，本文实现的体素分辨率比 block-hash 基线**细 1.5–5×**，活跃体素数最多大**两个数量级**
  - **最强单点**：KITTI seq 00 上 **1.67×10⁹ 个 ESDF 体素 / 38.6 GB @ 2 cm**，nvblox 在此直接 OOM
  - **速度**：occupancy 在 20–1.5 cm 扫描区间比 nvblox **快 3.5–11.5×**
  - LiDAR TSDF：Mai City **快 3.6–5.7×**；KITTI @ 40 cm **快 4.8–5.3×**，@ 20 cm 收窄到 2.6–3.5×，@ 10 cm nvblox 内存耗尽
  - Open3D 在 Replica 的 depth-TSDF 吞吐领先 11–46×（20–5 mm），@ 4 mm 失败
- **测试目标应用**: 3D 重建、流体仿真、大规模网格体素化

---

## 局限性

- 预印本，未见同行评审
- 论文强调的是**数据结构的通用能力**，具体应用（流体/重建）的端到端指标未全面给出
- VDBFusion 对比为 CPU-only，不可直接对比 GPU 路径
- 与渲染的关联主要是"动态几何/仿真的基础设施"，非渲染算法本身

---

## 相关工作

- [[2026-05-23-BVH-Accelerated-Ray-Tracing-EM-Backscattering]]
- [[2026-05-24_Snapshot-Polarimetric-Inverse-Rendering]]
- 概念：[[稀疏体素网格]], [[NanoVDB]], [[OpenVDB]], [[GPU内存布局]], [[形态学算子]]

---

## 实现建议

- **实现难度**: 低（NanoVDB 是开源库，动态算子可直接集成）
- **预期性能**: 稀疏网格 GPU 算子全面提速 3.5–11.5×（vs nvblox）；体素分辨率可细 1.5–5×
- **适用场景**: **流体仿真、动态几何处理、体素化重建**——若团队后续涉及流体渲染（团队有 鲜毛肚/鸭血 等流体专家），这套基础设施直接可用
- **与团队的关系**: 可转发给 @鸭血（流体渲染）与 @黄喉（几何）参考；稀疏网格 + 动态拓扑对"动态场景实时重建"也有价值
- **优先级**: 中（对纯渲染算法优先级一般，但对"渲染 + 仿真"混合管线价值高）
