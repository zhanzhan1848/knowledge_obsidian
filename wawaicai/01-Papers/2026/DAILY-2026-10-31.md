---
type: daily-summary
created: 2026-10-31
updated: 2026-10-31
tags: [daily-summary, geometry-processing, cs.GR, arxiv-scan, ACM-TOG, SIGGRAPH-Asia-2026, parametrization, winding-number, neural-explicit-representation, octree, ray-tracing, pose-space, curve-reconstruction, self-intersection, texture-representation]
domain: geometry
agent: wawaicai
period: 2026-10-30 14:03 ~ 2026-10-31 14:03 UTC
---

# 每日几何处理论文摘要 · 2026-10-31

## 扫描范围

| 项 | 内容 |
|----|------|
| **时间窗** | 2026-10-30 14:03 ~ 2026-10-31 14:03 UTC（24h） |
| **来源** | arXiv **API**（cat:cs.GR + cs.CV/cs.MM/cs.RO/math.MG 交叉）、**Crossref REST API**（ACM TOG, ISSN 0730-0301）、**SA2026 会议日程系统**（`sa2026.conference-schedule.org`，**309 篇技术论文全量清单 + 官方摘要**，本轮重新解析）、CGinterest SIGGRAPH Asia 2026 预告片报道 |
| **关键词** | mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification, mesh generation, curvature estimation + 扩展（winding number, containment, UV, octree, ray-surface, pose space, curve, self-intersection, texlet） |
| **命中** | **10 篇新收录**（几何核心 7 + 关联 3）+ 已存在去重 20+ |

> ⚠️ **检索限制与突破说明**：
> 1. **arXiv 24h 窗口内 cs.GR 零新提交** —— 10-30 为周五、10-31 为周六，**arXiv 周末公告空窗**。API 证实 cs.GR 最新批次仍为 **2026-10-29 17:50**（HairDeck）。因此本次扩大回溯窗口至 **10-27 ~ 10-31**，并**首次成功解析 SA2026 日程系统的逐篇摘要**（详见下条），补录了此前遗漏的几何核心论文。
> 2. **SA2026 摘要获取方式突破** 🔑 —— 上一轮（10-30）通过日程系统的日期分片 `.txt` 拿到了 309 篇标题，但**逐篇摘要是 JS 渲染的**。本轮找到正确路径：`/wp-content/linklings_snippets/wp_program_view_all_<date>.txt`（6 个日期分片，共 **18.1 MB**）→ 解析 `ssid="papers_XXXX"` 得 309 篇标题 → **浏览器访问 `/presentation/?id=papers_XXXX&sess=sessXXX` 读渲染后的 Description 字段**。**该流程可复用于后续每日任务。**
> 3. **ACM DL 直连 403**（Cloudflare）→ 期刊侧仍用 **Crossref**。`from-created-date:2026-10-29..10-31` 在 TOG 路由与 `/works` 路由**均返回 0 条**；TOG 全量最近 20 条的 `created` 字段仍停留在 2026-07 ⟹ **SIGGRAPH Asia 2026 的 online-first 论文尚未进入 Crossref 的 TOG 索引**。今日 ACM TOG 侧**无新增**，几何论文主要通过 **SA2026 日程系统**获取。

---

## 今日论文清单

### 🟢 几何核心（7 篇）

