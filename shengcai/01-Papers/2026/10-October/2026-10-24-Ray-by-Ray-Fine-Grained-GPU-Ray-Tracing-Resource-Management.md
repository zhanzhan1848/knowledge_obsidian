---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, ray-tracing, gpu-architecture, hardware, rtu, occupancy, path-tracing, vulkan-sim, pundue, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.31630
---

# Ray-by-Ray: Fine-Grained Resource Management for GPU Ray Tracing Units

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ray-by-Ray: Fine-Grained Resource Management for GPU Ray Tracing Units |
| **arXiv ID** | [2610.31630](https://arxiv.org/abs/2610.31630) (cs.AR) |
| **作者** | Junrui Pan, Cesar Avalos Baddouh, Kai Ze Ee, Timothy G. Rogers |
| **单位** | Purdue University（全部四人） |
| **发表** | arXiv 预印本，2026-10-22（v1）；**未见会议接收声明**（可能投向 MICRO/HPCA 类架构会议） |
| **链接** | [原文](https://arxiv.org/abs/2610.31630) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.31630 |
| **代码/Artifact** | Zenodo **10.5281/zenodo.21542536**（含 rbr-design / rbr-baseline Docker 镜像 + Vulkan-Sim 源码树；BSD 许可；**无独立 GitHub**） |

---

## 核心贡献

> 揭示了 GPU RT 单元在**warp 粒度**分配片上资源（而非 ray 粒度）导致的结构性资源浪费，并给出**保持软件模型完全不变**的逐光线资源管理硬件改造，模拟器几何平均加速 **1.91×**、面积开销仅 **0.19%**。

1. **微架构实证**：首次在 Blackwell (RTX 5090) 与 Ampere (RTX 3070) 上**定量证明** RT 单元按 warp 粒度预留资源——发 16 warp 时只有 12 warp 能并发遍历，且**满 32 lane 与单 lane 情况下并发上限都是 12 warp**（若按 ray 分配，单 lane 应能跑满 16 warp）。
2. **Ray-by-Ray 机制**：把基线的 `4 组 × 32 ray = 128` 个固定 ray-buffer entry **扁平化为 128 个独立可分配 entry**，非激活 lane 不再占用容量；每条 ray 完成即刻归还资源。
3. **可微注入性**：把注入性流（injective flow）构造化为**解一个稀疏线性系统**（Laplacian 方程），因此 Laplacian 边权可微，梯度优化时**保持注入性不破**。

---

## 技术方案

### 核心思想

GPU 的**软件可见 SIMT 模型**（warp = 32 lane 整组发射/整组提交）与 RT 单元的**本质逐 ray 行为**（每条 ray 走不同 BVH 路径、耗时不同）之间存在错配。基线 RTU 为所有 lane 预留 ray buffer / traversal stack，导致：

- 提前完成的 ray **不能提前释放**资源，必须等同 warp 内最慢的 ray；
- warp 整体卡在集体提交点，产生遍历的**尾效应（tail effect）**；
- **RT occupancy 高但 RT efficiency 低**，内存级并行度（MLP）不足，内存延迟无法隐藏。

路径追踪下尤为严重：每次弹射后存活 lane 数单调递减。

**Ray-by-Ray 的设计哲学**：不动软件模型，只改 RT 单元**内部**的资源调度粒度。

### 关键技术

| 技术 | 说明 |
|------|------|
| **统一 ray-buffer 池** | 基线 4 组固定 32 ray → 扁平化为 128 个独立可分配 entry；总容量不变 |
| **按活跃 lane 分配** | warp $w$ 只需 `popcount(M_w)` 个 entry，非激活 lane 零占用 |
| **warp 原子性保留** | 硬件不部分发射 warp：需 `N_free ≥ popcount(M_w)` 才准入 |
| **Ray Buffer Mask** | 128-bit 占用掩码，追踪空闲/占用；分发时扫描、分配时置位、**完成时立即清位** |
| **串行化分配** | 每周期分配 1 个活跃 lane → 满 32-lane warp 最多 32 个分配周期（相对数千周期遍历延迟可忽略；并行分配因面积代价被否决） |
| **Per-ray 遍历栈** | 遍历栈与软件线程**解耦**，绑定到 ray-buffer entry；仅在 ray 生命周期内存在；按 buffer-entry 顺序处理 → shared memory 访问模式固定，**降低 bank conflict** |
| **动态 ray 分组** | 调度器从**连续** buffer entry 取最多 32 ray 成组（保留基线的访存请求宽度），允许**跨原始 warp 混合** |
| **Warp ID + 完成计数器** | 每 ray 携带 5-bit Warp ID；每 warp 一个 5-bit 完成计数器，归零时提交并清表项 |
| **不涉及** | TLAS/BLAS 分配策略、软件 ray 排序、shader 执行重排、通用 warp compaction、软件可见 warp 的动态创建 |

### 关键公式

```math
% 占用率与效率（两个不同指标，可相差悬殊）
Occupancy = (RT 单元常驻 warp 平均数) / (允许的最大常驻 warp 数)
RT Efficiency = (RT 单元活跃线程平均数) / (最大线程容量)

% 按活跃 lane 分配
N_active(w) = popcount(M_w)
准入条件: N_free(RT) >= N_active(w)

% 逐 ray 完成与 warp 提交
派发时: C_w = N_active(w)
每条 ray 完成: C_w <- C_w - 1
提交条件: C_w = 0

% 几何平均加速比
S_i = T_baseline,i / T_Ray-by-Ray,i
S_geo = (prod_{i=1}^{N} S_i)^(1/N) = 1.91

% 面积开销
Area_overhead = (A_RbR - A_base) / A_base
= (678368.4 - 677066.8) / 677066.8 um^2 = 0.19%

% 额外记账位
Ray Buffer Mask: 128 bit
32 个 5-bit 完成计数器: 32 x 5 = 160 bit
128 个 5-bit Warp ID:      128 x 5 = 640 bit
合计: 928 bit
```

### 微架构实证（RTX 5090 / RTX 3070）

| 观测 | 数据 | 含义 |
|------|------|------|
| 并发 warp 上限 | 发 16 warp → 仅 12 warp 并发 | 其余 4 warp 被结构性 hazard 阻塞 |
| **关键对照** | **满 32-lane warp 与单-lane warp 的并发上限都是 12** | 若按 ray 分配，单 lane 应能跑满 16 → **证明按 warp 预留资源** |
| Shared memory 占用 | 8192 B / 128-thread block = **64 B/thread** | 遍历栈状态**部分存放于 shared memory** |
| Shared memory 访问 | 与 RT-core ray-cast 算子强相关 | 确认遍历栈由 shared memory 参与管理 |
| RT 核心性质 | 用**完全一致且全合并**的 ray 时，增加活跃 lane 数**仍增加**遍历延迟 | 32 lane 被串行化到**窄 temporal-SIMT 数据通路**，非真 32-lane 并行 |

> **对墨鱼丸的关键含义**：最后一条是本文最重要的可迁移洞察——RT 核心是**窄 temporal-SIMT 流水线**。这意味着**来自不同原始 warp 的 ray 可以在 RT 单元内部混合**，不会产生常规向量寄存器文件所需的 lane 迁移开销。这是 Ray-by-Ray 敢做跨 warp 混合调度的硬件前提。

---

## 代码片段

```text
% Ray-by-Ray 的分配与完成逻辑（论文伪代码整理）
dispatch(warp w):
    N = popcount(M_w)                       % 活跃 lane 数
    if N_free(RT) >= N:                     % 保留 warp 原子性
        for each active lane l in w:        % 串行化：每周期 1 个
            e = alloc_entry(RayBufferMask)  % 扫描 128-bit 掩码
            attach_stack(e)                % 遍历栈绑定到 entry
            WarpID[e] = w.id
        C_w = N                             % 完成计数器初始化
    else:
        stall(w)

complete(ray r):
    e = r.entry
    C_{WarpID[e]} = C_{WarpID[e]} - 1       % 逐 ray 递减
    free_entry(e, RayBufferMask)            % 立即归还（不等同 warp 最慢 ray）
    if C_{WarpID[e]} == 0:
        commit(warp)                       % 提交并清表项

% 调度：动态分组（跨原始 warp）
group = take up to 32 contiguous occupied entries
```

```text
% 模拟器配置（Vulkan-Sim v2.0，Jetson Orin 代表配置）
SMs: 16                 Registers/SM: 65,536
L1 + Shared: 192 KB     L1 MSHR entries: 256
Warps/sub-core: 16      Sub-cores/SM: 4
Units: 4 FP / 4 SFU / 4 INT / 1 RT
Baseline RT: 4 warps = 128 rays    Ray-by-Ray: 128 entries
L2: 4 MB, 32 banks      Memory: LPDDR5, 200 GB/s
分辨率: 256 x 256
```

---

## 实验结论

- **数据集**: LumiBench 16 场景 × 3 追踪模式（Path Tracing / Shadow Rays / Ambient Occlusion）+ CHSNT 单独 PT = **46 个 workload**
- **场景规模**: BVH 深度 7–18，BVH 大小 0.2 MB（WKND）～ 1721.3 MB（ROBOT）；CAR 1233.6 MB、FOX 597.8 MB、PARK 501.9 MB
- **基线**: NVIDIA warp 粒度分配基线（**注意**：加速比来自模拟器而非端到端实机）

### 加速比（对 warp 粒度基线）

| 评测 | 加速比 |
|------|--------|
| Shadow Rays | **1.42×** |
| Ambient Occlusion | **1.70×** |
| **Path Tracing** | **2.78×** |
| **几何平均（46 workload）** | **1.91×** |

> ⚠️ **重要方法论提示**：1.91× 是 **Vulkan-Sim v2.0（GPGPU-Sim + Mesa/lavapipe）周期级模拟**的结果，**不是 RTX 5090 上的端到端实测**。真实硬件仅用于**微架构表征**。模拟配置为 Jetson Orin 代表配置、256×256 分辨率。

### 副作用

| 指标 | 基线 | Ray-by-Ray | 变化 |
|------|------|-----------|------|
| L1 sector 访问（平均） | 1.000 | 1.000 | **+14%** |
| L2 sector 访问（平均） | 1.000 | 1.000 | **+1.6%** |
| **L2 带宽** | 1.000 | 1.000 | **1.94×** ← MLP 提升的直接体现 |
| **平均能耗** | 1.000 | 1.000 | **0.98×**（略降，最大降幅在高度发散的 PT 负载） |
| **RT 单元功耗** | 9.17 mW | 9.23 mW | **+0.7%** |
| MSHR merge 失败率（每千条 warp 指令） | 0.09 | 0.10 | 基本持平 |
| 面积 | 677066.8 µm² | 678368.4 µm² | **+0.19%** |

- **内存行为解读**：额外的 L1 请求大部分被 MSHR 合并吸收；因 BVH 节点宽、遍历是指针追逐，L2 流量没有大幅上升。
- **L2 带宽 1.94×**：反映更高的内存级并行度，**当 L2 带宽成为瓶颈时可能反过来限制加速比**。

---

## 局限性

论文**没有独立的 Limitations 章节**，限制散见于方法与评测部分：

1. **小尺度、cache-resident 场景下收益有限**——计算受限，无法体现并行度收益。
2. **L1 流量上升 14%**。
3. **L2 带宽可能成为新瓶颈**（已达 1.94×）。
4. **分配延迟**：串行化分配使满 lane warp 需最多 32 个分配周期（作者论证相对遍历延迟可忽略，但极端短射线场景未验证）。
5. **性能结论来自模拟器**，非实机端到端测量。
6. 拓扑限制：RT 单元被建模为**窄 temporal-SIMT**（32 lane 串行到窄数据通路），该结论的普适性依赖于具体 NVIDIA 实现。

---

## 相关工作

- [[NVIDIA-Ray-Tracing-Architecture]] — NVIDIA Ampere GA102 白皮书（[44]）、RT 遍历专利 US11,302,056B2（[40]）
- [[RayFlex-RTL-Hardware-Ray-Tracer]] — Shen et al., ISPASS 2025（[56]）：开源 NVIDIA 风格 RT 数据通路 RTL，本文八条流水线的吞吐/设计假设来源
- [[Vulkan-Sim]] — Saed et al., MICRO 2022（[53]）：本文扩展的 GPU 架构模拟器 v2.0
- [[Shader-Execution-Reordering]] — NVIDIA 白皮书（[45][46]）：本文对照组——NVIDIA 用软件侧 SER + live state reduction 处理发散，本文从硬件侧解决
- [[Path-Tracing-Optimization-Indiana-Jones]] — NVIDIA（[47]）：同样处理 ray 发散与 save/restore 开销
- [[Tutte-Like-Theorem-Injective-Flows]] — 同日入库的姊妹篇（几何处理方向）
- [[RLMuscle-Muscle-Driven-Character-Animation]] — 同日入库（GPU 求解器方向）

---

## 实现建议

- **实现难度**: **高**（硬件架构论文；需要 RT 单元 RTL + 周期级模拟器 + 微架构表征工具链）
- **预期性能**: 路径追踪 **2.78×**、AO 1.70×、阴影线 1.42×、几何平均 **1.91×**（模拟器）；面积 +0.19%、能耗 0.98×、RT 功耗 +0.7%
- **适用场景**: **路径追踪 / 高分支发散的追踪负载**（收益最大）；实时渲染收益较小（阴影线仅 1.42×）
- **可迁移到软件渲染器的启示**（**无需改硬件即可借鉴**）：
  1. **跨 warp 混合 ray 批次**——因 RT 核心是窄 temporal-SIMT，软件侧做 "ray 队列" 重排（如排序、压缩、分箱）收益可能比 NVIDIA 现有 SER 方案更高，且不需 save/restore 状态
  2. **逐 ray 资源回收**——软件侧若按"整 warp 等待最慢 ray"分配 slot/buffer，同样存在尾效应浪费；改为逐 ray 回收可省内存与同步开销
  3. **per-ray 排序/压缩的收益上界**：本文证明了硬件侧混合的可行性，**值得在 Vulkan-Sim 或自建软件光追器上做 "跨 warp ray 重排" 实验**（本库尚未见同类工作）
- **复现门槛**: 中等——Artifact 已在 Zenodo 公开（Docker ≥ 20.10、x86-64 Linux、**≥ 128 GB RAM**），`./docker/scripts/make_speedup.sh --only design` 可复现加速比图
- **优先级**: **中-高**（对算法 agent 而言价值在于"跨 warp ray 重排"这个可立即实验的软件侧思路，而非硬件实现本身）
