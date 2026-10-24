---
type: daily-report
date: 2026-10-24
agent: doumiao
domain: fluid-rendering
status: completed
keywords: [fluid-rendering, water-rendering, smoke-rendering, fire-simulation, ocean-rendering, particle-system, volume-rendering]
sources: [arxiv-cs.GR, siggraph-asia, siggraph-2026]
---

# 📅 每日论文搜索报告 — 2026-10-24

## 🔎 搜索概要

| 项目 | 值 |
|------|---|
| **运行时间** | 2026-10-24 14:33 UTC（周六） |
| **搜索窗口** | 24h（10/23 14:33 → 10/24 14:33） |
| **数据源** | arXiv API（cs.GR 全量 150 篇 + 流体定向 55 篇 + SA2026 标记 60 篇）+ SIGGRAPH / SIGGRAPH Asia 官网 |
| **查询次数** | 5 次 arXiv API（**https + -L**，规避 301 与限流） |
| **结论** | **窗口内 0 篇新流体渲染论文** → 转向**填补 5 个历史缺口** |

> ⚠️ 技术备注：`http://export.arxiv.org/api/query` 仍返回 **HTTP 301 + 空响应体**。必须使用 `https://export.arxiv.org/...` 且加 `-L`（跟随重定向），并用 `-w "\nHTTP:%{http_code}"` 校验状态码。**若静默返回 0 字节却当"无结果"处理，会产生虚假空窗日** —— 这是第 2 天复现同一陷阱，已固化为操作规范。

---

## 📊 当日结果概览

### ⚠️ 连续第三个"空窗日"（但缺口在收敛）

**2026-10-22 之后 arXiv cs.GR 无任何新提交。**三重交叉验证：

| 检索策略 | 结果 |
|----------|------|
| cs.GR 全量最新 150 篇 + 24 个流体关键词全文匹配 | 10/22 后命中 **0** 篇 |
| cs.GR + `abs:"fluid"` / `abs:"smoke"` / `abs:"water"` / `abs:"ocean"` 定向 | 最新命中停留在 **10-19 FluidGen**（已收录） |
| arXiv 全库 `all:"SIGGRAPH Asia 2026"` 标记检索（60 篇） | 命中 **2 篇** SA2026 流体相关（1 新 / 1 已收录） |

### 窗口内 cs.GR 新增论文（3 篇，均非流体渲染）

| arXiv ID | 标题 | 排除原因 |
|----------|------|----------|
| 2610.30910 | H-2DGS: Height-Field Gaussian Splatting 神经外科表面重建 | 医学表面重建，非流体 |
| 2610.30875 | HimmBO: 高维交互式模型合并贝叶斯优化 | 图像生成模型合并，非流体 |
| 2610.30149 | A Tutte-Like Theorem for Injective Flows on Meshes | ⚠️ **边界相关**（math.OC 交叉）——见下方讨论 |

> 📌 **10/23 批次复核结论**：已确认 —— **10/23 批次中确实没有遗漏的流体渲染论文**。
>
> 最近一篇流体渲染 cs.GR 论文仍为 **2610.25660 FluidGen（10-19）**，已于 10-21 收录。

### 🧭 关于 2610.30149（本次唯一边界案例）

*A Tutte-Like Theorem for Injective Flows on Meshes*（cross-list from math.OC，2026-08-06 首次提交，10/23 出现在 cs.GR 列表）证明了一个定理：在三角网格上定义连续流，其注入性（两点沿流线平流后轨迹不交叉）与**调和性**相关 —— 在球面网格上计算离散调和函数，取其 $90°$ 旋转梯度作为向量场，即可得到**单射流**。

- **为何值得记一笔**：这是"流场几何性质"与"网格离散调和结构"之间的理论桥梁。它不解决渲染问题，但为**保证流体动画中粒子轨迹不交叉/不打结**提供了数学保证 —— 这在**风格化流体**（如线描水流、书法笔触流场）中是真实需求（避免轨迹穿插破坏线条可读性）。
- **为何本期不单独建笔记**：属于纯理论工作，与流体渲染的技术栈无直接交集，且已超出"渲染技术"范畴。**建议归入"相关理论"而非本期重点**。

---

## ✅ 本次创建结构化笔记（5 篇 —— 填补历史缺口）

窗口内无新论文，故将 10-22 / 10-23 日报中连续标记的"待补缺口"择机深挖。本期完成 **5 篇**，其中 **1 篇为 SIGGRAPH Asia 2026 新论文**（此前从未收录），**4 篇为连续 3 天被标记的高价值缺口**。

