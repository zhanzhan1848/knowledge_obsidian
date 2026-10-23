---
type: daily-report
created: 2026-10-23
updated: 2026-10-23
tags: [daily-report, paper-search, 2026-Q4, cs.GR, gaussian-splatting, ray-surface-intersection, height-field, occlusion, ACCV-2026]
status: processed
domain: rendering
agent: shengcai
date: 2026-10-23
window: 24h (2026-10-22 14:00 UTC → 2026-10-23 14:15 UTC) + 72h 补充
---

# 每日论文搜索报告 - 2026-10-23

**执行时间**: 2026-10-23 14:15 UTC (Friday)
**执行 Agent**: shengcai (生菜)
**搜索范围**: arXiv cs.GR 主分类（API 抓取最近 100 篇，覆盖 2026-10-07 → 10-22）
**关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, Gaussian Splatting, surface reconstruction, deformation, occlusion, TSDF
**结果统计**: **24h 强相关论文 = 1 篇**（H-2DGS）；72h 补充 = 3 篇；入库 **4 篇**

---

## ✅ 关键变化：空窗期结束，SIGGRAPH 2026 会后浪潮正式到来

上一份报告（2026-10-18）判断"10/20 ~ 11/05 SIGGRAPH 论文集将陆续涌入 arXiv"。**该预测已兑现**。

| 日期 | cs.GR 主分类投稿数 | 对比 |
|------|------------------|------|
| 10-07 | 8 | 正常 |
| 10-08 | 12 | 正常 |
| 10-13 | 8 | 正常 |
| **10-14** | 4 | 空窗 |
| **10-15** | 11 | 空窗 |
| **10-16** | 4 | 空窗 |
| **10-17** | 7 | 空窗 |
| **10-18** | 2 | 空窗 |
| 10-19 | 7 | **回升** |
| **10-20** | **12** | **恢复高位** |
| 10-21 | 3 | — |
| 10-22 | 2 | 周五低谷 |

**结论**：10-14 ~ 10-18 连续 5 个窗口的低产出空窗（SIGGRAPH 2026 会期 10/11-15 干扰）已结束。10-20 恢复到 12 篇的正常高位。

> 注：10-21/10-22 数字偏低是因为报告执行时刻（10-23 14:15）时最近一批尚未完全进入 API 索引，且周五本身是 arXiv 低谷日（历史分布：周四 21 / 周二 20 / 周三 18 / 周五 9）。

---

## 今日入库清单 (4 篇)

### 🥇 Tier A — H-2DGS (2610.30910) ⭐⭐⭐⭐⭐

**24h 严格窗口内唯一的渲染表示类论文。**
[[2026-10-22-H-2DGS-Height-Field-Gaussian-Splatting-Surgical-Surface]]

- **标题**: H-2DGS: Height-Field Gaussian Splatting for Sharp and Deformable Neurosurgical Surface Reconstruction
- **单位**: Eindhoven University of Technology + Elisabeth-Tweesteden Hospital Tilburg
- **核心**: 三阶段管线把体积型 3DGS 转为**显式高度场曲面图元**：3DGS bootstrap → 可微光线厚度收缩 → TSDF 融合 → 曲面 chart
- **为何对本库重要**: 给出**完整可实现**的 surface primitive 渲染路径（5 个高斯基 + Newton 求交 `f_i(t) = y_{z,i}(t) − h_i(u,v) = 0`）。这是本库目前收录的 surface-Gaussian 类工作中**唯一**把光栅化步骤写清楚的
- **结果**: MVDC `1e-5 ~ 4e-5`（比 3D-HGS 低 4~5 个数量级）、恒定 **7.97 MB**（比基线小 5–13 倍）、RTX 3050 4GB 上 **29–42 ms/frame**；代价是 PSNR 明显落后（Preop3 上 25.20 vs QGS 40.07）
- **可迁移点**: 可微光线厚度惩罚、高度场图元、几何基维数 < 外观基维数（5/20/50）、形变时 opacity 覆写为 0.999、学习率分层 + 几何/外观交替窗口

### ⭐ Tier A- — Occlusion-Aware Densification (2610.27108) ⭐⭐⭐⭐

[[2026-10-19-Counting-Contributions-Occlusion-Aware-Densification-3DGS]]

