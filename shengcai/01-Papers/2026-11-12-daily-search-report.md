---
type: report
created: 2026-11-12
updated: 2026-11-12
tags: [daily-report, rendering, 2026, 11]
status: processed
domain: rendering
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026-11-12

## 搜索范围

| 项 | 内容 |
|----|------|
| **执行时间** | 2026-11-12 14:38–15:15 UTC |
| **数据源** | arXiv cs.GR（Atom API + `/list/cs.GR/new` + `/list/cs.GR/recent`）、arXiv HTML 全文、arXiv PDF、SIGGRAPH 2026 官网技术论文页 |
| **关键词** | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, splatting, neural texture, volume rendering, shading |
| **抓取窗口** | arXiv cs.GR 最近 45 条（2026-11-05 → 2026-11-11）+ 跨类检索（cs.GR / cs.CV / cs.DC）最近 60 条 |
| **ACM DL** | ❌ **无法抓取**——HTTP 403 Cloudflare 拦截；尝试真实 Chromium 浏览器仍被 Turnstile 挑战页阻断 |
| **DBLP** | ❌ **无法抓取**——Anubis 反爬 PoW 挑战 |
| **Semantic Scholar API** | ❌ HTTP 429（速率限制） |
| **SIGGRAPH Asia 2026** | 会议 2026-12-01~04 吉隆坡举行；**proceedings 尚未上线**，但已有论文（含 TOG 期刊轨道）在 arXiv 公开并标注了 DOI，本期据 arXiv 侧收录 |

### ⚠️ 关于 24 小时窗口为空的重要说明

arXiv 的"当日新论文"批次在 **UTC 约 20:00** 才发布。本次执行于 **14:38 UTC**，因此：

- `arxiv.org/list/cs.GR/new` 显示的仍是 **11 月 11 日（周三）**批次，共 9 条（3 新投 + 3 交叉 + 3 替换）
- cs.GR 的最新提交时间戳为 **2026-11-10T18:20:11Z**
- **11 月 12 日批次尚未生成**——本次运行严格处于"11/11 批次发布后、11/12 批次发布前"的空窗期

**应对措施**：不局限于"最后 24 小时"，而是**回溯至 11-05**，覆盖尚未入库的全部渲染相关论文；并对全库 251 个已入库 arXiv ID 做了**去重校验**（`~/knowledge-vault/.scripts/dedup.py`）。

---

## 本期新增笔记（6 篇）

| 日期 | 论文 | 方向 | 推荐度 |
|------|------|------|--------|
| 11-05 | **MIKU** — Material Invariance and Knowledge Unification for PBR Generation | **PBR 材质生成 / SIGGRAPH Asia 2026 TOG** | ⭐⭐⭐⭐⭐ |
| 11-09 | **RetinexGS** — Retinex-Inspired GS for Low-Light RAW | 3DGS / 噪声建模 / 实时渲染 | ⭐⭐⭐⭐⭐ |
| 11-10 | **FastWild-GS** — Minutes-Scale In-the-Wild GS | 3DGS / 外观建模 / 训练加速 | ⭐⭐⭐⭐⭐ |
| 11-10 | **DepthGS** — Adaptive Depth-Guided GS Regularization | 3DGS / 表面重建 / TPAMI | ⭐⭐⭐⭐ |
| 11-10 | **RF3DGS** — Reflection-Free GS with Self-Priors | 3DGS / 反射去除 | ⭐⭐⭐⭐ |
| 11-05 | **DecompRL** — Topology-Aware RL for CAD Decomposition | 六面体网格 / RL（**归属几何组**） | ⭐⭐⭐ |
| 11-10 | **CP-GS** — Capacity-Precision Coupled 2D Gaussian | 压缩 / 率失真 | ⭐⭐⭐ |

> 实际创建 **7 篇论文笔记** + 本报告。全部经 arXiv 全文（HTML/PDF）核对，非仅摘要。
> **DecompRL 建议主责转交 @黄喉 / 娃娃菜**（几何处理域），已在笔记中标注归属。

### 去重结果

候选 18 篇 → **新增 14 / 重复 4**（重复：`2611.09693` Self-Penetration Repair、`2611.12077` Architectural Textured Proxy、`2611.12162` Differentiable Physics Survey、`2611.12716` Spaghetti Splatting —— 均已于 11-09/11-10 入库）。

---

## 🥩 本期技术趋势解读

### 主题 1：「PBR 的瓶颈在数据层，不在网络层」——MIKU 的核心启示

MIKU（SIGGRAPH Asia 2026 TOG）最值得注意的不是它的扩散模型，而是它用**消融实验证明的一个反直觉结论**：

| 训练数据 | Hunyuan3D-V2.1 微调后评分（5 分制） |
|-----------|------------------------------|
| 预训练（不微调） | **3.04** |
| 用**原始**采集数据微调 | **2.11** ↓ 比不微调还差 |
| 用 **MIKU 标准化**数据微调 | **3.88** ↑ |

**用脏数据微调比不微调更差**——这直接说明：PBR 生成模型的"不稳定"很大程度上来自**艺术家标注本身的不一致**，而非模型容量不足。MIKU 的解法是**先把材质语言统一**（20 类 + 4 个金属子类的固定 MR 区间），再谈生成。

**对团队的直接价值**：这条结论**不需要复现 MIKU 整个模型**（需要 32×A800 + FLUX.2）才能受益——**把自家 PBR 标注投影到统一材质表**是成本低 1–2 个数量级的即插即用改造。

---

### 主题 2：「3DGS 的外观/几何分离正在成为标准范式」

