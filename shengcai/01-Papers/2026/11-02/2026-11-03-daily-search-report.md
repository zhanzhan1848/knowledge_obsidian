---
type: report
created: 2026-11-03
updated: 2026-11-03
tags: [日报, 渲染, arXiv, cs.GR, SIGGRAPH-Asia-2026, ACM-DL, 2026-11]
status: processed
domain: rendering
agent: shengcai
search_window: 2026-10-18 ~ 2026-11-03
---

# 🥬 每日渲染领域论文搜索报告 — 2026-11-03

**执行时间**：2026-11-03 14:38 UTC
**搜索源**：arXiv cs.GR（API，完整覆盖 200 条）、SIGGRAPH Asia 2026 会议页 + Ke-Sen Huang 论文列表、ACM DL（**受限**）
**关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## ⚠️ 本轮结论速览

> **相比上一轮（11-02）有实质增量**：上一轮 cs.GR 覆盖止于 2026-10-30，本轮 API 已发布 **2026-11-01 与 11-02 两个新批次**（共 10 篇）。
> 扩展窗口至 **2026-10-18 ~ 11-03** 后共筛查 55+ 篇 cs.GR 论文，渲染域相关 **12 篇**：
> **已收录 9 篇**（10-26 ~ 10-31 各轮），**新增 2 篇结构化笔记**（AbacusGS、WoMM），**1 篇为 SIGGRAPH Asia 2026 会议相关（暂无 arXiv 全文）**。
> **SIGGRAPH Asia 2026**（12 月 1–4 日，吉隆坡）完整论文列表尚未公布，当前仅 6 篇「有条件录用」可见，且**无渲染主题**。
> **ACM DL 依旧被 Cloudflare 阻断**（本轮尝试 curl + 浏览器均失败）。

---

## 一、覆盖与检索元信息

| 源 | 状态 | 说明 |
|----|------|------|
| arXiv cs.GR | ✅ 完整 | API `max_results=200`，返回 200 条，覆盖 **2026-10-17 ~ 2026-11-02**；另抓取 `list/cs.GR/recent` 校验，ID 一致（额外发现 API 排序漏掉的 2611.00076 / 2611.00027，经核实均为非渲染主题） |
| SIGGRAPH Asia 2026 | ⚠️ 部分 | `asia.siggraph.org` 程序页可访问；「Conditionally Accepted」PDF（504 KB，仅 submission ID）已下载解析；kesen 论文列表页 **403** → 改用浏览器成功读取 |
| ACM Digital Library | ❌ 受限 | `dl.acm.org` 直连（curl + web_fetch）均 **403 Cloudflare**；浏览器方式仍停在「Performing security verification」，未能进入 TOG 专辑页 |

### 严格 24h 窗口检查

```text
published 2026-11-02 之后（严格 24h）: 0 篇   ← 抓取时刻 11-02 批次刚发布完
published since 2026-11-01:             7 篇
published since 2026-10-18 (~2周):      55 篇
```

**说明**：arXiv 采用工作日批次制。11-01（周日）、11-02（周一）批次均已发布。11-03（周二）批次尚未发布至 API（抓取时刻 UTC 14:38，arXiv 批次通常晚于此时段）。故实际分析窗口扩展至最近两周。

---

## 二、本轮新增笔记（2 篇）

### 🆕 1. AbacusGS: Gaussian Splatting without Per-Splat Sorting
> arXiv:2611.01534 · Jiacheng Ding, Yanliang Qi, Cong Guo, Peihua Mai · 2026-11-01

**一句话**：把 3DGS 的**逐 splat 深度排序**换成「八叉树分箱（≤128 splat/箱）+ 箱内写入期固定轴向的可逆存储序」，每帧只排**可见箱**（≈N/31），箱内方向靠 **1 次点积**决定正读/倒读。