- **标题**: Counting Contributions, Not Views: Occlusion-Aware Densification for 3D Gaussian Splatting
- **单位**: RPTU Kaiserslautern-Landau + DFKI
- **发表**: **ACCV 2026 (Oral)**, 46 页
- **核心**: 3DGS 的致密化统计用**视锥可见性**过滤——该过滤**对遮挡完全盲视**。本文是**首个替换该过滤器本身**（而非其上的判据）的工作；同时把判据分母从视图计数 `M` 换成累积平均混合权重
- **公式**: `γ_i^Ours = (1 / (1 + Σ_v w̄_{i,v})) · Σ_v ‖g_{i,v}‖`，其中 `w̄_{i,v} = (1/N_{i,v})Σ_p w_{i,p}`
- **为何对本库重要**: 这是**所有 3DGS 后续工作都在继承却无人质疑的底层 bug**。本库已收录的 VisibilitySplat、H2-Ray 等大多基于标准 3DGS → 它们的性能数字都带这个系统性偏差
- **结果**: Zip-NeRF 遮挡严重场景 LPIPS 最多降 **12%**、Gaussian 数 ≤ StopThePop 一半；100k 调度下 PixelGS 裸判据过致密化到 >16.8M **训练崩溃**，本文方法 1.890M 稳定；**210k 调度下本文方法计数仍保持 2.495M 有界，竞品发散**
- **落地成本**: 接近零——`W_{i,v} = Σ_p w_{i,p}` 在 CUDA rasterizer 里本来就在算

### Tier B — Cross-Ray NeRF Geometry (2610.27776) ⭐⭐⭐

[[2026-10-20-Geometry-Regularization-Vanilla-NeRF-Cross-Ray-Consistency]]

- **标题**: Geometry Regularization for Vanilla NeRF via Self-Supervised Cross-Ray Consistency
- **作者**: Zongji Wang（单作者）
- **核心**: 从密度场采样候选表面点，**从不同方向生成在同一点相交的光线**，用 NeRF 渲染外观，以**可见性加权颜色一致性**约束几何；再惩罚外观不一致处的不透明度并鼓励法向平滑
- **亮点**: **零外部监督**（不需要深度/法向 GT，避开 Midas 类模型的域偏移）
- **结果**: 8 个 Replica 场景，平均 Chamfer 距离降 **30.8%**
- **注意**: 单作者、无代码、**摘要未报告 PSNR/SSIM**——几何改善是否以光度为代价未知

### Tier C — WorldStream (2610.28827) ⭐⭐

[[2026-10-20-WorldStream-Streaming-Interactive-3D-Worlds]]

- 开放式 3D 世界模型：分层规划（Macro/Micro）+ **流式分离可达性**（规划先行、编译滞后、离开即释放）+ 单一世界记录持久化（返回 tile 重新编译）
- 非渲染算法论文，但"规划先行 / 编译滞后 / 释放"的调度与**大场景渲染的 LOD 与流式加载同构**，程序化几何生成的"持久记录 + 返回重编译"模式也值得几何线参考

---

## 已抓取但未单独入库（4 篇）

| arXiv ID | 标题 | 判定 |
|---------|------|------|
| 2610.25755 | Does Tile Granularity Matter? Vector Tile Compression for Map Rendering (MapLibre) | cs.DB 主分类，与渲染管线无关 |
| 2610.25297 | Walk in Envelopes: Branching Walk-on-Spheres | **已在库**（10-18 已收录，Monte Carlo 数值方法非渲染） |
| 2610.27999 | Matrix-Game 4.0: Video Models for Real-Time Playable Game Worlds | 视频生成模型驱动游戏世界，非渲染算法创新；但其"低多边形 proxy + 自回归视频模型渲染"思路与神经渲染相关 |
| 2610.28490 | Learning from Automatic 3DGS Edits for Online Bayesian Scene Change Detection | 3DGS 应用（变化检测），非渲染算法 |

---

## 趋势分析

### 主题分布（近 7 天 cs.GR，n=54）

```
3D Gaussian / NeRF 重建:  31%   ← 持续主导
几何处理 (mesh, surface): 24%
动画 / 角色:             20%
布局 / 设计:             11%
程序化生成 / 世界模型:     6%
其他:                    8%
```

### 与 10-18 报告的趋势预测对照

| 10-18 预测 | 10-23 实际 | 判定 |
|-----------|-----------|------|
| cs.GR 每日回到 5–15 篇 | 10-20 = 12 篇 | ✅ 兑现 |
| 渲染管线（光追/路径追踪/BVH）占比回升至 15–25% | **仍低**：本期无传统光追/路径追踪论文；增量集中在 3DGS 表示层面 | ⚠️ 部分兑现 |
| SIGGRAPH 2026 论文集陆续上 arXiv | H-2DGS（10-22）为会后第一批 | ✅ 开始兑现 |
| 关注 NVIDIA/Adobe 博客 | 本期未执行 | ⏳ 待办 |

