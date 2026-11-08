---
type: report
created: 2026-11-08
updated: 2026-11-08
tags: [report, daily-search, rendering, SIGGRAPH-Asia-2026, TOG, 可微光栅化, 线段图元, 高斯泼溅, X光重建, 跨模态配准, 2026-11]
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026 年 11 月 8 日

## 搜索概况

- **搜索时间**: 2026-11-08 14:00 UTC（**周日**）
- **主窗口**: 2026-11-07 ~ 11-08（严格 24h）+ **SIGGRAPH Asia 2026 会议论文补采**
- **数据源**: arXiv API（`cat:cs.GR` 按 submittedDate 降序 60 条 + 关键词全文检索）、arXiv HTML 全文、arXiv PDF（PyMuPDF 抽表）、arXiv listing 页（按日分组核对）、**Ke-Sen Huang 的 SIGGRAPH Asia 2026 论文页**、SIGGRAPH Asia 官网、Web Search、ACM DL（浏览器 + web_fetch 双路尝试）
- **本轮收录**: **2 篇渲染相关论文**（均为 SIGGRAPH Asia 2026，新建结构化笔记，含全部公式、完整消融数据表）
- **来源可用性**:
  - ✅ arXiv API（**必须用 HTTPS**；`http://` 会 301/空响应）
  - ✅ arXiv HTML 全文（`https://arxiv.org/html/XXXX.XXXXX`）— 2 篇全部抓到完整方法/公式/表格
  - ✅ **arXiv PDF + PyMuPDF 本地抽取表格数字**（HTML 抽取会丢表格结构；PDF 48 MB 超出 pdf 工具 10 MB 限制，改为 `curl` 下载到工作区再用 PyMuPDF 解析，**这条路径成功拿到全部数值**）
  - ✅ **Ke-Sen Huang 的 `kesen.realtimerendering.com/siga2026Papers.htm`** —— 本轮新发现的 SIGGRAPH Asia 论文权威汇总源
  - ✅ **SIGGRAPH Asia 2026 官网**（12/1–4 吉隆坡 KLCC，马来西亚首届）
  - ✅ Web Search（Brave）
  - ⚠️ **ACM Digital Library 仍被 Cloudflare 拦截**（web_fetch 403 "Just a moment…"；浏览器点击 "Verify you are human" 后仍停在 "Verifying you are human"，Ray ID a5751f70590fd569）→ **已用 arXiv 上的 TOG/SA 版本 + 官方 DOI 完全替代覆盖**，内容无缺失
  - ⚠️ **SIGGRAPH Asia 2026 完整论文集尚未上载** → Ke-Sen 页目前只有 **5 篇「Conditionally Accepted」**（页面发布于 2026-09-17）；完整列表待 12/1 会议前后更新

---

## ⚠️ 本轮特殊情况：arXiv 周末无新批次

**今天（2026-11-08）是周日，arXiv 不发布新批次**（`arxiv.org/list/cs.GR/recent` 的日期分组最新为 **Fri, 6 Nov 2026**，11 条；RSS 的 `skipDays` 明确含 Saturday/Sunday）。

**核对结论**：11-06 批次的 11 篇 cs.GR 论文**已被 11-06 的每日报告全部覆盖**（逐 ID 核对：10/11 有笔记，剩余 1 篇 2611.06954「Decompose the Distillation」为扩散模型引导蒸馏，与渲染无关）→ **严格 24h 窗口内 arXiv cs.GR 零新增**。

**因此本轮转向 SIGGRAPH Asia 2026 会议论文补采**（TOG 45(6) 12 月号 + SA Conference Papers），补上 2 篇高价值渲染论文。

---

## 一、本轮核心发现（按价值排序）

### 🥇 1. 用显式线段重建绒毛/毛发，兼顾「显式几何」与「实时渲染」
**[[2026-11-08_Inverse-Rendering-Line-Primitives-FuzzyDR]]** · arXiv 2609.00625 · **ACM TOG 45(6) Art.200, Dec 2026**（SIG/TOG）· DOI 10.1145/3842527

