---
type: report
created: 2026-11-09
updated: 2026-11-09
tags: [daily-report, fluid-rendering, arxiv, siggraph-asia-2026, digipro-2026]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/list/cs.GR/recent
---

# 每日流体渲染论文搜索报告 — 2026-11-09

## 检索概况

| 项目 | 内容 |
|------|------|
| **执行时间** | 2026-11-09 14:33 UTC |
| **检索源** | arXiv cs.GR API + arXiv RSS + arXiv recent 列表 + SIGGRAPH/SIGGRAPH Asia/DigiPro 会议站点 |
| **关键词** | fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering |
| **arXiv 候选池** | cs.GR 最近 300 篇（2026-09-01 起）全量扫描 + 11 组定向关键词查询 |
| **新增入库** | **2 篇** |

### 检索窗口说明

arXiv 周末（11-07 周六 / 11-08 周日）不发布新批次，因此 cs.GR 的最新公告为 **11-09（周一）**，共 **7 篇**，其中**无直接流体渲染主题**。为保证覆盖率，本次将窗口扩展至 **11-05 ~ 11-09**，并同步核查 SIGGRAPH Asia 2026 / DigiPro 2026 会议论文。

**11-09 cs.GR 全部 7 篇**（无流体渲染命中，列出以备查）：
`2611.09693` 自穿透修复 / `2611.09238` VR 视听差异 / `2611.08897` 几何纹理分割 / `2611.08763` CrowdDirector 群体模拟编排 / `2611.08665` **NanoVDB** ✅ / `2611.08994` 机器肖像工作室 / `2611.08645` LiDAR 立面基准

---

## 新增论文（2 篇）

### 1. 🟢 Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB

> [[2026-11-09-NanoVDB-Dynamic-GPU-Sparse-Grids]]

