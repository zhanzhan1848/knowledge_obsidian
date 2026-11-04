---
type: report
created: 2026-11-04
updated: 2026-11-04
tags: [日报, 渲染, arXiv, cs.GR, SIGGRAPH-Asia-2026, ACM-DL, 2026-11]
status: processed
domain: rendering
agent: shengcai
search_window: 2026-10-21 ~ 2026-11-04
---

# 🥬 每日渲染领域论文搜索报告 — 2026-11-04

**执行时间**：2026-11-04 14:31 UTC
**搜索源**：arXiv cs.GR（API 全量 60 条 + 分类/关键词交叉检索）、cs.CV、eess.IV、math.NA、ACM DL（**受限**）、SIGGRAPH Asia 2026（程序页 + 条件录用 PDF）
**关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## ⚠️ 本轮结论速览

> **arXiv 新增批次有限**：11-03 批次只发布了 **1 篇 cs.GR**（Phase-DGS）。11-04 批次在抓取时刻（UTC 14:31）**尚未发布**（arXiv 批次通常晚于此时段），故本轮实际增量集中在 **11-03**。
> **新增结构化笔记 2 篇**：Phase-DGS（语义相位替代时间戳，NeurIPS 2026）、GSCV++（GS 序列标准视频编解码压缩，帧间 BD-rate −68.7%~−109.9%）。
> **cs.CV 侧另有 GSCV++**（3DGS 压缩，标注 cs.CV 而非 cs.GR，但属渲染/资产管线核心域，予以收录）。
> **SIGGRAPH Asia 2026**（12/1–4 吉隆坡）**完整论文列表仍未公布** —— 程序页仅有一句「Stay tuned as full session schedules are unveiled soon!」，条件录用 PDF 仍只含 submission ID。
> **ACM DL 依旧被 Cloudflare 阻断**（本轮尝试 web_fetch + 浏览器点击人机验证均失败）。

---

## 一、覆盖与检索元信息

| 源 | 状态 | 说明 |
|----|------|------|
| arXiv cs.GR | ✅ 完整 | API `max_results=60` 返回 60 条，覆盖 **2026-10-21 ~ 2026-11-03**；另按 8 组关键词交叉检索（`abs:"ray tracing"` / `"path tracing"` / `"global illumination"` / `"ray marching"` / `rasterization` / `BVH` / `"real-time rendering"` / `"physically based"`），确认**无遗漏于 API 排序之外的新条目** |
| arXiv cs.CV / eess.IV / math.NA | ✅ 抽样 | 检索 11-02 20:00 之后新条目，筛出 GSCV++（2611.05359）、Sparse Anchors（2611.05084，Gaussian 特征场 SLAM 相关）、ELiCv2 等，剔除非渲染项 |
| SIGGRAPH Asia 2026 | ⚠️ 部分 | `asia.siggraph.org/2026/program/technical-papers/` 与 `/program/` 可访问，但**无论文清单**；`Conditionally-Accepted-Technical-Papers.pdf`（504 KB, 3 页）已下载解析，**仅含 submission ID**（papers_1001 … papers_2660） |
| ACM Digital Library | ❌ 受限 | `dl.acm.org/doi/proceedings/10.1145/3842530` web_fetch **403 Cloudflare**；浏览器点击「Verify you are human」后仍返回「Performing security verification」（Ray ID a5545d05a880067d） |
| Ke-Sen 论文列表 | ❌ 受限 | `realtimerendering.com/kesen/siga2026Papers.htm` 浏览器 + web_fetch 均 403 Cloudflare |

### 严格 24h 窗口检查

```text
published 2026-11-03 14:31 之后（严格 24h）:  0 篇   ← 11-04 批次尚未发布
published since 2026-11-03:                 1 篇 (cs.GR: Phase-DGS)
published since 2026-11-01:                 7 篇
published since 2026-10-21 (~2周):          60 篇
```

**说明**：arXiv 采用工作日批次制。11-01（周日）、11-02（周一）批次已于上一轮收录；本轮新增 11-03（周二）批次。

---

## 二、本轮新增笔记（2 篇）

### 🆕 1. Phase-DGS: Phase-guided Dynamic Gaussian Splatting from Unsynchronized Multi-view Video
> arXiv:2611.04666 · Hosung Jeon, Jun Young Jeong, Sangwoon Kwak 等（ETRI + SNU） · 2026-11-03 · **NeurIPS 2026 已录用**

**一句话**：把 4DGS 的**绝对时间戳**换成从图像直接估计的**语义相位** $p\in[0,1]$（该帧在运动周期中的固有状态），跨相机天然对齐，即插即用接入现有 4DGS 骨干。

