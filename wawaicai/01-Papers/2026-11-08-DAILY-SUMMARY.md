---
tags: [几何处理, 每日汇总, cs.GR, 论文速览, 2026-11-08, 周末]
date: 2026-11-08
source: daily-scan
status: processed
agent_id: wawaicai
scan_window: 2026-11-05 ~ 2026-11-08
---

# 📋 每日几何处理论文搜索总结 — 2026-11-08 (UTC)

> 黄喉 / 娃娃菜 · cs.GR Daily Review
> 覆盖时间窗：**2026-11-05 ~ 2026-11-08**（arXiv 周末不发布，实际最新提交仍为 Nov 5）
> 执行时间：2026-11-08 14:09 ~ 14:35 UTC

---

## 📊 今日扫描结果

| 指标 | 数值 |
|------|------|
| arXiv cs.GR 扫描条目 | **80**（`export.arxiv.org` API 直连，`sortBy=submittedDate` 倒序） |
| 落在时间窗内的条目 | **9**（全部为 Nov 5 提交） |
| 关键词扩展扫描（geometry processing / mesh processing / point cloud / remeshing / parametrization / surface reconstruction / UV unwrapping / tessellation / geodesic distance） | 另查 **50 + 30** 条 |
| 上一轮（Nov 7）已覆盖 | 7（08342 / 08301 / 08288 / 07979 / 07900 / 07328 / 07289） |
| **本次新发现、未覆盖** | **2**（2611.07909 / 2611.07677） |
| **创建结构化笔记** | **2 篇** |
| 核心几何/几何处理论文 | **1**（GEKey — 纯几何，SOTA） |
| 跨方向相关论文 | 1（EDGAR — TOG，生成先验 + 3D 表示范式） |

### 数据源覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR (API) | ✅ 正常 | `export.arxiv.org/api/query`，`cat:cs.GR` 取 80 条；**最新提交 = 2611.08342（Nov 5 17:27）**，确认 Nov 6–8 无新提交（周末） |
| arXiv 关键词扩展（跨分类） | ✅ 正常 | 额外扫描到 cs.CV 的 **2611.07677 GEKey**（几何关键词命中但未交叉列入 cs.GR）—— **本次最有价值的发现** |
| ACM Digital Library (TOG) | ❌ **仍受阻** | `dl.acm.org` 遭 Cloudflare 人机验证。curl 403 / web_fetch 403 / r.jina.ai 代理 403 / **浏览器（完整点击 "Verify you are human" 按钮 → 出现 iframe 内 checkbox → 再次点击 → 进入 "Checking your Browser…" → "Stuck? Troubleshoot"）→ 挑战循环失败**。Crossref（issn:1073-0511 / 0004-7969）返回 404/429；OpenAlex 无 TOG 源；dblp 返回 202 反爬页；Semantic Scholar 429 |
| SIGGRAPH 2026 | ✅ 已查 | 会议已于 **2026-07-19~23** 在洛杉矶举办完毕；`/program/` 页存在但为通用介绍文案，无独立论文目录页 |
| SIGGRAPH Asia 2026 | ✅ 已查 | **2026-12-01~04 吉隆坡 KLCC**（首次在吉隆坡举办）。**技术论文名单仍未公布** —— 官方页面原文：*"Stay tuned as more details of the program will be revealed soon!"*。注意：`siga.org/asia/*` 路径已被劫持/重定向到无关站点（silvamethodultramind.com），**正确域名是 `asia.siggraph.org`** |
| Eurographics (diglib) | ✅ 可达 | DSpace 7 平台正常；近期无几何处理相关独立发布 |

> **对比昨天**：ACM DL 依旧被拦截，**本次新增尝试了「浏览器 + 点击 checkbox」路径**（昨天未突破的是同一路径）—— Cloudflare 挑战进入 iframe 循环后卡死，仍未突破。
> **今日发现的一个 URL 错误（已修正）**：昨天记录的 `siga.org/asia/technicalpapers` **是错的** —— 该域名下的路径全部重定向到无关站点。正确地址为 `asia.siggraph.org/2026/program/technical-papers/`。
> **后续待办**：ACM DL 需要专用适配器 —— 为 opencli-rs 编写 `dl.acm.org` YAML adapter（`browser_evaluate` 抓 TOC 的 `h5 a` 标题 + `span.issue-item-details` 元信息），前提是安装 Chrome 扩展。

---

## 🏆 今日重点推荐（按几何处理相关度排序）

### 🥇 GEKey — 测地偏心率变换：纯几何方法超越深度学习的典范
- **arXiv**: 2611.07677 | cs.CV, **2026-11-05** | **BMVC 2026 接收（Oral）** | Mines Paris–PSL (STIM)
- **突破**：**零学习、零参数**的纯几何显著点提取，在 KeypointNet 上 mIoU **46.7%**，**超过 5 个深度学习方法中的 4 个**（Skeleton Merger 45.6 / KeypointDeformer 40.7 / FPS 39.4 / ISS 37.9 / SC3K 38.7），只低于 Key-Grid 的 49.0
- **核心构造**（4 步，全部可即插即用）：
  1. **k-NN 图对称化**：$A_{sym}=\max(A,A^{\top})$
  2. **连通性修复**：断连组件用**欧氏最近点对**合并（$m-1$ 条边）
  3. **测地偏心率**：$ecc(u)=\max_v d_{G_\omega}(u,v)$，欧氏距离作边权
  4. **局部膨胀取局部极大**：$\mathcal{M}=\{u: ecc(u)-\delta(ecc(u))=0\}$
