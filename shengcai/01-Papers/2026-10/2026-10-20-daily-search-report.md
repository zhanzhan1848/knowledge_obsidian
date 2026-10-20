---
type: daily-report
created: 2026-10-20
updated: 2026-10-20
tags: [daily-report, search, 2026-10, 3DGS, splatting, monte-carlo]
status: processed
domain: rendering
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026-10-20

## 搜索范围

- **时间窗口（严格 24h）**: 2026-10-19 14:15 UTC → 2026-10-20 14:15 UTC
- **时间窗口（宽 40h 兜底）**: 2026-10-18 00:00 UTC → 2026-10-20 14:15 UTC
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, relighting, BRDF, splatting, Monte Carlo, 光线追踪/路径追踪/全局光照等
- **数据源**:
  - arXiv cs.GR（API 抓取最新 40 条，2026-10-13 → 2026-10-19）
  - SIGGRAPH Asia 2026：程序页仍为通用宣传文案，无新增论文公告
  - ACM Digital Library：本期无新公告

---

## 搜索结果概览

### 严格 24h 窗口（2026-10-19 14:15 → 2026-10-20 14:15）

arXiv cs.GR 在严格窗口内仅 4 条新提交，**均非渲染核心**：

| 论文 | 方向 | 判定 |
|------|------|------|
| FunCAD-Harness / Can It Actually Work? | LLM + CAD 机构功能合成 | ❌ 非渲染（CAD/agent） |
| Open-Form Geometric Style Transfer | 几何风格迁移（LoRA） | ❌ 属几何处理（wawaicai 域） |
| PhysSkin++ | 物理动画 / 神经蒙皮 | ⚠️ 邻域（动力学），非渲染 |
| Tile Granularity / MapLibre | 矢量瓦片压缩 | ❌ GIS 数据压缩 |

> **严格 24h 窗口无渲染核心论文** → 启用宽窗口兜底。

### 宽 40h 窗口（2026-10-18 → 2026-10-20）

窗口内渲染相关论文 3 篇（均新建笔记）：

| 论文 | 方向 | 会议 | 判定 |
|------|------|------|------|
| **SwitchSplat** | 3DGS 离散物体状态分解 | **SIGGRAPH Asia 2026** | ✅ 收录（高信号） |
| **Stable Signer V3** | 4D 可变形 primitive splatting 手语 avatar | — | ✅ 收录（中信号） |
| **Walk in Envelopes** | Branching Walk-on-Spheres / 蒙特卡洛方差控制 | — | ✅ 收录（方法论） |

### 跨域重复（不重复收录）

| 论文 | 已由谁收录 |
|------|-----------|
| **FluidGen**（物理感知流体视频生成） | **doumiao**（流体渲染 agent）已收录于 `doumiao/01-Papers/2026-10-20_FluidGen-Physics-Aware-Fluid-Video.md` |

### 此前日期已收录（本期窗口外，仅作对照）

以下渲染相关论文已在 10/15–10/16 收录，本期窗口外的最新提交中再次出现相关主题但无更新：
VisibilitySplat (WSCG 2026)、SUPRA-TEX (PBR 3D 纹理)、Spectral World Renderer、RoboCloth、Sketch-to-Scene（可重光照服装）、Tessellation-Free Displaced Surfaces、X-Splat。

---

## 新建笔记

1. `2026-10-17-SwitchSplat-Discrete-Object-States-3DGS.md`
   - SIGGRAPH Asia 2026，base+slot 分解，可微 slot 分配，支持组合未见状态
2. `2026-10-18-Stable-Signer-V3-4D-Deformable-Primitive-Splatting.md`
   - 4D primitive splatting 手语 avatar，面部误差 ↓71.4%
3. `2026-10-18-Walk-in-Envelopes-Branching-Walk-on-Spheres.md`
   - 认证解包络控制 WoS 分支方差，跨领域方法论

---

## 趋势观察

本期（10/18–10/20）cs.GR 的渲染相关投稿呈现明显的 **3D Gaussian Splatting 主题**:
- SwitchSplat（离散状态分解）、Stable Signer V3（4D 可变形）、X-Splat（多模态）
- 均为对 3DGS 表示**结构化/专门化**的扩展，而非新的光栅化或加速结构

Monte Carlo 方法论方面，Walk in Envelopes 代表了 **路径追踪同族的随机游走方法**在非图像问题上的方差控制探索（半线性 PDE），可作为渲染方差管理的旁证参考。

---

## 行动项

- ✅ SwitchSplat（高信号 SIGGRAPH Asia）→ 传递给 @墨鱼丸 评估 base+slot 改造
- ✅ Stable Signer V3 / Walk in Envelopes → 归档参考，不传递
- ✅ FluidGen → 已由 doumiao 覆盖，跨域去重

---

**搜索完成** — 严格 24h 窗口渲染核心为空，宽窗口补获 3 篇（1 高信号 / 1 中信号 / 1 方法论），1 篇跨域去重。