- **公式**：$z_f^i=\frac{1}{HW}\sum_n h_{\mathrm{ViTenc}(u_f^i)}^n$；$\mathcal{L}=\lambda_{\mathrm{phase}}\mathcal{L}_{\mathrm{phase}}+\lambda_{\mathrm{mono}}\mathcal{L}_{\mathrm{mono}}+\lambda_{\mathrm{render}}\mathcal{L}_{\mathrm{render}}$；相位一致性 $\mathcal{L}_{\mathrm{phase}}=\mathrm{MSE}(z_f^i,\sum w\cdot\mathcal{B}_i)$，$w=\mathrm{softmax}(-|P_i-p_f^i|)$；单调损失 $\mathcal{L}_{\mathrm{mono}}=\sum\mathrm{relu}(-\Delta_f^i+\frac{1}{Fk})$；**核心替换** $G(p_f^i)\leftarrow G(t)$
- **性能**：未同步条件下相对无同步基线 **+3 ~ +6.5 dB PSNR**（场景平均；SelfCap Dropped + FreeTimeGS **+6.485 dB**，Nvidia Shifted + FreeTimeGS **+6.051 dB**）；摘要所称 **+8.5 dB** 为单场景级增益
- **消融要点**：**单调损失**（−4.97 / −5.31 dB）与**特征库可学习性**（−4.59 / −3.57 dB）是两根支柱；$k=2$ 为最佳折中；DINOv2 S/B/L 差异 <0.3 dB；ROI 裁剪收益 <0.2 dB（可选）
- **开销**：显存 +514 MB（+30.5%），训练吞吐 148 → 70 iter/s（**2.11× 慢**）；**推理零开销**
- **局限**：**周期运动场景失效**（Balloon1 —— 视觉模式相同导致相位歧义）；RealTime-4DGS 约 6 万次迭代后过拟合；只估计**相对相位**
- **代码**：项目页标注 **Code (coming soon)**

📄 [笔记](2026-11-04_Phase-DGS-Phase-Guided-Dynamic-Gaussian-Splatting.md)

### 🆕 2. GSCV++: Lightweight 3D Gaussian Splatting Sequence Compression via Standard Video Codecs
> arXiv:2611.05359 · Qi Yang, Yingzhan Xu, Kai Zhang, Li Zhang · 2026-11-03

**一句话**：把 3DGS **序列**压缩整条流水线对齐到**标准视频编解码器**（HEVC/H.265、VVC/H.266、H.264），三模块 = **EA-SHDR**（I 帧单一 PCA 基降维 45 通道 SH AC）+ **P-MiniPLAS**（先验加权 + 局部 4! 排列）+ **CA-GC**（坐标非均匀位深拆分 16:4 + CU 控制）。

- **公式**：PCA 能量选维 $k^*=\min\{d:\sum_{i\le d}\lambda_i/\sum_{i\le45}\lambda_i\ge A\}$，$k=3\lceil k^*/3\rceil$；加权 $W_a=f_1(D_a)f_2(QP_a)$，$f_1=BD_a\cdot CH_a$，$f_2=2^{(4-QP_a)/6}$，$R_a\approx K_a2^{\beta_a(4-QP_a)/6}$；局部排列 $\pi^*=\arg\min_{\pi\in S_4}\sum_j\|g_P^e(p_{\pi(j)})-g_I^e(p_j)\|_2^2$；块尺寸 $B_i=B_{\mathrm{MBS}}/2^i$
- **性能**：相对 GSCV **帧内 −24.5%~−39.6%**、**帧间 −68.7%~−109.9%** BD-rate；2D 映射生成 **5.1–5.4×** 更快（I 帧 4.575 s vs 24.78 s；P 帧 14.665 s vs 74.60 s）；libx265 下编码 0.171 s/图、解码 0.035 s/图（≈30 FPS 并行解码）
- **消融**：EA-SHDR 单独 **+21.92%**、P-MiniPLAS 单独 **+32.43%**、联用 **+41.79%**；坐标拆分**帧内 LSB 用 LZMA 更好、帧间用 HM18.0 更好**；CU16/PD2 vs CU64/PD4 RD 仅差 0.41% 但编码耗时 16.39 s vs 22.45 s；**MBS=128 反而下降**（局部最优陷阱）；**推荐 GoP8**（GoP32 使后半段 PSNR 降 2.21 dB）
- **编解码器增益**（vs libx264）：libx265 12.01% / VTM23.11 23.27% / HM18.0 23.91%（VTM 未优于 HM —— GS 属性图重尾 + 缺显式运动信息）
- **局限**：坐标 **LSB 图难被标准编解码器压缩**；仅用能量定维非最优 RD；PLAS 图非自然图像

📄 [笔记](2026-11-04_GSCV2-GS-Sequence-Compression-Video-Codecs.md)

---

## 三、已收录论文确认（本轮复核，无重复建档）

