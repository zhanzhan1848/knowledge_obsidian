---
type: daily-summary
created: 2026-10-28
updated: 2026-10-28
tags: [daily-summary, geometry-processing, cs.GR, arxiv-scan, ACM-TOG, SIGGRAPH-Asia-2026, gaussian-splatting, surface-primitive, point-cloud-registration, camera-pose, volume-rendering, MPM, Monte-Carlo-PDE, subdivision-surface, line-primitives]
domain: geometry
agent: wawaicai
period: 2026-10-27 ~ 2026-10-28
---

# 每日几何处理论文摘要 · 2026-10-28

## 扫描范围

| 项 | 内容 |
|----|------|
| **时间窗** | 2026-10-27 14:15 ~ 2026-10-28 15:02 UTC（严格 24h）+ 同公告批次补齐（10-26 18:00 ~ 10-27 14:15） |
| **来源** | arXiv **cs.GR RSS**（当日公告批次全量 11 条）、arXiv **API（cat:cs.GR, sortBy=submittedDate, 80 条）**、**ACM TOG 官网**、**SIGGRAPH Asia 2026 官方页**、**Crossref REST API**、Web Search |
| **关键词** | mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification, curvature, Gaussian splatting, surface primitive, camera pose, volume rendering |
| **命中** | **11 篇新收录**（几何核心 8 + 期刊 2 + 渲染 1）+ 3 篇观察项 |
| **去重** | 已剔除 10-27 及更早批次（2610.35347 / 2610.35224 / 2610.35076 / 2610.34766 / 2610.34903 / 2610.34271 / 2610.33943 / 2610.34850 / 2610.33484 / 2610.33575 / 2610.32978 等） |

> ⚠️ **检索限制说明**：
> 1. **ACM Digital Library 直连 403**（Cloudflare 挑战）→ 期刊侧改用 **Crossref REST API** + DOI 直取摘要，并结合 Web Search 定位 TOG 新刊。
> 2. **SIGGRAPH Asia 2026**（2026-12-01~04，吉隆坡）官方**技术论文列表已公开**，但**条件录用清单 PDF 仍只有编号、无标题**；本次从 TOG 官网定位到 2 篇**已正式见刊**的 SIGGRAPH Asia 2026 论文。
> 3. 本轮**严格 24h 窗口内仅 2 篇**（CTBakeGS 15:21、Honeycomb-Surfels 17:59），故**扩展到同一公告批次**（10-26 18:00 ~ 10-28 15:02）以保证覆盖面。

---

## 今日论文清单

| # | 标题 | 来源 | 领域标签 | 推荐度 |
|---|------|------|----------|--------|
| 1 | [Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction](2026-10-28-2610-37668-Honeycomb-Surfels-Hexels-Hexagonal-Primitive.md) | arXiv 2610.37668 (cs.CV, **cs.GR**, cs.AI, cs.LG) | 六边形平面基元 / 一阶颜色场 / 表面重建 | ⭐⭐⭐ **强烈推荐（基元设计范式）** |
| 2 | [LingGS: Decoupling Feed-Forward Geometry Prediction from Camera Tracking](2026-10-28-2610-36853-LingGS-Geometry-Prediction-Camera-Tracking-Decoupling.md) | arXiv 2610.36853 (cs.CV, **cs.GR**) | SE(3) 求解 / 深度残差 / Huber / 内点迭代 | ⭐⭐⭐ **强烈推荐收录（方法论价值最高）** |
| 3 | [CTBakeGS: Training-Free Baking of CT Volume Renderings into 3DGS](2026-10-28-2610-37406-CTBakeGS-Training-Free-CT-Volume-Rendering-Baking.md) | arXiv 2610.37406 (cs.CV, **cs.GR**) | 光学厚度守恒 / 自适应八叉树 / 免训练转换 | ⭐⭐⭐ **强烈推荐（光学厚度映射公式）** |
| 4 | [C2 Point-Normal Subdivision Surfaces](2026-10-28-TOG-C2-Point-Normal-Subdivision-Surfaces.md) | **ACM TOG** (10.1145/3847304), **SIGGRAPH** | 细分曲面 / C² 连续 / 点法向 / 特征点 | ⭐⭐⭐ **强烈推荐（细分曲面核心）** |
| 5 | [Inverse Rendering with Line Primitives](2026-10-28-TOG-Inverse-Rendering-Line-Primitives-SIGGRAPH-Asia-2026.md) | **ACM TOG** (10.1145/3842527), **SIGGRAPH Asia 2026** | 可微渲染 / 线基元 / 随机不透明度掩码 | ⭐⭐ **推荐收录（几何基元 + 可微渲染）** |
| 6 | [SAGE: Semantic-Augmented Geometric Experts for Point Cloud Registration](2026-10-28-2610-36658-SAGE-Semantic-Guided-MoE-Point-Cloud-Registration.md) | arXiv 2610.36658 (cs.CV, **WACV 2027 R1**) | 点云配准 / MoE / 语义引导 / 低重叠 | ⭐⭐ **推荐收录** |
| 7 | [DomeGS: Perceptually Consistent Background Completion for Unbounded 3DGS in VR](2026-10-28-2610-37172-DomeGS-Background-Completion-VR-Gaussian-Splatting.md) | arXiv 2610.37172 (**cs.GR**) | 有限半径远场球面 / 全景外绘 / VR | ⭐⭐ **推荐（表示设计参考 + 用户研究范式）** |
| 8 | [GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing](2026-10-28-2610-37036-GraftRay-Mesh-Insertion-GS-Path-Tracing.md) | arXiv 2610.37036 (cs.CV, **cs.GR**) | 网格插入 / 路径追踪 / 近场面光源 | ⭐⭐ **推荐（网格-高斯统一光照）** |
| 9 | [Texture Consolidation of Generated Multi-View Renderings](2026-10-28-2610-36098-Texture-Consolidation-Multi-View-Renderings.md) | arXiv 2610.36098 (**cs.GR**) | 网格光流 / 梯度域拼接 / 纹理图集 | ⭐⭐ **推荐（网格上的经典光流+拼接）** |
| 10 | [Total Deformation-based MPM for Perfectly Elastic Solid Simulation](2026-10-28-2610-36945-Total-Deformation-MPM-Elastic-Solids.md) | arXiv 2610.36945 (**cs.GR**) | MPM / 无数值断裂 / 参考构型变形梯度 | ⭐ **推荐（变形梯度计算）** |
| 11 | [From Walks to Skeletons: A Reusable Transport Architecture for Interactive Monte Carlo PDE Solvers](2026-10-28-2610-36931-Transport-Skeletons-Reusable-MontCarlo-PDE.md) | arXiv 2610.36931 (**cs.GR**, math.NA) | Walk-on-Spheres / 传输骨架 / 渐进加密 | ⭐ **推荐（随机传输的几何复用）** |

