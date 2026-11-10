---
type: report
created: 2026-11-10
updated: 2026-11-10
tags: [report, daily-search, rendering, arXiv-cs.GR, SIGGRAPH-Asia-2026, WACV-2027, 体积渲染, 路径追踪, 全局光照, PBR, GPU优化, 2026-11]
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026 年 11 月 10 日

## 搜索概况

- **搜索时间**: 2026-11-10 14:36 UTC（**周二**）
- **主窗口**: 2026-11-09 ~ 11-10（严格 24h）
- **数据源**: arXiv API（`cat:cs.GR` 按 submittedDate 降序 100 条）、**arXiv `list/cs.GR/recent` 按日分组核对**、arXiv RSS（`rss.arxiv.org/rss/cs.GR`）、arXiv HTML 全文（**7 篇全部抓到完整方法/公式/表格**）、**Ke-Sen Huang 的 SIGGRAPH Asia 2026 论文页 + Changelog 页**、Web Search（Brave）
- **本轮收录**: **7 篇**（全部新建结构化笔记，含完整公式与数据表）
- **来源可用性**：
  - ✅ arXiv API（**必须用 HTTPS**；`http://` 返回空）
  - ✅ **arXiv `list/cs.GR/recent` 按日分组** —— 确认「今天是否有新批次」最可靠的途径（**API 的 sortBy=submittedDate 会滞后，本轮 API 最新只到 11-09，而列表页已有 11-10 批次**）
  - ✅ arXiv RSS（`pubDate: Tue, 10 Nov 2026 00:00:00 -0500`）
  - ✅ arXiv HTML 全文（7 篇全部抓到完整方法 + 公式 + 表格）
  - ✅ Ke-Sen 的 SIGGRAPH Asia 2026 页 + **Changelog 页**
  - ⚠️ **ACM Digital Library 仍被 Cloudflare 拦截**（web_fetch 403 "Just a moment…"）→ **已用 arXiv 上的会议版本 + 官方标注完全替代覆盖**，内容无缺失
  - ⚠️ SIGGRAPH Asia 2026 完整论文集尚未上载 → Ke-Sen 页仍是 **5 篇「Conditionally Accepted」**（**Changelog 最新条目仍为 September 17, 2026，本轮无更新**）

---

## ✅ 本轮关键变化：arXiv API 与列表页出现 24 小时分歧

**这是本轮最重要的方法论教训**：arXiv **API**（`sortBy=submittedDate`）返回的最新条目是 `2026-11-09T17:04:26Z`（2611.12716），而 **列表页** `arxiv.org/list/cs.GR/recent` 已经出现 **Tue, 10 Nov 2026** 的新批次。

| 来源 | 最新可见日期 | 状态 |
|---|---|---|
| arXiv API (export.arxiv.org) | 2026-11-09 | ⚠️ **滞后约 21 小时** |
| arXiv `list/cs.GR/recent` | **2026-11-10** | ✅ 正确 |
| arXiv RSS (`rss.arxiv.org/rss/cs.GR`) | **Tue, 10 Nov 2026** | ✅ 正确 |

> **结论**：**只依赖 API 会漏掉当天的批次**。必须以 `list/cs.GR/recent` 的日期分组 + RSS 双重核对。列表页的日期分组与条目数：
>
> | 日期 | 条目数 | 本轮状态 |
> |---|---|---|
> | **Tue, 10 Nov 2026** | **14** | 🆕 **本轮新增批次** |
> | Mon, 9 Nov 2026 | 7 | 已由 11-09 报告覆盖 |
> | Fri, 6 Nov 2026 | 11 | 已由 11-06 报告覆盖 |
> | Thu, 5 Nov 2026 | 7 | 已覆盖 |
> | Wed, 4 Nov 2026 | 2 | 已覆盖 |

**去重核对**：14 篇逐 ID 与知识库比对，**全部为新增**（无一篇已在库）。

---

## 一、本轮核心发现（按价值排序）

### 🥇 1. HaloRT —— 体积渲染**彻底摆脱路径采样**（本轮最高价值）
**[[2026-11-10_HaloRT-Real-Time-Volumetric-Light-Transport-Inference]]** · arXiv 2611.12103 · Leonard & Westermann (TUM)

> **这是本轮唯一一篇在「路径追踪 / 全局光照」核心理论上有突破的论文。**

**核心命题**：*「路径样本是必需的吗？」* —— 对于云这类介质，**否**。

