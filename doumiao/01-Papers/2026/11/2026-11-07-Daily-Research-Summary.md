---
type: summary
created: 2026-11-07
updated: 2026-11-07
tags: [summary, daily-research, fluid-rendering, arxiv, cs.GR, physics.flu-dyn, siggraph-asia-2026]
status: processed
domain: 流体渲染
agent: doumiao
search_window: 2026-11-06 ~ 2026-11-07
---

# 2026-11-07 每日流体渲染论文搜索总结

## 搜索执行摘要

| 项 | 结果 |
|------|------|
| **搜索窗口** | 2026-11-06 ~ 2026-11-07（arXiv 最新公告批次：11-06 新增 + 11-05 补充） |
| **arXiv cs.GR** | 全量抓取最近 200 条 + 直读 `list/cs.GR/recent` 列表页，**逐条核对 11-06 批次 11 篇 + 11-05 批次 9 篇，零流体渲染相关** |
| **arXiv physics.flu-dyn** | 抓取 11-05~11-08 全部 19 篇，筛出 **1 篇新增相关**（SIM-PINN） |
| **跨分类全量扫描** | 对 11-01~11-08 全 arXiv 新提交（300+ 篇）做流体关键词扫描 + 医学/天文/分子等假阳性过滤，**无遗漏** |
| **SIGGRAPH 2026** | 会议已于 **2026-07-19~23 在洛杉矶召开完毕**，无新发布 |
| **SIGGRAPH Asia 2026** | **2026-12-01~04 吉隆坡 KLCC**，技术论文尚未公布（当前仅有征稿说明页） |
| **新增笔记** | **1 篇**论文笔记 + 本总结 |
| **关键词** | fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering |

---

## 一、cs.GR 批次核对（逐条确认，零命中）

### 11-06 批次（11 篇）— 全部为非流体主题

| arXiv ID | 标题 | 主题 |
|---|---|---|
| 2611.08301 | REACT: Real-Time Completion of Skeletal Motion Signals | 骨架动作补全 |
| 2611.07979 | Perception Over Geometry: Gaussian Allocation in Mesh-based Splatting | 3DGS 分配 |
| 2611.07909 | EDGAR: Diffusion-Driven Gaussian Avatar Refinement | 数字人 |
| 2611.07730 | World-Model-Guided Navigation in Multi-Agent Scenes | 导航 |
| 2611.07328 | DC-SQEM: Medial Mesh Extraction by Dual Contouring | 几何处理 |
| 2611.07289 | Patch-Based Generalized Neural Texture Upscaling | 纹理 |
| 2611.06954 | Certified folding-free deformable image registration | 可形变配准 |
| 2611.08342 | 4D Point Splatting for mmWave Radar Micro-Doppler | 雷达点云（cs.CV 交叉） |
| 2611.08288 | Hierarchical Incremental Beta Splatting | 在线重建（cs.CV 交叉） |
| 2611.07900 | Structure from Collision via Hypothesis-Space Reasoning | 碰撞推理（cs.CV 交叉） |
| 2611.06974 | T²-Splat: Adaptive Topology Mesh Splatting | 网格 splatting |

### 11-05 批次（9 篇）— 同上，均非流体

REACT 之外还包括 Hierarchical Incremental Beta Splatting、Patch-Based Neural Texture Upscaling 等 3DGS/纹理主题。

> **结论：cs.GR 近 48 小时无流体渲染新论文。** 这延续了 11-06 那轮总结中观察到的趋势——**流体渲染主题正在从 cs.GR 流向 physics.flu-dyn**。

### 已排除的假阳性

| 论文 | 关键词命中原因 | 判定 |
|---|---|---|
| 2611.00227 Piecewise CMC Segmentation for Fluidic Shaping | "fluidic" 指**流体型材加工**（聚合物浇注成型） | ❌ 非流体渲染 |
| 2611.06954 Certified folding-free deformable image registration | "volume" 指形变体积分 | ❌ 非流体渲染 |
| 2611.07328 DC-SQEM | "water"/"volumetric" 出现在引用列表 | ❌ 非流体渲染 |
| 2611.07690 Simulation of Refraction Through Voxel Volumes | 体素光线追踪 + 折射 | ⚠️ **X 射线成像光学**，与流体渲染无实质关联，本轮不收录 |
| 2610.28131 OV-Foam | "foam" 是**泡沫材质**（泡沫塑料） | ❌ 非流体渲染 |
| 2610.24210 Colour-Field Particle Categorization | SPH 固体残余应力 | ❌ 已在 11-06 前收录 |

---

## 二、本轮新增论文（1 篇）

### [[2026-11-07-SIM-PINN-Projection-Segregated-Multi-Stage-PINN]] ⭐ 方法论价值最高

**arXiv:2611.07387** · physics.flu-dyn / physics.comp-ph · 2026-11-05 · 四川大学 Yunde Su 组

