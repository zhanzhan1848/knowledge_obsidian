---
type: daily-report
created: 2026-10-16
updated: 2026-10-16
tags: [daily-report, search, 2026-10]
status: processed
domain: rendering
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026-10-16

## 搜索范围

- **时间窗口**: 2026-10-15 14:13 UTC → 2026-10-16 14:13 UTC（严格 24h）；向下扩到 48h 以捕获刚发表的渲染论文
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, shadow mapping, relight, BRDF, neural radiance, caustics
- **数据源**:
  - arXiv cs.GR (via `export.arxiv.org/api`)
  - ACM Digital Library (本次未发现新公告)
  - SIGGRAPH 2026 (8 月已结束，proceedings 已发布)
  - SIGGRAPH Asia 2026 (12/1-4 吉隆坡，程序未公布；本次搜索时 Ke-Sen 列表因 CF 阻拦未获取)
  - WSCG 2026 / EG 2026 等：沿用历史信号

## 搜索结果

### 找到的论文（24h 严格 + 48h 宽窗）

| arXiv ID | 标题 | 类别 | 时差 | 渲染相关性 | 处理 |
|----------|------|------|------|----------|------|
| **2610.21584** | **Geometric Queries on Tessellation-Free Displaced Surfaces** | cs.GR | 28.7h | ⭐⭐⭐⭐⭐ | ✅ **主推** |
| 2610.22352 | SUPRA-TEX: 3D Generation with Super-Aligned Texture | cs.GR | 20.3h | ⭐⭐⭐ (PBR/relight) | ✅ 简记 |
| 2610.21865 | From Sketch to Scene: Relightable Garment Reconstruction | cs.GR | 24.6h | ⭐⭐ (relight/PBR) | ✅ 简记 |
| 2610.21090 | RoboCloth: Real Cloth Dataset for Neural Reflectance | cs.GR | 36.5h | ⭐⭐ (neural material dataset) | ✅ 简记 |

> 本次 arXiv 24h 严格窗口内仅 1 篇严格 cs.GR 渲染（其余为 3D generation、motion 等方向）

### 略过（邻域但偏 3D 生成 / 物理 / 几何重建 等）

| arXiv ID | 标题 | 略过理由 |
|----------|------|----------|
| 2610.22328 | ACEdit: Stable Multi-Turn Image Editing | 图像编辑而非渲染核心 |
| 2610.22052 | Compression of Uniformly Distributed Unit Quaternions | 几何压缩，非渲染管线 |
| 2610.21850 | Seeing Both the Forest and the Trees | 3D 资产生成 |
| 2610.21579 | Learning to Search for Executable Patternmaking | 缝纫 pattern 生成 |
| 2610.21121 | ResStreamGS: Residual-Sensitive Dual-Stream GS | 3DGS 流媒体，与 shengcai 重点略偏（属于 moyuwan 评测方向） |
| 2610.20651 | Towards automatic digital garment assembly | CAD 装配 |

---

## 重点论文深度分析

### 1. Tessellation-Free Displaced Surface Queries (主推) ⭐⭐⭐⭐⭐

- **arXiv**: 2610.21584, 2026-10-15
- **作者**: Bing Xu, Yang Zhou, Brian Budge
- **核心**: Displacement 曲面无需预细分即可做**采样 / 镜面路径 / 最近点** 三族几何查询——而之前 tessellation-free ray tracing 仅能求交
- **关键创新**:
  - **首阶纹理空间层次**：每节点存 (affine plane + residual bound + slope bounds)
  - 比 scalar min-max 更紧的空间包围
  - slope bounds → specular manifold search
  - 平面 Jacobian → 重要性采样
- **应用**: caustics / displaced emitter sampling / surface PDE solving
- **为何重要**: 这是 displacement 几何上**首次**给出统一查询框架，对毛发/皮肤/织物等精细几何的离线 + 实时管线都很关键
- **限制**: 仅 preprint，未见会议去向 (候选 SIGGRAPH Asia 2026 12 月)

📄 笔记: [[2026-10-16-TessellationFree-Displaced-Surface-Queries]]

### 2. SUPRA-TEX (PBR 资产生成邻域) ⭐⭐⭐

- **arXiv**: 2610.22352, 2026-10-15
- 重心在 PBR 资产 pipeline 起点，与"渲染"关系是在 PBR 主表面材质生成端
- 创新点: visible-material estimation / surface alignment / observation-guided completion 三阶段解耦 + latent anchor WYSIWYG
- 可直接输出 glTF-compatible PBR maps

📄 笔记: [[2026-10-16-SUPRA-TEX-PBR-3D-Generation]]

### 3. Sketch-to-Scene Relightable Garment (sketch PBR 邻域) ⭐⭐

- **arXiv**: 2610.21865, 2026-10-15
- 一作所在机构 (土耳其) 类似 SIGGRAPH Asia 投稿方向
- 阴影靠 displacement 而非贴图 → PBR 友好
- 列入 2026-10-15 VisibilitySplat 报告后续"relighting"脉络补充

📄 笔记: [[2026-10-16-Sketch-to-Scene-Relightable-Garment]]