---

## 今日主题线索 🔍

### 线索 1：**「换一个基元 / 一个表示，就能换一套计算特性」—— 今天最一致的技术模式**

今天至少 4 篇论文在做**同一件事**：不改变优化目标，只**换掉表示**，然后性能与质量自然改善：

| 论文 | 原表示 | 新表示 | 换来的收益 |
|------|--------|--------|-----------|
| **#1 Honeycomb-Surfels** | 高斯 / 三角形 | **平面六边形片 + 一阶颜色场** | 同显存下 PSNR +4.53~7.38 dB；FPS 2.31×；DTU 误差 -28.9% |
| **#3 CTBakeGS** | 逐场景优化的高斯 | **解析烘焙的高斯（光学厚度守恒）** | 免训练，4–30 s 完成转换 |
| **#4 C2 Point-Normal Subdivision** | 传统 Catmull-Clark | **点-法向基 + 精确 C² 评价** | 消除特征点的切向不连续 |
| **#2 LingGS** | 单一模型端到端出位姿 | **深度（学习）+ 位姿（几何）解耦** | 轨迹误差 -97% |

> 💡 **对我们的启发**：几何处理里「换表示」的收益常常大于「换算法」。看到一篇论文时，除了问「它用了什么新方法」，更该问「**它换掉了什么表示**」。

### 线索 2：**「解析 / 闭式」正在成为对抗「大规模优化」的有力替代**

- **#3 CTBakeGS**：把「逐场景训练数分钟到数小时」换成「**闭式转换 4–30 秒**」，核心是**光学厚度守恒的解析分配律**。
- **#4 C2 Point-Normal Subdivision**：把「数值逼近 C² 连续性」换成「**解析构造 + 精确求值**」。
- **#11 Transport Skeletons**：把「每次重新采样随机轨迹」换成「**持久化的传输骨架**」，支持渐进加密与结构保持压缩。

> 💡 三篇的共同点：**当问题的物理/几何本质已知时，求解一个方程比优化一个目标函数更可靠、更快、更可解释**。

### 线索 3：**「生成模型嵌入几何管线」成为一个独立子题**

- **#9 Texture Consolidation**（本期唯一**纯网格处理**论文）：生成模型产出的多视图渲染**视角不一致** → 在**纹理图集三角形网格上解光流场**做对齐 → 再用**梯度域拼接**融合成单张纹理图。**代码已开源**。
- **#7 DomeGS**：生成模型做 360° 全景外绘 → 结果**不直接当贴图**，而是转成**监督信号**去优化**有限半径球面上的高斯**。
- **#5 Inverse Rendering with Line Primitives**：几何基元 + 可微渲染 + 随机不透明度掩码。

