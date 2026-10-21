---
type: daily-report
date: 2026-10-21
agent: doumiao
domain: fluid-rendering
status: completed
keywords: [fluid-rendering, water-rendering, smoke-rendering, fire-simulation, ocean-rendering, particle-system, volume-rendering]
sources: [arxiv-cs.GR, siggraph-asia]
---

# 📅 每日论文搜索报告 — 2026-10-21

## 🔎 搜索概要

| 项目 | 值 |
|------|---|
| **运行时间** | 2026-10-21 14:09 UTC（周三） |
| **搜索窗口** | 严格 24h（10/20–10/21）→ 结果为空；扩展至近 60 天（08-21 起） |
| **数据源** | arXiv API（cs.GR，HTTPS，19 组关键词查询）+ Brave Search + SIGGRAPH Asia 官网 |
| **检索字段** | fluid / water / smoke / fire / ocean / liquid / particle / turbulence / spray / foam / caustics / wave / navier / vortex / free-surface / volume rendering / atmospheric |
| **查询次数** | 19 次 arXiv API + 2 次 Web Search + 1 次 SIGGRAPH Asia 官网抓取 |

## 📊 当日结果概览

### ⚠️ 24 小时窗口内无新论文

**arXiv 在 2026-10-20 至 10-21 未发布新的 cs.GR 流体相关论文。** 最近一篇流体 cs.GR 论文为：

- **2610.25660** — FluidGen（2026-10-19 发布，恰好落在 24h 边界外，已收录并深挖）

> 📌 2026-10-21 为周三，arXiv 新榜通常在工作日 13:00–20:00 UTC 陆续放出。本次 cron 于 14:09 UTC 运行，可能早于当日 cs.GR 批次发布。建议下一周期（10/22 22:00）复核 10/21 批次。

### ✅ 已创建结构化笔记（3 篇）

| # | arXiv ID | 标题 | 渲染类别 | 发表日期 | 笔记 |
|---|----------|------|---------|---------|------|
| 1 | 2610.25660 | FluidGen: Physics-Aware Fluid Video Generation | 生成模型 + 体积流 | 2026-10-19 | [2026-10-21-FluidGen-Physics-Aware-Fluid-Video.md](2026-10-21-FluidGen-Physics-Aware-Fluid-Video.md) |
| 2 | 2608.11100 | WildFireGS: Physics-Based Wildfire Simulation in 3DGS Forest | **粒子渲染** | 2026-08-11 | [2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation.md](2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation.md) |
| 3 | 2605.00177v2 | FieryGS: In-the-Wild Fire Synthesis with 3DGS | **体积渲染** | 2026-04-30 | [2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis.md](2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis.md) |

### ⏭️ 跳过（历史 cron 已处理）

| arXiv ID | 标题 | 上次处理日 |
|----------|------|-----------|
| 2610.13860 | Make It Flow: Animating Water in 3DGS | 2026-10-19 |
| 2609.20818 | SplashSplat: 飞溅液体多视图重建 | 2026-10-19 |
| 2609.19750 | DELUGE: 实时粒子流式传输 | 2026-10-19 |
| 2610.12461 | OuroWorld: 3D Cinemagraphs | 2026-10-10 |
| 2610.10984 | Fluid-Gen-Zero | 2026-10-19 |
| 2610.09822 | Simulation Methods for Multiphysics (Eurographics) | 2026-10-10 |
| 2610.24210 | Colour-Field Particle Categorization（固态 SPH，材料力学范畴） | — |
| 2610.21584 | Tessellation-Free Displaced Surfaces（含 caustics demo，但主体是几何查询） | — |

### ❌ 检索中发现但明确排除

- **2609.03243** — A Kinetic Theory of the Gated Self-Evolving LLM Agent（LLM 动力学类比）
- **2603.15627** — Physics-Informed Video Diffusion For Shallow Water Equations（水方程但属生成模型，cs.GR 边缘）
- **2411.15880** — Droplet Simulations in Computer Graphics（2024 综述，价值高但非新论文）
- **1109.6494** — Survey of Ocean Simulation and Rendering（2011 老综述）
- **2511.02852** — Real-Time Interactive Hybrid Ocean（2025-10，非本窗口）

## 🔥 本次核心洞察：三条互补的火焰/流体渲染技术路线