| # | 标题 | 来源 | 领域标签 | 推荐度 |
|---|------|------|----------|--------|
| 1 | [Point Containment Queries on Trimmed Surfaces via Winding Numbers and Periodicity Lifting](2026-10-31-SA2026-Point-Containment-Trimmed-Surfaces-Winding-Periodicity.md) | **SA2026** (papers_1384) | 点包含查询 / 广义缠绕数 / 修剪曲面 / 周期性提升 / B-Rep 镶嵌 | ⭐⭐⭐ **强烈推荐（今日第一，可直接实现）** |
| 2 | [NeuOctree: Neural Explicit Shape Representation](2026-10-31-arXiv-2610.38441-NeuOctree-Neural-Explicit-Shape-Representation.md) | **arXiv 2610.38441** (10-28) | 八叉树角点特征 / 光线-表面求交 / 神经网格压缩 / 开放表面 | ⭐⭐⭐ **强烈推荐（表示层范式）** |
| 3 | [ImageUnwrap: Single-View Dense UV Parameterization](2026-10-31-SA2026-ImageUnwrap-Single-View-Dense-UV-Parameterization.md) | **SA2026** (papers_1681, Adobe) | 稠密 UV 回归 / 单目 / 空间梯度损失 / 纹理编辑 | ⭐⭐⭐ **强烈推荐** |
| 4 | [Type-Free Global Intersection Analysis with Linear Displacement Fields](2026-10-31-SA2026-Type-Free-Global-Intersection-Analysis-LDF.md) | **SA2026** (papers_1118，预告片首篇) | 自交解缠 / 线性位移场 / 保守射线投射 / 布料薄壳 | ⭐⭐⭐ **强烈推荐（已开源）** |
| 5 | [ViPS: Video-informed Pose Spaces for Auto-Rigged Meshes](2026-10-31-SA2026-ViPS-Video-Informed-Pose-Spaces-Auto-Rigged-Meshes.md) | **SA2026** (papers_1874) | 姿态流形 / 可微几何约束 / 运动先验 / 流形投影 IK | ⭐⭐ 推荐 |
| 6 | [CGGT: Curve-Grounded Geometry Transformer](2026-10-31-SA2026-CGGT-Curve-Grounded-Geometry-Transformer.md) | **SA2026** (papers_1114) | 参数曲线重建 / 几何 Transformer / Wireframe-100K | ⭐⭐ 推荐 |
| 7 | [TexSpot: 3D Texture Enhancement with Spatially-Uniform Point Latent](2026-10-31-SA2026-TexSpot-Spatially-Uniform-Point-Latent-Texture.md) | **SA2026** (papers_1208) | Texlet 表示 / 视图一致性 / 空间均匀采样 | ⭐⭐ 推荐 |

### 🔵 关联但值得记（3 篇）

| # | 标题 | 来源 | 领域标签 | 推荐度 |
|---|------|------|----------|--------|
| 8 | [UltraTex: Unleashing 2K Multi-View Diffusion for 3D Texturing](2026-10-31-SA2026-UltraTex-2K-Multi-View-Diffusion-Texturing.md) | **SA2026** (papers_2019) | Background Token Dropping / 块稀疏注意力 / G-buffer TexVerse | ⭐⭐ 推荐（工程范式） |
| 9 | [A Tutorial on Shape Servoing of Deformable Objects I](2026-10-31-arXiv-2610.40559-Shape-Servoing-Tutorial-Fundamentals.md) | arXiv 2610.40559 (cs.RO) | 形变雅可比 / 数据驱动估计 / 局部稳定性 | ⭐⭐ 推荐（与 Re-NJF 对读） |
| 10 | [A complete solution to the reverse isoperimetric problem for λ-convex bodies](2026-10-31-arXiv-2610.40291-Reverse-Isoperimetric-Lambda-Convex-Bodies.md) | arXiv 2610.40291 (math.MG) | 凸几何 / 逆向等周 / Borisenko 猜想 / 常曲率推广 | ⭐ 理论参考 |

**已存在去重（未重复创建）**：
- **SA2026**：SeamFlow (2189)、Efficient & Robust Seamless Parametrization (1694)、OffsetAxis (1686)、PolyFlow (1758)、ADELE (1411)、Robust Bijective Mapping (2327)、S4R (1264)、RBF Your SDF (1380)、Re-NJF (1219)、CuACD (1423)、TORO (1893)、MeRM (2513)、PartLLM (2410)、FlowAR-BRep (2227)、TopoSurfel (1285)、UVFaceFusion (1414)、MegaParts (2796)、GLOSS (1329/2616)、Lyra (2096)、Artic-O (2140)、CADRec (1997)、SymTRELLIS (1054)
- **arXiv**：HairDeck (2610.40599)、CAD-WAM (2610.39306)、Texture Consolidation (2610.36098)、CVTSplat (2610.35347)、Honeycomb-Surfels (2610.37668)、Inverse Origami (2610.34903)、RLMuscle (2610.30033)

---

## 今日主题线索 🔍

### 线索 1：**「不再依赖分类」——把枚举式分支换成结构化证据**

两篇今日核心论文是**同一个思想的两次应用**：

| 论文 | 旧做法 | 新做法 |
|------|--------|--------|
| **#4 Type-Free Intersection** | GIA 按**轮廓类型**分支处理交叠 | **免类型分类**，直接用「轮廓锚定的射线证据」构造分离响应 |
| **#2 NeuOctree** | 隐式场（SDF/占据）→ 需**表面定位 / 网格提取**才能给交点 | 直接把「光线-表面求交」作为**表示的主接口**，无 level set 求根 |

**共同洞察**：
> **分类空间是组合爆炸的，而且必然不完备。** 更稳健的做法是「用**连续/结构化的证据**（射线命中、预测交点）替代**离散的类型判定**」。

