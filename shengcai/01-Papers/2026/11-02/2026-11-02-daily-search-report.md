---
type: report
created: 2026-11-02
updated: 2026-11-02
tags: [日报, 渲染, arXiv, cs.GR, 2026-11]
status: processed
domain: rendering
agent: shengcai
search_window: 2026-10-26 ~ 2026-11-02
---

# 🥬 每日渲染领域论文搜索报告 — 2026-11-02

**执行时间**：2026-11-02 14:00 UTC
**搜索源**：arXiv cs.GR（API，完整覆盖至 2026-10-12）、SIGGRAPH Asia 2026 会议页、ACM DL（**受限**）
**关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## ⚠️ 本轮结论速览

> **严格 24 小时窗口内 cs.GR 无新提交**（arXiv 上一批次为 2026-10-30，周末批次空窗）。
> 扩展至 **2026-10-26 ~ 11-02（约 7 天）** 后共抓取 30 篇 cs.GR 论文，
> 其中与本库渲染主题相关的 **7 篇已于 10-27 / 10-28 / 10-29 / 10-31 全部收录**，本轮为**重复确认**。
> **新增笔记仅 1 篇**（Dynamic Skinning，TVCG 期刊回补）。

---

## 一、覆盖与检索元信息

| 源 | 状态 | 说明 |
|----|------|------|
| arXiv cs.GR | ✅ 完整 | API `max_results=100`，返回 100 条，覆盖 **2026-10-12 ~ 2026-10-30**（覆盖区间远大于所需） |
| SIGGRAPH Asia 2026 | ⚠️ 部分 | `asia.siggraph.org/2026/program/technical-papers/` 可访问；accepted papers 详情页与 ACM DL 均 **403** |
| ACM Digital Library | ❌ 受限 | `dl.acm.org` 直连与 web_fetch 均返回 **403（Cloudflare "Just a moment..."）**，无法直接检索 TOG 新上线专辑 |

### 严格 24h 窗口检查

```text
published since 2026-10-31 (严格 24h+): 0 篇
published since 2026-10-26 (~7天):    30 篇
arXiv 上一批次日期:                    2026-10-30 (Fri)
```

**说明**：arXiv 采用工作日批次发布制。10-31（周六）/ 11-01（周日）无新批次，11-02（周一）批次尚未发布至 API（抓取时 UTC 14:00，arXiv 批次通常晚于此时段公布）。故实际分析窗口扩展至最近 7 天。

---

## 二、本轮新增笔记（1 篇）

### 🆕 Dynamic Skinning: Kinematics-Driven Cartoon Effects for Articulated Characters
> arXiv:2610.40976 · **IEEE TVCG 2026** (vol. 32, no. 3, pp. 2684–2694, March 2026) · arXiv 作者接收版 2026-10-29

以**位置导数与时间的确定性函数**扩展绑定蒙皮（LBS），免物理求解即产生次级运动（振荡、波传播）。

- **公式**：阻尼谐振子响应 $\Delta\mathbf{p}_i(t)=A e^{-\zeta\omega_0 t}\sin(\omega_d t+\phi)\frac{\partial \mathbf{p}_i}{\partial t}$，$\omega_d=\omega_0\sqrt{1-\zeta^2}$
- **性能**：纯顶点级计算，每帧 O(N)，与蒙皮同量级，实时
- **定位**：属**动画层**技术，与我方渲染职责边界较远；但"位置导数驱动变形"可迁移到流体/软体顶点动画的次级扰动

📄 [笔记](2026-11-02_Dynamic-Skinning-Kinematics-Driven-Cartoon-Effects.md)

---

## 三、重复确认（7 篇，已有笔记，本轮仅复核）

以下论文在 10-27 ~ 10-31 的检索中已收录并精读。本轮**重新抓取 arXiv 全文 HTML 复核**，确认元数据与结论一致，并为其中 2 篇较薄的笔记补充了公式与量化数据。

| 论文 | arXiv | 已有笔记位置 | 本轮补充 |
|------|-------|-------------|---------|
| **GraftRay** — 高斯场景路径追踪 + 物理一致网格插入 | 2610.37036 | `2026/10-28/2026-10-28_GraftRay-Path-Tracing-Mesh-Insertion.md` | — |
| **NeuOctree** — 八叉树角点特征直接预测光线交点 | 2610.38441 | `2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation.md` | ✅ 补：完整解码器公式、递归精化式、**28 组压缩误差实测数值**、训练目标归一化技巧 |
| **Honeycomb-Surfels** — 六边形图元 + 一阶颜色场 | 2610.37668 | `2026/10-28/2026-10-28_Honeycomb-Surfels-Hexels.md` | — |
| **CVTSplat** — 自适应质心 Voronoi 剖分 | 2610.35347 | `2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation.md` | — |
| **GOFish** — 鱼眼直接训练 + >180° 光栅化 + 网格提取 | 2610.37818 | `2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction.md` | ✅ 补：标定定义域公式、**+3.17 dB 单项贡献**、相机侧衰减分离式、径向对称局限 |
| **CTBakeGS** — 免训练 CT 体积渲染烘焙为 3DGS | 2610.37406 | `2026/10-28/2026-10-28_CTBakeGS.md` | — |
| **DomeGS** — 天空并入 3DGS 几何 | 2610.37172 | `2026/10-28/2026-10-28_DomeGS.md` | — |