> **3DGS 这类体素化表示能拍出毛茸茸的样子，但它是**没有拓扑的点云**——不能做深度测试、不能接反射模型、不能做物理仿真。** 本文用**显式线段（polyline）**重建绒毛/毛发/纤维，并发明了**面向线段的随机可微光栅化器**。

**核心技术点**：

$$\alpha = o\,(1-x)^{\beta(b)}\ \text{(HIBS，见 11-06)}\qquad \text{本文：}\qquad
f^{*}=\underset{f\in\mathcal{F}:\,\alpha_{f}>\tau_{f}}{\arg\min}\,d_{f}$$

$$\nabla\mathcal{L}=\mathbb{E}_{p_{f}}\big[\nabla\mathcal{L}_{1}(\mathbf{C}_{f})\big]+\mathbb{E}_{p_{f}}\big[\mathcal{L}_{1}(\mathbf{C}_{f})\,\nabla\log p_{f}\big]$$

> **第二项（不透明度梯度）是全文最硬的贡献**：把离散 z-buffer 片段选择变成可微随机过程。

**「Bresenham 取代线宽参数」是全文最漂亮的一招**：

$$\text{传统：}\ \text{world-space 线宽参数}\ \to\ \text{亚像素欠约束 → 不稳定 + 虚线伪影}$$
$$\text{本文：}\ \text{1-px Bresenham on }2{\times}2\text{ 子像素网格} + \text{Gaussian 滤波} \to\ \textbf{零线宽参数}$$

**MSAA 不透明度梯度的两处稳定性修正**（很实用）：
1. **同一图元内的片段梯度取平均** —— 否则不透明度梯度会把线的一端拉低 → 相当于「剪短线」；**几何变化应由位置梯度负责**
2. **只在像素中心 $2\times2$ 邻域的 4 个片段评估** —— 小滤波权重的片段对颜色/损失贡献小，单次随机光栅化判断不了该给多少更新

**主结果（Shelly 6 场景平均）**：

| 方法 | PSNR ↑ | SSIM ↑ | LPIPS ↓ | Geom./图元 ↓ |
|------|--------|---------|----------|--------------|
| DiffSoup（表面） | 30.63 | 0.920 | 0.112 | 9 |
| VolSurfs（表面） | 34.68 | 0.933 | 0.109 | 6.02 |
| AdaptiveShells（体素） | 36.02 | 0.954 | 0.079 | — |
| 3DGS (500K) | **37.73** | 0.960 | 0.057 | 10 |
| **Ours（2M 顶点显式线）** | 37.09 | **0.963** | **0.046** | **3.59** |

**628 FPS（RTX 4090）> 3DGS 的 588 FPS**，且 LPIPS 更低；**每图元几何参数仅 3.59 个（3DGS 为 10）**。

**Tab. 3 消融（最有说服力）**：传统 quad-sprite 线光栅化 **1 mm → 31.62 dB / 0.2 mm → 22.52 dB**（严重欠采样），本文 Bresenham+MSAA **37.09 dB / 0.046**，**且完全不需要线宽参数**。

**唯一失败案例**：Woolly（圆壳形大面积平坦区域）三角形图元（0.066）优于线图元（0.084）→ 论文提出**混合表示**为未来方向。

**相关度**: ⭐⭐⭐⭐⭐ 可微光栅化 / 实时渲染 / 毛发绒毛 / 显式几何

---

### 🥈 2. X-Splat：RGB 与 X 光共用一套高斯几何
**[[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]]** · arXiv 2610.23237 · **SIGGRAPH Asia 2026 Conference Papers** · DOI 10.1145/3829340.3842177

> **核心洞察：RGB（表面反射）和 X 光（密度线积分）物理机制完全不同，但都条件于同一套几何。** 所以正确的设计是**共享几何、只分化真正不同的属性**。