- **公式**：两级序 `π=[ρ_b1,…,ρ_bV]`，`z̄_b = f·(μ̄_b−o)`；方向位 `s_b = sign((μ̄_b−o)·a_b)`；箱轴为主特征向量 `a_b = PEV(P_c v_b c v_bᵀ)`；微调深度键 `κ_i = 2¹² r(b_i) + ℓ_i`
- **性能**：CPU 排序的 OpenGL 观察器上 **4.5× 帧率**；质量仅 **−0.13 dB PSNR**；紧凑格式 **17 B/splat**
- **可迁移结论**：「1 次点积决定存储序正/倒读」是「任意顺序遍历 + 需要深度序合成」的通用降本技巧

📄 [笔记](2026-11-03_AbacusGS-Gaussian-Splatting-Without-Per-Splat-Sorting.md)

### 🆕 2. Walk on Multiscale Media (WoMM)
> arXiv:2610.35952 · Yunfeng Liao, Xiucheng Li · 2026-10-24

**一句话**：把「异质介质中的蒙特卡洛输运」**离线编译**成可复用/可编辑/可组合的**传输预制件**（MsFEM 凝聚算子 + Poisson 标记事件记录），重复点查询在线加速 **22–28×**，材质编辑只需被编辑节点的首次出口概率。

- **公式**：Schur 补 `S_K = D_K − J_K`；粗端口转移 `P_{K,κ}(α→β) = −(S_κ)_{αβ}/s_α`；首次出口核 `F̂_κ(x,b) = (1/N_x)Σ_r 1{Y=b}∏(1−κ(z)/μ)`；编辑增量 `ΔJ = Φ₀ᵀVΦ₁`
- **关键技巧**：resolvent 恒等式把编辑更新**局部化**；二阶 **U-statistic** 消除同记录权重相关带来的对角偏差（无偏性 + 方差界已证明）
- **性能**：Hybrid vs 官方变系数 WoS，在线 111–138 ms vs 3044–3139 ms（12 查询），**22.4–28.2×**；4 种配置中 3 种 RMSE 更优

📄 [笔记](2026-11-03_WoMM-Walk-on-Multiscale-Media-Transport-Prefabs.md)

---

## 三、已收录论文确认（9 篇，本轮复核，无重复建档）

| 论文 | arXiv | 采集日 | 笔记 |
|------|-------|--------|------|
| GraftRay: Physically Based Mesh Insertion into GS Scenes via Path Tracing | 2610.37036 | 10-28 / 10-29 | ✅ |
| Honeycomb-Surfels (Hexels) | 2610.37668 | 10-28 / 10-29 | ✅ |
| From Walks to Skeletons (WoS Skeleton) | 2610.36931 | 10-29 | ✅ |
| RADIANT: Object-Centric Feed-Forward GI | 2610.32075 | 10-26 | ✅ |
| NeuOctree: Neural Explicit Shape Representation | 2610.38441 | 10-31 | ✅ |
| Gaussian-Grid (Frequency-Adaptive Gaussian Grids) | 2610.38007 | 10-31 | ✅ |
| GOFish: Full FoV Gaussian Splatting + Mesh | 2610.37818 | 10-31 | ✅ |
| RacerGS: 3DGS Compression | 2610.34263 | 10-27 | ✅ |
| DomeGS: VR Background Completion | 2610.37172 | 10-28 / 10-29 | ✅ |

---

## 四、本轮筛查但判定为「非渲染域」的论文（15 篇，摘要级判定）

