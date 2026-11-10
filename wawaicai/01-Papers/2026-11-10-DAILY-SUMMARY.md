---
tags: [日报, 几何处理, 论文收集]
date: 2026-11-10
time: 14:20 UTC
status: completed
agent: wawaicai
---

# 🥬 娃娃菜每日几何处理论文报告 — 2026-11-10

## 📊 执行摘要

- **执行时间**：2026-11-10 14:01–14:22 UTC（约 21 分钟）
- **时间窗口**：2026-11-09 14:00 UTC → 2026-11-10 14:00 UTC（严格 24 小时）
- **搜索范围**：arXiv cs.GR 主分类 + cs.CV 交叉列表 + cs.HC 交叉列表 + ACM TOG / SIGGRAPH Asia 2026 / Pacific Graphics 2026
- **候选论文**：cs.GR 24 小时窗口内 21 篇（11-09 批次 7 篇 + 11-10 批次 14 篇），另扫 cs.CV RSS 交叉筛选
- **新增笔记**：**6 篇**（去重后）
- **已去重跳过**：NanoVDB 动态稀疏网格、几何纹理分割、P-MGS —— 均为 11-09 已收录
- **Git 同步**：✅ 成功

## 🔍 搜索过程与工具链

| 步骤 | 工具 | 结果 |
|------|------|------|
| 1 | `exec` + `curl` → arXiv API | ❌ **Rate exceeded**（连续两次，含 User-Agent 重试） |
| 2 | `exec` + `curl` → `rss.arxiv.org/rss/cs.GR` | ✅ 成功，24 条（含 announce_type 字段） |
| 3 | `web_fetch` → `arxiv.org/list/cs.GR/recent` | ✅ 成功，拿到 11-04 ~ 11-10 完整分页列表 |
| 4 | `web_fetch` → `arxiv.org/abs/<id>` 元数据抓取（`citation_*` meta 标签） | ✅ 22 篇批量 |
| 5 | `web_fetch` → `arxiv.org/html/<id>v1` 全文 | ✅ 深度阅读 4 篇 |
| 6 | `web_fetch` → `export.arxiv.org/abs/<id>` | ⚠️ 触发限流但仍返回 HTML |
| 7 | `web_fetch` → GitHub DailyArxiv digest | ✅ 用于反查 ACM TOG / SIGGRAPH Asia 2026 条目 |
| 8 | `web_search`（Brave） | ⚠️ 噪声高，主要用于交叉验证 |

> **踩坑记录**：`export.arxiv.org/api/query` 在本机被限流（"Rate exceeded"），**RSS 端点 `rss.arxiv.org` 稳定可用**，是 arXiv API 的可靠替代。建议后续任务优先走 RSS。`arxiv.org/abs/<id>` 的 HTML 里 `<meta name="citation_*">` 可直接批量结构化抓取，无需解析 DOM。

## 📚 新收录论文（6 篇）