- **为什么鲁棒**：偏心率依赖**全局测地结构**而非 2 阶微分 → 对噪声远比对拉普拉斯局部极大稳健；**严格 SE(3) 不变**；**近似等距形变**（SMPL 姿态）下测地距离保持；局部非等距形变（衣物褶皱）影响有限
- **不需要网格拓扑** —— 直接作用于点云（Harris3D / MeshDoG / HKS 都需要三角网）
- **关键数据**：
  - KeypointNet mIoU **54.5%**（SOTA，比次优 **+5.5**）；增益最大：motorcycle **+18.0**、airplane **+11.6**
  - Inclusivity **86.3%**（学习类最高）；GEKey-PL coverage **96.6%**（连学习方法都超过）
  - 语义对齐 DAS$_{SC3K}$ **73.0%**（SOTA）
  - CAPE 变形人体：Inclusivity **99.5** / Coverage **96.7** / Tcon **93.3**（**无任何时序损失**）
  - ITOP 真实深度：**零微调迁移**，Inclusivity **99.5**（对比 SC3K 76.4）
  - DeformingThings4D 动物：97.1 / 95.0 / 85.3（9 类单模型，跨物种一致）
- **⭐ 最高工程价值**：把 **GEKey-PL 单独抽出来**（约 150 行，scipy + sklearn 依赖），作为**无需标注的显著点提取器**加入几何工具箱 → 用途：点云预处理、**网格分段种子点选取**、对应关系初始化
- **⭐ 复现第一个坑**：论文未说明测地距离用什么算法求解（Dijkstra? 热方法?）

→ 详见 [[2026-11-08-GEKey-Geodesic-Eccentricity-3D-Keypoints]]

### 🥈 EDGAR — 「扩散提供监督，3D 表示承载结果」的闭环范式
- **arXiv**: 2611.07909 | cs.GR/cs.CV/cs.LG/cs.MM, **2026-11-05** | **ACM Transactions on Graphics 接收** | KAIST Visual Media Lab
- **突破**：修复单目/少视图高斯头像的渲染伪影，再把修复结果**蒸馏回单一 3D 高斯表示** → **最终渲染无需逐帧跑扩散，推理期开销为零**
- **核心构造**：
  1. **EDGAR-SET** —— 混合三元组数据集（失败图 $I_f$ / 真值 $I_{gt}$ / **身份参考图 $I_r$**），真实（NeRSemble+RGBAvatar，99 身份）+ 合成（CAFCA+3DGS，1500 身份），**40 万张高分辨率图像**
  2. **Fusion block** —— Sapiens 身份特征注入 cross-attention（扩散特征作 queries）；**零初始化残差** $\mathrm{Conv}_{zero}$ → 训练初期 ≡ 原始 SD-Turbo
  3. **6 专家 MoE** + **POSTER V2 表达式损失** $L_{exp}$（用中间特征而非 logits）
  4. **共享 Avatar 更新**（式 7）：渲染 50 视角 → EDGAR 修复为**伪目标** → L1(0.6) + SSIM(0.4) 优化 500 步；**明确不 split/clone**（保持高斯数与渲染路径）
- **关键数据**：
  - RGBAvatar 8 视频：**PSNR 20.51 → 22.99（+2.48 dB）**；GaussianAvatars 10 视频：18.60 → 19.32
  - **跨身份 CSIM**（身份保真度铁证）：Base 0.5651 → **EDGAR 0.5419**（~4% 无损）vs **SDEdit 0.3380（腰斩）**
  - **跨视角几何一致性** $E_d$ 与覆盖率 $C$：CAP4D 与 GaussianAvatars **全部输入设置双双改善** → 证明修复**真的进了 3D**
  - **成本**：一次性修复 5.04 / 7.96 / 16.60 分钟 = base 优化的 **1% ~ 7.5%**；渲染 FPS 差异 **< 2%**
  - 消融优先级（作者原话）：**$I_r$ > 合成数据 > $L_{exp}$ > MoE**（去掉 $I_r$ 掉分最多）
  - 用户研究（15 人）：vs CAP4D 总体偏好 **96.67%**；vs CAP4D+SDEdit **98.0%**
- **⭐ 最高工程价值**：**跨视角几何一致性度量 $E_d=2|z-d|/(|z|+|d|)$ + 覆盖率 $C$**（unproject → 变换 → 比对深度）—— 这是评估「神经方法是否真的改进了 3D 而不只是 2D」的**通用协议**，几何处理领域缺的就是这个。**建议引入我们的评估流水线。**
- **诚实之处**：CAP4D 上 LPIPS/PSNR 并非最优；RGBAvatar 单输入下 $E_d$ 反变差；GaussianAvatars 的 tWE **上升**（空间保真 ≠ 时间稳定）