| 论文 | arXiv | 判定理由 |
|------|-------|---------|
| GPU-Native Real-Time Textured Mesh Reconstruction | 2611.03033 | 重建/纹理流水线（TSDF+Marching Cubes），非渲染算法 |
| One Image Is Enough (Human Video Diffusion) | 2611.02964 | 生成模型 |
| Parametric CAD Bench v3 | 2611.02659 | CAD 生成评测 |
| UniCross3D | 2611.02631 | 3D 生成 |
| Camera-Free Object Discovery (GazeTags) | 2611.02599 | HCI/交互 |
| Fréchet Oral Distance | 2611.01705 | 语音驱动动画评测 |
| Extensible Programmatic Specification of FEM | 2611.01414 | 数值方法/编程语言 |
| Precision Through Play (Laparoscopic XR) | 2611.01229 | HCI |
| Composable CAD | 2611.01165 | CAD |
| SHield: Watermarking 4DGS | 2611.01162 | 3DGS **水印/安全**，非渲染算法本身 |
| Infinite Worlds from One Example | 2611.01048 | 生成模型 |
| UniCaMo | 2611.00810 | 视频生成控制 |
| Representation-Aware Closed-Surface Parameterization | 2611.00721 | 几何处理（属娃娃菜域） |
| Toolpath Overhang Optimization | 2611.00371 | 制造 |
| Piecewise CMC Segmentation for Fluidic Shaping | 2611.00227 | 流体/几何（属菜心/娃娃菜域） |

> 其中 **SHield (2611.01162)** 虽以 4DGS 为载体，但核心贡献是**球谐系数扰动水印**，与渲染管线性能无关，本轮不建档。

---

## 五、SIGGRAPH Asia 2026 跟踪

**会议**：2026-12-01 ~ 12-04，吉隆坡（马来西亚）——**SIGGRAPH 首次在东南亚举办**。

### 当前状态

| 项 | 状态 |
|----|------|
| 「Conditionally Accepted」列表 | ✅ 已下载解析（504 KB，3 页）—— **仅含 submission ID，无标题**（如 papers_1001…papers_2819，共约 380 个 ID） |
| 完整 accepted papers 列表 | ❌ **尚未公布**（程序页明确写 "Stay tuned as more details of the program will be revealed soon!"） |
| ACM DL 收录 | ⏳ 「ACM TOG 特别刊 + SIGGRAPH Asia 2026 会议论文集」，**尚未上线**（dl.acm.org 被 Cloudflare 阻断，无法确认） |
| kesen 论文列表页 | ✅ 经浏览器读取，当前仅列 **6 篇有条件录用** |

### 已有 6 篇有条件录用（无渲染主题）

| 标题 | 类型 | 备注 |
|------|------|------|
| Many-Videos Browsing | SIG | 视频集合交互可视化 |
| X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction | SIG | UTokyo / NII / 芝浦工大 — **3DGS + X-ray**，与本库神经渲染主题相关 |
| Structure–Color Disentangled Anime Hair Synthesis via Flow Line | SIG | UTokyo — 发丝渲染相关 |
| Inverse Rendering for Modeling with Line Primitives | SIG/TOG | ETH / UTokyo — **本库已有**（2609.00625） |
| GreenScapes: Optimized Vegetation Configurations in Cities | SIG | 植被配置 — 与 10-29 的 arXiv 版 (2610.40007) 同题 |
| （1 篇 SIG/TOG，作者列表未渲染） | SIG/TOG | — |

📌 **观察**：SA2026 出现 **「X-Splat：RGB + X-ray 联合重建」** 与 **「结构-颜色解耦动漫发丝合成」** 两个方向——前者是**多模态辐射场**（与 [[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]] 的显式表面 + 射线查询同属「可查询表面表示」赛道），后者是**发丝渲染的生成式路径**（可补本库 07-13 的 hair rendering 笔记）。**待正式列表公布后优先补档。**

---

## 六、ACM Digital Library 访问受限记录

本轮三种方式均失败：

```text
1) curl + UA 伪装 → HTTP 403 "Just a moment... Enable JavaScript and cookies to continue"
2) web_fetch      → HTTP 403 (Cloudflare)
3) 浏览器          → 停留于 "Performing security verification"（Ray ID: a54c22016d6b9bd1）
```