**两条可独立检验的假设**：
- **(A1) 特征充分性**：$\mathbf{F}(\theta;\xi)\overset{d}{=}\mathbf{F}(\theta';\xi)\Rightarrow R(\theta)=R(\theta')$
- **(A2) 噪声不变性**：$S(\mathbf{F}(\theta;\xi))=S(\mathbf{F}(\theta;\xi'))=R(\theta)$ a.s.

**关键洞察（论文自己反复强调）**：
> **MC 去噪是本框架的特例**——单个算子给出无偏估计，$R(\theta)=\mathbb{E}_\xi[F_{\text{MC}}(\theta;\xi)]$，此时 **(A1) 平凡成立，全部难度压在 (A2)**。
> 本文换掉特征后**平衡被反转**：特征几乎确定 → (A2) 变容易；(A1) 只在云上近似成立。

**工程亮点**：
- 6 个廉价主射线特征：光学深度、交互深度、多尺度交叉层、NEE 透射率、环境光照、介质属性
- **光照线性性 + 通道独立性 → 两个单通道解码器**（联合模型论文实测效果更差且容量需求更高）
- HaloNet 局部窗口注意力：2048² 下 **10.5 ms**，全局注意力需 **31.7 ms**（3× 差距）
- Vulkan + CUDA 零拷贝推理管线

**结果（Table 2）**：

| 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | **RMS-SD↓** | **时间↓(ms)** |
|---|---|---|---|---|---|
| Denoiser | 41.62 | 0.9687 | 0.0901 | 0.00628 | 23.84±9.61 |
| DenoiserX | **44.23** | 0.9827 | 0.0517 | 0.00323 | 24.76±9.98 |
| **HaloRT** | 42.79 | **0.9874** | **0.0420** | **0.00070** | **10.66±0.52** |

- **稳定性（RMS-SD）不到 DenoiserX 的 1/4，只有 Denoiser 的 1/9** —— 直接量化了 A2
- 速度 2.3×，且**方差极小**（±0.52 vs ±9.98）
- PSNR 略逊 DenoiserX，但 **LPIPS / SSIM 最优**（感知质量更好）

**⚠️ 限制**：只训练/评测了**单一数据集的云**、HG 相函数、非自发光、远处光照；不支持介质内表面、局部光源、自发光；通道共享消光。

---

### 🥈 2. SM 级负载不均衡 —— 3DGS 实时渲染的隐藏瓶颈
**[[2026-11-10_SM-Level-Load-Imbalance-3DGS]]** · arXiv 2611.12319 · Ryu & Yoo (POSTECH)

> **工程价值最高、最容易落地的一篇。**

**诊断**：tile 间高斯数最大/最小比 **55–605×**（标准基准）、**>6,100×**（大规模城市场景）→ **执行长尾**，多数 SM 空闲。

**关键量化条件**（论文的重要澄清）：**不均衡本身不必然导致低利用率**——需要最重 tile 相对 GPU 并行容量足够大：

| 场景 | 最重 tile / 每 CTA 份额 | 平均 SM 活跃率 |
|---|---|---|
| Street Gaussians | 1.1× | **88.2%** |
| 3DGS train | 1.7× | **49.2%** |
| Hier-3DGS | **6.8×** | **24.9%** |

**解法（两层）**：
1. **LPT 持久化内核**：按投影高斯数降序派发 tile（**只排索引不动高斯数据**，开销 < 1%）
2. **深度分块 + 饱和信令**：利用 alpha blending 可组合性 $C=C_A+T_m\cdot C_B$ 把重 tile 切给多 CTA；用 `atomicMin` 标志跨 CTA 传递早停信息（**安全性依据：透射率沿深度序单调递减**）

**结果**：
- 标准基准 **1.12×**，驾驶场景 **1.23×**，**Hier-3DGS 平均 2.93×（单帧最高 5.64×）**
- 质量影响：≤ **0.0015 dB PSNR**、$2.4\times10^{-5}$ SSIM（24 场景）
- **GPU SM 越多收益越大**：A6000(84 SM) 1.45× vs GB10(48 SM) 1.32×
- **优于 CaT-GS**（均值阈值切分）：3DGS train 上快 **40.5%**，Hier-3DGS 上快 **16.0%**

**可立即复用的工程结论**：
> **投影高斯数是有效的工作负载 proxy**——离线 oracle（按实际处理数排序）只快 **1.3%**，而**颠倒顺序会慢 37%**。无需运行时 profiling。

---

### 🥉 3. Spaghetti Splatting —— 3DGS 的曲线基元严格超集
**[[2026-11-10_Spaghetti-Splatting-Curvilinear-Dirac-Masses]]** · arXiv 2611.12716 · Shramko et al.

> **统一的「Dirac 质量 ⊛ 低频核」配方，沿第三个轴（曲线基元）推广。**

- **闭式体渲染积分**：Tonelli 换序 + Dirac sifting → 一维高斯积分 → $\mathrm{erf}$ 闭式解；**换核（Beta 核）依然成立**
- **单采样解析抗锯齿**（3D+2D 协方差加项），优于 Tojo et al. 的 4 采样方案
- **通用场景**：Beta 核在 Mip-NeRF 360 **超越所有基线**（28.78 dB）
- **头发重建**：比 Gaussian Haircut **高 2.7 dB PSNR、F1@2mm 高 14.3 个百分点**
- **消融启示**：段克隆不可省（掉 1 dB）；**折线合并与吸引损失不改善图像指标但决定结构连通性**（平均连通分量 3.50 → 1.00）

---

### 4️⃣ AF-NTC —— 神经纹理压缩的各向异性过滤补丁
**[[2026-11-10_AF-NTC-LOD-Conditioned-Anisotropic-Filtering]]** · arXiv 2611.12650 · Fujieda & Harada

**最有价值的不是模型而是诊断**：
> **仅用长宽比无法设定滤波器**——单一输入无法同时携带足迹的「形状」和「大小」，导致**近处图像在每个距离上被同样地模糊**。缺失的量是**绝对尺寸**。

- **有界三元组** $(\texttt{rot},\texttt{stretch},\texttt{LOD})$，用硬件采样器同款的有界量
- **双轴滤波器**：主轴绝对 tap 线（$\sigma_{\min}\cdot\texttt{stretch}$，30 tap）+ 副轴 LOD 高斯层级混合
- **25% 存储预算下超越无 AF 的 BC7**：全部 10 个材质–场景对 **+1.31 ~ +7.63 dB**
- **消融**：去掉副轴混合损失 **5.3–9.3 dB**（最关键）；模型放大 4× **最多只涨 0.4 dB**（误差由压缩而非容量决定）

---

### 5️⃣ Architectural Textured Proxy Generation —— SIGGRAPH Asia 2026
**[[2026-11-10_Architectural-Textured-Proxy-Generation]]** · arXiv 2611.12077 · Xiong et al.

- **范式转变**：建筑代理生成从 **geometry-only** 改为 **image-guided** —— 错位不再推迟到下游纹理阶段
- 法线引导的相机位姿精化（可微渲染 + MoGe 先验）解决「建筑朝向相机误差」
- 自建 **PlaneSet** 基准（东京数据集 3.62 km²，1000 视角）+ LoRA 微调 SAM 3 → **ProxySAM**
- 2D→3D 平面先验 + 局部/全局法线引导 → 减少边缘重复、纹理漂移、跨视角不一致

### 6️⃣ Quadratic Bezier Splatting —— 绘画渲染的结构化 + 逐笔审计
**[[2026-11-10_Quadratic-Bezier-Splatting-Painting-Rendering]]** · arXiv 2611.10713

- 二次贝塞尔泼溅渲染器（像素到曲线最短距离**解析精确、常数时间**）
- **单笔画审计**：在线累积 $\Delta_i^\pm$ / $R_i^{supp}$（**不做 leave-one-out 重渲染**）→ 纯度 $\rho_i$、净收益 $\eta_i$、残差密度 $\delta_i$ → 剪枝/拆分/重生调度
- **PSNR +5.46 dB，表示紧凑 16%，渲染器前反向 220.3×**

### 7️⃣ PLS-GS —— LiDAR 概率脚手架（WACV 2027）
**[[2026-11-10_PLS-GS-Probabilistic-Lidar-Scaffolds]]** · arXiv 2611.10699 · Harikumar et al. · **有开源代码**

- HGMM 在**空间+颜色 6 维**联合拟合 → 脚手架分辨率自适应（替代离散网格）
- 神经高斯偏移**挂在曲面框架**上 + **Mahalanobis 支撑损失**（切向宽松、法向严格）
- **基元更贴近 LiDAR 实测且数量大幅减少**；等容量下仍更近、质量相当

---

## 二、本轮其余 cs.GR 条目（未单独建笔记）

| arXiv ID | 标题 | 归属 |
|---|---|---|
| 2611.12162 | Same Physics, Different Gradients: A State-of-the-Art Report on Differentiable Physics Simulation | 35 页综述，区分「导数指向的数学对象」(referent) 与「反向传播的组织方式」(realization)，配套发布诊断工具。**跨领域综述，与渲染交叉有限** |
| 2611.11640 | Feel My Focus: Gaze-Triggered Digital Twin Creation for Remote Collaboration | MR 注视触发的一图建 3D；5 页 demo 报告 |
| 2611.11561 | From Sketch to Design: A Cross-scale Workflow for Procedural Generative Urban Design | CAADRIA 2024 作者版；$1 Unistroke + 张量场 + Three.js |
| 2611.11087 | SoftPAT3D: Physics-Augmented Text-to-3D Scene Generation with Deformables | 文本到 3D 场景 + 可变形体物理；65 个 prompt 上**无任何非预期穿模** |
| 2611.10523 | Action Transfer Across Character Body Plans in Latent-Action World Models | 潜动作迁移的实证研究；提出 transfer score 剥离屏幕移动 |
| 2611.10088 | Same Pixels, Different Documents: Measuring Part-Level Editability in Image Vectorization | 提出 **Pass@k** 评估矢量化可编辑性；211 参考、635 编辑任务 |
| 2611.10013 | From Video to Digital Twin: World Models + 3DGS 的实地视频实证 | 商业世界模型 20 帧 → 74.7 万 splats，成本 20 美分；批评为「探索，非部署产品」 |

> **趋势观察**：本轮 14 篇中有 **6 篇是「3DGS / 世界模型 / 神经资产」方向的实证研究**，而**传统物理渲染（路径追踪、光栅化、全局光照）仅 HaloRT 一篇**。arXiv cs.GR 的重心已明显转向神经表示与生成。

---

## 三、给 @墨鱼丸 的可执行建议

| 优先级 | 项目 | 依据 | 难度 | 收益 |
|---|---|---|---|---|
| 🔴 **高** | **HaloRT 的特征充分性 (A1) 验证** | 先用 6 个廉价特征在小规模云数据上验证 A1 是否成立 | 中 | 若成立 → 体积渲染可完全去掉路径采样，是范式级突破 |
| 🔴 **高** | **SM 级负载均衡（LPT + 分块）** | 2611.12319，算法清晰、无需重训练、可与现有优化正交叠加 | 中高 | 大规模场景 2.93×，标准基准 1.12×，质量损失 <0.0015 dB |
| 🟡 **中高** | **AF-NTC 的 AF 条件化诊断** | 2611.12650：若现有 NTC 只喂 aspect ratio，一定存在「近处同样模糊」缺陷 | 低 | 副轴混合占 5.3–9.3 dB，是最高性价比的材质质量补丁 |
| 🟡 **中** | **Spaghetti Splatting 的闭式积分** | 2611.12716：线段卷积 + erf 闭式 + 单采样解析 AA | 高 | 线状/纤维几何重建与物理仿真的独特能力 |
| 🟢 **中** | **笔画审计机制** | 2611.10713：在线误差归因（免 leave-one-out）+ 剪枝/拆分/重生 | 中高 | 矢量/绘画方向的结构化表示 |

**推荐落地顺序**：
1. **先做 SM 负载均衡** —— 风险最低、见效最快、可直接在现有 3DGS 管线上叠加
2. **再做 AF-NTC 的诊断** —— 成本极低，且其结论（ratio-only 不足）具普适性，可能立刻暴露现有管线的缺陷
3. **最后攻 HaloRT** —— 价值最高但需先验证 A1 假设，避免在前提不成立时投入大量训练资源

---

## 四、数据源健康度与改进项

| 来源 | 状态 | 说明 |
|---|---|---|
| arXiv API | ⚠️ **滞后** | 本轮最新仅到 11-09，**漏掉 11-10 批次**。必须配合列表页 |
| arXiv `list/cs.GR/recent` | ✅ 可靠 | **本轮唯一准确反映当日批次的来源**，建议作为主入口 |
| arXiv RSS | ✅ 可靠 | `pubDate: Tue, 10 Nov 2026` |
| arXiv HTML 全文 | ✅ 优秀 | 7 篇全部抓到完整方法/公式/表格（含 LaTeX alttext） |
| ACM Digital Library | ❌ **持续被 Cloudflare 拦截** | 已连续多轮 403。**建议停止每轮直接尝试**，改用「arXiv 版本 + 官方会议标注」替代 |
| Ke-Sen Huang SIGGRAPH Asia 页 | ✅ 可用 | 但 Changelog 最新条目仍为 **2026-09-17**，SIGGRAPH Asia 2026 完整论文集尚未上载 |
| SIGGRAPH Asia 2026 官方 | ⏳ 待上载 | 会议 2026-12-01~04，论文集应在 11-12 月陆续放出 → **下几轮需重点盯防** |

**待办**：SIGGRAPH Asia 2026 完整论文集上载后，预期会有一批新的 TOG/SIG 论文进入 cs.GR，需立即补采。
