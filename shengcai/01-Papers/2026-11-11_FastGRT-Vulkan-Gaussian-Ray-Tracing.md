---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, ray-tracing, BVH, Gaussian-Splatting, Vulkan, differentiable-rendering, real-time-rendering, GPU-optimization, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.11586
---

# FastGRT: Accelerating Training of 3D Gaussian Ray Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FastGRT: Accelerating Training of 3D Gaussian Ray Tracing |
| **作者** | Meet Banthia*, Xiaoteng Liu*, Hexu Zhao, Aurojit Panda, Jinyang Li（*共同一作） |
| **单位** | New York University (NYU) |
| **发表** | arXiv preprint（cs.CV; cs.LG）2026-11-08（v1），ICML 模板 |
| **链接** | [原文](https://arxiv.org/abs/2611.11586) · [PDF](https://arxiv.org/pdf/2611.11586v1) · [HTML](https://arxiv.org/html/2611.11586v1) |
| **DOI** | 10.48550/arXiv.2611.11586 |
| **代码** | https://github.com/meetbanthia/fastgrt （**开源**） |

---

## 核心贡献

> **训练成本的大头不在光线遍历本身，而在遍历周围的"计算组织方式"** —— 复用前向命中、聚合梯度原子操作、混合 BVH 更新，可在**完全保持 3DGRT 渲染公式**的前提下把训练加速 **1.9–4.97×**。

1. **消除反向传播中的重复追踪（Hit Replay）**：前向 pass 用**自适应多轮遍历（adaptive multi-round traversal）**把每条光线命中的全部 Gaussian 记录到**合并访问（coalesced）的逐像素归档**中，反向 pass 直接重放（replay）这些命中而**不再遍历 BVH**，且**不对每条光线的轮数设上限**（避免了 RaySplats 的近似）。
2. **快速梯度累加器（Fast Gradient Accumulator）**：邻近命中同一 Gaussian 的光线**先在片上（on-chip）合并梯度**，再发出全局原子操作（global atomics）—— 在全分辨率下**反向 pass 最多快 10×**。
3. **混合 BVH 更新策略（Hybrid BVH Update）**：Gaussian 集合不变时**原地 refit（重拟合）** BVH，仅在 Gaussian 数量变化或周期性才重建—— 避免每迭代全量重建的巨额成本。
4. **首个同时支持训练与渲染的 Vulkan GRT 实现**（GRTX 也在 Vulkan，但代码未公开；`vk_gaussian_splatting` 只支持渲染）。

---

## 技术方案

### 核心思想

3DGRT 的每个训练迭代分三阶段：**forward pass → backward pass → BVH update**。论文实测发现 **backward pass 才是真正瓶颈**（而非光线遍历），于是从"组织方式"入手做三项优化，**不改变任何被混合的 Gaussian 集合**，因此渲染结果与 3DGRT 严格等价。

| 阶段 | 3DGRT 做法 | FastGRT 做法 | 收益 |
|------|------------|-------------|------|
| Forward | 单个 megakernel 内做「遍历+排序+混合」，只记录最远命中距离 | 拆成 **有界轮次（round）** 的轻量遍历+混合，**同时记录全部命中**到逐像素归档；长光线交给 fallback megakernel | 记录开销 ≈ 0，前向几乎不变 |
| Backward | **重新遍历 BVH** 找回同样的命中 | **重放归档**中的命中列表，零额外遍历 | 大头收益 |
| 梯度 | 每条光线直接对全局显存做 atomic 累加 | **subgroup 内片上聚合**后再发全局 atomic | 全分辨率最高快 10× |
| BVH | **每迭代重建** | Gaussian 集合不变时 **refit**，变化或周期性才 rebuild | 户外场景收益大 |

### 关键技术

| 技术 | 说明 |
|------|------|
| **Megakernel** | 沿用光线追踪文献（Laine et al. 2013）的术语：整个 per-ray 循环跑在**一个 kernel** 内。3DGRT 的遍历/排序/混合全在其中 |
| **Adaptive multi-round traversal** | 第一阶段执行 R 轮轻量「遍历-混合」；短光线在 R 轮内终止，剩余**长光线（long rays）**由 fallback megakernel 继续处理直到满足终止条件。**不限制每条光线的轮数** |
| **Coalesced hit archive** | 每步遍历的写入位置**预先可知**，使邻近光线写入邻近地址 → 保住内存合并访问（coalescing）。直接只存「被接受的命中」会导致发散写、破坏合并 |
| **Fast gradient accumulator** | 受 DISTWAR 启发，但需在 **Vulkan 不保证 invocation→subgroup 映射**的前提下工作；聚合对象是「per-ray 重放的命中列表」而非光栅化 fragment |
| **Hybrid BVH update** | refit 无法容纳 Gaussian 数量变化，且反复 refit 会逐步降低遍历效率 → 组合策略 |
| **Icosahedral proxy** | 沿用 3DGRT：每个 Gaussian 用 **20 面正二十面体**紧致包围，以便走硬件加速的**光线-三角形求交**。代价：Bicycle 场景 ~6.8M Gaussian ⇒ **~136M 三角形**，每迭代重建 BVH 代价巨大 |

### 3DGRT 基线的定量拆解

论文 Fig. 2 给出 Mip-NeRF 360 的 **Bonsai（室内）与 Bicycle（户外）** 在不同分辨率下的训练时间拆解：

- **全分辨率**：backward pass 在所有迭代中占主导
- **1/2 分辨率**：backward 仍是瓶颈（Bonsai 等室内场景）
- **1/4 分辨率**：**BVH update 接管成为瓶颈**（Bicycle 等户外场景，Gaussian 数量暴增）

> 这解释了瓶颈的迁移机制：**分辨率越低 → 处理的光线越少 → backward 变快；但同时 Gaussian 群体因密度化而变大 → BVH 时间上升**，于是瓶颈从 backward 转移到 BVH。

---

## 公式

高斯协方差参数化：

```math
\boldsymbol{\Sigma}_i=\mathbf{R}_i\mathbf{S}_i\mathbf{S}_i^{T}\mathbf{R}_i^{T}
```

其中 $\mathbf{R}_i$ 与 $\mathbf{S}_i$ 决定椭球的旋转与缩放；每个 Gaussian 用 **48 个球谐（SH）系数**表示视角相关颜色。

前向/反向边界条件（3DGRT 原样保留）：3DGRT 存储每像素**最远被接受的命中距离**，反向 pass 用它来界定重遍历范围以找回相同的贡献 Gaussian。

---

## 代码片段

论文未给出完整代码，但描述了关键实现结构（基于 Vulkan compute pipeline）：

```cpp
// 概念性伪代码：自适应多轮遍历 + 命中归档
for (round = 0; round < R; ++round) {
    // 轻量遍历-混合循环，轮内写入位置预先可知
    traverse_round(payload, round, archive_offset[round]);
    blend_into_pixel(payload);
    if (payload.transmittance < MIN_TRANSMITTANCE) {
        payload.terminated = true;   // 短光线：就地退出
    }
}
// fallback megakernel：仅长光线继续（已终止的光线立即 return）
dispatch_fallback_long_rays(pixels);
```

```cpp
// 反向：重放归档，不再遍历 BVH
for (hit in archive[pixel]) {
    // 片上聚合：同一 subgroup 内先合并对同一 Gaussian 的梯度
    subgroup_reduce_atomic_add(hit.gaussian_id, hit.gradient);
}
// 最后统一发出全局 atomic
```

---

## 实验结论

- **数据集**: Mip-NeRF 360（标准分辨率：室内 1/2、户外 1/4；另有全分辨率实验）、Tanks and Temples、Deep Blending、Zip-NeRF（鱼眼/畸变相机，1/8 分辨率）
- **硬件**: NVIDIA RTX PRO 6000 Blackwell，驱动 610.43.02，Vulkan 1.4，CUDA 12.8.1
- **基线**: 3DGRT（官方开源实现，OptiX）；3DGS（作为训练时间参照，但**不支持畸变相机**，故 Zip-NeRF 上不比较）

### 端到端训练加速

> **FastGRT 相比 3DGRT 训练快 1.9–4.97×**，渲染质量与渲染性能持平。

- **加速在更高分辨率下更大**（Fig. 10），因为 backward pass 在高分辨率下代价急剧上升
- 优化收益主要来自 **backward pass**（Fig. 11）；**全分辨率下最大贡献是 atomic reduction**（单项就把迭代时间减少 **300 ms**）
- **标准分辨率**下则由 atomic reduction（如 Bonsai @1/2）与 BVH update（如 Bicycle @1/4）共同贡献

### 阶段拆解（bicycle，全分辨率）

| 阶段 | OptiX 基线（3DGRT） | FastGRT（三项优化全开） |
|------|---------------------|------------------------|
| **backward pass** | **484 ms**（占 659 ms 一步的 ~4.6× 前向） | **43 ms**（↓ ~11×） |
| **BVH update** | （占大头） | **16 ms** |
| **forward pass** | ~96 ms（推算） | **96 ms**（**变成新的瓶颈**，>2× backward） |
| **整步** | 659 ms | ~155 ms |

### 渲染质量（最终收敛 checkpoint，标准分辨率，各数据集内场景均值）

| 方法 | Mip-NeRF 360<br>PSNR↑ / LPIPS↓ / SSIM↑ | Deep Blending<br>PSNR / LPIPS / SSIM | Tanks&Temples<br>PSNR / LPIPS / SSIM | Zip-NeRF<br>PSNR / LPIPS / SSIM |
|---|---|---|---|---|
| 3DGRT | 27.88 / 0.241 / 0.851 | 29.45 / 0.332 / 0.896 | 22.54 / 0.216 / 0.829 | 24.33 / 0.257 / 0.848 |
| **FastGRT** | **28.08** / 0.241 / **0.852** | 29.45 / **0.330** / 0.896 | 22.54 / **0.214** / **0.831** | **24.34** / 0.261 / 0.847 |

> **Mip-NeRF 360 上的 PSNR 差异（+0.20）不是算法改进**，而是论文发现的**3DGRT 上游 bug**：浮点精度导致前向最后一个命中在反向重遍历时被跳过。FastGRT 因重放前向结果而**天然规避**了该问题。

### 峰值 GPU 显存（标准分辨率）

| 场景 | FastGRT (GiB) | 3DGRT (GiB) | 倍数 |
|------|---------------|-------------|------|
| Bonsai | 13.1 | 7.5 | 1.75× |
| Counter | 10.9 | 5.3 | 2.06× |
| Kitchen | 13.0 | 5.8 | 2.24× |
| Room | 10.0 | 5.4 | 1.85× |
| Bicycle | 49.0 | 32.6 | 1.50× |
| Garden | 30.7 | 19.5 | 1.57× |
| Stump | 40.4 | 33.0 | 1.22× |

> **这是本文的主要代价**：存储前向命中使显存足迹**随图像分辨率线性增长**。3DGRT 在户外场景本就需 ~30 GiB，FastGRT 最高到 **49 GiB (Bicycle)**。推理阶段关闭命中存储，故渲染显存不受影响。

---

## 局限性

1. **显存开销显著增加**（1.2–2.2×），且随分辨率线性增长 —— 40 GB 级卡上跑满分辨率 Bicycle 场景需留意。
2. **atomic reduction 的收益依赖光线局部性**：Vulkan 不保证 invocation→pixel 映射，邻近光线可能落在不同 subgroup，导致聚合失效。
3. **对反射/折射二次光线收益下降**：发散度增大 → 共享 Gaussian 竞争减少 → 聚合收益低，而遍历与内存访问不规则性上升。
4. **前向 pass 成为新瓶颈**（96 ms，占整步 >50%），进一步加速需从「按光线深度自适应命中数」「光线重排序（NVIDIA 2022）」「降精度着色」入手。
5. **实现门槛高**：需要自行在 Vulkan 上实现可微 GRT 的训练 + 渲染（OptiX 路线不可用，因 OptiX 无训练支持）。
6. **与 3DGRT 的 PSNR 不可完全对齐**（浮点 bug 差异），严格复现需注意。

---

## 相关工作

- **[[2026-05-28_GRTX_Gaussian_Ray_Tracing]]** — GRTX 同样用 Vulkan，通过把各向异性 Gaussian 归一化为单位球简化求交并提出硬件扩展（**未开源**）；与本文**互补**（它优化遍历机制，本文优化训练的系统组织）
- **[[2026-07-01-GRay-Ray-Tracing-3D-Gaussians]]** — GRay 走算法/表示层路线（稠密初始化迁移）
- **3DGART**（Vit et al. 2026）— 也定位反向 pass 的梯度累加瓶颈，但用 primitive-major 组织 + tile-primitive 映射；**依赖透视投影**，无法处理畸变相机
- **Stochastic ray tracing**（Xu et al. 2026）— 用无偏 MC 估计替代前后排序混合，**改变了渲染公式**
- **RaySplats**（Byrski et al. 2025）— 同样复用前向命中，但**假设命中数上限并修改终止条件**（有近似），且未报告复用收益
- **DISTWAR**（Durvasula et al. 2023）— 光栅化管线的 warp 级梯度归约；本文是其思想在光线追踪 + Vulkan 约束下的移植
- **3DGS / FastGS / CLM-GS / 3DGUT / EDGS** — 光栅化路线（对比：3DGS 不支持畸变相机）

---

## 实现建议

- **实现难度**: **中高**（Vulkan compute + 可微光栅化/追踪 + 梯度原子归约 + BVH refit/rebuild 四件套；但**算法本身不改渲染公式**，迁移风险低）
- **预期性能**: 训练 **1.9–4.97×** 加速；backward pass 最高 10×；**显存 +1.2–2.2×**；渲染质量与 3DGRT 持平（PSNR 反而略高）
- **适用场景**:
  - ✅ 任何使用 **3DGRT / 可微高斯光追**做 NVS 训练的项目（这是最快的工程化加速路径）
  - ✅ **畸变/鱼眼相机**场景（3DGS 路线不可用，必须走光追）
  - ✅ 二次反射/折射（ray-splatting 难表达的场景）
  - ⚠️ 显存受限场景（≤24 GiB）需先评估，或采用「低分辨率训练 + 高分辨率推理」策略
  - ❌ 仅需推理、不需训练的用户 —— 论文明确指出**推理时 megakernel 更优**（无 backward/BVH 开销，内存压力低）
- **建议动作**: 传递给 **@墨鱼丸** 作为 GRT 训练管线优化的参考实现；与 [[2026-05-28_GRTX_Gaussian_Ray_Tracing]] 一并评估（前者需硬件扩展，后者纯软件可落地）
- **优先级**: **高** —— 这是本轮唯一直接命中「ray tracing + BVH + GPU 优化」关键词且**代码开源**的论文