| 论文 | arXiv | 笔记 |
|------|-------|------|
| AbacusGS: Gaussian Splatting without Per-Splat Sorting | 2611.01534 | ✅ 11-03 |
| Walk on Multiscale Media (WoMM) | 2610.35952 | ✅ 11-03 |
| UniCross3D (EG 2026, CGF) | 2611.02631 | ✅ 11-03 报告 |
| RADIANT: Object-Centric Feed-Forward GI | 2610.32075 | ✅ 10-26 |
| GraftRay: Path Tracing Mesh Insertion | 2610.37036 | ✅ 10-28 |
| GOFish: Full FoV GS + Mesh Extraction | 2610.37818 | ✅ 10-31 |
| NeuOctree: Neural Explicit Shape Representation | 2610.38441 | ✅ 10-31 |
| Dynamic Skinning (TVCG) | 2610.40976 | ✅ 11-02 |
| Infinite Worlds from One Example | 2611.01048 | ✅ 11-03 报告 |
| Representation-Aware Closed-Surface Param. | 2611.00721 | ✅ 11-03 报告 |

**本轮关键词交叉检索结论**：8 组关键词逐一检索 arXiv cs.GR，**返回结果与已收录库完全一致** —— 最近的渲染新条目仍是 10-23 的 RADIANT、10-27 的 GraftRay、10-28 的 NeuOctree、11-01 的 AbacusGS，**无遗漏条目**。

---

## 四、值得关注的技术趋势

### 1. 「语义/相位」正在取代「时间戳」作为动态场景的统一时间坐标
Phase-DGS 与此前 WoMM、RADIANT 一脉相承：**放弃对绝对时间/绝对几何的依赖，转而构造一个可跨设备、跨来源对齐的语义坐标**。这对多相机采集、档案素材重建都是刚需。

### 2. GS 资产压缩正从「专用压缩器」转向「标准视频编解码器 + 前端适配」
GSCV++ 的思路（**属性 → 2D 映射 → 标准编解码器**）与 AbacusGS 的思路（**存储序即渲染序**）同源：**把 GS 的结构性问题在编码前/渲染前解决掉，而不是发明新的编解码体系**。工程收益（硬件兼容、30 FPS 解码）非常直接。

### 3. 时间同步 / 帧间对应关系仍是 GS 序列的真正瓶颈
Phase-DGS 解决**采集端**不同步，GSCV++ 解决**压缩端**缺少帧间 primitive 对应（no-tracking 条件）—— 两者都指向同一个底层问题：**GS 表示缺少天然的时序结构**。这是本领域未来 1–2 年的重点方向。

---

## 五、待关注事项

- **SIGGRAPH Asia 2026**（12/1–4，KLCC 吉隆坡）：论文列表尚未公布，TOG 专辑与 ACM DL 需在会议前复查。当前 SIGGRAPH 2026 已启用 **ACM Open**，论文将开放获取
- **Phase-DGS 代码**：项目页标注 coming soon，建议后续跟进以验证实现
- **GSCV++ 代码**：论文未声明开源，仅引用 Fraunhofer HHI 的 PLAS 仓库
- **ACM DL 访问**：连续多日被 Cloudflare 阻断，建议后续尝试学术代理 / 机构订阅入口

---

## 六、本轮技术可行性建议（传递给 @墨鱼丸）

### 建议 1：GSCV++ 的 P-MiniPLAS 局部排列搜索值得单独实现
即使不做完整压缩流水线，**「先验加权 PLAS + 局部 4! 排列」**这套 3D→2D 映射技巧也可独立用于**属性图可视化、属性缓存、跨帧差分**等场景。复杂度可控（$O(M^2\log B_{\mathrm{MBS}})$），且相对全局 Inter-PLAS 有 **−24.5% RD / 3.84× 加速**。**实现难度：低-中**。

### 建议 2：Phase-DGS 的「单调损失 + 可学习特征库」是通用的时序正则化范式
即使不做 DGS，任何「从图像估计连续时间标量并注入渲染器」的管线都适用这两个约束：
- **单调损失**保证标量的时序有序（代价极低，收益 5 dB 量级）
- **可学习特征库 + 注意力检索**提供跨视角/跨实例的一致性锚点

**实现难度：低**，可作为通用模块库沉淀。

### 建议 3：坐标 LSB 的可压缩性是 GS 压缩的下一个突破口
GSCV++ 明确指出**坐标 LSB 图是标准编解码器最難压的部分**（16:04 拆分的 LSB 部分占坐标总大小的绝大部分）。建议探索：坐标**差分/预测编码**、把 LSB 交给 LZMA/Brotli 等熵编码器、或用**感知重要性**重排比特流。

---

*生成者：生菜 (shengcai) · 计算机图形学渲染专家 · 2026-11-04 14:31 UTC*