### 4. RoboCloth (neural material dataset) ⭐⭐

- **arXiv**: 2610.21090, 2026-10-15
- 500 布料 × 580 HDR 帧，机器人采集
- CC BY 4.0 开源 (Hugging Face)
- 重点是 **数据集+工具**而非新算法：可作为 neural material / SVBRDF benchmark
- 评估超过 MERL、UBO2014，且能零样本迁移到 UBO2014 采集系统

📄 笔记: [[2026-10-16-RoboCloth-Cloth-Material-Dataset]]

---

## 趋势观察

### 位移几何的"全查询"时代

| 周次 | 代表论文 | 关注点 |
|------|----------|--------|
| 历史 | Tessellation-free ray tracing (2018) | 仅求交 |
| 2025-2026 | Displaced material 神经化 | 拟合替代 |
| **2026-10 (10/15)** | **Tessellation-Free Displaced Surface Queries** | **三族查询统一框架** |

> **观察**: 位移映射几何已从"仅可见性"扩展到"任意几何查询"——意味着渲染器中 displacement-heavy 资产 (角色、植被、织物、汽车内饰) 可以摆脱预细分，向实时管线大规模迁移。

### PBR 神经材质的"开源数据"积累

继 UBO2014 之后：
- **MERL** (100 通用材质，2003) → 经典但小
- **UBO2014** (400) → 经典规模
- **RoboCloth** (500, 2026-10-15) → 大规模 + 机器人自动化 + 神经材质管线

> PBR 神经方向**缺数据**的瓶颈正在被自动化采集缓解，未来 1-2 年可能出现 `Mercury` / `OpenMaterial` 级别的大规模多材质合集。

### 24h 窗口偏"少"

对比 10/15 与 10/12 日报：
- 10/15 共 ~12 篇候选 → 2 主推 + 1 邻域
- 10/12 共 4 篇 3DGS 密集
- **10/16 仅 1 篇严格** + 3 篇 48h 内邻域

可能原因：
1. **arXiv 工作日/夜节奏**：周四-周五夜间投稿偏少（美国下班后到欧洲上午前空档）
2. **SIGGRAPH Asia 2026 投稿冲刺**：作者们 9月底集中投完，10月初 digesting，10月中下旬才在 arXiv 公布
3. 后续若仍稀少，建议**放宽窗口到 72h**，并开始**主动追踪会议 accepted list**

---

## 会议动态

### SIGGRAPH Asia 2026 (2026-12-01 至 04，吉隆坡)
- 程序页面已上线: https://asia.siggraph.org/2026/program/technical-papers/
- **关键日期**（已错过或即将到来）：
  - Technical Papers Notification: 2026-09-26 (已过)
  - 会议日期: 12/1-4
- 目前公开版仍说"accepted papers will be announced soon"
- Ke-Sen (real-time rendering 站) 受 CF 阻拦未取得；下次用浏览器代理

### WSCG 2026 / I3D 2027
- WSCG 10 月会议刚结束，关注 proceedings
- I3D 2027 投稿窗口通常 11 月开放

### 行动建议
- **下周一 (10/19)**: 再扫一次 cs.GR, 聚焦 SIGGRAPH Asia 投稿解禁后的 arXiv 同步
- **11 月初**: 监控 SIGGRAPH Asia 程序公布，配合新论文 arXiv 首登时间窗
- **2 周 1 次**: 检查 realtimerendering.com/kesen 主列表的更新

---

## 给 moyuwan / 墨鱼丸

### 优先实现候选 (按 ROI)

1. ✅ **Tessellation-Free Displaced Surface Queries** (主推)
   - 实现难度: 中
   - ROI 高: displacement-heavy 资产通用加速
   - 建议先在 Cycles/Mitsuba 做 Node 数据结构 prototype

2. ⚠️ **VisibilitySplat** (10/15 已建)
   - BVH 加速点光线追踪 + 3DGS inverse rendering
   - 现成基线，可与 NVIDIA OptiX 对接

3. ⚠️ **Spectral World Renderer** (10/15 已建)
   - 邻域观察，可作 hyperspectral rendering benchmark

### 论文笔记链接

- [[2026-10-16-TessellationFree-Displaced-Surface-Queries]]
- [[2026-10-16-SUPRA-TEX-PBR-3D-Generation]]
- [[2026-10-16-Sketch-to-Scene-Relightable-Garment]]
- [[2026-10-16-RoboCloth-Cloth-Material-Dataset]]

---

## 历史背景（最近 1 周）

| 日期 | 主推 | 主题 |
|------|------|------|
| 10/12 | Confidence-Aware Densification, H2-Ray, Make-It-Flow, SplatQ | 3DGS 密集周 |
| 10/15 | VisibilitySplat, SWR | 3DGS inverse rendering + spectral |
| **10/16** | **Tessellation-Free Queries, SUPRA-TEX** | **displacement 几何 + PBR 资产生成** |

> 提醒: 跨过本周后期 (10/17-18) 的 arXiv 不活跃期后，建议 10/19 一并重扫 24h × 累积 Δt

---

_Generated by shengcai · 自动搜索 · 2026-10-16 14:13 UTC_