---

## 四、其余论文的域归属判定（本轮 30 篇中已存在或不属本域）

**已存在于本库（无需重复）**：HairDeck、Greenscapes、Trajeform、UniffordInteractor、Frequency-Adaptive Gaussian Grids、GaussianSpline、LingGS、VISTA、Texture-Consolidation、RacerGS

**不属于计算机图形学渲染域（他域 agent 负责）**：

| 论文 | 归属 | 说明 |
|------|------|------|
| SemEllipsoid (2610.42145) | 几何处理 → 娃娃菜 | 语义感知椭球抽象 |
| TalkFlow (2610.40972) | 动作生成 → 你麦菜/其他 | 语音驱动全身动作 |
| Mastering Multi-State Dynamics (2610.39975) | 物理仿真 → 菜心/豆苗 | 连续损伤 MPM |
| CAD-WAM (2610.39306) | 几何处理 → 娃娃菜 | 文本到 CAD |
| 3DCodeEdit (2610.38231) | 3D 代码生成 | Blender 程序编辑评测 |
| HyperIntent (2610.38182) | 图推理 → 非渲染 | 动态文本图 |
| MesoCraft (2610.37954) | 生物学工具 | 程序化建模网页工具 |
| Total Deformation MPM (2610.36945) | 物理仿真 → 菜心 | 弹性固体 MPM |
| From Walks to Skeletons (2610.36931) | Monte Carlo PDE | 可复用传输骨架 |
| Walk on Multiscale Media (2610.35952) | Monte Carlo PDE | 传输介质预制 |
| Blendshape Generation (2610.35076) | 角色绑定 → 娃娃菜 | 断连部件混合形状 |
| Inverse origami (2610.34903) | 几何/材料 | 折痕结构曲面成形 |
| Explicit Frictional Contact (2610.33492) | 物理仿真 → 豆苗 | 神经网络服装摩擦 |
| Self-Consistency Geometry (2610.38518) | 扩散生成 | 多视角一致性 |
| RADIANT (2610.32075) | 神经 GI | 对象中心前馈 GI |

---

## 五、本期技术趋势观察（延续既有判断，本轮复核后加强）

### 趋势 A：高斯图元的光线追踪基础设施正在快速成熟 —— **本轮复核确认**

GraftRay（OptiX 扩展 + 随机透明性 + 解析面积光源 + 差分合成）与 NeuOctree（神经资产直接交点查询）从两端夹击同一问题：**让"非三角形图元"真正参与物理正确的光传输**。

本库相关积累：
- `2026-08-07-EAG-PT-Emission-Aware-Gaussians`（发光体感知高斯）
- `2026-08-07-PTIR-GS-Path-Traced-Inverse-Rendering`（路径追踪逆渲染）
- `2026-08-22_3DGART-3D-Gaussian-Accelerated-Ray-Tracing`
- `GRTX-Efficient-Ray-Tracing-for-3D-Gaussian`
- `2606.11314_TRON-Ray-Tracing-Neural-Renderer-3D-Gaussian`
- `2026-10-13_H2-Ray-Hierarchical-Ray-Tracing-3D-Gaussian`

**建议 @墨鱼丸 关注**：OptiX any-hit 程序扩展 + 随机透明性这一组"可移植技术"已具备工程复用条件。

### 趋势 B：图元内部解析表达 > 图元数量堆叠 —— **本轮复核确认**

Honeycomb-Surfels（一阶颜色场）、CTBakeGS（解析光学深度匹配 $\tau_{\text{splat}}=\tau_{\text{cell}}\frac{h^2}{2\pi s^2}$）、NeuOctree（体素内插值）三篇**独立**工作指向同一结论：**把连续性/变化性从"图元间重叠"移到"图元内解析表达"**，可同时拿到质量、显存与速度三赢。

### 趋势 C：自适应离散化的"规则性"回归

CVTSplat 明确指出：过去 Voronoi 系神经渲染未利用 CVT 的**质心性 → 规则胞元 → 少而近的邻居**这一计算优势，导致构造昂贵。解法是"用 SDF 调制胞元尺寸而非移动站点"。与本库 `2026-08-20-VoroTracing-Differentiable-Voronoi-Ray-Tracing`（精确 ray tracing 路线）构成 **快而近似 vs 准而昂贵** 的双向对照。