**统一基元**：

$$\mathcal{G}_i=\{\mu_i,R_i,S_i\;\text{(共享几何)},\;\rho_i\;\text{(辐射)},\;\alpha_i,c_i\;\text{(仅 }i\in\mathcal{S}\text{)}\}$$

**「几何代理配准」是全文最可迁移的一条**（Tab. 3）：

| 配准方法 | 输入源 | CD ↓ |
|------|--------|------|
| InsideOut† 层级对齐 | **已优化的高斯基元** | 0.0978 |
| 仅 ICP | 几何代理 | 0.1453 |
| 仅 PCA | 几何代理 | 0.0250 |
| **PCA + ICP（本文）** | **几何代理** | **0.0122** |

> **几何源的「干净程度」比配准算法本身更决定性** —— 仅 PCA 代理配准就优于 InsideOut 的全套层级对齐，**约 8× 改善**。仅 ICP 反而最差（identity 初始化在对称物体上退化缩放）。

**CT 深度一致性损失（边缘结构可迁移，绝对值不可迁移）**：

$$\mathcal{L}_{\mathrm{geo}}=\mathbb{E}_{\mathbf{r}}\!\left[\frac{1}{\bar{D}^{\mathrm{ct}}}\sum_{a\in\{x,y\}}\exp\!\bigl(-|\nabla_{a}D^{\mathrm{ct}}|/\tau\bigr)\,|\nabla_{a}D^{\mathrm{rgb}}|\right]$$

> CT 深度只做 **stop-gradient 的边缘结构目标** → 对齐表面边界结构，但不强制绝对深度值。

**主结果**：

| 数据集 | RGB PSNR (3DGS → Ours) | 提升 | 配准 CD | 存储 |
|--------|------|------|---------|------|
| InsideOut (4 场景) | 31.20 → **32.59** | +1.4 dB | 0.0978 → **0.0122** | **12.91 MB / 78.6k 高斯** |
| Flower & Insect (5 场景) | 33.72 → **36.44** | +2.7 dB | — | vs Independent 28.17 MB（**省 2.2×**） |

X 光侧与 R²-Gaussian **完全持平**（2D-PSNR ~48.9，3D-PSNR ~35.3）→ **共享几何提升 RGB 不牺牲 X 光**。

**Tab. 5 消融**：
- 去 CT 深度损失 → RGB **−0.16 dB**
- 去表面集机制 → 质量不变但**存储膨胀 2.5×**
- 换成 InsideOut 式对齐 → RGB **−0.9 dB**
- **统一表示 vs 完全独立双模型**：RGB 更高 + 存储省 2.2×；**但「冻结 CT 当深度先验给独立 RGB 集」只 +0.06 dB** → **增益来自「共享几何 + 联合优化」，不是「多了一个深度先验」**
- **FDK 初始化（已含完整体结构）反而不如 MVS 初始化** → 持续的几何监督 > 一次性的好初始化

**相关度**: ⭐⭐⭐⭐ 高斯泼溅 / 跨模态配准 / 神经渲染

---

## 二、本轮可迁移的通用技巧（跨领域总结）

这两篇论文合起来给出了一组**高度可复用**的设计模式，建议直接引入自研管线：