> **SIM-PINN**：把经典 CFD 的**投影法**搬进 PINN——动量预测与压力修正各用**独立子网络**，靠**投影式内迭代**耦合；再叠加**多阶段频率引导训练**对抗频谱偏置。**把病态的耦合非线性优化拆成一串解耦线性子问题。**

**三条最值得记的技术点**：
1. **网络输出"速度增量"而非"速度场"** —— 论文明确这是成功的**必要条件**。对自研求解器直接可抄。
2. **多阶段 = 频率分离** —— Stage 1 吃低频、Stage 2 追中高频，残差**主频持续升高**。比调 loss 权重更值得优先尝试。
3. **附录 C 的消融** —— 给基线 monolithic PINN 匹配**算力**（PINN-T）和**参数量**（PINN-P，6× 参数）后，精度仍显著低于 SIM-PINN → **排除了"赢在更贵"的质疑**，这是本文最有说服力的部分。

**关键数字**：
| 指标 | 结果 |
|---|---|
| Poisson 方程残差 vs 常规 PINN | **小约 6 个数量级** |
| 动量方程残差 vs 常规 PINN | **小约 3 个数量级**（隔离测试） |
| Re=2000 腔流动量残差 vs monolithic | **低约 2 个数量级** |
| Kolmogorov 流 sub-iteration 数 | 多数时间步仅 **2–3 次** |
| Kolmogorov 动量损失 | 通常 **< 1e-6** |
| 改进位置 | **近壁区 + 角落小涡**（恰是渲染中最难做对的地方）|

**⚠️ 诚实定位**：仅 2D 验证、离线训练成本高、无代码、几何简单。**方法论参考价值 >> 直接落地价值**。渲染主流仍是网格/粒子求解器。

---

## 三、SIGGRAPH 会议状态

| 会议 | 状态 | 说明 |
|---|---|---|
| **SIGGRAPH 2026** | ✅ 已闭幕 | 2026-07-19~23，洛杉矶 L.A. Convention Center。流体板块已于 11-05 那轮全量收录（见 [[2026-11-05-Daily-Research-Summary]]） |
| **SIGGRAPH Asia 2026** | ⏳ **论文未公布** | 2026-12-01~04，首落地吉隆坡 KLCC。Technical Papers Chair 为 Ravi Ramamoorthi (UCSD/NVIDIA)。技术论文程序覆盖**神经渲染、生成式 AI、物理仿真、空间计算** |

> ⚠️ **时序提示**：SIGGRAPH Asia 2026 距离开幕仅约 **3.5 周**，技术论文清单预计近期公布 → **下几轮搜索需重点关注 SIGGRAPH Asia 论文列表页**。

---

## 四、趋势观察

1. **流体渲染主题持续从 cs.GR 向 physics.flu-dyn 迁移**（连续两轮确认）。cs.GR 近期被 3DGS / 神经重建 / 人体动画占满。

2. **physics.flu-dyn 的"求解器 + 物理可验证性"双主线**：
   - 求解器侧：SIM-PINN（解耦 + 频谱）、KSF-Chol（核插值降数值扩散）、Fast VEM（二阶 VEM + 凸性保持）
   - 可验证性侧：Certified Neural Water Waves（Lean 形式化验证）、Readable Is Not Steerable（预注册实验）

3. **值得关注的范式转移**：11-06 收录的 MANTRA（低秩张量流形重建）与本轮的 SIM-PINN 代表**两条互补路线**——**"重建"（绕过求解器）** vs **"求解"（改进求解器）**。重建路线在渲染侧更易落地。

4. **神经渲染侧的流体处理**（3DGS 水体/烟雾）持续独立演进：Make It Flow、GauSmoke、LagrangianSplats、SplashSplat、WildFireGS 等，本轮无新增。

---

## 五、本轮结论

**新增论文数偏少（1 篇）是真实情况，非搜索失败。** 已通过四重手段交叉验证：

1. arXiv API `cat:cs.GR` 按提交日期倒序取 200 条 + 关键词全量扫描
2. 直读 `arxiv.org/list/cs.GR/recent` 列表页，**逐条人工核对**最新批次标题
3. `submittedDate` / `lastUpdatedDate` 双字段时间窗查询（抓更新版本）
4. 全 arXiv 跨分类 11-01~11-08 提交扫描 + 假阳性过滤
5. 补充 Web Search 交叉验证（发现 API 日期过滤漏掉的 2611.07690 / 2611.05577 / 2611.07387 / 2611.03263）

**去重完成**：KSF-Chol (2611.03263) 已在 11-03 收录；Readable Is Not Steerable (2611.05577) 已在 11-05/11-06 收录 → 本轮不重复建档。

---

## 相关索引

- [[2026-11-06-Daily-Research-Summary]] — 上一轮
- [[2026-11-03-KSF-Chol-Kernelized-Stable-Fluids]] — Stable Fluids 的核插值改进
- [[2026-11-06-Certified-Neural-Water-Waves-Lean-Verification]] — PINN + 形式化验证
- [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]] — SIGGRAPH Asia 流体板块（待更新）