> 💡 三篇的共同范式：**生成模型负责「补内容」，几何/优化负责「让内容几何一致」**。这是 2026 年几何处理与生成模型结合的典型形态。

### 线索 4：**「深度/尺度一致性」成为学习式几何的共同软肋**

- **#2 LingGS** 明确诊断：逐帧深度预测**不保证跨帧尺度一致**；直接用流式模型的位姿会导致**跨帧错位**。解法是**把位姿交给显式几何求解器**。
- 对照 **#6 SAGE**（点云配准）：同样在处理**低重叠**下的对应关系建立。
- **#2 LingGS 附录 A.1** 顺带给出一个很有价值的辨析：ORB-SLAM3 的**虚立体观测**建模在深度来自前馈模型时**不再自然**，应改为**直接深度残差 + 显式像素坐标加权 (εz)²**。

---

## 🔬 重点论文速览

### #1 Honeycomb-Surfels（本期首选 · 基元设计范式）

**核心**：用**平面六边形片（hexel）**替代高斯。每个基元携带中心位置、正交单位切向量、两个尺度、以及**一阶线性颜色梯度**。

**关键数字**：
| 项 | 值 |
|----|----|
| 相对 memory-matched 2DGS PSNR | **+4.53 ~ 7.38 dB** |
| 单基元 PSNR（消融） | 最高 **+4.74 dB** |
| FPS | **2.31×** |
| DTU 表面重建误差 | **-28.9%**（15 scans） |
| Tanks&Temples F1 | **34.38%**（vs 2DGS 31.72%） |
| 训练 VRAM | 更低 |

**几何要点**：六边形支撑域是**面积与边界双高效**的域 —— 六边形是**最致密的可镶嵌多边形**（每单位面积周长最小），这让同样数量的基元覆盖更多面积且边界畸变更小。配合「局部平面 + 一阶颜色场」，用**更少、更大的基元**表达局部平面且外观平滑变化的区域。

**推荐**：✅ 强烈推荐。基元设计（形状 + 局部外观参数化）的范式可直接迁移到我们的表面重建/网格化工作。

### #2 LingGS（方法论价值最高）

**核心公式**（SE(3) 下的三维残差向量）：

$$\mathbf{T}_t = \arg\min_{\mathbf{T}\in SE(3)} \sum_{j} \rho\!\left(\mathbf{r}_j^\top \mathbf{\Sigma}_j^{-1} \mathbf{r}_j\right), \quad \mathbf{r}_j = \begin{bmatrix} u_j - \pi_u(\mathbf{T}\mathbf{x}_j^{\mathrm{w}}) \\ v_j - \pi_v(\mathbf{T}\mathbf{x}_j^{\mathrm{w}}) \\ z_j - [\mathbf{T}\mathbf{x}_j^{\mathrm{w}}]_z \end{bmatrix}$$

$$\mathbf{\Sigma}_j = \mathrm{diag}(\sigma_j^2,\ \sigma_j^2,\ (\varepsilon z_j)^2),\quad \varepsilon = 0.05$$

**关键数字**：7 FPS @ RTX 4090；PSNR +3.1 dB；轨迹误差 -97%；吞吐 2–3×。

**几何要点**：深度维度的权重 **随深度线性缩放**（相对误差噪声模型）—— 远处深度噪声大 → 权重自动降低。配合 **Huber 核 + 4 轮内点重分类**，对「学习深度有噪声 + 特征匹配有误」双重误差鲁棒。

**推荐**：✅ 强烈推荐。几何求解器可独立抽取复用。

### #3 CTBakeGS（光学厚度守恒）

**核心公式**（不透明度映射，最干净的一步）：

$$\tau_{\text{cell}} = -\ln(1-\alpha_{\text{cell}}),\qquad \tau_{\text{splat}} = \tau_{\text{cell}}\cdot\frac{h^2}{2\pi s^2},\qquad \alpha_{\text{splat}} = 1-\exp(-0.526\,\tau_{\text{cell}})$$

**s = 0.55h** 是数值标定的最窄宽度，使间距 h 的高斯点阵沿格轴累加的光学深度在 **1% 内恒定**。

**关键数字**：200 万 splat，骨 PSNR **32.6 ± 0.9 dB**；转换 **4–30 s**（笔记本）；**68 FPS @ 800×800**。

**几何要点**：**「多个基元累积 vs 单体不透明度」的通用分配律** —— 任何「规则采样 → 连续表示」的转换都适用。

### #4 C2 Point-Normal Subdivision Surfaces（细分曲面核心 · TOG/SIGGRAPH）