### 1. ⭐⭐⭐⭐⭐ Architectural Textured Proxy Generation ⭐⭐⭐⭐⭐
- **arXiv**：[2611.12077](https://arxiv.org/abs/2611.12077)
- **发表**：**SIGGRAPH Asia 2026** · DOI 10.1145/3829340.3842246 · CCS Shape modeling
- **单位**：深圳大学（Shenzhen University）· Daniel Cohen-Or / Hui Huang 组
- **核心**：**Image-Guided Proxy 范式** —— 把「几何抽象 → 贴图」的串行解耦改为联合约束。代理几何在生成阶段就被航拍图像的结构线索约束 ⟹ 结构特征（立面/棱边/交点）天然跨视图对齐，贴图退化为「聚合一致的观测」而非「修复不一致」
- **方法四件套**：
  1. **法向一致性相机精化**（MoGe 单目法向 + Nvdiffrast 可微渲染，$L_{Camera}=L_{Normal}+L_{Reg}$）
  2. **PlaneSet 基准 + ProxySAM**（东京数据集 3.62 km² 渲染 ~1000 视角；Stable Diffusion 3.5 双 ControlNet 造真值；LoRA 微调 SAM3）
  3. **全局 + 局部双引导法向场**（平面面用球面 K-means 主方向 $K=3$；非平面面用 one-ring patch + 联合双边滤波）
  4. **法向引导顶点优化 + 周期重网格化**（$L_{Proxy}=L_{Planar}+\lambda_l L_{Lap}+\lambda_r L_{PReg}$，$\lambda_l=1/\lambda_r=100$，每 10 步自适应各向同性重网格化，目标边长 = 平均边长 ×110%）
- **结果**（Bank 场景）：Error **0.027 最低**、Comp **99.88%**、EF1 **0.713**、SSIM 三视角全优；同顶点数下远超 VSA / PolyFit / KSR / BLOD / QEM
- **依赖**：Nvdiffrast + CGAL + SAM3(LoRA) + MoGe + ContextCapture
- **推荐度**：✅ **强烈推荐** —— 本窗口唯一 SIGGRAPH Asia 正式论文，几何处理主线最完整

### 2. ⭐⭐⭐⭐⭐ Spaghetti Splatting ⭐⭐⭐⭐⭐
- **arXiv**：[2611.12716](https://arxiv.org/abs/2611.12716) · cs.CV / cs.GR · CC Zero
- **单位**：Simon Fraser University / Wayve Labs / UBC / University of Toronto（David Lindell、Andrea Tagliasacchi 组）
- **核心**：把 3DGS / Poisson 重建的通用配方「**Dirac 质量 ⊛ 低频核**」沿**核**与**图元**两轴推广到**曲线状图元**
- **关键推导**：
  - 线段测度 $m(\bm{x})=\int_0^1\delta(\bm{x}-\bm{x}(u))du$；密度 $\sigma=\rho\int_0^1\mathcal{N}_{\bm{\Sigma}}(\bm{x}-\bm{x}(u))du$（Dirac sifting）
  - Tonelli 定理交换积分序 → 射线边缘化 $f(u)=f(\bar{u})e^{-\kappa^2(u-\bar{u})^2}$
  - **闭式光学深度**（只需 `erf`，**无需 Owen's T**）：$\tau=\frac{\rho f(\bar{u})\sqrt{\pi}}{2\kappa}\big[\operatorname{erf}(\kappa\bar{u})+\operatorname{erf}(\kappa(1-\bar{u}))\big]$
- **工程要点**：逐段独立渲染 ⟹ 关节处**不重复计数**；EWA 线性化 + Mip-Splatting 3D/2D 滤波 ⟹ **每像素 1 次采样**（并发工作 Line Primitives 需 4 次）；MCMC 密集化中**长段一分为二、短段克隆**，子段继承父段密度 ⟹ 图像渲染**完全不变**
- **结果**：
  - Mip-NeRF 360：Beta 核 **28.78 / 0.838 / 0.193**，超 DBS+SV8（28.71）与 3DGS-MCMC+SV8（28.39）
  - Fuzzy：Gaussian 核 **35.03 PSNR**，超 Line Primitives（**仅 33.64**，因其等宽细线无法建模真实场景）
  - 头发（GeomHair 8 型 + Yuksel 卷发）：**32.25 PSNR / F1@2mm 61.2**，vs Gaussian Haircut 29.56 / 46.9 —— **+2.7 dB / +14.3 F1**
- **严格超集**：$a=b$（零长曲线）精确退化为 3DGS
- **诚实声明**：作者明确说「自动恢复拓扑的更广泛主张仍需进一步评估」
- **开源**：承诺完全开源，**截至 11-10 尚无仓库地址**
- **推荐度**：✅ **强烈推荐** —— 对做 CAD / 曲线表示 × 神经渲染交叉的研究者必读

### 3. ⭐⭐⭐⭐ Martine: Multi-View 3D Surface Reconstruction Benchmark ⭐⭐⭐⭐
- **arXiv**：[2611.11602](https://arxiv.org/abs/2611.11602) · cs.CV
- **核心**：**受控采集**的多视角表面重建基准 —— 28 物体 / 9568×6376 / 84 视角球冠 / 单光+多光
- **价值**：物体无关相机标定 + 高精度真值扫描 + **标定与图像-几何对齐精度量化** + 3D 属性掩码（材质/可见性/曲率/精细结构）
- **结果**：可分辨**亚毫米**差异，最优 Chamfer 距离 **0.058 mm**；跨 5 个方法族（摄影测量 / MVS / 神经隐式 / GS 重建 / 多视图光度立体）对比
- **推荐度**：⚠️ **建议关注**（评测者用；纯几何开发者价值有限）

### 4. ⭐⭐⭐⭐ SoftPAT3D: Physics-Augmented Text-to-3D with Deformables ⭐⭐⭐⭐
- **arXiv**：[2611.11087](https://arxiv.org/abs/2611.11087) · cs.CV
- **单位**：Stanford University（Jeannette Bohg / Gordon Wetzstein / Leonidas Guibas 组）
- **核心**：文本生成的**可变形体**（布料/毛绒玩具/绳索）成为**物理有效、可直接仿真**的物体
- **关键洞察**：**静止形状来自物体的制造方式**，而非生成的「物理不一致的变形后构型」；再补材料库 + 可接受初始状态
- **结果**：65 个 prompt 上**零非期望互穿**（其他所有系统都有）；多体场景单次仿真完成；网格搜索失败时用**可微仿真伴随法**修正
- **几何处理相关性**：**生成网格的修复（去自交、水密化、厚度化）是物理仿真的前置条件** ⟹ 明确的网格修复用武之地
- **推荐度**：✅ **推荐**（跨方向价值高）

### 5. ⭐⭐⭐ Part-Level Editability in Image Vectorization ⭐⭐⭐
- **arXiv**：[2611.10088](https://arxiv.org/abs/2611.10088) · cs.CV（11-09 进 cs.GR 交叉）
- **核心**：**Pass@k** —— 检验指定编辑能否在 **k 次点击**内可选中的对象上完成（把**零件选择成本**纳入指标）
- **结果**：12 方法 / 211 参考 / 635 任务；**64–88% 的 oracle-passed 任务在零件由多碎片组成时失败**
- **迁移价值**：**「选中一个语义零件需要点几次」**可直接迁移到网格分割 / UV 岛划分 / 材质槽划分的评估 —— 比 IoU 更贴近编辑体验
- **推荐度**：⚠️ **建议关注**（评估方法学本身是贡献）

### 6. ⭐⭐⭐ Segmenting Geometric Textures of 3D Meshes（补记）⭐⭐⭐
- **arXiv**：[2611.08897](https://arxiv.org/abs/2611.08897) · **Pacific Graphics 2026 Short Paper**
- **作者**：Weidan Xiong, Kaijie Qu, Shihao Feng, Shunqi Fan (NetEase), Rongyu Xiong (NTU), Hui Huang —— **与 #1 同组**
- **核心**：**中粒度几何纹理**分割（介于高层语义与低层几何特征之间）。2D→3D 管线：LoRA 微调 SAM3 → DINO 特征聚类 → 加权投票融合提升到 3D
- **状态**：**11-09 已收录**（wawaicai 与 shengcai 各有一份），本次仅做 venue 补充确认
- **局限**：弱浮雕、空心结构、重遮挡失败
- **推荐度**：✅ 推荐（与 #1 同组连续工作，值得跟踪）

## 🗂️ 本窗口其它相关条目（未单独建笔记）

| 论文 | arXiv | 理由 |
|------|-------|------|
| Differentiable Physics Simulation 状态报告 | 2611.12162 | 综述性质，核心是「referent × realization」双轴分类法 + 接触的非光滑性分类学 —— **软 PAT3D 的理论背景，值得单独读** |
| Real-Time Self-Penetration Repair for Skinned Characters | 2611.09693 | 顶点级位姿层 QP（纯 C 单核）+ 有状态接触变形器；接触预算 1.11ms + 1.18ms |
| Dynamic GPU Sparse Grids (NanoVDB) | 2611.08665 | 已于 11-09 收录（TOG 45(6)） |
| From Geometry to Function: HFX3D LiDAR 基准 | 2611.08645 | 4.92 亿点 / 26 建筑 / 三级标注（语义+实例+功能）—— 城市立面点云基准 |
| LocateAnyMesh | 2611.11692 | 网格作为 VLM prompt 的一部分 |
| Perception Over Geometry (P-MGS) | 2611.07979 | 已于 11-06 收录 |
| Quadratic Bezier Splatting | 2611.10713 | 笔画渲染，**曲线图元 + 可微 alpha 合成**，与 Spaghetti Splatting 同一趋势 |
| PLS-GS | 2611.10699 | 概率 LiDAR 骨架引导的紧凑表面对齐 GS |
| Explicit LOD-Conditioned AF for NTC | 2611.12650 | 渲染向，与几何弱相关 |
| Mitigating SM-Level Load Imbalance in 3DGS | 2611.12319 | 渲染性能 |
| Real-Time Volumetric Light Transport Inference | 2611.12103 | 渲染向，与几何弱相关 |
| Feel My Focus | 2611.11640 | 注视触发的一次性 3D 重建 |
| Same Pixels, Different Documents | 2611.10088 | → 已建笔记（#5） |

## 🧭 本期主题线索

| 线索 | 涉及笔记 | 说明 |
|------|---------|------|
| **「几何阶段就该看图像」** | #1 | 串行解耦 ⟹ 误差不可恢复；把图像证据前置到几何抽象阶段，是可推广到法线烘焙/语义网格化/AR 资产压缩的通用思路 |
| **卷积配方沿两轴推广** | #2 | 3DGS 的一切（点→线→三角形→曲线；高斯→Beta→重尾）统一在「Dirac ⊛ 核」下；**曲线图元是通往 CAD/曲面表示的关键一步** |
| **「k 次点击」式评估** | #5 | 从 IoU/保真度转向**操作成本**；可直接迁移到网格分割、UV 岛、材质槽的评估 |
| **几何有效性是仿真的前置** | #4 | 去自交 + 水密化 + 厚度化 ⟹ 仿真收敛；生成式管线必须内建修复环节 |
| **受控采集 vs 事后筛选** | #3 | 基准设计的根本分野：限制视角/分辨率/光照会**系统性偏向**特定方法 |
| **同组连续工作** | #1 #6 | 深圳大学 Xiong/Huang 组：ProxySAM → 图像引导代理，同一「中粒度结构识别」主线 |

## 📈 观察与建议

1. **本日 cs.GR 产出明显偏低**（24h 内仅 21 篇，其中 10 篇是 cs.CV/cs.HC 交叉），几何处理主线论文集中在 SIGGRAPH Asia 2026。arXiv cs.GR 已不是几何处理的主要出口 —— **ACM TOG / SIGGRAPH Asia 会议流更值得盯**。
2. **arXiv API 限流**已成为常态，建议后续任务**优先用 `rss.arxiv.org/rss/<cat>`**。
3. **Spaghetti Splatting 承诺开源但仓库未上线**，建议下轮复查 —— 这类「完整释放代码」的承诺通常在会议版或数周内兑现。
4. **深圳大学 Xiong/Huang 组**在本窗口产出两篇（#1 SIGGRAPH Asia 完整论文 + #6 Pacific Graphics short），且主题连贯（几何纹理 / 平面结构识别 → 图像引导代理），建议在 MOC 中建立**课题组追踪**条目。
5. **2611.12162（可微物理仿真状态报告）**的「referent × realization」双轴分类法，是理解 #4（SoftPAT3D）的理论前提，建议本周内单独精读并建笔记。

## 📌 已创建笔记

```
wawaicai/01-Papers/2026-11-10-Spaghetti-Splatting-Curvilinear-Dirac-Masses.md
wawaicai/01-Papers/2026-11-10-SIGGRAPH-Asia-2026-Architectural-Textured-Proxy-Generation.md
wawaicai/01-Papers/2026-11-10-Martine-MultiView-Surface-Reconstruction-Benchmark.md
wawaicai/01-Papers/2026-11-10-SoftPAT3D-Physics-Augmented-Text-to-3D-Deformables.md
wawaicai/01-Papers/2026-11-10-Part-Level-Editability-Image-Vectorization.md
wawaicai/01-Papers/2026-11-10-DAILY-SUMMARY.md
```
