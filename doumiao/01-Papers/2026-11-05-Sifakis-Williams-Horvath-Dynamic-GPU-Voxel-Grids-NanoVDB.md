---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, voxel-grid, gpu, nanovdb, fvdb, sparse-grid, fluid-simulation, volumetric-data, ray-marching]
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
| **作者** | Eftychios Sifakis, Francis Williams, Christopher Horvath, Rohan Sawhney, Mark Harris, Jonathan Swartz, Ken Museth |
| **发表** | arXiv preprint (cs.GR, cs.CV, cs.DC), 2026-11-05；**DOI: 10.1145/3842564**（ACM） |
| **链接** | [arXiv:2611.08665](https://arxiv.org/abs/2611.08665) |
| **DOI** | [10.1145/3842564](https://doi.org/10.1145/3842564) |
| **代码** | 摘要未声明（NVIDIA 系作者，Sifakis 为 NVIDIA 高级研究科学家；对应 OpenVDB / fVDB 项目） |
| **分类** | 图形学基础设施 / GPU 稀疏体素网格 / 流体仿真数据结构 |

---

## 核心贡献

> **一句话点题：给 NanoVDB 补上"动态"这块拼图——GPU 原生的拓扑更新（膨胀/合并/剪枝/变分辨率）+ 体素顺序访问范式，让这个稀疏体素结构从"只读静态容器"升级为可用于**流体仿真与动态几何操作**的高性能主表示。**

1. **动态 GPU 原生拓扑更新（dynamic GPU-native topological updates）**：此前 NanoVDB 及其前身 fVDB 的 Index-Grid 概念都**假设拓扑静态**，这直接把它排除在仿真与动态几何流程之外。本文移除该限制。
2. **一整套动态拓扑算子**：
   - **形态学膨胀**（morphological dilation）
   - **网格合并**（grid merging）
   - **剪枝**（pruning）
   - **跨分辨率粗化与细化**（cross-resolution coarsening / refinement）
   
   这些算子使用**位并行（bit-parallel）算法**，能在**数毫秒内**重建包含**数亿体素（hundreds of millions）**的网格。
3. **体素顺序访问范式（voxel-sequential access paradigm）**：将活跃体素**以扁平线性序列流式输出**，在此过程中**最小化甚至消除树遍历**。
4. **逼近峰值显存带宽**：该访问模式带来高计算密度与规整性，**即使复杂的基于模板（stencil-based）的算子也能逼近峰值内存带宽**，且存储开销极小。
5. **确立 NanoVDB 作为动态 GPU 仿真与几何操作的高性能主表示**：移除了只读约束。
6. **基准测试来源广泛**：3D 重建、**流体仿真**、大规模网格体素化。

---

## 技术方案

### 核心思想

稀疏体素网格（如 OpenVDB / NanoVDB）是流体渲染与仿真的**基础设施级**依赖：烟雾/火焰的密度场、火焰温度场、SPH 粒子转网格、流体求解器的压力场与速度场，都需要稀疏体素存储。核心优势是**只存活跃体素**，内存与活跃区域体积成正比而非网格域体积。

但 NanoVDB 长期存在一个架构性限制：**静态拓扑**。原因是其线性化内存布局 + Index-Grid（拓扑/数据分离）设计假定"体素的存在性集合不变"。这带来两个后果：

- 无法做**动态域扩展/收缩**（源发射区域随时间变化时，活跃体素集合必须变）。
- 无法做**动态几何/网格体素化**（物体运动时体素集合必须跟随）。

而**流体渲染恰恰是动态域的典型场景**：火焰燃烧区随时间推进、烟雾源随风移动、液体自由表面不断变形。

本文的解法分两个层面：

**层面一：动态拓扑算子（bit-parallel）。**
位并行的关键在于用**位集合（bitset）**而非逐体素操作来表示"哪些体素活跃"。形态学膨胀 = bitset 的移位 OR 组合；合并 = bitset 的 OR；剪枝 = 计数/阈值过滤；跨分辨率粗化细化 = 重采样 + 位集重映射。位操作在 GPU 上以极宽的字并行执行，因而能在**毫秒级**处理上亿体素。

**层面二：体素顺序访问（voxel-sequential）。**
传统 GPU 稀疏访问必须做树遍历（root → internal node → leaf → value），导致**访存不连续、计算密度低**。本文把活跃体素**预展平为线性序列**，GPU kernel 按序流式读取：
- 消除树遍历 → 访存完全连续 → **逼近峰值带宽**。
- 计算密度规整 → 复杂 stencil 算子（如 Jacobi 迭代、散射、压力投影）也能跑满带宽。
- 存储开销极小（额外的索引结构很小）。

这两点合在一起，才让**在 GPU 上做迭代式的流体仿真/体积着色**变得实际可行——因为仿真本质上是"每个时间步重复执行 stencil 算子"，带宽受限而非算力受限。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Dynamic topology operators** | 膨胀 / 合并 / 剪枝 / 粗化 / 细化——GPU 原生，非 CPU→GPU 往返 |
| **Bit-parallel algorithms** | 用位集合表示活跃体素，宽度并行处理，数毫秒重建上亿体素网格 |
| **Voxel-sequential access paradigm** | 活跃体素展平为线性流，消除树遍历，保证访存连续 |
| **Peak-bandwidth stencil execution** | 规整计算密度使复杂 stencil 逼近峰值显存带宽 |
| **Index-Grid topology/data separation** | 继承自 fVDB 的核心设计：拓扑与数据分离，最优紧凑存储 |
| **Zero-copy CPU↔GPU updates** | GPU 原生拓扑更新意味着仿真循环内无需 CPU 参与网格维护 |

---

## 公式

体素顺序访问的抽象（论文核心范式）：

活跃体素集合 $A \subset \mathbb{Z}^3$，展平为线性序列：

$$A = \{(x_0, y_0, z_0),\, (x_1, y_1, z_1),\, \dots,\, (x_{N-1}, y_{N-1}, z_{N-1})\}$$

GPU kernel 以连续下标读取：

$$\text{value}(i) = \text{buffer}[\,\text{offset} + i\,],\quad i = 0,1,\dots,N-1$$

**带宽利用率**对比传统随机树遍历：

$$\text{effective bandwidth} = \frac{N \cdot s_{\text{voxel}}}{\Delta t_{\text{access}}}$$

线性化访问使 $\Delta t_{\text{access}}$ 逼近硬件极限 $\frac{N \cdot s_{\text{voxel}}}{BW_{\text{peak}}}$，故有效带宽 $\to BW_{\text{peak}}$。

形态学膨胀的位并行表达：

$$A_{\text{dilated}} = \bigcup_{d \in \mathcal{D}} \big(A \oplus d\big)$$

其中 $\mathcal{D}$ 为结构元偏移集合，每个 $\oplus d$ 是一次移位-OR 的位操作，在 GPU 上可批处理为全字并行。

---

## 实验结论

- **基准来源**：3D 重建、**流体仿真**、大规模网格体素化三类应用
- **性能指标**：
  - 动态拓扑算子：**数毫秒**内重建**数亿体素**的网格
  - 体素顺序访问使复杂 stencil 算子**逼近峰值显存带宽**
  - 存储开销**极小**
- **结论**：NanoVDB 从"只读静态容器"变为"可用于动态 GPU 仿真与几何操作的高性能主表示"

---

## 局限性

1. **摘要未给出具体硬件平台与数值**（型号、SM 占用、带宽百分比）——需查正文（DOI 10.1145/3842564）。
2. **论文重心在数据结构而非流体渲染本身**：对"如何用它做烟雾/火焰渲染"只有 benchmark 提及，未系统展示端到端的流体渲染管线。
3. **拓扑更新的频繁程度**：动态算子虽快（毫秒级），但若仿真每步都需要重建拓扑，累积开销是否可接受需实测。摘要未讨论增量更新策略。
4. **生态迁移成本**：既有基于 OpenVDB/fVDB 的项目迁移到动态模式的改造成本未量化。
5. **未涉及渲染端**：体素顺序访问对 ray marching（随机访问）友好度与对 stencil（顺序访问）友好度不同，本文主要面向后者；体积渲染中常见的 DDA ray marching 属随机访问模式，收益需单独评估。

---

## 相关工作

- [[体积渲染]]
- [[稀疏体素网格]]
- [[OpenVDB]]
- [[Ray Marching]]
- [[实时体积光传输推断]]（2026-11-09 收录，互补：渲染端 vs 数据结构端）
- [[GPU 流体仿真]]

---

## 实现建议

- **实现难度**: 中高（基础设施级改造，需要理解稀疏树结构与 GPU 并行模式）
- **预期性能**: 拓扑更新毫秒级；顺序访问 stencil 逼近峰值带宽
- **适用场景**:
  - ✅ GPU 上的实时流体仿真（FLIP/PIC 的粒子转网格、压力投影）
  - ✅ 动态烟雾/火焰源（活跃域随时间变化的体积渲染）
  - ✅ 大规模网格体素化与 3D 重建
  - ⚠️ 以随机访问为主的 DDA ray marching（收益需实测）
  - ❌ 已经在生产中使用 OpenVDB 的项目若无性能痛点，迁移动机不足

**给 @墨鱼丸 的可行性判断**：这是**基础设施级**利好而非渲染算法级利好。如果团队计划做实时流体渲染（MantaFlow 类的 FLIP、或自研 GPU 求解器），本文指出了正确的底层数据结构选择；对已有基于 OpenVDB CPU 路径的管线，价值在于评估迁移到 GPU 动态体素网格的收益。建议：若实时流体是主线，优先关注 OpenVDB 上游的动态拓扑 PR 落地进度；若离线高质量渲染，OpenVDB 已足够，不必迁移。