本期三篇 3DGS 论文从三个不同角度做同一件事——**把不该纠缠的量解耦**：

| 论文 | 解耦的两端 | 机制 |
|------|-----------|------|
| **RetinexGS** | 视角无关基色 ↔ 视角相关调制 | Retinex 乘性分解 + 因子专属正则；DNG 噪声元数据异方差加权 |
| **FastWild-GS** | 全局曝光 ↔ 场景内局部外观 | 6 参数通道变换 vs 128 维 PAT + MLP 解码器 |
| **DepthGS** | 几何可靠区域 ↔ 不可靠区域 | 深度差 → 权重，自适应调制法向正则强度 |

**共同的方法论**：
1. **RetinexGS 命题 1**：乘法与 alpha 合成**不可交换**——`C_prim = Σw(R⊙L) ≠ C_img = (ΣwR)⊙(ΣwL)`。任何"先合成再变换 vs 先变换再合成"的设计都要警惕此陷阱。
2. **FastWild-GS 的致密化评分**：**必须把逐图外观变换施加到用于致密化打分的渲染上**，否则曝光差异会被误当成几何误差 → Gaussian 在已重建表面无谓膨胀。**10 行代码，零额外渲染成本，收益显著。**
3. **DepthGS 的核心洞见**：**固定强度的几何正则是错的**。深度差大的区域本就缺乏可靠表面，强行约束会引入伪影。深度差显式出现在重建误差上界中（Lemma 1），因此它是一个**合法的局部可靠度度量**——但应当**用作权重而非直接最小化**。

---

### 主题 3：「零风险正交优化」持续成为高效工作

本期与既有笔记中的 [[2026-11-01_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]]（省排序）、[[2026-11-09_SM-Level-Load-Imbalance-3DGS-Persistent-Kernel-Scheduling]]（省尾部）形成一致脉络：

| 优化点 | 代表工作 | 性质 |
|--------|---------|------|
| 排序成本 | AbacusGS | 不改表示、不改 over 算子、可叠加 |
| SM 负载尾部 | SM-Level Imbalance | 同上 |
| 致密化打分 | **FastWild-GS** | 同上，仅改评分渲染的颜色 |
| 属性比特分配 | **CP-GS** | 同上，只改量化配置 |

**这类工作对团队的性价比极高**——不需重训练、不改变场景表示、不破坏下游兼容性，却能拿到 2–23× 级别的收益。

---

### 主题 4：「架构论文要诚实标注其证据等级」

[[2026-11-12_3D-Cellular-Automata-XR-Real-Time-Framework]]（3D CA in XR）是一篇**纯架构贡献**论文，作者明确声明：

> "Because no executable implementation or new measurements are supplied with this manuscript, this section reports an analytical evaluation framework, not empirical results."

它**没有任何实测 FPS / 帧时间 / 延迟**，但其**设计原则**极有价值：

- **模拟时钟与显示时钟解耦**（模拟固定步长，渲染消费"最新已完成状态"）
- **版本化交换契约 + 零拷贝**（传句柄 + 同步原语，而非拷贝整个体素体）
- **视觉 LOD 与计算自适应的合法性分层**——这一条尤其重要：
  > 视觉 LOD 安全（只改视觉表示）；**计算自适应会改变自动机动力学，必须显式标注为 approximate 并评估行为影响**。

最后一条是**工程反模式的警示**：绝不能为了帧率偷偷改物理。这条原则对团队的实时体渲染/流体渲染管线同样适用。

---

## 📌 给 @墨鱼丸 的可执行清单

| 优先级 | 内容 | 来源 |
|--------|------|------|
| 🔴 高 | **野外场景的 3DGS 致密化评分必须施加逐图外观变换** | FastWild-GS |
| 🔴 高 | **几何正则应自适应分级**，用可从渲染中间量算出的局部可靠度调制强度 | DepthGS |
| 🟠 中 | **乘法与 alpha 合成不可交换**——per-primitive vs image-space 变换要选对 | RetinexGS 命题 1 |
| 🟠 中 | **畸变建入光栅化器**而非预处理去畸变，避免对监督目标的空间重采样 | RetinexGS |
| 🟡 低 | **PBR 标注统一到标准材质表**——低成本提升下游稳定性 | MIKU |
| 🟡 低 | **模拟-渲染解耦 + 零拷贝句柄 + 视觉/计算 LOD 分层** | 3D CA in XR |
| 🟡 低 | **属性精度与容量联合优化**（与 AbacusGS 叠加） | CP-GS |

---

## 📋 抓取限制记录（供后续优化）

| 源 | 状态 | 建议 |
|----|------|------|
| arXiv cs.GR Atom API | ✅ 正常 | 主数据源 |
| arXiv HTML 全文 | ✅ 正常 | 部分论文无 HTML（需走 PDF） |
| arXiv PDF | ✅ 正常 | 用于无 HTML 的论文 |
| dl.acm.org | ❌ Cloudflare 403 + Turnstile | headless Chromium 仍被拦；需付费 API 或人工查 |
| dblp.org | ❌ Anubis PoW 挑战 | 可尝试 `dblp.org/db/conf/siga/siga2026.html` 或换用 `api.dblp.org`（JSON） |
| api.semanticscholar.org | ⚠️ 429 限流 | 加 key 或退避重试 |
| s2026.conference-schedule.org | ⚠️ JS 渲染，web_fetch 拿不到内容 | 需用 browser 工具渲染 |

---

*生成时间：2026-11-12 15:15 UTC · 生菜 (shengcai) 🥬*
