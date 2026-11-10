---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 实时渲染, 高斯泼溅, GPU优化, 负载均衡, 光栅化, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12319
arxiv_id: 2611.12319
---

# Mitigating SM-Level Load Imbalance in 3D Gaussian Splatting on GPUs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mitigating SM-Level Load Imbalance in 3D Gaussian Splatting on GPUs |
| **作者** | Junha Ryu, Hoi-Jun Yoo（POSTECH） |
| **发表** | arXiv cs.GR, 2026-11-09 |
| **链接** | [原文](https://arxiv.org/abs/2611.12319) / [HTML 全文](https://arxiv.org/html/2611.12319v1) |
| **DOI** | —（arXiv 预印本） |
| **代码** | 论文未提供；基于 **CUDA / Nsight Compute** 实测 |

---

## 核心贡献

> **发现并解决 3DGS 实时渲染在 GPU 上的一个被忽视的瓶颈——SM 级负载不均衡导致的「执行长尾」**：用**软件定义的 GPU 调度**（持久化内核 LPT 排序 + 深度方向分块 + 饱和信令），**无需重训练、无需专用硬件**，即可与现有优化正交叠加。

1. **问题诊断**：屏幕 tile 之间的负载极度不均——标准基准 tile 高斯数最大/最小比达 **55–605×**，大规模城市场景超过 **6,100×**；由此产生**执行长尾**，绝大多数 SM 空闲而少数 SM 仍在计算重 tile。
2. **量化了「不均衡 → 低利用率」的真正条件**：仅不均衡还不够，**最重 tile 必须相对 GPU 并行容量足够大**才会造成长尾。定义 proxy = 最重 tile 高斯数 / 每 CTA 应分得的份额。
3. **持久化内核 + LPT 调度**：固定数量 CTA 从软件工作队列取 tile，**按投影高斯数降序（最长处理时间优先）派发**，消除「重 tile 启动太晚」的问题。
4. **深度方向分块 + 饱和信令**：利用 alpha blending 的**可组合性**，把重 tile 的深度序列表切成 $k$ 段并行执行；用**跨 CTA 的原子标志**通信早停信息，避免分块后重复计算本该跳过的���斯。
5. **逐帧自适应策略**：轻量代价模型决定「何时分块、切几块」，**只在预测能缩短关键路径时才分块**，避免在均衡场景引入开销。

---

## 技术方案

### 核心思想

**问题根源**：传统 3DGS 光栅化器**每个 tile 启动一个 CTA**，派发顺序交给硬件调度器——而硬件调度器**完全不知道 tile 的负载**。重 tile 可能很晚才启动，在其他所有 tile 都跑完之后还在执行，形成关键路径上的长尾。

**两个互补的解法**：

- **改「顺序」**（LPT 调度）：改变 tile 的执行顺序，但**不改变单个 tile 的执行时间**。
- **改「粒度」**（深度分块）：利用 alpha blending 的可组合性，把一个 tile 的工作切给多个 CTA，**真正缩短重 tile**。

### 关键技术

| 技术 | 说明 |
|------|------|
| Alpha blending 可组合性 | 把 tile 的深度序列表在第 $m$ 个高斯前切开：前段产出部分颜色 $C_A$ 与剩余透射率 $T_m$，后段独立计算 $C_B$（假设初始透射率为 1），合并为 $C=C_A+T_m\cdot C_B$。**因共享这一合成结构，机会可推广到 2DGS / 3DGUT / Hier-3DGS / CityGaussianV2 等变体** |
| LPT 持久化内核 | 启动 $K$ 个 CTA（= GPU 可并发数），每个 CTA 循环从软件队列 $Q$ 取 tile，队列由单次 `atomicAdd` 推进 |
| 工作负载估计 | 用 tile 在排序后高斯列表中的区间得到投影高斯数 $N_t$；对 tile 索引做基数排序（**不移动高斯数据**），开销 **< 1%** 的 alpha blending kernel 时间 |
| 深度分块 | 把深度序列表切成 $k$ 个连续块，各块独立做 alpha blending（初始透射率为 1），产出 $C_p,T_p$，再由 reduction kernel 按深度顺序合并 |
| 饱和信令 | 每个分块 tile 维护一个全局内存标志，记录**最早的、其所有像素透射率都已低于阈值的块**；用 `atomicMin` 更新；后续块**每 256 个高斯批检查一次**该标志并停止。**安全性依据：透射率沿深度序单调递减**——若更早的块已把所有像素降到阈值下，则真实透射率更低，顺序渲染本也会停止 |
| 流协同执行 | 分块工作与 LPT 工作跑在**独立 CUDA stream** 上，让硬件调度器分配 SM，**免去手动分配合并内核的调参** |
| 逐帧策略 | 用渲染管线中已有的 tile 统计量做代价估计，决定是否分块、切几块（参数 $h,k$） |

---

## 公式

```math
// Alpha blending 可组合性（式 4）—— 分块并行的理论基础
C=C_{A}+T_{m}\cdot C_{B}

// 多块合并（式 5）
C=\sum_{p=1}^{k}C_{p}\prod_{q=1}^{p-1}T_{q}

// 工作负载份额与长尾 proxy
N_{t}=\text{tile } t \text{ 的投影高斯数},\qquad
N_{\mathit{total}}=\sum_{t}N_{t},\qquad
K=\text{GPU 可并发执行的 CTA 数}

// 每 CTA 的理想份额
N_{\mathit{total}}/K

// 执行长尾 proxy = 最重 tile 的 N_t 除以每 CTA 份额
```

---

## 代码片段

```cuda
// 持久化内核 + LPT 调度（论文 4.1）
// 启动 K 个 CTA（K = GPU 并发 SM 数）
__global__ void persistent_kernel(..., TileQueue* Q) {
    while (true) {
        // 每个 CTA 用单次 atomicAdd 推进软件管理的 tile 队列
        unsigned int tile_idx = atomicAdd(&Q->head, 1u);
        if (tile_idx >= Q->count) break;          // 队列空
        // 队列已按投影高斯数 N_t 降序（基数排序，只排索引不动高斯数据）
        render_tile(tile_idx, ...);
    }
}

// 深度分块 + 饱和信令（论文 4.2）
// 每个分块 tile 维护 global memory 上的 "最早饱和块" 标志
__device__ unsigned int saturation_flag;   // 用 atomicMin 更新

// 分块 p 独立计算（初始透射率 = 1）
partial_color_t cp = alpha_blend_chunk(tile, chunk_begin, chunk_end, T=1.0f);

// 每 256 个高斯批检查一次早停标志
if ((i & 255) == 0) {
    if (atomicMin(&saturation_flag, my_chunk_id) < my_chunk_id) {
        // 更早的块已饱和 → 本块后续高斯必然被顺序渲染跳过，可停止
        break;
    }
}

// reduction kernel：按深度顺序合并
C = sum_{p=1..k} C_p * prod_{q<p} T_q;
```

---

## 实验结论

- **硬件**：NVIDIA GB10（48 SM）与 NVIDIA RTX A6000（84 SM）。
- **场景**：
  - 标准基准全 13 场景：Mip-NeRF 360（9）、Tanks & Temples（3）、Deep Blending（2），用 3DGS；其中 4 个用 2DGS 与 3DGUT。
  - train / truck 场景用 SwiftGS、HiGS；small_city 用 Hier-3DGS；MatrixCity 的 aerial / street 用 2DGS-based CityGaussianV2。
  - 通过 **gsplat** 渲染 15 个驾驶序列（nuScenes / Argoverse 2 / PandaSet / Waymo，由 OmniRe 重建）的前视相机。
  - NVIDIA NuRec 场景的 8 个视角（3DGUT）；Lyra 2.0 生成的 3 个世界模型场景。
- **对比配置**：Vanilla（原始光栅化器）、LPT-only、Chunking-only（每 tile 都切）、Ours（LPT + 逐帧策略下的选择性分块）。

- **结果（性能，Figure 12）**：
  - **驾驶场景平均 1.23×**，标准基准平均 **1.12×**，单帧最高 **3.20×**。
  - **Hier-3DGS：平均 2.93×，单帧最高 5.64×**（最不均衡的场景收益最大）。
  - 驾驶场景 nuScenes scene 005：Ours 达 **1.77×**，而 LPT-only 只有 1.06× → **选择性分块在此不可或缺**。
  - Chunking-only 在相对均衡的场景会**引入开销**（逐帧策略正是为避免这一点）。
  - 3DGUT 的 NuRec 视角 **1.22–1.31×**；CityGaussianV2 的 street **1.10×**，aerial **1.01×**（与 Vanilla 持平）。
  - 与优化光栅化器叠加：**SwiftGS 上 1.24×（最高 2.09×）**，**HiGS 上 1.23×（每帧 1.08–1.43×）**；truck（较均衡）上分别为 1.08× 和 1.01×。
  - **GPU 架构对比**：A6000（84 SM）上 **1.13–2.13×（均值 1.45×）**；GB10（48 SM）上 1.10–1.77×（均值 1.32×）→ **GPU 规模越大，本方法收益越高**。
  - **世界模型生成场景**（Lyra 2.0）：平均 1.07–1.17×，最不均衡帧最高 2.86×（LPT-only 仅 1.01–1.06×）→ 收益取决于**负载分布**而非场景构造方式。

- **结果（质量，Table 1，Chunking-only 对 Vanilla 的差异）**：24 个场景上差异至多 **0.0015 dB PSNR、$2.4\times10^{-5}$ SSIM、$7\times10^{-5}$ LPIPS**；驾驶与 NuRec 工作负载的**每一帧**输出都保持在原渲染器 **76 dB PSNR 以上**。

- **关键分析（5.4 节，设计替代方案）**：
  - **投影高斯数是有效的工作负载 proxy**：离线 oracle 按「实际处理的高斯数」排序只比本文快 **1.3%**；而**颠倒顺序会使执行时间增加 37%**。说明 early termination 只是减少工作量，投影计数是**保守估计**，无需运行时 profiling 即达近似 oracle。
  - **流协同执行优于融合内核**：把 chunk 与 LPT 合并到一个持久化内核（CTA 分区 + 工作窃取）时，延迟对 CTA 分配比例敏感，最优值随负载变化；即使逐负载调优，融合也只能减少 <1% 延迟，而次优划分反而使延迟增加最多 29%。
  - **优于 CaT-GS**（Zhang et al. 2026，按均值 2× 阈值切分所有 tile）：本文在 3DGS train 上平均快 **40.5%**，Hier-3DGS 上快 **16.0%**，且任一帧最大回退仅 3.4%。

- **SM 利用率实测（3.2 节）**：Street Gaussians 最重 tile 仅为每 CTA 份额的 **1.1×**，平均 SM 活跃率 **88.2%**；3DGS train 为 1.7× / **49.2%**；Hier-3DGS 为 6.8× / **24.9%**。

- **LPT 单独效果（4.1 节）**：3DGS train 上缩短 alpha blending kernel **25%**，Street Gaussians **14%**，Hier-3DGS 仅 **7%**（因其最重 tile 是份额的 6.8×，即使最先启动仍拖尾）。

---

## 局限性

（论文设有「6 Limitations and Conclusion」小节）

- **只解决执行长尾，不解决场景表示本身的问题**——不改变高斯数量或内存占用。
- **质量影响虽极小但非零**：分块改变了浮点累加顺序，最多 0.0015 dB PSNR 的偏差。
- **收益强依赖负载分布**：均衡场景（CityGaussianV2 aerial 1.01×、truck 1.01×）几乎无收益；GPU SM 越少收益越小。
- **分块有额外开销**：部分结果的全局内存流量 + reduction pass，故必须由逐帧策略决定何时分块。
- **依赖 tile 统计量可得**：策略需要渲染管线中已有的 tile 统计信息；自建管线需自行提供。
- 论文未报告对内存占用的影响（分块需要额外存储部分结果）。

---

## 相关工作

- [[2026-11-10_SM-Level-Load-Imbalance-3DGS]]
- 高斯泼溅：[[3D Gaussian Splatting]] [[可微渲染]] [[光栅化与分块渲染]]
- GPU 调度：[[持久化内核]] [[工作负载均衡]] [[CUDA 流与协同执行]]
- 关键引文：
  - **Flash-Decoding**（Dao et al. 2023）——分块并行长序列计算 + 部分结果合并，本文分块思想的直接类比
  - **FlashAttention-3**（Shah et al. 2024）、**FlashInfer**（Ye et al. 2025）、**Mirage Persistent Kernel**（Cheng et al. 2026）——持久化内核在 LLM 负载上的应用
  - **CaT-GS**（Zhang et al. 2026）——按均值阈值切分 tile，本文的主要对比
  - gsplat（Ye et al. 2025）、3DGUT、Hier-3DGS、CityGaussianV2、SwiftGS（Gao et al. 2026）、HiGS（Pająk et al. 2026）、Street Gaussians、OmniRe、Lyra 2.0

---

## 实现建议

- **实现难度**：**中高**（需要改写 3DGS 光栅化器的 tile 派发逻辑 + 持久化内核 + 跨 CTA 饱和信令 + 归约内核；核心算法本身清晰）
- **预期性能**：标准基准 1.12×，驾驶场景 1.23×，最不均衡场景 2.93×（单帧最高 5.64×）；质量损失 < 0.0015 dB PSNR
- **适用场景**：
  - ✅ **大规模城市场景 / 驾驶仿真 / 世界模型生成场景**——tile 不均衡最严重的场景
  - ✅ 已有 3DGS 变体（2DGS / 3DGUT / Hier-3DGS / CityGaussianV2）**无需重训练即可套用**
  - ✅ 与 SwiftGS / HiGS 等优化光栅化器**叠加**使用
  - ✅ GPU SM 越多的新硬件收益越大
  - ❌ 均衡的小场景（收益 ≈ 1.0×）
  - ❌ 需要逐位确定性输出的场景（分块改变浮点累加顺序）
- **落地建议**：
  1. **先测量，再优化**：用 Nsight Compute 统计每 tile 的高斯数，算「最重 tile / 每 CTA 份额」比值。**比值 < 1.5 基本没收益；> 3 收益显著**（Street Gaussians 1.1× → 49.2% SM 利用率；Hier-3DGS 6.8× → 24.9%）
  2. **先只上 LPT**：实现成本极低（队列 + 基数排序），在标准基准上就有 1.1–1.6×；排序只动 tile 索引不动高斯数据，开销 < 1%
  3. **再按需加分块**：只有当长尾 proxy 超过阈值时才启用，且必须用**逐帧代价模型**而非固定策略（CaT-GS 式固定阈值在均衡场景会大量误切）
  4. **饱和信令是安全底线**：不实现它，分块后会重新计算顺序渲染本该跳过的高斯，退化收益甚至变慢
  5. **用独立 CUDA stream 协同执行**而非融合内核——融合需调参且次优划分会反噬 29%
  6. 用**投影高斯数**做 proxy 即可，无需运行时 profiling（oracle 只快 1.3%）
  7. 因为分块改变浮点累加顺序，需在回归测试中容忍 ~0.0015 dB 的 PSNR 偏差
- **优先级**：**中高**——对已有 3DGS 管线的工程团队是低风险、高回报的即插即用优化
