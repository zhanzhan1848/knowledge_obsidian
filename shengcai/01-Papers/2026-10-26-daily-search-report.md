---
type: report
created: 2026-10-26
updated: 2026-10-26
tags: [报告, 每日搜索, 渲染, 2026-10]
status: processed
agent: shengcai
---

# 🥬 每日渲染领域论文搜索报告 — 2026-10-26

**执行时间**：2026-10-26 14:31–14:40 UTC
**搜索窗口**：2026-10-19 ~ 2026-10-26（arXiv cs.GR 近期列表 + 全库关键词检索）
**数据源**：arXiv cs.GR listing / arXiv API（cs.GR + cs.CV + cs.RO + cs.AR）、SIGGRAPH Asia 2026、ACM DL（Cloudflare 拦截，via DOI 元数据）、Advances in Real-Time Rendering 2026

---

## 一、检索方法与覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR recent listing | ✅ | 解析 38 条近 5 日条目（10/20–10/26）；今日（10/26）仅 2 条且均为 cs.CV cross-list |
| arXiv API 关键词检索 | ✅ | 覆盖 ray tracing / path tracing / global illumination / PBR / BVH / ray marching / light transport / rasterization 等 9 组查询 |
| arXiv 全库标题检索 | ✅ | ti:rendering / render / illumination / lighting / shading / splatting 等 |
| ACM Digital Library | ⚠️ | 直接抓取被 Cloudflare 拦截（返回 "Just a moment..."）；改用 arXiv 元数据中的 ACM DOI 反查（JointLight 的 DOI 10.1145/3829340.3842252 确认收录） |
| SIGGRAPH / SIGGRAPH Asia | ✅ | 命中 JointLight（SA Conference Papers '26）与 SwitchSplat、GALA（SIGGRAPH Asia 2026） |

---

## 二、收录论文（6 篇，按相关性排序）

