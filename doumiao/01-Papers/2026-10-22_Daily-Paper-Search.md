---
type: daily-report
date: 2026-10-22
agent: doumiao
domain: fluid-rendering
status: completed
keywords: [fluid-rendering, water-rendering, smoke-rendering, fire-simulation, ocean-rendering, particle-system, volume-rendering]
sources: [arxiv-cs.GR, siggraph-asia]
---

# 📅 每日论文搜索报告 — 2026-10-22

## 🔎 搜索概要

| 项目 | 值 |
|------|---|
| **运行时间** | 2026-10-22 14:11 UTC（周四） |
| **搜索窗口** | 严格 24h（10/21 14:11 → 10/22 14:11）；扩展检索用于补齐历史缺口 |
| **数据源** | arXiv API（cs.GR，**29 组关键词**，共扫描 **474 篇**）+ SIGGRAPH Asia 官网 |
| **查询次数** | 29 次 arXiv API（多轮重试绕开 429 限流）+ 1 次 SIGGRAPH Asia 抓取 |
| **知识库去重** | 与已有 580 个 arXiv ID 比对 |

> ⚠️ arXiv API 本日多次返回 **HTTP 429 限流**。前 4 组精确关键词首轮全部被拒，已通过指数退避重试补齐，最终 29 组全部成功。

---

## 📊 当日结果概览

### ⚠️ 24 小时窗口内无新流体渲染论文

扫描 474 篇 cs.GR 论文后，**2026-10-21 至 10-22 窗口内无新的流体渲染核心论文**。

窗口内仅 6 篇 cs.GR 论文（全部**非流体渲染**领域）：

| arXiv ID | 标题 | 排除原因 |
|----------|------|----------|
| 2610.30033 | RLMuscle: Muscle-Driven Character Animation via RL | 角色动画/肌肉驱动，非流体 |
| 2610.29517 | AutoPhyX: Automatic Text-Condition Physics Property Generation | 物理属性生成，非流体 |
| 2610.28628 | AdaDex: Learning Adaptable Dexterous Skills | 灵巧手操作，非流体 |
| 2610.28131 | OV-Foam: How 3D Representations Shape Semantic Feature Lifting | **"Foam" 是"泡沫表示"(Foam of primitives) 而非流体泡沫**，语义分割/开放词汇 |
| 2610.28050 | Digital Twin for C-SMC Strip Deposition | 工业视觉检测数字孪生，非流体 |
| 2610.26861 | Synthesizing Functional CAD Mechanisms | CAD 机构合成，非流体 |

> 📌 最近一篇流体渲染 cs.GR 论文仍为 **2610.25660 FluidGen（10-19）**，已在 10-21 收录。本次 cron 于 14:11 UTC 运行，早于 arXiv 当日批次发布时点（通常 13:00–20:00 UTC 陆续放出）。**建议下周期（10-23）复核 10/22 批次。**

### ✅ 本次创建结构化笔记（6 篇，均为高价值渲染论文）

本次检索顺带发现知识库存在**历史缺口**，从 78 篇未收录的流体相关论文中筛选出 6 篇渲染价值最高的予以深挖：

| # | arXiv ID | 标题 | 渲染类别 | 发表日期 | 笔记 |
|---|----------|------|---------|---------|------|
| 1 | 2601.04382v2 | Radiant Foam Rendering on a Graph Processor | **体积渲染**（众核硬件） | 2026-01-07 | [笔记](2026-10-22-Radiant-Foam-Rendering-Graph-Processor.md) |
| 2 | 2512.16706v1 | SDFoam: Signed-Distance Foam | **体积渲染 + 表面重建** | 2025-12-18 | [笔记](2026-10-22-SDFoam-Signed-Distance-Foam.md) |
| 3 | 2511.15189v2 | Fluid Control with Localized Spacetime Windows | **流体控制/编辑** | 2025-11-19 | [笔记](2026-10-22-Fluid-Control-Localized-Spacetime-Windows.md) |
| 4 | 2511.02852v1 | Real-Time Interactive Hybrid Ocean (WP-FFT) | **表面渲染（海面）** | 2025-10-31 | [笔记](2026-10-22-Real-Time-Hybrid-Ocean-WP-FFT.md) |
| 5 | 2507.12156v3 | SmokeSVD: Single-View Smoke Reconstruction | **体积渲染 + 扩散模型** | 2025-07-16 | [笔记](2026-10-22-SmokeSVD-Single-View-Smoke-Reconstruction.md) |
| 6 | 2502.09631v1 | Volumetric Temporal Texture Synthesis (VNCA) | **体积渲染/风格化** | 2025-02-05 | [笔记](2026-10-22-Volumetric-Temporal-Texture-Smoke-Stylization-NCA.md) |

---

## 💡 本期核心洞察

### 1. 🌊 Foam 术语陷阱
`OV-Foam` 的 "Foam" 是 **"Foam of primitives"**（基元泡沫表示，PowerFoam），**与流体泡沫无关**。关键词 `foam` 在 cs.GR 检索中会引入这类语义碰撞，需人工甄别。

### 2. 🔧 体积渲染的硬件-算法耦合（Radiant Foam on IPU）
现有 NeRF/3DGS/RadiantFoam 生态默认"单一统一显存"。当 **IPU、tile GPU、chiplet** 等众核架构普及时，体积渲染需**重新设计算法**（数据分片 + 通信路由）而非简单移植。这对端侧 XR 是架构预警。

