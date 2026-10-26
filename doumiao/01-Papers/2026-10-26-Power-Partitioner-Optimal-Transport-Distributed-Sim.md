---
type: paper
title: "A Practical Partitioner for Distributed Simulations on Sparse Dynamic Domains Using Optimal Transport"
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
category: [surface-rendering, volume-rendering]
tags: [distributed-simulation, optimal-transport, load-balancing, power-diagram, VFX-pipeline, free-surface-liquid, SPH, PIC-FLIP, sinkhorn]
venue: SIGGRAPH Asia 2026 (presented); ACM TOG 45(2) Article 20
doi: 10.1145/3787521
arxiv: null
status: completed
---

# The Power Partitioner — 用最优传输做稀疏动态域的分布式仿真分区

## 📌 基本信息

| 项目 | 值 |
|------|---|
| **别名** | "The Power Partitioner"（作者自用名） |
| **作者** | Joel Wretborn (Wētā FX + University of Waterloo), Marcus Schoo (Wētā FX), Noh-hoon Lee (Wētā FX), Christopher Batty (U. Waterloo), Alexey Stomakhin (Wētā FX) |
| **期刊** | ACM Transactions on Graphics, Vol. 45, No. 2, Article 20, 2026年1月 |
| **DOI** | [10.1145/3787521](https://doi.org/10.1145/3787521) |
| **会议演讲** | SIGGRAPH Asia 2026（吉隆坡，2026-12-01~04） |
| **项目页** | https://www.wetafx.co.nz/videos/a-practical-partitioner-for-distributed-simulations-on-sparse-dynamic-domains-using-optimal-transport |
| **补充视频** | YouTube `jSfscOjH33g`（Wētā FX 官方频道） |
| **PDF** | https://alexey.stomakhin.com/research/tog2026_partitioner.pdf · https://www.wetafx.co.nz/assets/Uploads/PDFs/2026_Power_partitioner_v09.pdf （同一论文的两种排版） |
| **arXiv** | **无**（4 次 API 查询均为 0 结果） |
| **代码** | 无公开发布 |
| **页数** | 14 页 |
| **收稿/接收** | 2025-06-25 收稿 / 2025-11-18 修订 / 2025-11-25 接收 |

> **收录理由**：这是 **Wētā FX（《指环王》/《阿凡达》级 VFX 工作室）的一篇生产级论文**，用**真实电影制作数据**做评估 —— 在流体渲染知识库中，这类"从制作管线倒推算法"的论文极为稀缺，其指标体系可直接指导大规模流体渲染的集群渲染资源分配。

---

## 🎯 核心问题

VFX 行业的**大规模物理仿真**（基于偏微分方程）建模自由表面液体、火焰、爆炸等现象，其计算域**形状与拓扑快速演化**。这类仿真的分布式执行面临三重困难：

1. **负载不均**：域内各区域计算量差异巨大（自由表面、湍流活跃区 vs 静区）
2. **通信开销**：邻居数据跨节点交换，发生在分区边界
3. **重划分抖动**：域形状快速变化 → 每步重划分 → 数据在 rank 间反复搬家（reshuffling）

**现有方法的不足**：
- **SFC（Space-Filling Curve，Hilbert/Morton）**：把域嵌入包围立方体，细分为 n³ 个子盒（n 为 2 的幂，本文用 1024），沿曲线排序后切成 R 个连续区间。**局部性好但无法匹配负载**，且对域形状高度敏感。
- **METIS**：把域建成图 G（域为顶点、邻接为边），用 `METIS_PartGraphRecursive` 图分区。局部性好，但**每步都可能完全重排**（METIS 每步打乱 57% 的域）。

**本文方案**：用**最优传输（Optimal Transport）**构造**幂图（power diagram）**分区，同时满足负载均衡、通信最小化与时间一致性。

---

## 🔬 方法

### 1. 稀疏域与桶（bucket）抽象

- 域 `D_t` 是**稀疏网格**上的**桶集合**（每个桶是 4³~8³ 体素）
- 粒子只是"每桶的负载权重 `W_b`"，不直接参与分区
- 每个桶的工作量 `W_b` 反映处理该桶所需的实际计算
- **工作单元是桶，不是粒子** —— 这使方法与 SPH/FEM/MPM 等具体粒子格式解耦（重要设计决策）

### 2. 熵正则化平衡最优传输

代价函数（平方欧氏距离）：

```
C_rb = ||x_r − x_b||²₂
```

平衡 OT 约束（论文 Eq. 3–5）：

```
min  Σ_{r,b} T_rb · C_rb
s.t. Σ_b T_rb = W_b          （每个 rank 承担等量工作）
     Σ_r T_rb = W_b          （每个桶的全部工作量被完整分配）
     T ≥ 0
```

**求解**：Sinkhorn 算法（Eq. 8–9），复杂度 **`O(R|D|)`**；另提供 log-domain 变体（Eq. 11–13）以应对小 ε。

### 3. 从传输计划得到分区

```
分区 = argmax_r T_rb         (Eq. 15)
```

即每个桶分配给"传输权重最大"的 rank —— 这正好对应**幂图（power diagram）**的结构（每个点集的 Voronoi 区域按幂加权）。

**Lloyd 算法**迭代：把 rank 的"位点" `x_r` 移到其负责桶的质心（Eq. 6），反复精化。

### 4. 关键调度参数

| 参数 | 值 | 含义 |
|------|-----|------|
| `E` | **10** | 第一步的正则化强度 `ε₁ = Γ(C₁)/E` |
| `η` | **2/3** | 衰减系数 `ε_l = η·ε_{l−1}` |
| `τ_load` | **0.01** | 负载不均容忍阈值（`max_r λ_r < 0.01`） |
| `τ_sinkhorn` | `0.5·τ_load` | Sinkhorn 停止阈值 |
| Lloyd 迭代 | 1~3 次 | 典型值 |

### 5. 稀疏性与动态性的处理

- **重划分频率**：**每个时间步一次**（`P_t = P(D⁰_t)`）
- **增量分配**（Eq. 17）：新桶用**最近 rank 位点**做初始分配
- **warm-start**：rank 位点 `x_r` 从上一时间步热启动
- **位点随机但时间恒定**：位点本身随机采样，但**在时间上保持不变**（这是时间一致性的来源）
- **粗化**：桶数可粗化到 `|D_coarse| ≈ 64k`

---

## 📊 评价指标（本文自创，实用价值高）

### 1. 负载指数（Load index）

```
λ_P(r) = | (Σ_{b∈P_r} W_b)/L − 1 |          (Eq. 18)
```

其中 `L` 为理想均分负载。**接近 0 = 负载被均分**。

### 2. 表面指数（Surface index）—— 通信量代理

```
σ_P(r) = |(T(P_r) \ P_r) ∩ D_t| / |P_r|      (Eq. 19)
```

分子是 rank `r` 拥有的桶的**外部邻居桶数**（需要跨节点通信），分母是它拥有的桶数。

### 3. 时间一致性指数（Temporal consistency index）—— 重划分抖动代理

```
ν(P1, P2, S) = |{b ∈ S : P1(b) ≠ P2(b)}| / |S|   (Eq. 20)
```

= 换过 rank 的桶的相对比例。**0 = 分区完全不变，无数据需传输**。

---

## 📈 实验结果

### 硬件

**纯 CPU，无 GPU**：每节点 **64 物理核**（禁用超线程）+ 256 GB RAM，OpenMP 并行。多级树网络拓扑，约 **20 Gbps** 全双工，节点间 RTT **0.1–0.5 ms**。

### 动态域结果（论文 Table 2）

| 场景 | R | \|D_t\| | SFC σ / ν / 时间 | METIS σ / ν / 时间 | **Power σ / ν / 时间** |
|------|---|--------|--------------------|---------------------|--------------------------|
| **Boat wake** | 4 | 10.4K–671K | 0.120 / 0.006 / 2h29m | 0.070 / **0.736** / 7h26m | 0.094 / **0.003** / **2h13m** |
| **Flamethrower** | 4 | 150–207K | 0.205 / 0.044 / 5h11m | 0.093 / **0.737** / 7h10m | 0.123 / **0.017** / **4h14m** |
| **Turntable** R=2 | 2 | 397K–599K | 0.025 / 0.036 / 35m20s | 0.013 / **0.544** / 43m25s | 0.020 / 0.016 / **31m34s** |
| Turntable R=4 | 4 | — | 0.052 / 0.078 / 21m52s | 0.030 / **0.746** / 30m7s | 0.040 / 0.032 / **18m28s** |
| Turntable R=8 | 8 | — | 0.136 / 0.205 / 18m33s | 0.082 / **0.858** / 19m38s | 0.089 / 0.037 / **12m18s** |
| Turntable R=16 | 16 | — | 0.266 / 0.328 / 13m33s | 0.122 / **0.901** / 13m36s | 0.135 / 0.053 / **9m24s** |
| Turntable R=32 | 32 | — | 0.395 / 0.503 / 10m14s | 0.162 / **0.939** / 9m18s | 0.193 / 0.067 / **7m54s** |
| **Fight scene** | 8 | 32.5K–369K | 0.214 / 0.318 / — | 0.192 / **0.668** / — | 0.145 / 0.089 / — |
| **Corpus（133 个缓存）** | 2–32 | 10K–1.2M | 0.155 / **9.34×** | 0.081 / **505.41×** | 0.100 / 0.008 |

（括号内为相对 Power 的比值；σ 列括号为相对倍数，ν 列括号为相对倍数）

### 关键结论

**1. 时间一致性大幅领先**
- 相对 **SFC 好 9.34×**，相对 **METIS 好 505×**
- METIS 每步**打乱 57% 的域**；Power 的 ν 仅为 **0.008**
- 重划分数据量最多比 METIS **少 422.8×**

**2. 表面指数：优于 SFC，略逊于 METIS**
- 相对 SFC 好 **1.83×**
- 相对 METIS 为 **0.82×**（即 METIS 在通信量上仍略优）
- 这是论文的诚实之处：Power 的强项是**时间一致性**，不是单帧通信量

**3. 端到端运行时大幅领先**
- Boat wake：METIS **7h26m** → Power **2h13m**（**3.35× 加速**）
- Flamethrower：7h10m → 4h14m（1.69×）
- Turntable R=32：9m18m → 7m54m（1.18×）
- 论文摘要称**最高 70% 提速**

**4. Turntable 随 rank 数增加优势扩大**
R=2 时 1.12× → R=32 时 1.29×（相对 SFC），说明**节点越多，Power 的时间一致性收益越大**。

**5. 场景规模**
- Fig. 1：**约 500 GB 的 PIC 水体仿真**，8 ranks
- 语料库：**133 个生产缓存 / 102,580 帧**
- 最大规模：**1.69 亿粒子 / 4 台机器**

### 其他实验设置

- **弱扩展（静态域）**：三个解析域拓扑 —— 蜿蜒河流、烟羽、海洋表面（由解析 SDF 定义），`|P_r| ≈ 70k`
- **强扩展（动态域）**：快速旋转的矩形盒，24 帧，`|D_t| ≈ 500k`
- 求解器：不可压缩 Euler 方程 + 压力投影（SOR 固定 100 次迭代）+ 半拉格朗日平流（三线性插值 + 一阶 RK 回溯），10 个时间步

---

## ⚠️ 重要澄清与局限（避免误读）

子代理核查报告明确指出以下**常见误读**，务必注意：

| 常见假设 | 实际情况 |
|---------|---------|
| 有 arXiv 版本 | **没有**（4 次 API 查询均为 0） |
| 使用非平衡最优传输 | **是平衡 OT**（Eq. 4–5） |
| 计算 Wasserstein 距离 | **没有显式计算 Wasserstein 距离** |
| 使用 GPU | **全 CPU**（64 核/节点，OpenMP，20 Gbps，RTT 0.1–0.5 ms） |
| 有渲染实验 | **没有** —— 纯仿真侧；与流体渲染的关联是**间接的**（吞吐/分辨率/显存余量） |
| 针对 SPH/FEM 粒子 | **不针对特定粒子格式** —— 工作单元是稀疏网格**桶**（4³~8³ 体素），粒子仅作为每桶的负载权重 |
| 有专门的 Limitations 章节 | **没有** —— 8 条局限散见于正文：缺乏形式化收敛证明、无显式通信量最小化保证、Sinkhorn 的 `O(R|D|)` 成本、表面指数仅是代理指标 |

---

## 🩸 可行性分析：最优传输分区技术

### 渲染方法
- **类型**：表面渲染 / 体积渲染（**渲染基础设施层**，非渲染算法本身）
- **技术**：熵正则化平衡最优传输 + 幂图分区 + Sinkhorn 求解 + Lloyd 迭代 + warm-start

### 视觉质量
- **逼真度**：不适用（不影响画质本身）
- **风格化支持**：不适用

### 性能预期
- **帧率**：不直接提升渲染帧率，但**显著缩短仿真墙钟时间**（Boat wake 3.35×、Turntable 最高 1.29×）
- **GPU 需求**：无（纯 CPU）
- **内存占用**：显著降低 —— 重划分数据传输最多减少 **422.8×**，避免大规模粒子/网格跨节点搬家

### 实现建议
- **着色器复杂度**：不适用
- **管线要求**：需要分布式仿真框架（域分桶 + rank 通信层）；**与粒子格式解耦**，可直接套到 SPH/PIC-FLIP/MPM 之上
- **推荐度**：✅ **推荐（面向大规模生产）** —— 若在做百 GB 级流体仿真 / 集群渲染的预算与调度，这是目前最贴近工业实践的分区方案；小规模单机场景收益有限

### 对本库算法 Agent 的落地建议
1. 若已在做分布式流体渲染的**资源调度**，引入 surface index 与 temporal consistency index 两个指标来量化分区质量
2. 注意 METIS 在**单帧通信量**上仍略优（0.82×）—— 若通信是瓶颈，Power 未必是唯一答案；但若**重划分抖动**是瓶颈（长时序仿真），Power 的 505× 优势是决定性的
3. 幂图的**时间恒定位点 + warm-start** 是时间一致性的关键，不要替换成每步重采样

---

## 🔗 关联笔记

- [[Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — SA2026 半拉格朗日平流画质提升
- [[Flamescapes-Wildlandfire-Urban-Interface]] — SA2026 野火-城市界面仿真
- [[Divisor-Dynamics-Surface-Fluid]] — SA2026 表面流体
- [[Power-Partitioner-Optimal-Transport-Distributed-Sim]] — 本笔记

## 📚 参考文献（论文关键引用）

- Tsuzuki & Aoki 2016. *Performance of space-filling curves for large-scale spatially-distributed data*（SFC 基线方法）
- Karypis & Kumar 2013. *METIS: A multilevel graph partitioning algorithm*（图分区基线）
- Benamou, Carlier, Cuturi, Ntoutsi, Peyré 2015. *Iterative scaling for optimal transport*（Sinkhorn）
- Lloyd 1982. *Least squares quantization in PCM*（Lloyd 算法）
- Stam 1999. *Stable Fluids*（论文中的平流求解器）