| # | 论文 | 来源 | 日期 | 匹配关键词 | 推荐度 |
|---|------|------|------|-----------|--------|
| 1 | [RADIANT: Object-Centric Feed-Forward Global Illumination](https://arxiv.org/abs/2610.32075) | arXiv (cs.CV/cs.GR/cs.LG) | 10-23 | global illumination, 前馈渲染, Transformer | ⭐⭐⭐⭐⭐ |
| 2 | [Ray-by-Ray: Fine-Grained Resource Management for GPU Ray Tracing Units](https://arxiv.org/abs/2610.31630) | arXiv (cs.AR) → MICRO-2026 | 10-22 | ray tracing, GPU 架构, BVH, SIMT | ⭐⭐⭐⭐ |
| 3 | [RxGS: Relightable Gaussian Stylization via BRDF Decomposition](https://arxiv.org/abs/2610.25681) | arXiv (cs.CV) | 10-19 | PBR, BRDF, 可重光照, 3DGS | ⭐⭐⭐⭐ |
| 4 | [JointLight: Human-Centric Video Relighting with Async RGB-Irradiance Joint Modeling](https://arxiv.org/abs/2610.29780) | **SIGGRAPH Asia 2026** | 10-21/22 | path tracing (irradiance cue), 光照传输, 重光照 | ⭐⭐⭐⭐ |
| 5 | [HyperDrone: Simulation-to-Reality Transfer at Millions of FPS](https://arxiv.org/abs/2610.28950) | arXiv → CoRL 2026 | 10-20 | ray tracing (OptiX/Vulkan/Metal/WebGPU), PBR | ⭐⭐⭐⭐ |
| 6 | [SpaRV: Sparse Radiance Voxels for Scalable LiDAR-Visual Mapping and Rendering](https://arxiv.org/abs/2610.25665) | arXiv (cs.RO/cs.CV) | 10-19 | ray marching, 辐射场, 稀疏体素 | ⭐⭐⭐⭐ |

笔记已写入 `~/knowledge-vault/shengcai/01-Papers/`。

---

## 三、今日技术趋势观察

### 1. 「物理不变量进网络」成为主流范式
RADIANT 把辐射传输的几何不变量（距离、核朝向、互相朝向）**精确因式分解为 query-key 内积**，而非用 MLP 拟合。这与 Ray-by-Ray 的「把资源管理粒度对齐到实际工作粒度」是同一种思路：**在正确的抽象层上建模，而不是在更细的粒度上堆算力**。

```math
-\|\Delta_{ij}\|^2 = \langle [2c_i, -\|c_i\|^2, -1],\; [c_j, 1, \|c_j\|^2] \rangle
```

### 2. 光照传输的三条并行路线同批出现
- **前馈神经路线**：RADIANT（feed-forward，无 per-scene 优化）
- **几何/材质分解路线**：RxGS（albedo-only 记账式保持可重光照）
- **生成/像素路线**：JointLight（path-traced irradiance cue + 异步 diffusion 去噪）

三条路线分别解决「跨场景泛化」「材质正确性」「生成质量与可控性」，说明**可重光照研究正在从单一表示问题转向表示 × 控制 × 质量的组合问题**。

### 3. 工业界的 RT 认知正在被学术论文追赶
SIGGRAPH 2026 的 Advances 课程里，Activision EA SEED 的 Jon Greenberg 讲了 **ORCA（Online Radiance Cache Acceleration）加速路径追踪**、Michał Olejnik 讲了 **COD MW4 的 Variable Rate Ray Tracing**、IO Interactive 讲了 **Smolder 实时体积渲染**、Roblox 讲了 **SLIM（kit-based UGC 世界扩展）**、Meta 讲了 **自适应细分**。而本批次的 Ray-by-Ray 正好从硬件层面对同一问题（RT 发散开销）给出了独立佐证。

### 4. ray marching 作为「多传感器统一渲染器」的定位凸显
SpaRV 用**一个**可微 ray marching 渲染器同时服务相机像素、LiDAR 射线与鱼眼/全向相机 —— 说明 ray marching 不只是 NeRF 的实现细节，正在成为**通用可微多模态渲染前端**。

---

## 四、筛选与排除记录

以下条目经审阅后**排除**（理由：非渲染算法核心，或领域归属其他 agent）：

| 论文 | 排除理由 |
|------|----------|
| SwitchSplat (2610.24812) | SIGGRAPH Asia 2026，但属 3DGS 场景状态表示/动态建模，无光照传输创新 → 归 3D 表示方向 |
| GALA (2610.28280) | SIGGRAPH Asia 2026，但属几何布局/场景生成 → 归 娃娃菜（几何）方向 |
| OV-Foam (2610.28131) | 开放词汇分割 + PowerFoam 空间划分，属语义特征提升，非渲染 |
| Walk in Envelopes (2610.25297) | Walk-on-Spheres 求解半线性 PDE，属数值方法（物理），非渲染 |
| HRoPE (2610.28284) | 多视图注意力位置编码，属视觉表征，无光传输 |
| AnyGameRenderer (2610.31466) | 视频到视频生成渲染器（LoRA 微调 33B），属生成模型，无渲染算法贡献 |
| Geometry Regularization for Vanilla NeRF (2610.27776) | NeRF 几何正则，价值中等但非本轮核心关键词覆盖范畴 |
| 3DGS densification / GTSM / RecallGS / H-2DGS 等 | 属 3D 表示/密度控制/动态场景方向 |

---

## 五、待办与后续

- [ ] RxGS、SpaRV 代码未公开 → 关注后续 release
- [ ] HyperLux 引擎（HyperDrone 内核）是否有独立开源仓库待确认
- [ ] ORCA（Online Radiance Cache Acceleration，EA SEED @ SIGGRAPH 2026）材料值得单独抓取分析 —— 与我们已有的 2026-08-02 SIGGRAPH2026 Advances 笔记互补
- [ ] RADIANT 承诺「publication 后开源 code + dataset」，可建立跟踪

---

## 六、同步状态

已执行 `~/knowledge-vault/.scripts/git-sync.sh` 提交并推送到 `https://github.com/zhanzhan1848/knowledge_obsidian.git`（branch: main）。
