---
type: paper
created: 2026-11-09
updated: 2026-11-09
tags: [paper, fluid-rendering, volume-rendering, sparse-grid, nanovdb, openvdb, gpu, siggraph-asia-2026, fire, level-set]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.08665
---

# Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB |
| **arXiv 标题** | Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB |
| **作者** | Eftychios Sifakis (NVIDIA / UW-Madison), Francis Williams (NVIDIA), Christopher Horvath (NVIDIA), Rohan Sawhney (NVIDIA), Mark Harris (NVIDIA), Jonathan Swartz (NVIDIA), Ken Museth (NVIDIA) |
| **arXiv ID** | [2611.08665](https://arxiv.org/abs/2611.08665) (v1, 2026-11-05) |
| **发表** | ACM TOG 45(6), 2026 — **SIGGRAPH Asia 2026**（Journal Track） |
| **DOI** | [10.1145/3842564](https://doi.org/10.1145/3842564) |
| **分类** | cs.GR（主）、cs.CV、cs.DC |
| **代码** | [AcademySoftwareFoundation/openvdb](https://github.com/AcademySoftwareFoundation/openvdb) + [openvdb/fvdb-core](https://github.com/openvdb/fvdb-core) |
| **HTML 版** | https://arxiv.org/html/2611.08665v1 |

---

## 核心贡献

> **打破 VDB 生态二十年来"CPU 动态拓扑 / GPU 只读速度"的二选一僵局**——首次让 NanoVDB 这一 GPU 原生稀疏体数据结构支持**在 GPU 上直接做拓扑演化**，并提出面向 stencil 算子的 **voxel-sequential 访问范式**，把稀疏数据流式化为线性序列以逼近峰值显存带宽。

1. **Bulk-Synchronous 拓扑演化范式**：在 GPU 上对 linearized index-grid 做合并（merge）、剪枝（prune）、形态学膨胀（dilate）、跨分辨率粗化/细化（coarsen/refine），拓扑变更以离散 epoch 集体执行；采用**位并行（bit-parallel）算法**，数亿体素的树骨架重建仅需**毫秒级**。
2. **Voxel-Sequential Access 范式 + VoxelBlockManager (VBM)**：把活跃体素当作**扁平线性序列**流式处理（不按 leaf node 边界切分），消除 warp divergence 与 threadblock load imbalance，使复杂 stencil 算子逼近峰值内存带宽。
3. **Sidecar 注入与演化算子**：支持在主拓扑旁并行挂载多个辅助载荷（密度/压力/level set 值），实现 topologically-eager 而 data-lazy 的稀疏场管理。
4. **真实负载验证**：以火焰燃烧模拟（ghost fluid method + 窄带 level set + WENO5 重初始化）、大尺度网格体素化、3D 重建为基准。

---

## 技术方案

### 核心思想

论文指出 VDB 生态的历史包袱：

| 版本 | 定位 | 短板 |
|------|------|------|
| **OpenVDB** (Museth 2013) | CPU 优先，堆分配 + 指针密集节点 | accessor 软件缓存在 GPU 上产生 warp divergence；allocate-on-insertion 模型与 CUDA 编程范式冲突 |
| **NanoVDB** (Museth 2021) | GPU 优先，线性化内存布局 + 相对寻址 | **静态拓扑、只读**——不支持建后修改活跃体素集合 |
| **fVDB Index-Grid** (Williams 2024) | 拓扑/数据分离，最紧凑存储 | 同样继承静态拓扑限制 |

> 原文表述："So far, no published research has seriously challenged this limitation, leaving developers with an untenable choice: the dynamic topological versatility of the CPU (OpenVDB) or the read-only speed of its GPU sibling (NanoVDB)."

本文的解法是证明**静态拓扑不是 NanoVDB 的固有属性，而是以往维护拓扑的算法的局限**。

### NanoVDB 树结构（LOG2DIM = 5, 4, 3）

| 层级 | LOG2DIM | 分支数 | 体素跨度 |
|------|---------|--------|----------|
| Root | — | nTiles（无界） | unbounded |
| Upper Internal | 5 | 32,768 | 4096³ |
| Lower Internal | 4 | 4,096 | 128³ |
| Leaf | 3 | 512 | 8³ |

### 关键技术

| 技术 | 说明 |
|------|------|
| **Morphological dilation** | 形态学膨胀；从"表面穿越体素"向外膨胀生成窄带活跃体素集。**位并行**实现，半径 ≤ 8（不超 leaf 大小）时可用 box stencil 平凡实现 |
| **Grid merging** | 多个 grid 合并为统一拓扑（多分辨率/多来源场融合） |
| **Pruning** | 剪去 \|φ\| 超过带宽阈值的体素（level set 窄带收缩）；亦可充当 dilation 的逆操作（erosion） |
| **Cross-resolution coarsen / refine** | 跨分辨率粗化与细化；与 dilation/merge/prune 共用同一处理流水线，但**尚未被任何应用端到端验证**（作者明确列为局限） |
| **VoxelBlockManager (VBM)** | 核心新增数据结构：将活跃体素流式化为扁平线性序列，**跨越 leaf node 边界连续**，launch size 仅由活跃集决定 |
| **Sidecar injection** | 通过坐标同一性在两个拓扑间关联体素，把载荷注入 sidecar；PyTorch 张量可直接作为 sidecar 操作 |
| **HDDA**（已有） | 分层数字差分分析器，渲染时直接遍历稀疏 index-grid，通过 UDF 等值面穿越检测命中，无需转稠密 |

### 流体模拟管线（火焰追踪，本文核心应用）

采用 **ghost fluid method** (Nguyen et al. 2001, 2002; Hong et al. 2007) 追踪燃烧火焰锋面（"blue core"）：

```
每步流程:
(i)   dilate  —— 膨胀窄带，为下一次平流准备源体素
(ii)  advect  —— 沿火焰锋面速度 w 做半拉格朗日平流 φ
                 (速度由一阶爆燃冲击波动力学 DSD 导出)
(iii) reinit  —— 在窄带内用 WENO 离散化 Hamilton–Jacobi 迭代重初始化
                 保持 φ 为符号距离函数，锋面保持锐利
(iv)  prune   —— 剪除 |φ| 超过带宽阈值的体素
```

- **Eikonal 方程**仅在稀疏窄带上迭代求解，stencil 访问 ±3 体素 × 3 个基方向 = **18 个邻接体素访问** + 1 个中心体素
- **Euler 方程离散化**用 **WENO5**（最优五阶精度），计算与算术复杂度均高

---

## 公式

### 能量级联湍流补注（Kora 使用，见 [[2026-11-09-Kora-Physics-Based-Fire-Pipeline]]）
本文不涉及。

### VBM 调度与 leaf occupancy 指标

$$
\text{mean leaf occupancy} \equiv \frac{\text{activeVoxels}}{\text{nLeaves} \cdot 512}
$$

512 = 8³（leaf 内体素数）。该指标越低，说明线程落在空体素上的浪费越大，accessor 基线退化越严重，而 VBM 保持不变。

---

## 实验结论

### 火焰模拟 WENO5 窄带重初始化（Figure 9）

| 指标 | 数值 |
|------|------|
| **VBM 吞吐** | 稳定在 **≈20 Gvoxel-updates/s**（launch size 仅由活跃集决定） |
| **Accessor 基线吞吐** | **14.0 → 9.8** Gvoxel-updates/s（随 occupancy 下降而退化） |
| **VBM 加速比** | 最高 **1.98×**，且随 leaf occupancy 下降而**增大** |

### 3D 重建 / 网格体素化（Table 1，单张 48 GB RTX 6000 Ada）

| 负载 | nvblox | Open3D | 本文 | 体素数 | 显存 |
|------|--------|---------|------|--------|------|
| Mai City 700f LiDAR TSDF | 10 cm | 1.25 cm | **1.25 cm** | 938.7 M | 37.1 GB |
| Mai City 700f TSDF→ESDF | 10 cm | 3 cm | **3 cm** | 1.28 B | 30.6 GB |
| Replica 8×2000f TSDF | 10 mm | 5 mm† | **3 mm** | 109 M | 10.3 GB |
| Replica 8×2000f ESDF | 10 mm | n/a | **3 mm** | 438 M | 10.3 GB |
| KITTI seq02 4661f TSDF | 20 cm | 10 cm | **10 cm** | 427 M | 19.8 GB |
| KITTI seq00 100f ESDF | 5 cm | n/a | **2 cm** | 1.67 B | 38.6 GB |
| KITTI seq05 100f Occupancy | 1.5 cm | 5 mm | **5 mm** | 2.35 B | 44.1 GB |

† Open3D 在 5 mm 仅 6/8 场景成功，3 mm 全部 8 个场景崩溃（illegal memory access）

- **Scale**：同等显存预算下，本文的体素分辨率比 block-hash 基线**细 1.5–5×**，活跃体素数最多高**两个数量级**。最强单点：KITTI seq00 在 2 cm 下 **1.67×10⁹ ESDF 体素 / 38.6 GB**，而 nvblox **显存耗尽**
- **Speed**：occupancy 在 20–1.5 cm 区间比 nvblox **快 3.5–11.5×**；LiDAR TSDF 在 Mai City 快 3.6–5.7×、KITTI 在 40 cm 快 4.8–5.3×，20 cm 收窄到 2.6–3.5×（10 cm 时 nvblox 显存耗尽）。Open3D 在 Replica 上 depth-TSDF 吞吐领先 11–46×（20–5 mm），4 mm 失败
- **Composability**：每个积分器都可分解为同类三步——动态拓扑算子 + 自定义 CUDA kernel（per-leaf-slot / per-ray HDDA / VBM）+ sidecar 张量上的 PyTorch 操作。动态场景衰减是极限情形（**两个算子、零积分器代码**），KITTI seq00 上 500 帧测得持久体素**减少 78%**
- **大网格体素化**：2.8M 三角形 hairball → **9.88×10⁹** 活跃体素，**3.24 秒**（OpenVDB 未完成，内存耗尽）；对比项 1.026×10⁹ 体素需 **2.30 秒**——**约 10× 加速**（同分辨率可比）

---

## 局限性

- **拓扑算子**：膨胀 stencil 半径不得超过 leaf 大小（8 体素）；显著不规则（非矩形、非对称）形状的 stencil 难以获得同等位并行优化收益。**形态学腐蚀（erosion）尚未实现**（计划复用 prune 算子实现）
- **scratchpad 记账开销**：每个可能与输出重叠的 4096³ root tile 约需 **16 MB** 暂存空间——对极小域场景可能削弱相对"从头重建"方案的性能优势
- **VBM 收益边界**：leaf 节点近乎稠密的场景收益衰减（此时传统 leaf-level dense NanoVDB 更合适）；**memory-bound** 工作负载（如标量场上的梯度/散度有限差分）难以显著受益；空间相关但非流式的访问模式仍应使用 accessor
- **跨分辨率算子**：coarsening/refinement 未被任何应用端到端验证；多分辨率金字塔场景需要额外的 upsample/downsample（prolongation/restriction）侧车算子，本文未实现

---

## 相关工作

- [[2026-11-09-Kora-Physics-Based-Fire-Pipeline]] — 同一 SIGGRAPH Asia 2026 会议，Wētā FX 的生产级燃烧求解器
- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — SIGGRAPH Asia 2026 两相流统一多尺度离散
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]] — SIGGRAPH Asia 2026 野火-城市界面模拟
- [[2026-03-29_3D-Gaussian-Particle-Approximation-VDB]] — 3D 高斯粒子近似与 VDB 的结合
- [[2026-07-12/2509.11377-3d-gaussian-openvdb]] — 3DGS + OpenVDB 相关工作
- 概念：NanoVDB / OpenVDB / fVDB Index-Grid / VoxelBlockManager / 稀疏体数据 / WENO5 / level set / ghost fluid method

---

## 实现建议

- **实现难度**：**高**。CUDA/C++ 级别，需要理解 VDB 树结构、index-grid 拓扑/数据分离、以及位并行 bitmask 算法
- **预期性能**：稀疏体算子逼近峰值显存带宽（VBM ≈ 20 Gvoxel-updates/s）；拓扑重建毫秒级（亿级体素）；相比 nvblox 等 block-hash 基线 3.5–11.5× 加速
- **适用场景**：
  - **GPU 上的实时/交互式稀疏流体模拟**（火焰、烟、level set 追踪）
  - 大尺度动态几何编辑（体素化、网格变形）
  - 神经渲染/重建的稀疏场存储（fVDB 生态）
  - 高分辨率体积渲染的数据层
- **落地建议**：
  1. 直接用 `AcademySoftwareFoundation/openvdb`（含本文改进）+ `openvdb/fvdb-core`（含 §5.1 与附录 B 代码）
  2. **计算密集型 stencil 算子**（WENO、稀疏卷积、GEMM 化）优先走 VBM 路径
  3. **memory-bound 的小 stencil**（梯度、散度）仍用 accessor，别指望 VBM
  4. level set 窄带管理直接套用论文给出的 dilate→advect→reinit(WENO5)→prune 四步循环

---

## 可行性分析（渲染视角）

🩸 **可行性分析：GPU 原生动态稀疏网格 + 体素序列流式访问**

### 渲染方法
- **类型**：体积渲染（数据层支撑）
- **技术**：Sparse Index-Grid + VoxelBlockManager + HDDA 直接遍历稀疏拓扑渲染（无需稠密化）

### 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐（本身不提升视觉质量，但为超高分辨率火焰/烟雾模拟提供算力基础）
- **风格化支持**：是

### 性能预期
- **帧率**：VBM stencil 算子 ≈ 20 Gvoxel-updates/s；单卡 48 GB 可承载 2.35 B 活跃体素
- **GPU 需求**：NVIDIA Ada 及以上（论文用 RTX 6000 Ada 48 GB）；需 CUDA 12+
- **内存占用**：动态——1.67 B ESDF 体素 @ 2 cm 需 38.6 GB；2.35 B occupancy @ 5 mm 需 44.1 GB

### 实现建议
- **着色器复杂度**：中（渲染侧改动小，难点在数据层）
- **管线要求**：稀疏体数据结构需支持逐帧拓扑变更（这是本文的核心突破）
- **推荐度**：✅ **强烈推荐**——这是 2026 年稀疏体数据基础设施层面最重要的进展，且代码已开源

已传递给 @墨鱼丸。