这与昨日的线索（OffsetAxis「中轴提取」、PolyFlow「连续嵌入 + 阈值化」、Robust Bijective Mapping「基本形式目标」）**完全同构** —— **连续化 / 重表述这条主线已经连续三天被独立验证**。

⟹ **这是本知识库近三日最强的元观察**，值得单独立一条 MOC：
**「离散几何问题的连续化重表述」** —— 把「选择离散类别/分支」的问题，改写为「在连续空间上优化或求交」，从而复用成熟的连续工具（流匹配、射线投射、梯度下降），并自动获得对未见拓扑的泛化能力。

### 线索 2：**「角点特征共享」——空间结构化存储 × 神经局部解码的干净解耦**

**NeuOctree** 的设计值得单独提炼：

```
八叉树体素角点特征（共享，存储）
        ↓ 三线性插值
连续局部特征场 φ_v(q)
        ↓ 共享 MLP（所有体素、所有光线同一套权重）
交点 / 法向 / 反照率 / 命中概率
```

**为什么这个拆分好**：
- **存储层**：稀疏、结构化、体素角点共享 ⟹ 跨体素边界天然连续、内存紧凑、可 LOD
- **解码层**：一个 MLP 复用所有体素 ⟹ 参数量与物体复杂度**解耦**
- **查询层**：直接给交点 ⟹ 无需中间网格

**这个模式可迁移**到任何「结构化空间存储 + 局部连续解码」的场景。值得作为我们表示层设计的参考模板。

### 线索 3：**参数化三连 —— SeamFlow → Seamless Param. → ImageUnwrap**

本周「参数化」方向已形成完整链条（三篇都在库内）：

| 阶段 | 论文 | 问题 |
|------|------|------|
| ① **切在哪** | SeamFlow (SA2026) | 接缝位置的**语义连贯性**（艺术家意图） |
| ② **怎么展** | Efficient & Robust Seamless Parametrization (SA2026) | 无缝 + 低失真（Penner 坐标、内蕴网格） |
| ③ **从图像反推** | **ImageUnwrap (SA2026, 今日新增)** | 单图 → 稠密 UV，**跳过 3D 重建** |

⟹ **三篇分别解决「拓扑」「度量」「感知」三个层面**，构成一个相当完整的参数化知识三角。

### 线索 4：**纹理方向今日双篇 —— 「效率」与「一致性」分头解决**

- **UltraTex**：把多视图扩散推到 **2K**（Background Token Dropping + Block-Sparse Attention + Foreground-Aware VAE Decoding）⟹ **治「算不动」**
- **TexSpot**：提出 **Texlet** 表示（点式几何表达力 + UV 式紧凑性，**空间均匀**打破「纹理分辨率⟷几何密度」耦合）⟹ **治「不一致 + 表示受限」**

⟹ **理想组合**：UltraTex 产高分辨率多视图 → TexSpot 一致地融合到高分辨率纹理表示。**两篇应作为一组阅读。**

---

## 与既有笔记的关联网络

| 今日论文 | 关联既有笔记 | 关系 |
|---------|-------------|------|
| **NeuOctree** | [[2026-10-30-SA2026-RBF-Your-SDF-RBF-Interpolation-SDF]] | SDF→网格的**另一种路线**（神经 vs RBF） |
| **NeuOctree** | [[2026-10-30-SA2026-OffsetAxis-UDF-Medial-Axis-Reconstruction]] | 都在解决「隐式 → 显式」的转换代价 |
| **ImageUnwrap** | [[2026-10-30-SA2026-SeamFlow-Artist-Like-UV-Unwrapping]] | 同一参数化生态（接缝 vs UV 回归） |
| **ImageUnwrap** | [[2026-10-30-SA2026-Efficient-Robust-Seamless-Parametrization]] | 参数化三连之二 |
| **Type-Free Intersection** | [[2026-10-30-SA2026-S4R-Rigid-Body-Interpenetration-Resolution]] | **强烈建议对读**：S4R 刚体穿透（延续法+凸 QP）vs 本文薄壳自交（射线证据+LDF） |
| **Type-Free Intersection** | [[2026-10-22-2610-30033-RLMuscle-Geometric-Multigrid-XPBD]] | XPBD 约束求解器背景 |
| **ViPS** | [[2026-10-30-SA2026-Rotation-Equivariant-Neural-Jacobian-Fields]] | 同一「雅可比场」概念：**生成式 vs 控制式** |
| **Shape Servoing** | [[2026-10-30-SA2026-Rotation-Equivariant-Neural-Jacobian-Fields]] | **强烈建议对读**：形变雅可比（数据驱动估计 vs 神经参数化） |
| **Point Containment** | [[2026-05-18-Spatially-Accelerated-Winding-Numbers]] | **缠绕数主线第 5 篇**，路线：GPU 加速 vs 紧致包围 + 覆盖空间 |
| **Point Containment** | [[2026-05-18-Accelerated-Winding-Numbers-Curved-Geometry]] | **本人前作** |
| **CGGT** | [[2026-03-12-TreeON-3D-Tree-Point-Cloud-Reconstruction]] | 曲线/结构提取 |
| **TexSpot / UltraTex** | [[2026-10-30-SA2026-MeRM-Neural-Geometry-Tokens]] | 几何 token 思路同族 |
| **TexSpot / UltraTex** | [[2026-10-28-2610-36098-Texture-Consolidation-Multi-View-Renderings]] | 纹理融合 |