细分曲面的**切向连续性**问题 —— 特征点（extraordinary point）处 Catmull-Clark 的切向不连续导致着色可见的接缝。本文改用**点-法向基**并给出**精确的 C² 连续性求值**。这是本期**最贴近经典几何处理主线**的论文。

### #9 Texture Consolidation（唯一纯网格处理论文 · 已开源）

三步法：**(1)** 把渲染图**反投影到纹理图集三角形网格**上，得到归一化颜色与置信度 → **(2)** 在**网格上解光流场**做颜色对齐（带置信度加权）→ **(3)** 用**梯度域拼接**（gradient-domain stitching）融合为单张纹理图。
代码：https://github.com/hliuw/TextureConsolidation

**几何要点**：**在三角形网格上解光流**（而非在图像域）+ **梯度域融合**（而非加权平均）—— 两个都是经典图像处理的成熟技术，被移植到网格纹理管线上。

---

## 📌 观察项（不建独立笔记）

| 来源 | 标题 | 理由 |
|------|------|------|
| **arXiv 2610.35902** | StereoSplat: Metric-Scale NVS via Stereo-Grounded Gaussian Splatting | 双目度量尺度新视角合成，纯渲染 |
| **arXiv 2610.36111** | VISTA: Differentiable Viewpoint Planning | 可微视点规划，纯渲染/交互 |
| **arXiv 2610.37172** | DomeGS | 已收录（见 #7） |
| **SIGGRAPH Asia 2026** | 条件录用清单 PDF（337 条 `papers_XXXX` 编号） | **仍只有编号、无标题作者** —— 官方程序页尚未公布标题，持续观察 |
| **ACM TOG** | 官网 dl.acm.org 直连 **403**（Cloudflare） | 改走 Crossref + DOI 取元数据 |

---

## 🧭 对 @墨鱼丸 的传递（几何算法层面）

**优先级 1 —— 可直接实现（中等难度）**
1. **带深度残差的 SE(3) 求解器**（#2 LingGS）：三维残差 + (εz)² 加权 + Huber + 内点迭代。可作为我们配准/位姿模块的标准件。
2. **光学厚度守恒的不透明度映射**（#3 CTBakeGS）：公式 (1)–(4) + s=0.55h 标定值。若我们做隐式场→显式基元的烘焙，直接套用。
3. **自适应八叉树按梯度细分**（#3）：α_max 判据 + 1.5 cell 外延 + 幂律调目标数。与我们已有的自适应加密思路可对照。

**优先级 2 —— 值得跟踪（高难度 / 有启发）**
4. **六边形平面基元**（#1）：面积-边界双高效的镶嵌域 + 一阶颜色场。若我们做表面基元化/轻量化，参照价值高。
5. **网格上的光流对齐 + 梯度域纹理融合**（#9）：代码已开源，可直接读实现。

**优先级 3 —— 概念借鉴**
6. **「深度用学习、位姿用几何」的解耦**（#2）—— 一个普适的架构原则。
7. **有限半径远场球面**（#7）—— 「用真实几何承载视觉上的伪无限远」的设计取舍。

---

## 今日统计

| 项 | 值 |
|----|-----|
| 新收录笔记 | **11 篇**（arXiv 9 + ACM TOG 2） |
| 观察项 | 3 篇 + 1 个会议跟踪项 |
| 补齐缺口 | 3 篇（DomeGS / CTBakeGS / LingGS —— 前次运行遗漏） |
| 覆盖范围 | arXiv cs.GR / cs.CV / ACM TOG / SIGGRAPH Asia 2026 / Crossref |
| 严格 24h 窗口内 | 2 篇（CTBakeGS 15:21、Honeycomb-Surfels 17:59） |

---

## 相关笔记

- [[2026-10-27-2610-35347-CVTSplat-Adaptive-CVT-Multi-view-Reconstruction]] —— 昨天的 CVTSplat 同样属于「利用表示的规整性换效率」，与今日 #1 同源
- [[2026-10-22-2610-30033-RLMuscle-Geometric-Multigrid-XPBD]] —— 几何多重网格与四面体重网格
- [[2026-10-27-2610-33943-Extrinsic-Curvature-Estimation-Projected-Rays]] —— 曲率估计，与 #2 的 Laplacian 引导插入可对照
- [[2026-10-27-2610-34271-TLP-Single-Parameter-Point-Cloud-Registration]] —— 点云配准，与 #2 的 PnP 式求解互补
- [[2026-10-09-FeatureZ-Feature-Preserving-Compression-Meshes]] —— 特征保持压缩，与 #4 的 C² 连续性目标一致

---
相关主题：[[几何处理]] [[高斯泼溅]] [[表面基元]] [[点云配准]] [[相机位姿估计]] [[细分曲面]] [[体渲染]] [[可微渲染]] [[参数化]] [[自适应细分]]
