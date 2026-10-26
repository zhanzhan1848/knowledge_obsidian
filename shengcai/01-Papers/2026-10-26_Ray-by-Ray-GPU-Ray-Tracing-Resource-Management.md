---
type: paper
created: 2026-10-26
updated: 2026-10-26
tags: [paper, 渲染, 光线追踪, GPU架构, 硬件加速, BVH, SIMT, 2026]
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
| **作者** | Junrui Pan, Cesar Avalos Baddouh, Kai Ze Ee, Timothy G. Rogers（Purdue University） |
| **发表** | arXiv 2026-10-22（cs.AR）；**将发表于第 59 届 IEEE/ACM International Symposium on Microarchitecture (MICRO-2026)** |
| **链接** | [原文](https://arxiv.org/abs/2610.31630) |
| **DOI** | — |
| **代码** | 未提供（硬件架构研究，依赖自研 cycle-level 仿真器 + Vulkan-Sim） |

---

## 核心贡献

> 揭示并修正了当代 GPU RT 单元中「片上资源按 warp 粒度分配」这一被所有前人工作默认的假设 —— 改为按「单条 ray」粒度分配，用轻量管理结构在不增加 buffer 容量的前提下让更多 warp 并行驻留。

1. **问题诊断**：用 CUPTI + GPUVision 周期级分析工具在真实 NVIDIA GPU（RTX 5090 / RTX 3070）上做了微基准，证明 RT 单元的片上 buffer 与 traversal stack 实际是**按 warp 粒度**分配/释放的 —— 当 warp 内部分 lane 空闲时仍占用资源，产生内部碎片。
2. **Ray-by-Ray 机制**：把 ray buffer group 重组成**扁平的 128 条统一 ray buffer 池**（容量不变），每个活跃线程单独占用一个 entry；引入 Ray Buffer Mask（每 entry 1 bit）、per-warp completion counter、每 entry 的 Warp ID 字段。
3. **Traversal stack 重新挂载**：把 stack 从「per-thread 共享内存」改为「per-ray-buffer-entry 附着」，消除线程重排导致的 shared memory bank conflict。
4. **内存合并性论证**：说明 RT 访存对传统 SIMT 合并优化收益极小（BVH8 节点 128B 天然占满 cache line），故重排不会带来传统核的合并损失；实测 L1 sector 访问 +14%，但 L2 仅 +1.6%（MSHR 合并吸收）。
5. **结果**：几何平均加速 **1.91×**，面积开销 **0.19%**；其中 Path Tracing **2.78×**、Ambient Occlusion 1.70×、Shadow 1.42×。

---

## 技术方案

### 核心思想

**病根**：GPU SIMT 执行模型下 warp 锁步执行（32 线程），但 BVH 遍历天然是 thread-level 的 —— 每条 ray 走不同路径、在不同深度终止。早完成的 ray 必须等同 warp 内最慢的 ray。

**关键观察（论文的三条实证依据）**：
1. **RT occupancy 高但 RT efficiency 低** —— 有足够 warp 保持 RT 单元繁忙，但实际执行遍历的线程比例低（用 Vulkan-Sim 测量 16 个 LumiBench 场景的 path tracing / shadow / AO）。
2. **RT 访存几乎不从合并获益** —— 屏幕空间 tile 带来的 ray 空间局部性在几次相交测试后就迅速发散；而 BVH8 节点占 128 B（整条 cache line），天然无发散。
3. **RT 单元是相对「窄」的流水线** —— 天然适合在不同 warp 的线程间共享，而非一次服务整个 warp。

**设计原则**：**利用发散而非消除发散**（exploit divergence rather than eliminate it）。

- **软件层**：完全不动。程序员看到的仍是标准控制流发散，active-lane mask 保持原样，ray 遍历完成后严格返回原 lane 与原 warp。
- **硬件层**：只管理 RT 单元**内部**的发散。由于整个遍历过程封装在单条复杂指令内，发散阶段被界定，硬件管理不会付出通用动态 warp 重组（recompose threads into new warps）的代价。

**为什么不用 SER**：NVIDIA 的 Shader Execution Reordering 需要写出/恢复每个线程的完整执行上下文，额外访存与延迟限制其效果；且 SER 是**遍历后的**机制，无法解决遍历进行中的发散。

### 关键技术

| 技术 | 说明 |
|------|------|
| **统一 ray buffer 池（128 entry）** | 取代基线的 4 个 warp 级 buffer group（4×32）。容量不变，但从「组」变成「扁平池」，消除内部碎片 |
| **Ray Buffer Mask（1 bit/entry）** | 追踪资源占用；dispatch 时扫描以把活跃线程分配到空闲 slot |
| **分配保 warp 原子性** | 一个 warp 只有在池中有足够空闲 entry 容纳其**全部活跃线程**时才被接纳，防止部分发射（partial warp issuance） |
| **串行化分配** | 每周期处理 1 个线程，全活跃 warp 需 32 周期 initiation interval —— 相对动辄数千至数万周期的 ray 遍历可忽略 |
| **Per-warp completion counter** | dispatch 时初始化为活跃线程数；math pipeline 判定 ray 终止时立即清 Ray Buffer Mask 对应位并递减计数；归零则该 warp 提交 trace_ray() 指令、释放 warp table entry |
| **Warp ID 字段** | 每个 buffer entry 记录来源 warp，因为 ray 被打散到非连续 entry |
| **Traversal stack 重新挂载** | stack 改为附着在 ray buffer entry 而非 thread；因为遍历按 buffer-entry 顺序进行，共享内存访问变成固定结构化模式 → 消除 bank conflict |
| **调度器改造** | 基线是每周期选 1 个 warp 发访存请求；改进后调度器从**连续的 buffer entry** 发出 32 条 ray 的组，保持基线的合并宽度与吞吐，且不增加面积开销 |
| **访存合并性分析** | BVH8 节点 128 B > 单个 sector，无 sub-sector 合并可被破坏；MSHR 合并同一 cache line 的并发请求，阻断冗余事务上浮到 L2 |

### 时间线对比（论文 Fig. 7）

```
Baseline（warp 粒度）：
  W0-3 占用 4 个 buffer group（A）
  → W4 被阻塞（B：虽有空 entry 但整组未释放）
  → W0-3 整组释放（D）→ W4 才被接纳（E）

Ray-by-Ray（ray 粒度）：
  W0-3 只有活跃线程消耗 slot（G）→ 无碎片
  → W4 立即被接纳（H）
  → 单条 ray 完成即回收资源（I）→ 释放更多 slot → W5 被接纳（J）
  两者都提供 128 条 ray 的片上缓冲
```

### 仿真配置（论文 Table II）

| 项 | 配置 |
|---|---|
| # SMs | 16 |
| Registers / SM | 65,536 |
| L1 Data Cache + Shared Memory | 192 KB，256 MSHR entries |
| # Warps / Sub-Core | 16 |
| # Sub-Core / SM | 4 |
| 执行单元 | 4 FP, 4 SFU, 4 INT, **1 RT Unit** |
| RT 吞吐 | 4 Warps = 128 Rays |
| L2 Cache | 4 MB, 32 banks |
| 内存 | LPDDR5, 200 GB/s |

基线 RT 单元并发遍历 4 个 warp（32 线程/warp，1 ray/线程），改进版对应 128 个 ray buffer entry 以维持同等吞吐。

### 微基准方法论

- 硬件：OptiX SDK 9.0.0 的 `optixTriangle` 示例，**RTX 5090**（并在 Ampere **RTX 3070** 上复现同一结论）
- 工具：CUPTI + GPUVision，周期级采样（数十周期粒度）；inline PTX 读 `%clock` 寄存器在 `optixTraverse()` 前后打时间戳，单独隔离遍历阶段（不含 shading）
- 分配粒度验证：改写 kernel 选择性 mask 掉 warp 内部分线程，精确测量遍历延迟；限制在单 SM 上运行以隔离 RT 单元流水线、排除内存层级噪声

---

## 实验结论

- **数据集**：LumiBench 套件的 16 个场景（WKND, SPRNG, SHIP, FOX, FRST, SPNZA, PARTY, LANDS, CAR, PARK, BATH, CRNVL, BUNNY, REF, ROBOT, CHSNT）
- **基线**：warp 粒度 buffer 管理的当代 RT 单元设计
- **结果**：
  - 几何平均加速 **1.91×**
  - 按技术分类：**Path Tracing 2.78×** > **AO 1.70×** > **Shadow 1.42×**
  - PT 加速最高的原因：ray 命中后会从命中点生成新 ray 模拟反射，递归性放大执行发散；随时间推移每个 warp 内活跃 ray 数下降
  - ROBOT 场景 PT 实测：活跃 ray 数从基线的「远低于上限」提升到**接近理论上限 128 rays**
  - **面积开销 0.19%**
  - **L1 sector 访问 +14%**（重排代价），**L2 sector 访问仅 +1.6%**（MSHR 合并吸收）
  - **无任何 workload 出现 MSHR allocation failure**（遍历的指针追逐特性天然限制在途请求数）
  - 加速最小的场景：**WKND** 和 **SHIP** —— BVH 树仅 0.2 MB 级别可完全装进 L1（L1 miss rate 仅 5.6% / 5.7%），L1 延迟只有数十周期，这些 workload 变成 compute-bound 而非 memory-bound

---

## 局限性

1. **仅在仿真器上验证** —— 基于 Vulkan-Sim 的 cycle-level 仿真（论文自述扩展了 Vulkan-Sim 的假设模型），未在真实流片硬件上实现。RT 核心的内部实现是专有且未公开的。
2. **仅覆盖遍历阶段** —— 机制被约束在硬件遍历阶段内部，无法处理遍历之外的发散（如 shader 执行、间接光寻址）。
3. **compute-bound 场景收益有限** —— WKND/SHIP 这类 BVH 完全驻留 L1 的场景只能获得接近 1× 的加速。
4. **L1 访存增加 14%** —— 依赖 MSHR 合并能力吸收；虽然实测无 MSHR 耗尽，但在更极端发散度或更小 MSHR 配置下存在风险。
5. **分配串行化** —— 每周期 1 线程，全活跃 warp 需 32 周期 initiation interval。
6. **依赖硬件商业机密假设** —— 对 NVIDIA RT 单元内部设计的推断虽经微基准验证，但推广到 AMD RDNA、Intel Xe-LP 等架构需重新验证。

---

## 相关工作

- [[Vulkan-Sim]] — 本文所用的研究模拟器，并对其 RT 单元假设做了修正
- [[Shader-Execution-Reordering]] — NVIDIA 的事后线程重组机制，本文指出其局限
- [[BVH]] / [[Ray-Tracing]] — 遍历加速结构与 SIMT/RT 粒度失配问题
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 同批次，同为「用物理/几何结构替代朴素细粒度 token」思路
- [[2026-10-26_HyperDrone-HyperLux-RayTracing-Engine]] — 同批次，工业级 RT 引擎

---

## 实现建议

- **实现难度**：**高**（但方向明确）。软件层零改动 —— 这是本文最重要的工程价值：不需要修改 API、着色器或 SDK，只需 RT 单元内部硬件改造。
- **预期性能**：平均 1.91× 加速；PT 负载 2.78×。面积开销 0.19%。对 memory-bound 的复杂场景收益最大。
- **适用场景**：
  - ✅ 离线 path tracer（Cycles / OptiX）—— 但需自研硬件，无法直接在消费级 GPU 上落地
  - ✅ 硬件/芯片团队：RT 单元设计的参考基线
  - ✅ 实时引擎：理解「RT occupancy ≠ RT efficiency」，推动 driver 层面的 SER 调优
  - ⚠️ 我们作为软件团队：**不可直接实施**，但可作为「RT 单元性能天花板」的理论参考
- **推荐度**：**⭐⭐⭐⭐ 值得关注** —— 对我们属「架构/硬件视角」论文，能量化为**我们自研 RT 引擎（若做硬件/驱动侧）**的设计依据；纯软件路径无法落地。价值在于建立「发散才是 RT 的主要开销来源」这一认知。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.31630
- PDF：https://arxiv.org/pdf/2610.31630
