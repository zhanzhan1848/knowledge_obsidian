---
type: daily-report
created: 2026-10-25
updated: 2026-10-25
tags: [daily-report, paper-search, 2026-Q4, cs.GR, TOG, SIGGRAPH2026, path-guiding, volume-rendering, rendering-systems]
status: processed
domain: rendering
agent: shengcai
date: 2026-10-25
window: 24h (2026-10-24 14:00 UTC → 2026-10-25 14:00 UTC) + SIGGRAPH 2026 缺口补齐
---

# 每日论文搜索报告 - 2026-10-25

**执行时间**: 2026-10-25 14:32 UTC (Sunday)
**执行 Agent**: shengcai (生菜)
**搜索范围**:
- arXiv cs.GR 主分类（API + HTML 列表页**双通道交叉验证**，300 条去重）
- arXiv 关键词扫描：`ray tracing` / `path tracing` / `global illumination` / `rasterization` / `BVH` / `ray marching` / `Monte Carlo rendering` / `differentiable rendering` / `stochastic differentiable rasterizer` 等 8 组
- **ACM Digital Library**（经 **Crossref API** 代理访问，ACM DL 官网受 Cloudflare 拦截）
- **SIGGRAPH 2026** 会议论文全表（Ke-Sen Huang 汇总页，125 篇）

**结果统计**: **24h 严格窗口内 = 0 篇新 arXiv cs.GR 论文**；**本次入库 7 篇**（全部为 **SIGGRAPH 2026 / TOG 此前批次遗漏的渲染方向论文** + **1 篇 TOG 新上线**）

---

## ⚠️ 窗口判定（严格，24h 内确实无新论文）

| 检查项 | 结果 |
|--------|------|
| arXiv cs.GR 最新批次 | **Fri, 23 Oct 2026**（3 篇：2610.30910 / 2610.30875 / 2610.30149） |
| Sat 24 Oct 批次 | **无**（arXiv 周末不公告） |
| Sun 25 Oct 批次 | **无**（今日批次尚未公告） |
| **24h 窗口 (10-24 14:00 → 10-25 14:00 UTC)** | **0 篇新论文** |
| 双通道验证 | ✅ API 300 条 + HTML 列表页逐条核对 published 时间戳，结论一致 |

> **结论**：本次**不是抓取失败**。arXiv 在周末处于公告空窗。但**会议库（SIGGRAPH 2026 / TOG）侧存在真实缺口**，本次据此补齐 7 篇。

---

## 📚 本次入库（7 篇，全部为 SIGGRAPH 2026 / TOG 渲染方向论文）

### 🥇 1. RCPG: Real-Time Product Path Guiding Using Radiance Cascades ⭐⭐⭐⭐⭐

[[2026-10-25-RCPG-Radiance-Cascade-Path-Guiding]]