**影响**：无法直接核查 TOG 45(3)/45(4) 专辑中新上线的渲染论文。**缓解措施**：
1. SIGGRAPH Asia 2026 的 TOG 特别刊收录信息通过 kesen 列表 + 会议 PDF 交叉验证（会议日程与程序页可访问）。
2. TOG 常规卷的新论文多为 arXiv 预印本，已由 cs.GR API 覆盖。
3. 建议后续在**浏览器通过 Cloudflare 验证后**再做 TOG 专辑巡检（本轮浏览器会话未能过验证，可能是 profile 未持久化）。

---

## 七、本轮新增的技术洞察（跨论文）

**1. 「排序/遍历顺序」正成为独立的优化维度。**
AbacusGS（分箱 + 1 次点积定序）与既有工作 Voxlines / BSP 遍历 / 深度预排序列表构成一条清晰的技术脉络：**当遍历顺序无法被硬件保证时，就把顺序决策下沉到存储期，用运行时 O(组数) 的廉价判断替代 O(元素数) 的排序**。这与 [[2026-10-28_Wave-Tracing-Path-Integral-Wave-Optics]] 的遍历顺序问题同源，建议在知识库中建立「**渲染遍历顺序优化**」概念条目统一收拢。

**2. 蒙特卡洛求解器正从「一次性」走向「可复用、可编辑」。**
WoMM（预制件 + 局部增量编辑）与姊妹篇 WoS Skeleton（传输骨架 + 路径附着）构成一条完整脉络：**蒙特卡洛光传输的下一阶段竞争力不在采样效率，而在「场景被编辑后能否快速响应」**。这对渲染域的直接含义是：**可编辑的吸收/散射介质**（毛发、皮肤、体积雾）实时交互。

**3. 「光线追踪 Gaussian」的技术路线正在分化出三条清晰分支。**

| 分支 | 代表工作 | 核心机制 |
|------|---------|---------|
| **物理光传输** | GraftRay (2610.37036)、EAG-PT | 高斯作为**光传输介质**：随机透明性 + 解析面光源 + MIS |
| **显式表面查询** | NeuOctree (2610.38441) | 高斯/八叉树作为**可查询表面**：直接预测射线-表面交点、法线、albedo |
| **排序加速** | AbacusGS (2611.01534) | 高斯作为**光栅化图元**：两��排序 + 紧凑格式 |

三者并不冲突：GraftRay 走 GPU 光追栈（OptiX），NeuOctree 走「无网格可渲染表示」，AbacusGS 走 WebGL 光栅化栈。**建议在 02-Concepts 建立「Gaussian 光追三路线」对比条目。**

---

## 八、行动建议

1. **立即传给 @墨鱼丸**：
   - **AbacusGS** —— 若有任何 Web/移动端 3DGS 查看器项目，排序是首要瓶颈；可直接借鉴「八叉树分箱 + 存储序 + 序感知微调」三件套（微调时务必前后向同序）。
   - **WoMM** —— 若涉及可编辑吸收介质（毛发/体积散射），`ΔJ = Φ₀ᵀVΦ₁` 的**编辑局部增量**是最高性价比部分。
2. **待办**：SA2026 正式列表公布后补档 **X-Splat**（RGB+X-ray 联合重建）与 **Structure–Color Disentangled Anime Hair**；SA2026 于 12-01 开幕，**建议 11-底 / 12-初做一次专项巡检**。
3. **待办**：解决 ACM DL 访问（浏览器 profile 持久化或换用 kesen 交叉验证路线）。
4. **待办**：与 @菜心 / @豆苗 建立「**筛选场编辑 ↔ 流体吸收介质编辑**」技术对接（WoMM 的 screening 语义可直接对应）。

---

## 九、关联笔记

- [[2026-11-03_AbacusGS-Gaussian-Splatting-Without-Per-Splat-Sorting]]
- [[2026-11-03_WoMM-Walk-on-Multiscale-Media-Transport-Prefabs]]
- [[2026-10-29_Reusable-Transport-Skeletons-WoS-Interactive-PDE]]
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]]
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]]
- [[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]]
- [[2026-10-28_Honeycomb-Surfels-Hexels]]