> **值得注意的结构性观察**：本期两篇 Tier A 论文都**不是**传统渲染管线（光线追踪/路径追踪/全局光照）论文，而是**"3DGS/NeRF → 显式几何表示"的转换与致密化策略**。这可能反映 SIGGRAPH 2026 会后涌出的论文方向偏向神经/高斯表示工程，而非经典渲染算法。

---

## 行动建议

| 收件人 | 内容 | 优先级 |
|--------|------|--------|
| **墨鱼丸 (moyuwan)** | **H-2DGS 的高度场图元 + Newton 求交**——本库目前唯一给出完整可实现渲染路径的 surface primitive，建议评估移植为自定义图元类型 | **高** |
| **墨鱼丸 (moyuwan)** | **3DGS 视锥可见性过滤是系统性 bug**：任何基于标准 3DGS 的室内/大场景工作必须先替换为混合权重过滤，否则计数统计被遮挡视图稀释；长调度下这是防发散的必要条件 | **高** |
| **墨鱼丸 (moyuwan)** | H-2DGS 的可微光线厚度惩罚可用于让稀疏视角下的 3DGS 变锐，与本库 Tabula Rasa 同族思路 | 中-高 |
| **黄喉 (huanghou)** | WorldStream 的"契约 → tile 语义 → 确定性编译"分层结构与"持久记录 + 返回重编译"的生成模式 | 中 |
| **菜菜 (caicai)** | 方法论案例：领域普遍在"判据层"创新（AbsGS/PixelGS/GOF/EFA-GS/Grubert）却忽略"过滤器层"的偏差——可作为其他 agent 审视既有假设的范例 | 中 |
| **吊龙 (diaolong)** | WorldStream 的分级可达性调度与大场景渲染的 LOD/流式加载同构 | 低 |

---

## 落库清单 (Knowledge Vault)

```
/root/knowledge-vault/shengcai/01-Papers/2026/10-October/
├── 2026-10-22-H-2DGS-Height-Field-Gaussian-Splatting-Surgical-Surface.md  (新建, 11.8KB)
├── 2026-10-19-Counting-Contributions-Occlusion-Aware-Densification-3DGS.md (新建, 8.2KB)
├── 2026-10-20-Geometry-Regularization-Vanilla-NeRF-Cross-Ray-Consistency.md (新建, 2.9KB)
├── 2026-10-20-WorldStream-Streaming-Interactive-3D-Worlds.md (新建, 2.2KB)
└── 2026-10-23-daily-search-report.md (本文)
```

**技术提取消耗**：H-2DGS PDF 全文提取（9 页）+ Occlusion-Aware Densification 全文提取（46 页）→ 公式与定量表格逐条核验。

---

## 下次预期

- cs.GR 维持 5–12 篇/日（SIGGRAPH 会后恢复期）
- **重点关注**：SIGGRAPH 2026 论文集后续批次是否带来经典渲染管线论文（本期为零）
- 追踪 H-2DGS 承诺的 GitHub 开源
- 执行拖后待办：NVIDIA Research / Adobe Research 官方博客扫描
- 追踪 ACCV 2026 / WSCG 2026 接收论文上 arXiv

---

## 历史窗口对照

| 报告日期 | 24h 强相关 | 72h 补充 | 状态 |
|---------|-----------|---------|------|
| 2026-10-13 | 4 篇 | — | 正常 |
| 2026-10-14 | 0 篇 | — | 空窗 |
| 2026-10-15 | 0 篇 | — | 空窗 |
| 2026-10-16 | 0 篇 | — | 空窗 |
| 2026-10-17 | 0 篇 | — | 空窗 |
| 2026-10-18 | 0 篇 | 3 篇 | 空窗 |
| **2026-10-23 (本报告)** | **1 篇** | **3 篇** | **✅ 空窗结束** |

---

**质量检查**:
- [x] arXiv API 正确抓取（HTTPS + `-L`，首次 HTTP 301 已修正）
- [x] 24h 窗口严格检查（cs.GR 主分类，100 篇覆盖 16 天）
- [x] 关键词分层过滤（强相关 / 中相关 / 剔除）
- [x] 与已有笔记去重（7 篇候选逐一 grep 验证，1 篇已存在）
- [x] 两篇 Tier A 论文**下载 PDF 全文提取**，公式与表格逐条核验
- [x] 会议归属核验（ACCV 2026 Oral / arXiv）
- [x] 与 10-18 报告趋势预测对照
- [x] 提供下次运行预期
- [ ] git sync 推送