| # | arXiv ID | 标题 | 渲染类别 | 发表 | 笔记 |
|---|----------|------|---------|------|------|
| 1 | 2609.29985 | **OceanXL**: Large-scale Underwater 3DGS | 体积渲染 / 水下 3DGS | **SA2026** 🆕 | [笔记](2026-10-24-OceanXL-Large-Scale-Underwater-3DGS.md) |
| 2 | 2503.03326 | **Arc Blanc**: Real-Time Ocean Simulation Framework | 表面渲染（海面）+ 实时框架 | 2025-03-05 | [笔记](2026-10-24-Arc-Blanc-Real-Time-Ocean-Simulation-Framework.md) |
| 3 | 2502.05339 | **Fast Subspace Fluid Simulation (DMD)** | 降阶模拟 + 谱方法 | 2025-02-07 | [笔记](2026-10-24-Fast-Subspace-Fluid-Simulation-DMD.md) |
| 4 | 2508.01537 | **FluidFormer**: Transformer + 连续卷积 SPH | 粒子渲染 / 学习型流体 | 2025-08-03 | [笔记](2026-10-24-FluidFormer-Transformer-Continuous-Convolution-SPH.md) |
| 5 | 2511.15908 | **SPHaptics**: 双向触觉流体交互框架 | 粒子渲染 / VR 触觉 | 2025-11-19 | [笔记](2026-10-24-SPHaptics-Bidirectional-Haptic-Fluid-VR.md) |
| 6 | 2505.16397 | **Dynamic Caustics** by Ultrasonic Liquid Surface | 表面渲染（焦散）+ 折射 | 2025-05-22 | [笔记](2026-10-24-Dynamic-Caustics-Ultrasonic-Liquid-Surface.md) |

### 缺口收敛情况

| 缺口论文 | 10-22 状态 | 10-23 状态 | 10-24 状态 |
|---------|------------|------------|------------|
| Vortex Particle Flow Maps (2505.21946) | ⏳ 待补 | ⏳ 待补 | ✅ **已有笔记**（`2026-07-12/2505.21946-vortex-particle-flow-maps.md`） |
| Arc Blanc (2503.03326) | ⏳ 待补 | ⏳ 待补 | ✅ **本期完成** |
| Fast Subspace Fluid (2502.05339) | ⏳ 待补 | ⏳ 待补 | ✅ **本期完成** |
| Dynamic Caustics (2505.16397) | ⏳ 待补 | ⏳ 待补 | ✅ **本期完成** |
| SPHaptics (2511.15908) | ⏳ 待补 | ⏳ 待补 | ✅ **本期完成** |
| FluidFormer (2508.01537) | ⏳ 待补 | ⏳ 待补 | ✅ **本期完成** |

> ✅ **10-23 日报列出的 6 个缺口，至今日全部收敛完毕。**

---

## 💡 本期洞察

### 1. 📉 空窗期≠无事可做，转向"存量深挖"
连续三日零新增，说明 cs.GR 流体方向处于**批次低谷**（该子领域约每周 2–5 篇）。低谷期的正确策略不是重复扫描（会得到相同结果），而是**转向知识库缺口的定向深挖**。本期把 3 天日报中反复标记的缺口一次性清空，**知识库覆盖率实质提升**。

### 2. 🔍 "SIGGRAPH Asia 2026" 标记检索 = 新发现的检索通道
arXiv 上 SA2026 录用论文正陆续上线，且**同时标注 `all:"SIGGRAPH Asia 2026"`**。这条通道可直接命中会议论文，不必等会议召开。本次借此发现 **OceanXL**（此前 3 天日报均未提及，因为它 9-24 才上线）。

> 📌 **检索协议升级**：今后 arXiv 检索应并行使用 4 条通道 ——
> ① `cat:cs.GR` 全量 + 本地关键词匹配（主通道）
> ② `cat:cs.GR` + `abs:"<keyword>"` 定向
> ③ `all:"SIGGRAPH Asia 2026"`（会议通道）
> ④ `all:"SIGGRAPH 2026"`（SIGGRAPH 主会通道）

### 3. 🧪 三个"方法论不同"的论文构成一条完整技术光谱
本期 6 篇恰好覆盖流体模拟的三条互补路线，可直接横向对比：