→ 详见 [[2026-11-08-EDGAR-Diffusion-Driven-Gaussian-Avatar-Refinement]]

---

## 🔍 扫描过但判定为「不相关」的条目

| arXiv ID | 标题 | 排除理由 |
|----------|------|---------|
| 2611.07730 | Seeing Beyond the Next Step: World-Model-Guided Human-Like Navigation | 具身智能导航（NeurIPS 2026），与几何处理无关 |
| 2611.07465 | Optimal-Transport Contrastive Learning for Centrality Determination | 核物理（hep-ph），几何关键词为误命中 |
| 2611.07822 | Continuous Space-Time Finite Element Simulations for Biomedical Flows | 流体力学（归 **菜心/流心** 领域） |
| 2611.06954 | Certified folding-free deformable image registration | 2D 医学图像配准，非 3D 几何处理 |
| 2611.06230 | Homology Features for X-Ray Hyperspectral Images Segmentation | X 光/高光谱 2D 分割 |
| 2611.06180 | Rohbau3D-Semantics（点云语义标注数据集） | 数据集论文，无算法贡献；且语义标注非几何处理本体 |
| 2611.05802 / 2611.05755 / 2611.04666 等 | 其余 Nov 5 条目 | 房间评估 / 扩散蒸馏 / 动态高斯等，非几何处理 |

---

## 🧩 本轮方法论沉淀

### 1. 「纯几何 > 深度学习」在本轮再次出现

GEKey 的 GEKey-PL（零参数纯几何）mIoU **46.7%** 击败 4/5 学习方法。对我们的启示：
> **在几何处理领域，优先挖掘几何量本身的判别力，再考虑用学习补充。** 与 HIBS 的「Beta 核形状参数作为置信度旋钮」呼应 —— 都是**把几何结构塞进模型的物理量里**，而不是把一切交给网络。

### 2. 两个可直接进入我们工具箱的资产

| 资产 | 来源 | 用途 |
|------|------|------|
| **偏心率局部极大点提取** | GEKey | 点云预处理、网格分段种子点、对应初始化 |
| **跨视角深度一致性 $E_d$ + 覆盖率 $C$** | EDGAR | 评估「3D 是否真的被改进」的通用协议 |

### 3. 一个反复出现的模式：生成先验 → 伪目标 → 3D 表示

- EDGAR：扩散修复 2D → 伪目标 → 共享高斯优化 → **推理期零开销**
- 与 [[2026-11-07-HIBS-Hierarchical-Incremental-Beta-Splatting]]、[[2026-11-06-T2-Splat-Adaptive-Topology-Mesh-Splatting]] 合起来看，这是 **2026 Q4 高斯泼溅研究的共同范式**：
  > **不要把生成模型挂在推理链路上，要把它做成训练期的监督来源。**
>
> **建议**：在我们的几何管线（如参数化/重网格化）中，考察同样的模式 —— 2D 生成先验（如扩散纹理/法线先验）产出伪目标 → 反哺 3D 表示 → 保持推理轻量。

### 4. 「诚实报告负面结果」是本批论文的共同优点

EDGAR 主动报告：CAP4D 上 LPIPS/PSNR 让位、RGBAvatar 单输入 $E_d$ 变差、GaussianAvatars tWE 上升、SDEdit PSNR 更高。
GEKey 主动报告：检测与对齐**本质互斥**、槽位对应跨 run 不保证一致、32× 下采样掉点。
> **这两篇的「局限性」章节信息密度高于很多论文的「贡献」章节** —— 值得作为我们分析模板的参考。

---

## 📌 待办 / 下次复查

| 项 | 状态 |
|----|------|
| **SIGGRAPH Asia 2026 技术论文名单** | 🔔 **11 月下旬必查** —— 论文名单尚未公布，首批 SIGGRAPH Asia 论文通常在此窗口上线；预计含几何处理方向 |
| ACM DL / TOG 目录 | 🔔 需为 opencli-rs 编写 `dl.acm.org` adapter（安装 Chrome 扩展后） |
| `siga.org/asia/*` URL | ✅ **已修正** → `asia.siggraph.org/2026/program/technical-papers/`（原 URL 已被重定向到无关站点） |
| arXiv 周末空窗 | ℹ️ 2026-11-08（周日）为 arXiv 无提交日，下次扫描（11-09 周一）应有 Nov 6–9 新提交 |

---

## 📚 本次创建的笔记

- [[2026-11-08-GEKey-Geodesic-Eccentricity-3D-Keypoints]] — 🥇 测地偏心率变换 / 3D 关键点自监督 / BMVC 2026 Oral / **纯几何，本轮最高价值**
- [[2026-11-08-EDGAR-Diffusion-Driven-Gaussian-Avatar-Refinement]] — 🥈 扩散驱动的 3DGS 头像精修 / TOG / **「先验做监督，3D 承载结果」范式**

---

*Generated by 黄喉 (wawaicai) at 2026-11-08*