- **arXiv** [2611.08665](https://arxiv.org/abs/2611.08665) | **SIGGRAPH Asia 2026 (TOG 45(6))** | DOI [10.1145/3842564](https://doi.org/10.1145/3842564)
- **作者**：Sifakis, Williams, Horvath, Sawhney, Harris, Swartz, Museth（NVIDIA）
- **一句话**：打破 VDB 生态"CPU 动态拓扑 / GPU 只读速度"的二选一僵局——首次让 NanoVDB 支持 **GPU 原生动态拓扑演化**（位并行 bit-parallel，亿级体素毫秒级重建），并提出 **voxel-sequential 访问范式**（VoxelBlockManager）把稀疏体素流式化为扁平线性序列。
- **流体渲染相关点**：以 **ghost fluid method + 窄带 level set + WENO5 重初始化**追踪燃烧火焰锋面。
  - VBM 吞吐 **≈20 Gvoxel-updates/s**，accessor 基线随 occupancy 下降从 14.0 退化到 9.8 → **加速比最高 1.98×**
  - 相比 nvblox：**快 3.5–11.5×**，体素分辨率细 1.5–5×
  - 网格体素化：2.8M 三角形 → **9.88×10⁹ 体素 / 3.24 s**（OpenVDB 内存耗尽）
  - 动态场景衰减：**两个算子、零积分器代码**，持久体素减少 **78%**
- **代码已开源**：`AcademySoftwareFoundation/openvdb` + `openvdb/fvdb-core`
- **可行性**：✅ **强烈推荐**——2026 年稀疏体数据基础设施层面最重要的进展

### 2. 🟡 Kora: A Physics-Based Fire Pipeline and Toolset

> [[2026-11-09-Kora-Physics-Based-Fire-Pipeline]]

- **会议** **DigiPro '26**（ACM Digital Production Symposium），2026-07-18，洛杉矶 | DOI [10.1145/3819990.3820026](https://doi.org/10.1145/3819990.3820026)
- **作者**：Stomakhin, Edholm, Ramachari, Isakov, Forootaninia, Schoo, Illingworth, Letteri（**Wētā FX**）
- **获奖**：**VES 2026 Emerging Technology Award**
- **一句话**：把物理燃烧求解器真正装进 VFX 生产线——弱可压稀疏自适应 **MPI 分布式**燃烧求解器 + **能量级联湍流 (ECT)** 模型 + Houdini 艺术家工具链 + Manuka 渲染期体积合成，交付《阿凡达：火与灰》**1000+ 火镜头**，**100+ 艺术家 / 8 团队**一致产出。
- **可直接移植的高价值技术**：
  - **ECT 能量级联湍流**：按 Kolmogorov 谱 $A = 2^{-5/3}$ 检测频带能量亏损并注入 curl noise，恢复数值耗散损失的动能（5 个频带为性能/丰富度最佳平衡）
  - **艺术导向四件套**：变形重力场 / 空间可变 Coriolis 力 / 风场边界约束 / 频域速度引导
  - **Kora diffusion**（温度通道多级模糊加回）与 **Kora crust**（模糊烟尘再减去 → 隔离表面凸起 → 凹形裂缝透出发光内核的"焦壳"感）——**纯渲染期技巧，可脱离 Kora 移植**
  - 黑体辐射火焰着色 + **hollow flame**（等价比场 $q$ 调制热量通道 → $Z = \frac{1-2q}{1-2q+4\epsilon}$）
  - **混合模拟策略**：弹道段用廉价 Houdini Pyro，接触表面用 FLIP 建模液体飞溅，再驱动高保真 Kora 火
- **可行性**：✅ **推荐（工程范式借鉴价值 > 直接复用）**——全栈复现不现实，但 ECT 与 diffusion/crust 性价比极高

---

## 会议论文核查结果（SIGGRAPH Asia 2026 / DigiPro 2026）

### 已入库（无需重复创建）

| 论文 | 笔记 |
|------|------|
| A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows (Wretborn, Stomakhin, Batty) | `2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows.md` |
| Flamescapes: Simulating the Wildlandfire Urban Interface | `2026-10-25-Flamescapes-Wildlandfire-Urban-Interface.md` |
| DiffSurFlow (可微流体优化) | `2026-10-08-DiffSurFlow-Differentiable-Fluid-Flow-Map.md` |
| SIGGRAPH Asia 2026 流体综述（16 篇） | `2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup.md` |

### arXiv 近期流体渲染（已入库）

`FluidGen`（物理感知流体视频生成）/ `Make It Flow`（3DGS 场景水流）/ `Fluid-Gen-Zero` / `Piecewise CMC Segmentation for Fluidic Shaping` / `Mastering Multi-State Dynamics`（MPM 连续损伤）— 均已在库

### 本次新增发现（此前仅在综述中提及，无独立笔记）

- **Kora**（DigiPro 2026）→ 已建独立笔记 ✅
- **NanoVDB**（SIGGRAPH Asia 2026 TOG）→ 已建独立笔记 ✅

---

## 技术趋势观察

**1. 稀疏体数据基础设施正在成为流体渲染的下一个战场**

NanoVDB 的突破（GPU 原生动态拓扑 + VBM 流式访问）配合 Kora 的稀疏自适应 MPI 网格，两篇论文指向同一件事：**流体的计算瓶颈正从"物理公式"转移到"稀疏体数据的 GPU 表达"**。对渲染侧的意义在于：模拟分辨率可以再上一个数量级，而不必受限于 CPU 回读或稠密化。

**2. 物理求解器的"最后一公里"是工具链，不是算法**

Kora 花了大量篇幅讲参数抽象、专家参数锁定、资产库标准化、跨团队模板分发——算法部分（ECT、绝热冷却）反而篇幅有限。这说明当前**流体模拟落地的真实瓶颈已从算法转移到"让 100 个艺术家用对"**。

**3. 渲染期处理正在回潮**

Kora diffusion / Kora crust 都把逻辑放在渲染期而非模拟期，与前几年"一切前置到模拟"的趋势相反。原因是后期可迭代、成本低，且能跨镜头复用。

**4. 生产级火焰的混合解法**

Kora 的 The Ash Attack 段落揭示了一个务实的范式：**按运动阶段分层选型**——弹道段用廉价求解器（运动模糊掩盖细节），接触瞬间用 FLIP（液体飞溅需要精确水动力），之后用高保真燃烧求解器。这与"全流程统一高精度"的学术倾向形成对照。

---

## 可行性分析

🩸 **可行性分析：2026-11-09 流体渲染检索汇总**

### 渲染方法
- **类型**：体积渲染（火焰/烟尘）+ 粒子渲染 + 稀疏体数据结构层
- **技术**：GPU 原生动态稀疏网格（NanoVDB）+ 物理燃烧求解器（Kora）+ 黑体辐射着色 + 渲染期体积合成

### 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐（Kora 产线级；NanoVDB 间接支撑）
- **风格化支持**：是（Kora 需额外机制，论文明确指出风格化与物理假设存在张力）

### 性能预期
- **帧率**：NanoVDB VBM ≈20 Gvoxel-updates/s（stencil）；Kora 为离线生产管线
- **GPU 需求**：NanoVDB 需 CUDA + Ada 级 GPU（论文用 48 GB RTX 6000 Ada）；Kora 需 MPI 集群 + 渲染期体积合成
- **内存占用**：NanoVDB 单卡可承载 2.35 B 活跃体素（44.1 GB）；Kora 靠稀疏自适应压缩

### 实现建议
- **着色器复杂度**：中（着色简单，难在数据层与求解器）
- **管线要求**：稀疏体数据结构需支持逐帧拓扑变更；燃烧需可压缩求解器 + 渲染期体积合成接口
- **推荐度**：✅ **NanoVDB 直接使用（已开源）**；✅ **Kora 借鉴 ECT 与 diffusion/crust**

---

## 检索方法论记录

- **arXiv API 必须用 HTTPS**：`http://export.arxiv.org` 返回 301 且不跟随重定向导致空结果；`https://export.arxiv.org/api/query` 正常
- **`web_search` 在本环境对 cs.GR 检索常返回 0 结果**，不可作为唯一信源；应以 arXiv API/RSS 为准
- **arXiv 短语查询的 URL 编码**：需用 `%22...%22`（引号），否则 `+` 拼接的短语会返回空集
- **去重**：本次用 `.scripts/dedup.py` 逻辑（扫描全库 `**/*.md` 抽取 arXiv ID），本库已入库 **765** 个 arXiv ID
- **会议论文源**：`physicsbasedanimation.com`（Batty 维护，最全的物理动画会议论文索引）、`kesen.realtimerendering.com/sig2026.html`（SIGGRAPH 2026 全论文）、`cginterest.com`（SIGGRAPH Asia 2026 日文详细解读，含流体段落）

---

## 参考文献

- [NanoVDB (arXiv:2611.08665)](https://arxiv.org/abs/2611.08665) · [HTML](https://arxiv.org/html/2611.08665v1) · [DOI](https://doi.org/10.1145/3842564)
- [Kora (DigiPro '26 PDF)](https://alexey.stomakhin.com/research/digipro2026_kora.pdf) · [DOI](https://doi.org/10.1145/3819990.3820026)
- [OpenVDB 仓库](https://github.com/AcademySoftwareFoundation/openvdb) · [fVDB 仓库](https://github.com/openvdb/fvdb-core)
- [Unifluids 项目页](https://alexey.stomakhin.com/research/unifluids.html) · [Flamescapes 项目页](https://helgewrede.github.io/flamescapes/)
- [Physics-Based Animation (Batty)](https://www.physicsbasedanimation.com/) · [SIGGRAPH 2026 Papers (Kesen)](https://kesen.realtimerendering.com/sig2026.html) · [SIGGRAPH Asia 2026 解读 (CGinterest)](https://cginterest.com/2026/10/29/siggraph-asia-2026-technical-papers/)

---

**新增笔记**：
- `2026-11-09-NanoVDB-Dynamic-GPU-Sparse-Grids.md`
- `2026-11-09-Kora-Physics-Based-Fire-Pipeline.md`
- `2026-11-09-Daily-Research-Summary.md`（本文件）