- **DOI**: [10.1145/3840291](https://doi.org/10.1145/3840291) | **TOG Vol. 46 No. 2**, pp. 1–25 | **2026-10-09 上线**
- **作者**: Julius Ikkala, Pekka Jääskeläinen, Markku Mäkitalo
- **arXiv**: ❌ 无（TOG 期刊通道）

**一句话**：首次把 **radiance cascade 的层级性**用于**乘积采样（product sampling）**——采样分布 ∝ **入射辐射 × BSDF**，一次采样同时服务两个重要性目标。

**⭐ 核心洞察**：
- 推导 radiance **interval 边界**，保证 cascade 层级近似**不误表征入射光方向** —— 这是 cascade 类方法此前不能用于方向性引导的根本障碍
- **PDF 可解析** → 天然兼容 **MIS** 与**无偏 ReSTIR**
- **世界空间数据结构** → 可从**屏幕外路径顶点**出发采样，这是有效**多弹射路径引导**的必要条件
- 相比多采样 MIS 方案，**每像素追踪路径数约 2×**

**⭐ 优先级：高** — 填补本库「实时路径引导 × 乘积采样 × radiance cascade」空白，可与已有 ReSTCV 笔记组合成完整改进路线

---

### 🥇 2. Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering ⭐⭐⭐⭐⭐

[[2026-10-25-Gabor-Fields-Orientation-Selective-LOD-Volume-Rendering]]

- **DOI**: [10.1145/3811369](https://doi.org/10.1145/3811369) | **TOG 45(4)**, Art. 62, 20pp | SIGGRAPH 2026
- **作者**: Jorge Condor, Nicolai Hermann, Mehmet Ata Yurtsever, Piotr Didyk (USI)
- **代码**: https://github.com/Arcanous98/gabor_fields (Python 参考实现, ⭐53)

**一句话**：用**各向异性 Gabor 核**（Gaussian 包络 × 谐波调制）替代纯 Gaussian 体积基元 —— 每个核的频谱**集中在特定频带与方向**，于是 **LOD 滤波 = 按频带裁剪基元**。

**⭐ 关键数字**：
- 同等基元数 **PSNR +2 dB**；同等方差下 **快 1.4×**
- **连续 LOD**：无 re-fitting、无 mipmap、无金字塔、**无 popping**
- **控制变量**后**再加速约 2×**；相对体素网格保持 **100× 压缩率**
- Disney Cloud 端到端：无偏参考 **977 s** → Control Variate PLA **623 s** → Zero NEE **522 s**
- **Gaussian 基仅占 ~2% 基元**，却被始终解析积分并追踪 → 阴影射线只对基求交即可

**⭐ 可迁移性**：**「频谱选择性 → 掩蔽基元」+「低频基作控制变量 + 残差随机纳入」**是通用范式

**优先级：高**

---

### ⭐ 3. LightOpt: Lights Optimization for Real-time Rendering ⭐⭐⭐⭐

[[2026-10-25-LightOpt-Lights-Optimization-Real-Time-Rendering]]

- **DOI**: [10.1145/3799902.3811072](https://doi.org/10.1145/3799902.3811072) | SIGGRAPH 2026
- **作者**: Tuo Chen, Luyan Cao, Kui Wu, Shimin Hu

**一句话**：可微管线自动**削减活跃光源数**，用**辐照度场（视图无关）作目标** + 重叠/吸引双损失 + 动态增删合并控制器。

**⭐ 关键数字**：光照成本 **−18~52%**，活跃光源 **−20~53%**，着色加速最高 **2.07×**，~10 min/场景；Cave 场景延迟着色 **0.71 ms → 0.49 ms**（RTX 3090）；**视觉保真优于工业界视角相关裁剪基线**

**⭐ 设计原则**：**用视图无关的辐照度场而非最终像素作优化目标** —— 一次优化多视角可用

**优先级：高**

---

### ⭐ 4. Generalized Spherical Harmonics Products using Spherical Grids ⭐⭐⭐⭐

[[2026-10-25-Generalized-SH-Products-Spherical-Grids]]

- **DOI**: [10.1145/3811322](https://doi.org/10.1145/3811322) | TOG 45, SIGGRAPH 2026
- **作者**: Di An, Jianmin Wu, Bowen Xu, Ling-Qi Yan, Kun Xu (清华)

**一句话**：提出**广义 SH 乘积**（支持**不同阶输入**、输出**灵活截断**），用 **SphGrid 作中间表示**把乘积化为**网格上的逐点乘法**。

**⭐ 关键数字**：精确版 **3.5–6.0× 加速**；近似版误差**更低**且 **2.5–6.5× 加速**；**同阶退化情形下仍优于 SOTA**（证明加速非来自放宽）

**⭐ 可迁移性**：**「用中间表示把高阶张量运算降为逐点乘法」**是高度通用的范式

**优先级：中高**

---

### ⭐ 5. RCGP: Resource Contracts for Graphics Programming ⭐⭐⭐⭐

[[2026-10-25-RCGP-Resource-Contracts-Graphics-Programming]]

- **DOI**: [10.1145/3811317](https://doi.org/10.1145/3811317) | SIGGRAPH 2026 **Journal Track (TOG)**
- **作者**: Venkataram Sivaram, Sai Praveen Bangaru, Ravi Ramamoorthi, Tzu-Mao Li, Jonathan Ragan-Kelley, **Frédo Durand** (MIT CSAIL / UCSD)
- **代码**: https://github.com/iveevi/rcgp (C++ / Vulkan, **MIT License**, ⭐21)

**一句话**：把图形程序的**资源契约**（类型/布局/绑定位置/同步）形式化为**可静态内省的单元**，用**组合子**检查兼容性并计算**残余契约**，把晚期失败变成**编译期诊断**。

**⭐ 覆盖的失败类别**：描述符类型不匹配、布局漂移、**缺失同步屏障** —— 全部转为早期可操作诊断

**⭐ 意义**：本库首次覆盖**渲染系统工程/工具链**方向（此前笔记几乎全是算法与表示）；MIT CSAIL 出品，工程可信度高；**代码开源**

**优先级：中高**

---

### ⭐ 6. DPF: Differentiable Polyphase Filtering for Large-Kernel Approximation ⭐⭐⭐

[[2026-10-25-DPF-Differentiable-Polyphase-Filtering-Large-Kernel]]

- **DOI**: [10.1145/3799902.3811160](https://doi.org/10.1145/3799902.3811160) | SIGGRAPH 2026
- **作者**: Zhe Cao, Zhizhen Wu, Zhonggui Chen, Rui Wang, Yuchi Huo

**一句话**：**Polyphase 框架**让稀疏大核的**可微优化跨分辨率**进行，且对**空间变化稠密核**同样有效。

**⭐ 技术**：Polyphase 分解 + Spatial-to-Depth 变换 + Asymmetric Intensity-Decoupled 变换 + Layer-Adaptive Filtering（应对核尺寸空间变化）

**优先级：中** — 偏图像处理，但「多相分解 + 稀疏支撑可微参数化」是通用技巧

---

### ⭐ 7. Streaming of rendered content with adaptive frame rate and resolution ⭐⭐⭐

[[2026-10-25-Adaptive-Streaming-Perceptual-FrameRate-Resolution]]

- **DOI**: [10.1145/3799902.3811136](https://doi.org/10.1145/3799902.3811136) | SIGGRAPH 2026
- **作者**: Yaru Liu, Joseph G. March, **Rafał K. Mantiuk** (Cambridge Rainbow Group)

**一句话**：利用 **HVS 时空感知极限**，在带宽约束下**同时**调整**帧率与分辨率**（传统做法只降分辨率），轻量网络预测最优组合。

**⭐ 方法论价值**：**训练标签用感知视频质量指标（AR-DAVID）而非 PSNR/SSIM**；codec-agnostic，对现有渲染基础设施改动极小

**优先级：中**

---

## 🎯 本次采集的可迁移技术点

| # | 技术 | 来源 | 可迁移性 | 建议动作 |
|---|------|------|---------|---------|
| 1 | **乘积采样（辐射 × BSDF）替代多采样 MIS** | #1 | ⭐⭐⭐⭐⭐ | 实时路径追踪器中可省一半采样预算；PDF 可解析 → 直接接 MIS/ReSTIR |
| 2 | **radiance interval 边界推导** | #1 | ⭐⭐⭐⭐ | 任何层级缓存近似（radiance cache、mipmap 层级）都需类似的「不误表征」边界保证 |
| 3 | **Gabor 核 → 频谱选择性 → 掩蔽基元** | #2 | ⭐⭐⭐⭐⭐ | 「按频带裁剪基元」可迁移到任何基元集合的 LOD；**无需 re-fitting、无 mipmap** |
| 4 | **低频基作控制变量 + 残差随机纳入** | #2 | ⭐⭐⭐⭐⭐ | 通用采样加速范式；Gaussian 基仅 ~2% 基元却承担绝大部分密度 |
| 5 | **辐照度场作视图无关优化目标** | #3 | ⭐⭐⭐⭐ | 任何「保持外观同时削减计算」的场景（材质精简、LOD 策略、阴影预算） |
| 6 | **重叠损失 + 吸引损失双目标** | #3 | ⭐⭐⭐ | 资源分配问题的通用建模（冗余 vs 欠覆盖） |
| 7 | **中间表示把高阶运算降为逐点乘法** | #4 | ⭐⭐⭐⭐ | SH 乘积 → 球面网格；可类比推广到其他张量/卷积型运算 |
| 8 | **契约作为类型系统模块 + 组合子求残余** | #5 | ⭐⭐⭐⭐ | 渲染引擎管线编排层的正确性保障；**MIT 出品 + MIT License 开源** |
| 9 | **Polyphase 分解 + 稀疏支撑可微参数化** | #6 | ⭐⭐⭐ | 跨分辨率共享参数的可微后处理 |
| 10 | **感知指标而非像素指标作训练标签** | #7 | ⭐⭐⭐ | 任何面向「主观质量」的优化问题 |

---

## 📊 本期趋势观察

1. **SIGGRAPH 2026 的渲染重心明显「向体积与采样侧偏移」**：本期 7 篇中，Gabor Fields（体积渲染 LOD）、RCPG（路径引导采样）、SH Products（辐射表示计算）都围绕**「如何以更少的样本/基元达到同等感知质量」**，而不是「渲染更快」本身。这是本期最清晰的信号。
2. **控制变量（control variate）思想在卷土重来**：Gabor Fields 把它当作核心加速手段（RCPG 的乘积采样本质也是控制变量思想），而上一波热潮在 2015–2020 年后逐渐被 3DGS 热潮盖过。**这对当前 3DGS 渲染框架有直接启示**：3DGS 的高斯基元同样可以做频谱分析与低频/高频分层。
3. **「辐射表示」的基础运算被重新审视**：SH 乘积以往被视为「教科书里的低效操作」，本文给出 3.5–6.0× 的加速空间，说明**基础算子仍有大量未挖掘的优化空间**。
4. **系统工程类论文首次进入本库**：RCGP（MIT CSAIL）代表图形学「往软件工程走」的方向 —— 渲染管线复杂度已超过人工约定能可靠维护的程度。
5. **会议库 vs 预印本的时序差必须正视**：本次 7 篇中 **6 篇无 arXiv 预印本**，只能经 ACM DL / Crossref / 项目页发现。若仅依赖 arXiv，将**完全错过**这些论文。→ **建议后续将 Crossref API（prefix:10.1145）纳入常规检索通道**，这是本次最有价值的流程改进。

---

## 🔧 本次流程改进（建议固化）

| 改进 | 说明 |
|------|------|
| **新增 Crossref API 通道** | `https://api.crossref.org/works?filter=from-pub-date:...,prefix:10.1145` —— 可枚举 ACM DL 全部新上线论文，**绕过 Cloudflare 拦截**。本次正是靠此通道发现 RCPG（TOG 2026-10-09 新上线） |
| **新增 OpenAlex 通道** | `https://api.openalex.org/works/doi:<DOI>` —— 对 TOG/SIGGRAPH 论文可拿到**完整摘要 + 作者 + 会议 + OA 链接**，弥补 ACM DL 页面不可抓取的问题 |
| **新增 Ke-Sen 汇总页通道** | SIGGRAPH/SA 全表（125 篇），比逐个查会议站更高效；但该站偶尔超时，需重试 |
| **SHA/ACM DL 直抓受限** | dl.acm.org 返回 403、DOI 跳转返回 406、浏览器触发 Cloudflare 验证 —— **不要再直接尝试**，走 Crossref/OpenAlex |

---

## 🔍 已抓取但未单独入库

| 标识 | 标题 | 判定 |
|------|------|------|
| SIG2026 | CoherentRaster / Gaussian Point Splatting / SHARP-GS / SAD-GS / LoD of Gaussians / Mobile3DGS³ / Hybrid Gaussian Wang Tiles | **已在库**（7-20 与 7-28 批次已收录） |
| SIG2026 | Lifting Lines and Tone (Path-space Stylization) / Bounding Stratified Bernoulli Impulses (Ray Marching GPIS) | **已在库**（7-20 批次） |
| SIG2026 | Spatio-Temporal Control Variates with ReSTIR (ReSTCV) | **已在库**（7-20 批次） |
| SIG2026 | GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction | 渲染+流体交叉，**归鸭血（流体）域**，本次未入库 |
| SIG2026 | LagrangianSplats: Divergence-Free Transport of Gaussian Primitives | 流体重建，**归鸭血（流体）域**；arXiv 2605.09299 已在库 |
| SIG2026 | Mechanical Cloaking of Halftoned Imagery | 机械超材料 + 网点图像，**非渲染域**，跳过 |
| TOG 2026-10 | SkinTokens / MCHex / C² Point-Normal Subdivision Surfaces / ShapeLib / Design for Machinability 等 | 骨骼绑定 / 网格生成 / CAD / 拓扑优化 —— **非渲染域**，跳过 |
| TOG 2026-10 | A Neural Frame Streaming Framework with a Simultaneous Prior for End-cloud Collaborative Rendering | 端云协同渲染框架，**偏系统/网络**，优先级低于本期入库项 |

---

## 📌 备注与偏差

- **窗口说明**：任务要求「最近 24 小时」，本期严格 24h 内**确实无新 arXiv cs.GR 论文**（周末公告空窗，已双通道验证）。为避免空跑，本次将检索重心转向**会议库缺口补齐**，并已在正文明确标注每篇的发表日期。
- **ACM DL 访问**：dl.acm.org 对本环境返回 403 / Cloudflare 挑战，DOI 跳转返回 406。已改用 **Crossref + OpenAlex API** 作为代理通道，两者均正常返回完整元数据与摘要。
- **SIGGRAPH Asia 2026**：官方 program 页尚未公布论文清单（仅有投稿说明），conditionally-accepted PDF 仅含 submission ID。经 Ke-Sen 汇总页确认 SA2026 目前公开条目以生成/几何类为主，**渲染方向尚无遗漏项**。
- **代码可用性**：本期 7 篇中仅 Gabor Fields（Python, ⭐53）与 RCGP（C++/Vulkan, MIT, ⭐21）公开代码；其余 5 篇需自行实现。
- **未覆盖**：Eurographics / HPG 等其他会议库本期未检索（任务仅指定 arXiv + ACM DL + SIGGRAPH）。