---

## 可执行动作清单

| 优先级 | 动作 | 依据 |
|--------|------|------|
| 🔴 **高** | **实现「椭圆包围替代控制点包围」的 GWN 加速** —— 单点改动即可加速现有缠绕数实现 | #1 |
| 🔴 **高** | **拉取 Type-Free Intersection 的 GitHub**，做布料/薄壳对照测试（vs S4R 式解算） | #4（已开源，可立即试） |
| 🟡 **中** | 精读 Shape Servoing Part I 第 6/7 章（局部稳定性条件 + 不可达性），与 Re-NJF 联合分析 | #9 + Re-NJF |
| 🟡 **中** | 拉取 UltraTex（MIT），跑「参考图 → 2K 多视图 → 融合到现有网格 UV」全流程 | #8 |
| 🟡 **中** | 将 **Wireframe-100K**（CGGT）与 **G-buffer TexVerse**（UltraTex, 268K 资产 2K 多视图 + G-buffer）纳入数据集池 | #6, #8 |
| 🟢 **低** | 把 NeuOctree 的「角点特征存储 + 共享 MLP 解码」模式作为我们表示层设计的参考模板 | #2 |
| 🟢 **低** | 追踪 NeuOctree 项目页（ICLR 2027 投稿中）、Shape Servoing Part II、SeamFlow/TexSpot 代码开源 | #2, #9, #3, #7 |

---

## 关键数字速查

| 论文 | 关键数字 |
|------|---------|
| **NeuOctree** | 24/28 最低位置误差；81–244 KiB 全胜 21/21；相对 VQAD Objaverse $d_{pm}$ **-85.5%** / ShapeNet **-95.8%**；**前馈 50 ms** vs N-BVH **3 min**；开放表面 $d_z$=**0**（VQAD 0.059） |
| **Point Containment** | 椭圆界替代控制点界 ⟹ **免去曲线细分**；通用覆盖空间处理非可压缩/不连续环 |
| **ImageUnwrap** | 单视图稠密 UV；**无 3D 重建、无类别模板**；空间梯度损失显式允许边界不连续 |
| **Type-Free Intersection** | VF/EE/FV 保守射线投射 + 自适应 k-ring 限制；输出标准 proximity penalty pairs |
| **ViPS** | **零样本泛化**到 OOD 物种与未见骨骼拓扑；追平用艺术家 4D 数据训练的 SOTA |
| **CGGT** | **Wireframe-100K**（10 万 CAD 模型 + 精确曲线标注）；稀疏无标定多视图输入 |
| **TexSpot** | Texlet：2D 编码局部块 + 3D 编码注入全局形状；级联 3D→2D 解码 |
| **UltraTex** | **2K × 6 视图**（>212K tokens）；训练加速 **20.6–91.1×**、推理加速 **22.3–74.6×**；**G-buffer TexVerse** >268K 资产 |
| **Shape Servoing** | 9 页两部曲；形变雅可比数据驱动估计；平面弹性杆 + 双臂 + 相机示例 |

---

## 待办 / 追踪

- **Shape Servoing Part II**（更进阶主题）——待 arXiv 放出
- **NeuOctree** —— ICLR 2027 投稿中，待正式录用信息；官方称「octree 构建需加速」⟹ 效率改进可能是后续版本的重点
- **SeamFlow / TexSpot / Make-It-Poseable / RigIt / DecomVoxel** —— 代码「近日公开」，需回补实现细节
- **ACM TOG 索引滞后** —— SA2026 的 online-first 论文尚未进入 Crossref ⟹ 未来几日应复查 Crossref，可能补回 DOI

---

相关主题：[[几何处理]] [[缠绕数]] [[点包含查询]] [[神经显式表示]] [[八叉树]] [[光线追踪]] [[UV参数化]] [[自交检测]] [[姿态空间]] [[参数曲线重建]] [[3D纹理生成]] [[形变雅可比]] [[凸几何]]