### 3. 🌊 异构表示的"边界缝合"模式（Hybrid Ocean）
FFT 谱海面 + 局部波粒子，通过**统一方向谱 + 能量密度匹配**在 patch 边界缝合两种异构表示。该模式可迁移至**烟雾+粒子混合渲染**。

### 4. 🎨 自涌现动力学替代物理算子（VNCA）
风格化场景下，用神经元胞自动机的自涌现运动**替代显式流体平流**，训练提速 >10× 且保持时序连贯。启示：不要求物理精确时，可大胆用学习到的动力学替代物理算子。

### 5. 🧬 物理信号须注入生成过程
`SmokeSVD`（重建）与 `FluidGen`（生成）同属"物理引导生成模型"范式，共同点：**速度场/运动信号注入生成模型内部，而非事后过滤**。

### 6. 🎛️ "floating background grid" 解耦技巧
`Fluid Control` 用粗粒度浮动网格参数化控制力，**解耦控制自由度与模拟分辨率**，天然产生平滑物理合理的力。该技巧可推广至相机/灯光优化。

---

## 📌 知识库缺口（待后续补充）

扫描发现 **78 篇**流体相关 cs.GR 论文尚未收录知识库（多为 2023–2026），推荐优先补齐的渲染核心：

| 优先级 | arXiv ID | 标题 | 理由 |
|--------|----------|------|------|
| ⭐⭐⭐ | 2505.21946 | Fluid Simulation on Vortex Particle Flow Maps | Vortex Particle Flow Map，flow map 路线代表作 |
| ⭐⭐⭐ | 2503.03326 | Arc Blanc: A Real-Time Ocean Simulation Framework | 完整实时海洋框架（工程向） |
| ⭐⭐⭐ | 2502.05339 | Fast Subspace Fluid Simulation (Temporally-Aware Basis) | 快速子空间流体 |
| ⭐⭐ | 2505.16397 | Dynamic Caustics by Ultrasonically Modulated Liquid Surface | 动态焦散（罕见题材） |
| ⭐⭐ | 2511.15908 | SPHaptics: 实时双向触觉交互（流体） | 触觉 + 流体，VR 方向 |
| ⭐⭐ | 2411.16802 | Droplet Simulations in Computer Graphics | 2024 综述（若未收录） |

> 完整清单见下方"附录：未收录流体相关 cs.GR 论文"。

---

## 📎 SIGGRAPH Asia 2026 状态

- **会期**: 2026-12-01 ~ 12-04，Kuala Lumpur, Malaysia（首届在马来西亚）
- **当前状态**: 官网仅公布 keynote（Markus Gross / DisneyResearch、Ran Huang / Huawei、Andrea Vedaldi / Oxford+Meta），**论文列表尚未发布**。
- **结论**: 本周期无需从会议源抓取论文内容。

---

## 附录：未收录流体相关 cs.GR 论文（共 78 篇，节选）

<details>
<summary>点击展开完整清单</summary>

```
2026-01-07 | 2601.04382v2 | Radiant Foam Rendering on a Graph Processor          ✅本次收录
2025-12-18 | 2512.16706v1 | SDFoam: Signed-Distance Foam                        ✅本次收录
2025-11-19 | 2511.15189v2 | Fluid Control with Localized Spacetime Windows      ✅本次收录
2025-11-19 | 2511.15908v1 | SPHaptics: 实时双向触觉交互（刚-软体+拉格朗日流体）
2025-11-03 | 2511.01259v1 | An Adjoint Method for Differentiable Fluid Flow Maps
2025-10-31 | 2511.02852v1 | Real-Time Interactive Hybrid Ocean                  ✅本次收录
2025-08-11 | 2508.07760v1 | Sea-Undistort: 通过水体图像复原数据集
2025-08-03 | 2508.01537v1 | FluidFormer: Transformer 粒子流体
2025-07-23 | 2507.17248v2 | Reality Proxy: MR 中流物交互
2025-07-16 | 2507.12156v3 | SmokeSVD                                            ✅本次收录
2025-07-15 | 2510.15874v1 | Sketch-based Fluid Video Generation
2025-07-13 | 2510.15873v1 | Two-Stage Sketch-Based Smoke Illustration
2025-07-12 | 2507.09146v1 | Helmholtz-Hodge 流体场生成
2025-06-20 | 2506.16827v2 | Beyond Blur: 扩散模型的流体视角
2025-05-28 | 2505.21946v1 | Vortex Particle Flow Maps
2025-05-22 | 2505.16397v1 | Dynamic Caustics (超声调制液面)
2025-05-18 | 2505.12539v2 | Penetration-free Solid-Fluid Interaction on Shells/Rods
2025-04-01 | 2504.00745v2 | Granule-In-Cell Method (砂-水混合物)
2025-03-12 | 2503.09019v1 | Protective Foam 设计与制造
2025-03-05 | 2503.03326v2 | Arc Blanc: 实时海洋模拟框架
2025-03-02 | 2503.00868v2 | 3D Dynamic Fluid Assets from Single-View (3DGS)
2025-02-07 | 2502.05339v2 | Fast Subspace Fluid Simulation
2025-02-05 | 2502.09631v1 | VNCA 烟雾风格化                                  ✅本次收录
... (2024 及更早 60+ 篇从略)
```

</details>

---

## ⚙️ 执行记录

- ✅ 29 组 arXiv 关键词查询（含 429 指数退避重试）
- ✅ SIGGRAPH Asia 官网抓取
- ✅ 与 580 个已有 arXiv ID 去重
- ✅ 创建 6 篇结构化笔记
- ✅ 运行 `~/knowledge-vault/.scripts/git-sync.sh` 同步