这是本次检索最有价值的产出——三篇笔记恰好覆盖同一目标（可信流体/火焰渲染）的三种截然不同架构：

| 路线 | 代表 | 载体表示 | 优势 | 劣势 | 适用场景 |
|------|------|---------|------|------|---------|
| **粒子** | WildFireGS | Gaussian 基元即粒子 | 省内存、天然稀疏、渲染复用 splatting | 密集现象表达力弱、无烟羽细节 | 大尺度森林火灾、稀疏火焰 |
| **体积** | FieryGS | 体素 reaction-transport | 表现力强（火焰+烟+碳化）、物理完整 | 内存受限分辨率 | 影视级室内外火灾特效 |
| **生成** | FluidGen | 视频扩散模型 | 免 3D 场景建模、零调参、可语义编辑 | 不可实时、非严格物理 | 离线资产生成、概念预演 |

**推荐工程组合**：粒子 + 体积混合（模拟层用 SPH/体素双通道），生成模型仅用于前期概念预演与烟羽风格探索。

### 另一条主线：速度场成为一等公民

[[2026-10-21-FluidGen]] 把速度场当作**可监督、可预测、可当奖励**的中间量——这一思想与 [[2026-10-19-Make-It-Flow]] 的「光流提升为 3D Eulerian 运动场」殊途同归。两条独立工作线同时把「运动场显式化」，说明**显式运动表征**正在成为该领域的共识方向。

## 📡 SIGGRAPH / SIGGRAPH Asia 状态

| 会议 | 状态 |
|------|------|
| **SIGGRAPH 2026** | 7 月已结束，无新动态 |
| **SIGGRAPH Asia 2026** | 会期 **12/01–04，吉隆坡**（首次）。Technical Papers 页面明确写着「**Stay tuned as more details of the program will be revealed soon!**」——**论文清单尚未公布**。已接收论文将发表于 ACM TOG 专刊 + 官方 proceedings |
| **会议线索** | 页面列出合作机构含 **UC San Diego** 与 **NVIDIA** —— 与 WildFireGS 作者单位（Weinmann @ NVIDIA / Palubicki @ UCSD）吻合，**WildFireGS 有较大概率被 SIGGRAPH Asia 2026 接收**，建议跟踪确认 |

## 📌 检索方法改进（本次踩坑记录）

1. **arXiv API 必须用 HTTPS** — `http://export.arxiv.org` 返回 301 且 curl 未跟随，导致全部查询返回空 body 且报 `ParseError: no element found`。已改用 `https://` + `urllib`。
2. **短语搜索 `all:"fluid rendering"` 过严** — 大量论文标题用 `fluid simulation`、`Fluid Video Generation` 等变体，短语精确匹配召回极低（"fluid rendering" 返回 0，"smoke rendering" 返回 0）。**应改用单词级 `all:fluid` + 人工筛标题**。
3. **查询间隔 ≥3.2s** — arXiv API 限流敏感，19 组查询耗时约 70s。
4. **Brave Search 对学术查询质量差** — 「arXiv cs.GR fluid rendering」仅返回 1 条 GameDev News。学术检索应**以 arXiv API 为主**，Web Search 仅补充会议资讯。

## 🧭 后续建议

1. **下周期（10/22 22:00）复核 10/21 arXiv 批次** — 本次运行早于周三新榜发布窗口。
2. **持续跟踪三条路线**：
   - 3DGS 原生粒子模拟（WildFireGS 的后续，是否有液体/水版本？）
   - 体积燃烧模拟的实时化（FieryGS 的加速版）
   - 速度场监督在**实时渲染**中的迁移（FluidGen 的实时版本尚未出现，是明确空白）
3. **待验证方向**：
   - RefracGS（2603.21695）折射水面 + 3DGS 光线追踪，与 Make It Flow 形成互补（水面渲染前沿）
   - Physical Water Caustics 系列的实时化
4. **SIGGRAPH Asia 2026 监控**：12/01 会期，建议 11 月上旬增加每日官网 program 页抓取。

## 📁 文件清单

本次任务新建文件（`~/knowledge-vault/doumiao/01-Papers/`）：
```
2026-10-21-FluidGen-Physics-Aware-Fluid-Video.md
2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation.md
2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis.md
2026-10-21_Daily-Paper-Search.md（本文件）
```