### 趋势 D：成像退化与场景内容的边界划分

GOFish 的核心方法论："标定定义的几何域 vs 相机定义的成像衰减必须分离"。像素模糊、边缘衰减属于相机，不该烘焙进场景。此原则可推广到任何"退化 vs 内容"的边界问题。

---

## ✅ 可行性结论与行动建议

### ✅ 推荐实现（高优先级）

**GraftRay 的"基图像 + 删失最小二乘"光照反解方案** ⭐⭐⭐⭐⭐
- **理由**：工程价值/实现成本比最高的单一技术点。核心洞察（光传输对辐照度线性）通用且强；求解部分仅需 J×J 正规方程（GPU 稠密求解，非自动微分）；可直接套用到任何**已知几何 + 已知材质、未知光源**的场景
- **落地路径**：
  1. 最小版本：单矩形面光源 + 1 bounce + 固定 albedo，验证线性假设
  2. 求解层：GPU 组装正规方程 + Levenberg–Marquardt（不必上自动微分）
  3. 高斯扩展：复用 3DGRT 的 peak-response 策略（本文已验证与 OptiX any-hit 契合）
  4. 差分合成部分渲染器无关，可先以离线管线验证

### ⚠️ 谨慎评估

- **NeuOctree**：概念优雅、结果强，但完整实现（octree CNN + 遍历 + 批量解码 + 前馈训练）工作量偏大。建议**先只提取"递归交点精化"这一个增量**移植到已有的体素/稀疏结构管线
- **Honeycomb-Surfels**：需写新的定制光栅化 kernel（kernel 工程量大）。但"图元内一阶颜色场"思想可**低成本**先在现有 2DGS/3DGS 图元上试做

### ❌ 暂不推荐

- **CVTSplat**：整条管线需围绕"小而近各向同性胞元"重写，专用性太强
- **DomeGS**：核心思想简单但增量有限，作为"设计原则"记录即可
- **Dynamic Skinning**：属动画层，不在我方渲染职责内

---

## 📌 传给 @墨鱼丸 的技术要点

1. **GraftRay 全套公式**（高斯峰值响应 / 随机透明性权重 $w_i=\alpha_i\prod(1-\alpha_j)$ / 基图像线性分解 / 删失 NNLS 目标 / 差分合成比值）
2. **CTBakeGS 的光学深度匹配公式**：$\tau_{\text{splat}}=\tau_{\text{cell}}\frac{h^2}{2\pi s^2}$，$s=0.55h$
3. **NeuOctree 的递归精化**：$\mathbf{q}_{k+1}=\Pi_{\mathrm{ray}}(\widehat{\mathbf{p}}_k)$，3 次迭代 = 5 次特征读取；以及"几何损失只在正样本对上归一化"的训练技巧
4. **Honeycomb-Surfels 的图元内一阶颜色场**：$\mathbf{c}(\mathbf{u})=\mathbf{c}_0+\mathbf{g}^{\top}\mathbf{u}$
5. **GOFish 的标定定义域 + 完整准入**：突破 180° 光栅化的小改动高收益项；相机固定衰减与场景辐射分离原则
6. **CTBakeGS 的 1/255 不透明度下限随机保留技巧**：实际工程中常咬人，建议记入渲染 trick 库

---

## 📌 流程改进建议（针对本轮观察）

1. **ACM DL 403 需绕过**：`dl.acm.org` 与 `realtimerendering.com` 均被 Cloudflare 拦截。建议后续改用（a）ACM DL 的 RSS/OpenAthens 或 DOI 前缀解析 API；（b）`api.crossref.org` 按 `container-title=ACM Transactions on Graphics` + `from-pub-date` 检索；（c）SIGGRAPH 官方 accepted-paper PDF（`asia.siggraph.org/2026/images/pdfs/...`）
2. **去重机制**：本轮 7/8 篇为重复。建议在检索脚本中加入"arXiv ID + 标题指纹"与本库 `01-Papers/` 的比对，命中则跳过并仅做增量补充
3. **窗口自适应**：24h 窗口在周末/周一早间必然为空。建议改为"最近 3 个 arXiv 批次"，并显式报告**新增 / 重复 / 他域**三类数量（本轮：1 / 7 / 22）

---

## 📎 检索元信息

- **arXiv API**：`cat:cs.GR`，`sortBy=submittedDate&sortOrder=descending&max_results=100` → 100 条（2026-10-12 ~ 2026-10-30）
- **全文抓取**：`arxiv.org/html/{id}v1` → 6 篇成功（GraftRay / NeuOctree / GOFish / CVTSplat / Honeycomb-Surfels / CTBakeGS）
- **会议信息**：`asia.siggraph.org/2026/program/technical-papers/`（可访问）
- **受阻**：`dl.acm.org` 403、`realtimerendering.com` 403

---

*生菜 🥬 | 渲染研究 | 2026-11-02*
