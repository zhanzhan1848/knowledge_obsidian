---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, convex-decomposition, GPU, warp-level-parallelism, device-side-heap, CUDA, physics-simulation, collision-detection, robot-learning, preprocessing]
domain: geometry
agent: wawaicai
recommendation: 推荐（工程实现范式清晰，GPU 加速思路可复用到其他几何管线）
---

# CuACD: A Fully GPU-Resident Approximate Convex Decomposition

> 📌 **今日最偏「系统工程」但最有工程借鉴价值的一篇**：把近似凸分解（ACD）**完整搬到 GPU 上**。核心方法论非常有意思 —— 不是「把每个 kernel 加速」，而是**以 warp（而非 thread / thread block）为算法设计单元**。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | CuACD: A Fully GPU-Resident Approximate Convex Decomposition |
| **作者** | Ruoxi Shi, Xinyue Wei (UC San Diego), Fanbo Xiang, Zexiang Xu, Hao Su (Sudo GmbH) |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_1423](https://sa2026.conference-schedule.org/presentation/?id=papers_1423) |
| **关键词** | approximate convex decomposition, GPU-resident, warp-level parallelism, device-side heap allocator, convex hull |

## 技术概述

### 问题：ACD 是管线的「隐藏税」

**近似凸分解（ACD）** 把三角网格转换成**小规模的凸部件集合**，是以下场景的标准预处理步骤：

- 物理仿真
- 碰撞检测
- 大规模机器人学习

现代 ACD 方法通过**对候选切平面做昂贵搜索**来产出高质量分解，但：

> **每个网格的运行时间达数十秒**，迫使游戏管线使用**通宵烘焙**，并让铰接物体数据集在 **CPU 集群上跑上几天**。

也就是说，ACD 已经成为整个管线的瓶颈。

### 核心思想：以 warp 为算法设计单元

论文的核心诊断非常精准 —— 既有 GPU 加速工作（如 VisACD 的可见性度量）只加速了**孤立阶段**，而**主导成本 —— 搜索、网格切割、凸包构造 —— 仍然留在 CPU**，原因是：

> 它们的**自然分解**成许多**小的同质阶段**，在每个 kernel 边界处**都会流失掉最后一个波前（fading last wave）**；而且**每个阶段的输出大小可变**，迫使系统做一次**主机往返（host round trip）**仅为分配下一个启动所需的输入。

**CuACD 的解法**：

> 采用 **warp（而非 thread 或 thread block）作为算法设计的单元** —— 这个想法由图处理社区为另一种病态问题引入，本文**将其改编**，以把计算几何流水线中**许多异质阶段融合进单个 warp 常驻内核（warp-resident kernels）**，并配以**设备端堆分配器（device-side heap allocator）**，让融合阶段之间的缓冲区**能在设备端分配与定尺寸**。

这是全文的技术核心，包含三个可复用组件：

| 组件 | 作用 |
|------|------|
| **warp 常驻内核** | 把异质阶段融合，消除 kernel 边界、消除主机往返 |
| **设备端堆分配器** | 变长输出缓冲区在 GPU 内存中分配/复用，无需回主机 |
| **warp 协作快速排序** | 图处理社区的组件，用于排序（切割候选排序） |
| **divide-a-...**（摘要被截断） | 推测为 divide-and-conquer 分解 |

## 复杂度分析

- **理论复杂度不变** —— 加速来自**常数因子**（消除 kernel 启动开销、消除主机往返、提升占用率）
- 关键收益：消除了「每个 kernel 边界流失最后一个波前」的低效 ⇒ 在**小网格**（占用不满一个波前）上收益尤其大
- 论文报告：大规模下**墙钟时间优于优化基线**（与 S4R 同批基准：Kubric / HY3D-Bench / Thingi10K）

## 实现难度与数值稳定性

- **算法复杂度**：**高（系统级）**。需要 CUDA 内核开发、warp 级原语编程（`__shfl`、warp vote 等）、设备端内存管理、且要处理**变长输出**这一 GPU 编程中的老大难。
- **数值稳定性**：**中**。凸分解本身是几何计算，数值问题（退化输入、共面）由几何算法决定；但**并发顺序不确定性**（不同线程的浮点归约顺序不同）可能引入**非确定性输出** —— 这对需要可复现性的管线是个隐患，摘要未讨论。
- **依赖项**：CUDA / HIP；可能复用 CGAL 的凸包/网格切割（CPU 侧参考实现）。

## 实验结论

- **基线**：VisACD（GPU 部分加速）及其他 CPU ACD 方法
- **结果**：**完全 GPU 常驻**（fully GPU-resident）—— 这是**首个**完全 GPU 化的 ACD 系统；大规模下时间优于优化基线

## 局限性

- **只加速了 ACD**。整条「几何 → 凸分解 → 物理仿真」的下游是否也被 GPU 化，未涉及。
- **设备端堆分配器**的内存碎片与峰值管理问题未讨论。
- **数值确定性与可复现性**未讨论（GPU 上不同运行可能得到略有不同的分解）。
- 摘要被截断，具体加速比数字需查正文。
- **CUDA 锁定**：AMD/Intel GPU 的移植性未讨论（Sudo GmbH 是 AMD 关联公司，但其方案用 CUDA 的可能性高）。

## 相关工作

- [[2026-10-30-SA2026-S4R-Rigid-Body-Interpenetration-Resolution]] — 同批基准（Kubric / HY3D-Bench / Thingi10K）
- [[2026-04-05-VisACD-GPU-Accelerated-ACD]] — 本库已有：**直接前置工作**（VisACD）
- [[2026-05-09-Adaptive-In-Solve-Algebraic-Coarsening-GPU-IPC]] — 本库已有：GPU IPC
- [[2026-10-17-Geometric-Queries-Tessellation-Free-Displaced-Surfaces]] — 本库已有
- [[2604.04244-VisACD]] — 本库已有

## 实现建议

- **实现难度**：**高**（需要 CUDA / warp 级编程能力）
- **预期性能**：数十秒 → 显著低于 1 秒量级（具体数字待正文确认）；在**中小网格**上收益最大
- **适用场景**：
  - **机器人学习数据集生成**（大规模铰接物体 → 凸分解 → 物理仿真）
  - **游戏管线的通宵烘焙**场景 → 转为实时/交互式
  - **物理仿真的在线初始化**
- **对团队的直接价值**：**高**。本库已有 VisACD 的记录，这篇是它的**彻底完成版**。更重要的是，**「以 warp 为算法设计单元」这个方法论可以迁移到任何「多阶段、变长输出」的 GPU 几何管线** —— 我们若有类似的分阶段几何计算（简化 → 割 → 凸包 → 碰撞体生成），都应参考这个融合范式。

## 可直接抄的工程结论

1. **不要逐个 kernel 优化，要融合阶段。** 「每个 kernel 边界流失最后一个波前」+「变长输出迫使主机往返」是 GPU 几何管线的两个系统性开销源，必须从架构上消除。
2. **设备端堆分配器是变长输出管线的必需品** —— 没有它，所有变长阶段都会被迫回主机。
3. **warp 是介于 thread 与 thread block 之间的正确粒度** —— 它给了足够的并行度来做分支合并，又足够小到能塞进同一个 kernel 而不触发全局同步。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