| # | 技巧 | 出处 | 适用场景 |
|---|------|------|---------|
| 1 | **「离散选择可微化三板斧」**：①连续不透明度作软选择概率 ②似然比梯度估计器 ③同图元内梯度取平均（形状归位置梯度、存在性归不透明度梯度） | FuzzyDR | **任何 z-buffer / argmax / top-k 的可微化** |
| 2 | **「能不参数化就别参数化」**：亚像素几何的连续参数天然欠约束 → 用 Bresenham 这类离散算法替代 | FuzzyDR | 亚像素线/点/窄面元 |
| 3 | **「亚像素欠采样是隐蔽质量杀手」**：0.2 mm quad 掉到 22.5 dB → 亚像素几何必须 MSAA/超采样 | FuzzyDR | 所有亚像素渲染 |
| 4 | **重建滤波器选择有实质影响**：同样 $2{\times}2$ 子像素，Box vs Gaussian 差 0.013 LPIPS → **不要默认 box filter** | FuzzyDR | 通用后处理/光栅化 |
| 5 | **「几何代理配准」优于「优化结果配准」** | 两篇共通 | 多模态融合、跨数据集配准 |
| 6 | **「PCA 找全局 + ICP 做局部」两段式**，缺 PCA 会陷入局部极小/退化缩放 | X-Splat | 任意点云配准 |
| 7 | **「边缘结构可迁移、绝对值不可迁移」的弱监督跨模态损失** | X-Splat | 结构共享但尺度/偏移不同的多模态 |
| 8 | **「共享几何 + 差异化属性」表示范式**，省 2.2~2.5× 存储而质量不降 | X-Splat | 同一几何、多个渲染路径 |
| 9 | **多模态密度控制要维护多套梯度统计；剪枝用 AND 不用 OR；「降级」代替「剪枝」** | X-Splat | 多任务联合优化 |
| 10 | **联合优化时保留次要任务的损失不冻结**（防耦合漂移） | X-Splat | 多任务 loss 平衡 |
| 11 | **更精细的初始几何 ≠ 更好的结果** | X-Splat | 初始化策略评估 |

---

## 三、覆盖度核对与缺口

- **11-06 arXiv 批次 11 篇**：逐 ID 核对 → 10 篇已有笔记；剩余 1 篇（2611.06954）非渲染主题 → **无遗漏**
- **本轮之前未覆盖、但属于几何/绑定域（不在生菜职责范围，留给 @wawaicai）**：
  - `2611.03775` **FlowRig**（3D/4D 网格统一骨骼生成，flow matching + 匈牙利匹配 + CFG 骨骼数控制）
  - `2611.00179` **SemEllipsoid**（语义感知形状抽象）
- **SIGGRAPH Asia 2026 会议论文完整集尚未公开**（Ke-Sen 页仅 5 篇 conditionally accepted）→ **建议 11 月下旬（会议前）再补采一轮**
- **ACM DL 持续被 Cloudflare 拦截**（已连续多轮）→ 已通过 arXiv 上的 TOG/SA 版本 + 官方 DOI 完全替代；**建议后续考虑接入 ACM DL 的官方 API（需 API key）或 OpenAlex/Crossref 补充元数据**

---

## 四、下一步建议

1. **传递给 @墨鱼丸**：
   - FuzzyDR 的**离散选择可微化三板斧**（技巧 #1）→ 若自研可微渲染管线涉及深度测试/排序，**立刻可用**
   - **亚像素欠采样排查**（#3）+ **Gaussian vs box filter**（#4）→ 成本极低，建议作为现有管线的常规体检项
   - **几何代理配准**（#5、#6）→ 若有多模态/多源数据配准需求，直接照搬 PCA+ICP 两段式
   - X-Splat 的**表面集机制**（外观属性只分配给表面邻近基元）→ **显存/存储优化立竿见影**
2. **本轮无需新方案落地**（arXiv 周末无新增），2 篇 SIGGRAPH Asia 论文均为**方法论/设计模式**价值 > 直接实现价值
3. **建议 11 月 28 日前后**再跑一次 SIGGRAPH Asia 2026 完整论文集补采（会议 12/1–4，论文集会随会议上线）

---

## 五、下一轮（11-09，周一）预期

- arXiv cs.GR **周一恢复发布** → 预计会补上 11-06/11-07/11-08 三天的积压（周末跳过）
- 需重点检查：11-07 的 PlayGen2（11-07 笔记已收录）、11-08/11-09 是否有新的**光追 / 全局光照 / PBR / BVH** 方向论文