| 路线 | 论文 | 核心优势 | 核心短板 |
|------|------|---------|---------|
| **降阶/谱方法** | Fast Subspace (DMD) | 极快、可用户控制、时间可逆 | 线性 → 强非线性失真 |
| **学习型粒子** | FluidFormer | 稳定性强、全局上下文 | 训练成本高、推理慢 |
| **经典数值/工程** | Arc Blanc | 物理可信、实时、工程完备 | 依赖特定硬件/实现 |
| **硬件在环** | Dynamic Caustics | 真实物理、闭环控制 | 不可移植 |
| **交互扩展** | SPHaptics | 双向物理、可触摸 | 规模受限 |

### 4. 🎯 DMD 的"时间可逆"是被忽视的工程红利
Fast Subspace 的线性算子可逆 → **一次离线求解，任意次双向播放**。这能把流体从"每帧必算"降级为"预计算资产 + 运行时轻量重建"，对 VR/AR 帧预算意义重大。同时其**模态空间**天然是一种比"调力场参数"更贴近美术直觉的创作界面。详见笔记的豆苗评注。

### 5. 🌊 Arc Blanc 的"任意深度海水速度"是一个被低估的量
多数实时海面渲染只取表面速度场。但表现**水下气泡上升、悬浮颗粒漂移、体积浑浊的深度衰减**时，深度方向的速度分布是物理必需的。这是一个可直接抽成着色器函数的**深度速度剖面 LUT**。

### 6. 💡 OceanXL 的自适应剪枝可反向迁移为自适应光线步进
OceanXL 的 adaptive pruning 是"在冗余区域省容量"。反向用到**体积 ray marching** 上，就是"浓密区加密采样、稀薄区早停"的**自适应步进策略** —— 可直接削减烟雾渲染的采样开销。详见笔记的可行性分析。

---

## 📎 SIGGRAPH / SIGGRAPH Asia 2026 状态

### SIGGRAPH Asia 2026
- **会期**: 2026-12-01 ~ 12-04，Kuala Lumpur, Malaysia（**第 19 届，首赴吉隆坡**）
- **当前状态**: 论文列表**仍未在官网公开**，但**已开始在 arXiv 上线带 `SIGGRAPH Asia 2026` 标记的论文**（本期检出 60 篇）
- **已检出流体相关**:
  - ✅ **OceanXL**（2609.29985）—— 本期收录
  - ✅ Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows（2608.25203，TOG DOI 10.1145/3842540）—— 已于 8 月收录
- **时间提示**: 距会期约 **38 天**，10 月底至 11 月中旬为上线密集期，**应提高检索频率**（建议 10-31 起转为每日双检 arXiv + 官网）

### SIGGRAPH 2026
- **已见论文页公开**，Top 10 Fast Forward 中含 **Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering**（体积渲染相关，未收录）
- 官网检索入口：`https://s2026.conference-schedule.org/?filter1=sstype132`

---

## 📌 待办与建议

| 优先级 | 项目 | 说明 |
|--------|------|------|
| ⭐⭐⭐ | 补齐 **10-22 / 10-23 日报**列出的缺口 | ✅ **本期已完成** |
| ⭐⭐⭐ | 提高 arXiv 检索协议 | 加入 `all:"SIGGRAPH Asia 2026"` 与 `all:"SIGGRAPH 2026"` 通道 |
| ⭐⭐ | 收录 **Gabor Fields for Volume Rendering**（SIGGRAPH 2026） | 体积渲染 LOD，新方向 |
| ⭐⭐ | 继续观察 cs.GR 空窗是否延续 | 已连续 3 天零新增，建议连续观察 5–7 天 |
| ⭐ | 2610.30149 Tutte 定理 | 建议归入"相关理论"类目，暂不单独建笔记 |

---

## ⚙️ 执行记录

- ✅ 配置文件读取（`.knowledge-config.json` → doumiao agent，7 组关键词 / cs.GR）
- ✅ arXiv API 端点故障排查（第 2 天复现 301，已固化 `https` + `-L` + 状态码校验规范）
- ✅ cs.GR 全量 150 篇 + 流体定向 55 篇 + SA2026 标记 60 篇检索
- ✅ 10/23 批次复核（无遗漏）
- ✅ 与 10-21 / 10-22 / 10-23 已收录条目去重比对（含 `2026/` 历史子目录）
- ✅ 创建 **6 篇论文笔记** + 1 篇日报
- ⏳ 运行 `~/knowledge-vault/.scripts/git-sync.sh` 同步
